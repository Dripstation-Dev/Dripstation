/datum/wound/blood_vessel
	name = "Blood Vessel wound"
	desc = "oof ouch!!"

	processes = TRUE

	//sound_effect = 'sound/effects/dismember.ogg'
	severity = WOUND_SEVERITY_NON_EXISTENT
	//status_effect_type = /datum/status_effect/wound/blood_vessel
	//scar_keyword = "blood_vessel"
	wound_type = WOUND_BLOOD_VESSEL
	wound_flags = (FLESH_WOUND | ACCEPTS_GAUZE)
	viable_zones = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	var/tick_of_blood_flow = 1 SECONDS
	/// How much max bleeding we can recieve in one process
	var/blood_flow_proc
	/// How much min bleeding we can recieve in one process
	var/minimum_flow_proc
	var/is_internal = FALSE
	var/limb_name

/datum/wound/blood_vessel/apply_wound(obj/item/bodypart/L, silent = FALSE, datum/wound/old_wound = null, smited = FALSE, attack_direction = null)
	if(!istype(L) || !L.owner || !(L.body_zone in viable_zones) || isalien(L.owner) || !L.is_organic_limb() || (L?.owner?.dna?.species && NOBLOOD in L?.owner?.dna?.species.species_traits))
		qdel(src)
		return

	victim = L.owner
	set_limb(L)
	LAZYADD(victim.all_wounds, src)
	LAZYADD(limb.wounds, src)
	update_descriptions()
	limb.update_wounds()
	if(status_effect_type)
		linked_status_effect = victim.apply_status_effect(status_effect_type, src)
	SEND_SIGNAL(victim, COMSIG_CARBON_GAIN_WOUND, src, limb)
	if(!victim.alerts["wound"] && !silent) // only one alert is shared between all of the wounds
		victim.throw_alert("wound", /atom/movable/screen/alert/status_effect/wound)

	if(severity == WOUND_SEVERITY_NON_EXISTENT)
		return

	if(!silent)
		var/msg = span_danger("[victim]'s [limb.name] [occur_text]!")
		var/vis_dist = COMBAT_MESSAGE_RANGE

		victim.visible_message(msg, span_userdanger("Your [limb.name] [occur_text]!"), vision_distance = vis_dist)
		if(sound_effect)
			playsound(L.owner, sound_effect, 70 + 20 * severity, TRUE)
		if(!is_internal)
			wound_injury(attack_direction = attack_direction)
	second_wind()
	L.owner.flick_pain(40, TRUE)
	if(limb.body_zone == BODY_ZONE_HEAD && !is_internal)
		limb_name = "neck"
	else
		limb_name = limb.name

/datum/wound/blood_vessel/handle_process()
	. = ..()

	if(blood_flow_proc && victim.blood_volume && is_internal)
		addtimer(CALLBACK(src, PROC_REF(handle_internal_bleed)), tick_of_blood_flow, TIMER_UNIQUE)
		//else
		//	addtimer(CALLBACK(src, PROC_REF(handle_external_bleed)), tick_of_blood_flow, TIMER_UNIQUE)


/datum/wound/blood_vessel/applySanitization(amount)	//blood flows too agressively
	return

/datum/wound/blood_vessel/proc/get_external_bleed()
	var/blood_bled = rand(minimum_flow_proc, blood_flow_proc)

	if(HAS_TRAIT(victim, TRAIT_BLOODY_MESS))
		blood_bled *= 1.5

	if(HAS_TRAIT(victim, TRAIT_BLOODY_MESS_LITE))
		blood_bled *= 1.2

	return blood_bled
	//if(limb.current_gauze && limb.current_gauze.splint_factor)
	//	blood_bled *= (1 - limb.current_gauze.splint_factor)
	//	limb.seep_gauze(limb.current_gauze.absorption_rate)
	

	// switch(blood_bled)
	// 	if(1 to 6)
	// 		victim.bleed(blood_bled, TRUE)
	// 	if(7 to 13)
	// 		victim.visible_message(span_smalldanger("[victim] drips a bit of blood from [victim.p_their()] blood vessel of [victim.p_their()] [limb_name]."), span_danger("You drips a bit of blood from the blood vessel of your [limb_name]."), vision_distance=COMBAT_MESSAGE_RANGE)
	// 		victim.bleed(blood_bled, TRUE)
	// 	if(14 to 19)
	// 		victim.visible_message(span_smalldanger("[victim] releases a string of blood from [victim.p_their()] blood vessel of [victim.p_their()] [limb_name]!"), span_danger("You releases a string of blood from the blood vessel of your [limb_name]!"), vision_distance=COMBAT_MESSAGE_RANGE)
	// 		new /obj/effect/temp_visual/dir_setting/bloodsplatter(victim.loc, victim.dir)
	// 		victim.bleed(blood_bled)
	// 	if(20 to INFINITY)
	// 		victim.visible_message(span_danger("[victim] bleeds a flow of blood from [victim.p_their()] blood vessel of [victim.p_their()] [limb_name]!"), span_danger("<b>You choke up on a spray of blood from the blood vessel of your [limb_name]!</b>"), vision_distance=COMBAT_MESSAGE_RANGE)
	// 		victim.bleed(blood_bled)
	// 		new /obj/effect/temp_visual/dir_setting/bloodsplatter(victim.loc, victim.dir)
	// 		victim.add_splatter_floor(get_step(victim.loc, victim.dir))

