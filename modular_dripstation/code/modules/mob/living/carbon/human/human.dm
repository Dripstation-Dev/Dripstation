/mob/living/carbon/human
	has_field_of_vision = TRUE

/mob/living/carbon/human/register_init_signals()
	. = ..()

	RegisterSignals(src, list(SIGNAL_ADDTRAIT(TRAIT_UNKNOWN), SIGNAL_REMOVETRAIT(TRAIT_UNKNOWN)), PROC_REF(on_unknown_trait))

/// Gaining or losing [TRAIT_UNKNOWN] updates our name and our sechud
/mob/living/carbon/human/proc/on_unknown_trait(datum/source)
	SIGNAL_HANDLER

	name = get_visible_name()
	sec_hud_set_ID()

/mob/living/carbon/human/death(gibbed)
	. = ..()
	apply_deathwitness_penalty(gibbed)

/mob/living/carbon/human/proc/apply_deathwitness_penalty(gibbed)
	var/list/mob/living/carbon/human/viewers = viewers(src)
	for(var/mob/living/carbon/human/V as anything in viewers)
		if(!ishuman(V))
			continue
		if(V.in_fow(src, TRUE))
			continue
		var/mind_fortified_rating = V.check_fear_protection(NORMAL_FEAR_SOURCE)
		if(mind_fortified_rating == 0)	//concidered invulnerable
			return
		if(gibbed)
			SEND_SIGNAL(V, COMSIG_ADD_MOOD_EVENT, "witnessgib_[mind_fortified_rating]", /datum/mood_event/seengib, mind_fortified_rating)
			V.apply_status_effect(/datum/status_effect/terrified, fear_value = 30/mind_fortified_rating)
		else
			SEND_SIGNAL(V, COMSIG_ADD_MOOD_EVENT, "witnessdeath_[mind_fortified_rating]", /datum/mood_event/seendeath, mind_fortified_rating)

/mob/living/proc/check_fear(type_of_fear = NORMAL_FEAR_SOURCE)
	if(HAS_TRAIT(src, TRAIT_FEARLESS))
		return FALSE
	switch(type_of_fear)
		if(NORMAL_FEAR_SOURCE)
			if(HAS_TRAIT(src, TRAIT_NO_NORMAL_FEAR) || HAS_TRAIT(src, TRAIT_PSYCHOPATHIC))
				return FALSE
		if(ABNORMAL_FEAR_SOURCE)
			if(HAS_TRAIT(src, TRAIT_NO_ABNORMAL_FEAR))
				return FALSE
	return TRUE

/mob/living/proc/check_fear_protection(type_of_fear = NORMAL_FEAR_SOURCE)
	if(!check_fear(type_of_fear))
		return 0
	var/mind_fortified = 1
	if(HAS_TRAIT(src, TRAIT_MINDSHIELD))
		mind_fortified ++
	if(is_special_character(src))
		mind_fortified ++
	if(HAS_TRAIT(src, TRAIT_NUMBED) || HAS_TRAIT(src, TRAIT_SURGERY_PREPARED))
		mind_fortified ++
	return mind_fortified
