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

/mob/living
	COOLDOWN_DECLARE(pain_emote_cd)

/mob/living/proc/pain(pain_mult = 1, hard = FALSE, force = FALSE)
	return emote_pain(hard, force)

/mob/living/proc/emote_pain(hard = FALSE, force = FALSE)
	if(HAS_TRAIT(src, NO_PAIN_EMOTE))
		return
	if(force)
		COOLDOWN_RESET(src, pain_emote_cd)
	if(!COOLDOWN_FINISHED(src, pain_emote_cd))
		return
	INVOKE_ASYNC(src, PROC_REF(emote), "scream")
	COOLDOWN_START(src, pain_emote_cd, 3 SECONDS)

/mob/living/carbon/pain(pain_mult = 1, hard = FALSE, force = FALSE)
	if(stat >= UNCONSCIOUS)
		return
	if(HAS_TRAIT(src, TRAIT_SURGERY_PREPARED) && HAS_TRAIT(src, TRAIT_NUMBED) && !hal_screwyhud)
		set_screwyhud(SCREWYHUD_NUMB)	//we just don`t feel anything at this point
		return
	if(hal_screwyhud == SCREWYHUD_NUMB)
		set_screwyhud(SCREWYHUD_NONE)
	if(HAS_TRAIT(src, TRAIT_RESISTDAMAGESLOWDOWN) || HAS_TRAIT(src, TRAIT_HIGHRESISTDAMAGESLOWDOWN))	//reagents and species traits, probably need other
		return
	var/datum/component/mood/mood = GetComponent(/datum/component/mood)
	var/pain_apply_chance = 1
	var/can_stutter = FALSE
	switch(pain_mult)
		if(10 to 20)
			if(mood)
				SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "pain", /datum/mood_event/stings)
				pain_apply_chance = 10
		if(20 to 40)
			if(mood)
				SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "pain", /datum/mood_event/pain)
			pain_apply_chance = 30
		if(40 to 60)
			if(mood)
				SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "pain", /datum/mood_event/painfull)
			pain_apply_chance = 60
		if(60 to 90)
			if(mood)
				SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "pain", /datum/mood_event/painagony)
			pain_apply_chance = 80
			can_stutter = TRUE
		if(90 to INFINITY)
			if(mood)
				SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "pain", /datum/mood_event/painagony)
			pain_apply_chance = 100
			can_stutter = TRUE
			//hard = TRUE

	var/pain_emote_use = FALSE
	if(prob(pain_apply_chance))
		if(hard)
			flash_pain()
		else
			flash_weak_pain()
		pain_emote_use = TRUE
		adjustStaminaLoss(pain_mult/2)
		if(can_stutter && prob(pain_apply_chance/2))
			AdjustImmobilized(0.05 SECONDS * pain_mult)
			adjust_stutter((0.1 SECONDS * pain_mult) SECONDS)
			visible_message(span_warning("[src] stutters in agony!"),\
					span_warning("You stutter in agony!"))
	if(force || pain_emote_use)
		emote_pain(hard, force)

/mob/living/carbon/emote_pain(hard = FALSE, force = FALSE)
	if(HAS_TRAIT(src, NO_PAIN_EMOTE))
		return
	if(force)
		COOLDOWN_RESET(src, pain_emote_cd)
	if(!COOLDOWN_FINISHED(src, pain_emote_cd))
		return
	var/pain_emote_list = list("moan" = 100)
	if(stat == SOFT_CRIT)
		pain_emote_list = list("moan" = 50, "faint" = 15, "cry" = 35)
	else if(hard)
		pain_emote_list = list("moan" = 30, "twitch" = 20, "scream" = 50)
	INVOKE_ASYNC(src, PROC_REF(emote), pickweight(pain_emote_list))
	COOLDOWN_START(src, pain_emote_cd, 3 SECONDS)