/datum/wound/blood_vessel/proc/handle_internal_bleed()
	var/blood_bled = rand(minimum_flow_proc, blood_flow_proc)
	if(victim.bodytemperature < TCRYO)
		blood_bled = 0
	else if(victim.bodytemperature < BODYTEMP_NORMAL)
		blood_bled *= round(victim.bodytemperature/BODYTEMP_NORMAL, 0.1)
	switch(blood_bled)
		if(1 to 15)
			victim.bleed(blood_bled, FALSE)
		if(15 to INFINITY)
			victim.emote("faint")
			var/obj/item/organ/ears/ears = victim.getorganslot(ORGAN_SLOT_EARS)
			ears.deaf += 7
			SEND_SOUND(victim, sound('sound/weapons/flash_ring.ogg', volume = 40))
			to_chat(victim, span_warning("The ringing in your ears grows louder, blocking out any external noises for a moment."))
			victim.bleed(blood_bled, FALSE)


/datum/wound/blood_vessel/drag_bleed_amount()
	. = ..()
	if(!is_internal)
		var/bleed_amt = min(blood_flow_proc * 0.1, 1) // 3 * 3 * 0.1 = 0.9 blood total, less than before! the share here is .3 blood of course.

		if(limb.current_gauze) // gauze stops all bleeding from dragging on this limb, but wears the gauze out quicker
			limb.seep_gauze(bleed_amt * 0.33)
			return

		return bleed_amt

///so external vein damage handled by piercing|slashing wounding, but i will leave it here to have fun
/datum/wound/blood_vessel/vein
	name = "Vein Bleeding"
	desc = "Vein damage. Patient's vein has been torn apart and bleeds. Immidiate intervention is recomended."
	occur_text = "vein ruptiers, releesing a spray of blood!"
	examine_desc = "is torn open, spraying blood"
	severity = WOUND_SEVERITY_BLOOD_VESSEL

	/// If we did the gause healing method for vein, how many ticks does it take to heal by default
	var/regen_ticks_needed
	/// Our current counter for gause regeneration
	var/regen_ticks_current
	treatable_by = list(/obj/item/stack/medical/suture)
	treatable_by_grabbed = list(/obj/item/gun/energy/laser)
	treatable_tool = TOOL_CAUTERY
	base_treat_time = 3 SECONDS
	blood_flow_proc = 3
	minimum_flow_proc = 1
	threshold_minimum = 5
	threshold_penalty = 5
	status_effect_type = /datum/status_effect/wound/blood_vessel/vein

/datum/wound/blood_vessel/vein/handle_process()
	. = ..()
	
	if(victim.bodytemperature < (BODYTEMP_NORMAL -  15))
		regen_ticks_current++
		if(prob(5))
			to_chat(victim, span_notice("You feel the [lowertext(name)] in your [limb_name] firming up from the cold!"))
	
	if(limb.current_gauze && !is_internal)
		regen_ticks_current++
		if(LAZYLEN(victim.mind?.antag_datums)) //not like anyone will be counting, right?
			regen_ticks_current++
		if(!(victim.mobility_flags & MOBILITY_STAND))
			if(prob(50))
				regen_ticks_current += 0.5
			if(victim.IsSleeping() && prob(50))
				regen_ticks_current += 0.5

	if(regen_ticks_current > regen_ticks_needed)
		if(!victim || !limb)
			qdel(src)
			return
		to_chat(victim, span_green("Your [limb_name] has recovered from your vein damage!"))
		remove_wound()


