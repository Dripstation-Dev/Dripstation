//Throwing stuff
/mob/living/carbon/proc/toggle_throw_mode()
	if(stat)
		return
	if(ismecha(loc))
		var/obj/mecha/M = loc
		if(M.occupant == src)
			M.cycle_action.Activate()
			return
	if(in_throw_mode)
		throw_mode_off(THROW_MODE_TOGGLE)
	else
		throw_mode_on(THROW_MODE_TOGGLE)


/mob/living/carbon/proc/throw_mode_off(method)
	if(in_throw_mode > method) //A toggle doesnt affect a hold
		return
	in_throw_mode = THROW_MODE_DISABLED
	if(client && hud_used)
		hud_used.throw_icon.icon_state = "act_throw_off"


/mob/living/carbon/proc/throw_mode_on(mode = THROW_MODE_TOGGLE)
	in_throw_mode = mode
	if(client && hud_used)
		hud_used.throw_icon.icon_state = "act_throw_on"


/mob/living/carbon/throw_item(atom/target)
	. = ..()
	throw_mode_off(THROW_MODE_TOGGLE)
	if(!target || !isturf(loc))
		return
	if(istype(target, /atom/movable/screen))
		return

	var/atom/movable/thrown_thing
	var/obj/item/held_item = get_active_held_item()
	var/frequency_number = 1 //We assign a default frequency number for the sound of the throw
	var/neckgrab_throw = FALSE // we can't check for if it's a neckgrab throw when totaling up power_throw since we've already stopped pulling them by then, so get it early


	if(!held_item)
		if(pulling && isliving(pulling) && grab_state >= GRAB_AGGRESSIVE)
			var/mob/living/throwable_mob = pulling
			if(!throwable_mob.buckled)
				thrown_thing = throwable_mob
				if(pulling && grab_state >= GRAB_NECK)
					neckgrab_throw = TRUE
				stop_pulling()
				if(HAS_TRAIT(src, TRAIT_PACIFISM))
					to_chat(src, span_notice("You gently let go of [throwable_mob]."))
					return
				if(!synth_check(src, SYNTH_ORGANIC_HARM))
					to_chat(src, span_notice("You gently let go of [throwable_mob]."))
					return
				var/turf/start_T = get_turf(loc) //Get the start and target tile for the descriptors
				var/turf/end_T = get_turf(target)
				if(start_T && end_T)
					log_combat(src, throwable_mob, "thrown", addition="grab from tile in [AREACOORD(start_T)] towards tile at [AREACOORD(end_T)]")

	else if(!CHECK_BITFIELD(held_item.item_flags, ABSTRACT) && !HAS_TRAIT(held_item, TRAIT_NODROP))
		thrown_thing = held_item
		SEND_SIGNAL(thrown_thing, COMSIG_MOVABLE_PRE_DROPTHROW, src)
		dropItemToGround(held_item, silent = TRUE)

		if(HAS_TRAIT(src, TRAIT_PACIFISM) && held_item.throwforce)
			to_chat(src, span_notice("You set [held_item] down gently on the ground."))
			return
		if(!synth_check(src, SYNTH_RESTRICTED_WEAPON))
			to_chat(src, span_notice("You set [held_item] down gently on the ground."))
			return

	if(!thrown_thing)
		return FALSE
	var/power_throw = 0
	if(HAS_TRAIT(src, TRAIT_HULK))
		power_throw++
	if(HAS_TRAIT(src, TRAIT_DWARF))	
		power_throw--
	if(HAS_TRAIT(thrown_thing, TRAIT_DWARF))
		power_throw++
	if(neckgrab_throw)
		power_throw++
	if(isitem(thrown_thing))
		var/obj/item/thrown_item = thrown_thing
		frequency_number = 1-(thrown_item.w_class-3)/8 //At normal weight, the frequency is at 1. For tiny, it is 1.25. For huge, it is 0.75.
	do_attack_animation(target, no_effect = 1)
	var/sound/throwsound = 'modular_dripstation/sound/weapons/throw.ogg'
	var/power_throw_text = "."
	if(power_throw > 0) //If we have anything that boosts our throw power like hulk, we use the rougher heavier variant.
		throwsound = 'modular_dripstation/sound/weapons/throwhard.ogg'
		power_throw_text = " really hard!"
	if(power_throw < 0) //if we have anything that weakens our throw power like dward, we use a slower variant.
		throwsound = 'modular_dripstation/sound/weapons/throwsoft.ogg'
		power_throw_text = " flimsily."
	frequency_number = frequency_number + (rand(-5,5)/100); //Adds a bit of randomness in the frequency to not sound exactly the same.
	//The volume of the sound takes the minimum between the distance thrown or the max range an item, but no more than 50. Short throws are quieter. A fast throwing speed also makes the noise sharper.
	playsound(src, throwsound, min(8*min(get_dist(loc,target),thrown_thing.throw_range), 50), vary = TRUE, extrarange = -1, frequency = frequency_number)
	visible_message(span_danger("[src] throws [thrown_thing][power_throw_text]"), \
					span_danger("You thrown [thrown_thing][power_throw_text]"))
	log_message("has thrown [thrown_thing] [power_throw_text]", LOG_ATTACK)
	newtonian_move(get_dir(target, src))
	thrown_thing.safe_throw_at(target, thrown_thing.throw_range, thrown_thing.throw_speed + power_throw, src, null, null, null, move_force)
	changeNext_move(CLICK_CD_RANGE)