/mob/living/carbon/proc/handle_pain()
	if(stat >= UNCONSCIOUS)
		return
	if(HAS_TRAIT(src, TRAIT_SURGERY_PREPARED) && HAS_TRAIT(src, TRAIT_NUMBED) && !hal_screwyhud)
		set_screwyhud(SCREWYHUD_NUMB)	//we just don`t feel anything at this point
		return
	if(hal_screwyhud == SCREWYHUD_NUMB)
		set_screwyhud(SCREWYHUD_NONE)
	if(HAS_TRAIT(src, TRAIT_RESISTDAMAGESLOWDOWN) || HAS_TRAIT(src, TRAIT_HIGHRESISTDAMAGESLOWDOWN))	//we feel pain, but resist it
		return
	var/may_be_painfull = (getBruteLoss()+getOrganLoss(ORGAN_SLOT_TAIL))*0.8 + getFireLoss() + getCloneLoss()*0.5 //+ getPainFull()
	var/msg
	var/hard = FALSE

	switch(may_be_painfull)
		if(5 to 10)
			msg = span_warning("Your body hurts a little.")
		if(10 to 20)
			msg = span_warning("Your body hurts.")
		if(20 to 90)
			msg = span_warning("Your body hurts badly!")
		if(90 to INFINITY)
			hard = TRUE
			msg = span_userdanger("OH GOD! Your body is hurting terribly!")

	var/M = may_be_painfull/10
	if(may_be_painfull > 5)
		if(prob(M) && may_be_painfull)
			to_chat(src, msg)

	var/head_pain = getOrganLoss(ORGAN_SLOT_BRAIN) + getOrganLoss(ORGAN_SLOT_EARS) * 0.4 + getOrganLoss(ORGAN_SLOT_EYES) * 0.4
	var/headMsg

	switch(head_pain)
		if(5 to 10)
			headMsg = span_warning("Your head hurts a little.")
		if(10 to 20)
			headMsg = span_warning("Your head hurts.")
		if(20 to 40)
			headMsg = span_warning("Your head hurts badly!")
		if(40 to INFINITY)
			hard = TRUE
			headMsg = span_userdanger("OH GOD! Your head is hurting terribly!")
	
	var/H = head_pain/5
	if(head_pain > 5)
		if(prob(H))
			to_chat(src, headMsg)

	var/intDamageMsg = null
	var/internal_damage = getToxLoss()*0.5 + getOrganLoss(ORGAN_SLOT_STOMACH)
	switch(internal_damage)
		if(20 to 35)
			intDamageMsg = span_warning("Your inner hurts.")
		if(35 to 50)
			intDamageMsg = span_warning("Your inner hurts badly.")
		if(50 to INFINITY)
			intDamageMsg = span_userdanger("Your inner aches all over, it's driving you mad!")

	var/I = internal_damage/10
	if(internal_damage > 20)
		if(prob(I))
			to_chat(src, intDamageMsg)
	
	if((I + H + M) > 1)	//putting here some treshold, so mob wouldn`t just moan for nothing
		pain(I + H + M, hard)

/mob/living/carbon/proc/flash_pain(var/target)
	overlay_fullscreen("pain", /atom/movable/screen/fullscreen/pain, 2)
	addtimer(CALLBACK(src, .proc/clear_fullscreen, "pain"), 0.5 SECONDS)

/mob/living/carbon/proc/flash_weak_pain()
	overlay_fullscreen("pain", /atom/movable/screen/fullscreen/pain, 1)
	addtimer(CALLBACK(src, .proc/clear_fullscreen, "pain"), 0.5 SECONDS)

/atom/movable/screen/fullscreen/pain
	icon_state = "painoverlay"
	icon = 'modular_dripstation/icons/mob/fullscreen.dmi'
	layer = FULLSCREEN_LAYER + 0.2
	plane = FULLSCREEN_PLANE

/datum/mood_event/stings
	description = "<span class='warning'>It`s stings a little.</span>\n"
	mood_change = -3
	timeout = 3 SECONDS

/datum/mood_event/pain
	description = "<span class='warning'>It`s quite painfull!</span>\n"
	mood_change = -6
	timeout = 4 SECONDS

/datum/mood_event/painfull
	description = "<span class='warning'>Okay, now it`s REALLY PAINFULL!</span>\n"
	mood_change = -8
	timeout = 5 SECONDS

/datum/mood_event/painagony
	description = "<span class='warning'>I`m suffering, PLEASE END THIS!!</span>\n"
	mood_change = -15
	timeout = 5 SECONDS