/* BEWARE, THE BELOW NONSENSE IS MADNESS. bones.dm looks better */

/datum/wound/blood_vessel/vein/check_grab_treatments(obj/item/I, mob/user)
	if(is_internal)
		return
	if(istype(I, /obj/item/gun/energy/laser))
		return TRUE
	if(I.get_temperature()) // if we're using something hot but not a cautery, we need to be aggro grabbing them first, so we don't try treating someone we're eswording
		return TRUE

/datum/wound/blood_vessel/vein/treat(obj/item/I, mob/user)
	if(is_internal)
		return
	if(istype(I, /obj/item/gun/energy/laser))
		las_cauterize(I, user)
	else if(I.tool_behaviour == TOOL_CAUTERY || I.get_temperature())
		tool_cauterize(I, user)
	else if(istype(I, /obj/item/stack/medical/suture))
		suture(I, user)

/// If someone's putting a laser gun up to our cut to cauterize it
/datum/wound/blood_vessel/vein/proc/las_cauterize(obj/item/gun/energy/laser/lasgun, mob/user)
	var/self_penalty_mult = (user == victim ? 1.25 : 1)
	if(LAZYLEN(user.mind?.antag_datums)) //antagonists can heal wounds better with ghetto alternatives, since they don't have as much access to proper medical treatment
		self_penalty_mult = 1
	user.visible_message(span_warning("[user] begins aiming [lasgun] directly at [victim]'s [limb_name]..."), span_userdanger("You begin aiming [lasgun] directly at [user == victim ? "your" : "[victim]'s"] [limb_name]..."))
	playsound(lasgun, 'sound/surgery/cautery1.ogg', 75, TRUE, falloff_exponent = 1)

	if(!do_after(user, base_treat_time * self_penalty_mult, victim, extra_checks = CALLBACK(src, PROC_REF(still_exists))))
		return

	playsound(lasgun, 'sound/surgery/cautery2.ogg', 75, TRUE, falloff_exponent = 1)
	lasgun.chambered.BB.bare_wound_bonus = 0
	lasgun.chambered.BB.wound_bonus -= 20
	lasgun.chambered.BB.damage *= self_penalty_mult
	if(!lasgun.process_fire(victim, victim, TRUE, null, limb.body_zone))
		return
	victim.flick_pain(100, TRUE)
	user.visible_message(span_green("[victim]'s vein in [limb_name] has cauterized!"), span_green("You cauterize vein in [limb_name] on [user == victim ? "yourself" : "[victim]"]!"))
	remove_wound()

/// If someone is using either a cautery tool or something with heat to cauterize this cut
/datum/wound/blood_vessel/vein/proc/tool_cauterize(obj/item/I, mob/user)
	var/improv_penalty_mult = (I.tool_behaviour == TOOL_CAUTERY ? 1 : 1.25) // 25% longer and less effective if you don't use a real cautery
	var/self_penalty_mult = (user == victim ? 1.5 : 1) // 50% longer and less effective if you do it to yourself
	if(LAZYLEN(user.mind?.antag_datums)) //antagonists can heal wounds better with ghetto alternatives, since they don't have as much access to proper medical treatment
		self_penalty_mult = 0.5
		improv_penalty_mult = 1
	user.visible_message(span_danger("[user] begins cauterizing [victim]'s [limb_name] with [I]..."), span_warning("You begin cauterizing [user == victim ? "your" : "[victim]'s"] [limb_name] with [I]..."))
	playsound(I, 'sound/surgery/cautery1.ogg', 75, TRUE, falloff_exponent = 1)

	if(!do_after(user, base_treat_time * self_penalty_mult * improv_penalty_mult * I.toolspeed, victim, extra_checks = CALLBACK(src, PROC_REF(still_exists))))
		return

	playsound(I, 'sound/surgery/cautery2.ogg', 75, TRUE, falloff_exponent = 1)
	limb.receive_damage(burn = 10, wound_bonus = 5)
	victim.flick_pain(30, TRUE)
	user.visible_message(span_green("[victim]'s vein in [limb_name] has cauterized!"), span_green("You cauterize vein in [limb_name] on [user == victim ? "yourself" : "[victim]"]!"))
	remove_wound()

/// If someone is using a suture to close this cut
/datum/wound/blood_vessel/vein/proc/suture(obj/item/stack/medical/suture/I, mob/user)
	var/self_penalty_mult = (user == victim ? 1.4 : 1)
	if(LAZYLEN(user.mind?.antag_datums)) //antagonists can heal wounds better with ghetto alternatives, since they don't have as much access to proper medical treatment
		self_penalty_mult = 1
	user.visible_message(span_notice("[user] begins stitching [victim]'s [limb_name] with [I]..."), span_notice("You begin stitching [user == victim ? "your" : "[victim]'s"] [limb_name] with [I]..."))
	playsound(I, pick(I.apply_sounds), 25)

	if(!do_after(user, base_treat_time * self_penalty_mult * I.treatment_speed, victim, extra_checks = CALLBACK(src, PROC_REF(still_exists))))
		return

	user.visible_message(span_green("[user] stitches up some of the bleeding on [victim]."), span_green("You stitch up some of the bleeding on [user == victim ? "yourself" : "[victim]"]."))

	limb.heal_damage(I.heal_brute, I.heal_burn)
	I.use(1)
	user.visible_message(span_green("[victim]'s vein in [limb_name] has stitched up!"), span_green("You stitch up vein in [limb_name] on [user == victim ? "yourself" : "[victim]"]!"))
	remove_wound()

/datum/wound/blood_vessel/vein/internal
	name = "Internal Vein Bleeding"
	is_internal = TRUE
	wound_flags = (FLESH_WOUND)
	status_effect_type = null
	severity = WOUND_SEVERITY_HIDDEN
	threshold_penalty = 10
	blood_flow_proc = 3
	minimum_flow_proc = 1

/datum/wound/blood_vessel/artery
	name = "Arterial Bleeding"
	desc = "Artery damage. Extreme blood loss will lead to quick death without intervention."
	treat_text = "Immediate applying a tourniquet, followed by supervised blood infusion."
	occur_text = "artery ruptiers, releesing a spray of blood!"
	examine_desc = "is torn open, spraying blood wildly"
	severity = WOUND_SEVERITY_BLOOD_VESSEL
	blood_flow_proc = 6
	minimum_flow_proc = 3
	threshold_minimum = 15
	threshold_penalty = 25
	status_effect_type = /datum/status_effect/wound/blood_vessel/artery

/datum/wound/blood_vessel/artery/wound_injury(datum/wound/old_wound = null, attack_direction = null)
	. = ..()
	if(attack_direction && !is_internal && victim.blood_volume > BLOOD_VOLUME_OKAY(victim))
		victim.spray_blood(attack_direction, 2)

/datum/wound/blood_vessel/artery/internal
	name = "Internal Arterial Bleeding"
	is_internal = TRUE
	wound_flags = (FLESH_WOUND)
	status_effect_type = null
	blood_flow_proc = 5
	threshold_penalty = 30
	minimum_flow_proc = 2
	severity = WOUND_SEVERITY_HIDDEN

/datum/wound/blood_vessel/artery/internal/body
	viable_zones = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN)

/datum/wound/blood_vessel/artery/internal/body/apply_wound(obj/item/bodypart/L, silent = FALSE, datum/wound/old_wound = null, smited = FALSE, attack_direction = null)
	if(!(L.body_zone in viable_zones))
		var/datum/wound/blood_vessel/artery/A = new
		addtimer(CALLBACK(A, PROC_REF(apply_wound), L, silent = TRUE, attack_direction = attack_direction), 0.1 SECONDS, TIMER_UNIQUE)	//apply in one tick whatever
		qdel(src)
	else if(!(locate(/datum/wound/blood_vessel/artery/internal) in L.wounds))
		var/datum/wound/blood_vessel/artery/internal/AI = new
		addtimer(CALLBACK(AI, PROC_REF(apply_wound), L, silent = TRUE, attack_direction = attack_direction), 0.1 SECONDS, TIMER_UNIQUE)	//apply in one tick whatever
		qdel(src)
	else
		qdel(src)
	
/datum/status_effect/wound/blood_vessel/artery
	id = "artery wound"

/datum/status_effect/wound/blood_vessel/vein
	id = "vein wound"
