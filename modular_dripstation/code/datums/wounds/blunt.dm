
/*
	Blunt/Bone wounds
*/
// TODO: well, a lot really, but i'd kill to get overlays and a bonebreaking effect like Blitz: The League, similar to electric shock skeletons

/*
	Base definition
*/
/*
/datum/wound/blunt/flesh
	name = "Blunt (Flesh) Wound"
	wound_type = WOUND_BLUNT
	sound_effect = SFX_SLICE
	treatable_tool = null	//you cant dirrectly treat bruising for now
	wound_flags = (FLESH_WOUND | ACCEPTS_GAUZE)
	viable_zones = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

/datum/wound/blunt/flesh/handle_process()
	. = ..()
	if(internal_bleeding_processed && victim.blood_volume)
		addtimer(CALLBACK(src, PROC_REF(handle_internal_bleed)), 3 SECONDS, TIMER_UNIQUE)
	if(limb.current_gauze)
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
			to_chat(victim, span_green("Your [limb.name] has recovered from your blunt damage!"))
			remove_wound()

/datum/wound/blunt/flesh/handle_internal_bleed()
	if(!prob(internal_bleeding_chance))
		return
	if(limb.current_gauze && limb.current_gauze.splint_factor)
		internal_bleeding_processed *= (1 - limb.current_gauze.splint_factor)
	var/blood_bled = rand(1, internal_bleeding_processed)
	switch(blood_bled)
		if(1 to 15)
			victim.bleed(blood_bled, FALSE)
		if(16 to INFINITY)
			to_chat(victim, span_danger("You feel yourself faint!"))
			victim.bleed(blood_bled, FALSE)

/datum/wound/blunt/flesh/moderate
	name = "Discoloring"
	desc = "Patient's skin has been bruised, causing pain and abnormal color."
	treat_text = "Recommended splinting with gauze."
	examine_desc = "is bruised and discolored"
	occur_text = "develops a bruise"
	severity = WOUND_SEVERITY_MODERATE
	scar_keyword = "bluntmoderate"
	status_effect_type = /datum/status_effect/wound/blunt/flesh/moderate
	threshold_minimum = 30
	threshold_penalty = 5
	regen_ticks_needed = 60 // ticks every 2 seconds, 120 seconds, so roughly 2 minutes default

/datum/wound/blunt/flesh/severe
	name = "Extravasation"
	desc = "Patient's skin has been extensive bruised, causing pain and abnormal color."
	examine_desc = "is heavily bruised and discolored"
	occur_text = "develops a bad looking bruise"
	severity = WOUND_SEVERITY_SEVERE
	scar_keyword = "bluntsevere"
	internal_bleeding_chance = 40
	internal_bleeding_processed = 4
	threshold_minimum = 50
	threshold_penalty = 30
	wound_flags = (FLESH_WOUND | ACCEPTS_GAUZE)
	status_effect_type = /datum/status_effect/wound/blunt/flesh/severe
	regen_ticks_needed = 120 // ticks every 2 seconds, 240 seconds, so roughly 4 minutes default

/datum/wound/blunt/flesh/critical
	name = "Critical Extravasation"
	desc = "Patient's skin has been extensive bruised, causing pain and abnormal color."
	examine_desc = "is extensively bruised and discolored"
	occur_text = "develops a nasty looking bruise"
	severity = WOUND_SEVERITY_CRITICAL
	scar_keyword = "bluntcritical"
	disabling = TRUE
	internal_bleeding_chance = 60
	internal_bleeding_processed = 6
	threshold_minimum = 100
	threshold_penalty = 50
	wound_flags = (FLESH_WOUND | ACCEPTS_GAUZE)
	status_effect_type = /datum/status_effect/wound/blunt/flesh/critical
	regen_ticks_needed = 240 // ticks every 2 seconds, 480 seconds, so roughly 8 minutes default

// blunt
/datum/status_effect/wound/blunt/flesh/moderate
	id = "discoloring"
/datum/status_effect/wound/blunt/flesh/severe
	id = "extravasation"
/datum/status_effect/wound/blunt/flesh/critical
	id = "critical extravasation"

/datum/status_effect/wound/blunt/flesh/interact_speed_modifier()
	return 1

/datum/status_effect/wound/blunt/flesh/nextmove_modifier()
	return 1
*/
