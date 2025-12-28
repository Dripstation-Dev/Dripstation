/datum/status_effect/wound/infected
	id = "infested flesh"

/datum/wound/infected
	name = "Flesh Infection"
	desc = "Patient's flesh is infected and rotting. Immidiate intervention is recomended."
	treat_text = "Recommended immediate disinfection and excision of any infected skin, followed by bandaging."
	examine_desc = ""
	occur_text = ""

	processes = TRUE
	wound_type = WOUND_INFECTION

	//sound_effect = 'sound/effects/dismember.ogg'
	//severity = WOUND_SEVERITY_BLOOD_VESSEL
	status_effect_type = /datum/status_effect/wound/infected
	//scar_keyword = "blood_vessel"
	wound_flags = (FLESH_WOUND | ACCEPTS_GAUZE | CAN_BE_INFESTED)
	infestation_rate = 0.04 // appx 8,33 minutes to reach sepsis without any treatment
	/// Once we reach infestation beyond WOUND_INFESTATION_SEPSIS, we get this many warnings before the limb is completely paralyzed (you'd have to ignore a really bad wound for a really long time for this to happen)
	var/strikes_to_lose_limb = 4

/datum/wound/infected/handle_process()
	if(strikes_to_lose_limb == 0) // we've already hit sepsis, nothing more to do
		victim.adjustToxLoss(2)
		if(prob(1))
			victim.visible_message(span_danger("The infection on the remnants of [victim]'s [limb.name] shift and bubble nauseatingly!"), span_warning("You can feel the infection on the remnants of your [limb.name] coursing through your veins!"), vision_distance = COMBAT_MESSAGE_RANGE)
		return
	
	. = ..()

	if(limb.infestation <= 0)
		to_chat(victim, span_green("The infection flesh on your [limb.name] have cleared up!"))
		qdel(src)
		return

	switch(limb.infestation)
		if(0 to WOUND_INFECTION_MODERATE)
			return
		if(WOUND_INFECTION_MODERATE to WOUND_INFECTION_SEVERE)
			if(prob(30))
				victim.adjustToxLoss(0.2)
				if(prob(6))
					to_chat(victim, span_warning("The blisters on your [limb.name] ooze a strange pus..."))
		if(WOUND_INFECTION_SEVERE to WOUND_INFECTION_CRITICAL)
			if(!disabling && prob(2))
				to_chat(victim, span_warning("<b>Your [limb.name] completely locks up, as you struggle for control against the infection!</b>"))
				set_disabling(TRUE)
			else if(disabling && prob(8))
				to_chat(victim, span_notice("You regain sensation in your [limb.name], but it's still in terrible shape!"))
				set_disabling(FALSE)
			else if(prob(20))
				victim.adjustToxLoss(0.5)
		if(WOUND_INFECTION_CRITICAL to WOUND_INFECTION_SEPTIC)
			if(!disabling && prob(3))
				to_chat(victim, span_warning("<b>You suddenly lose all sensation of the festering infection in your [limb.name]!</b>"))
				set_disabling(TRUE)
			else if(disabling && prob(3))
				to_chat(victim, span_notice("You can barely feel your [limb.name] again, and you have to strain to retain motor control!"))
				set_disabling(FALSE)
			else if(prob(1))
				to_chat(victim, span_warning("You contemplate life without your [limb.name]..."))
				victim.adjustToxLoss(0.75)
			else if(prob(4))
				victim.adjustToxLoss(1)
		if(WOUND_INFECTION_SEPTIC to INFINITY)
			victim.adjustToxLoss(0.3)
			if(prob(0.5 * limb.infestation))
				strikes_to_lose_limb--
				switch(strikes_to_lose_limb)
					if(3 to INFINITY)
						to_chat(victim, span_warning("The skin on your [limb.name] is literally dripping off, you feel awful!"))
					if(2)
						to_chat(victim, span_warning("<b>The infection in your [limb.name] is literally dripping off, you feel horrible!</b>"))
					if(1)
						to_chat(victim, span_warning("<b>Infection has just about completely claimed your [limb.name]!</b>"))
					if(0)
						to_chat(victim, span_warning("<b>The last of the nerve endings in your [limb.name] wither away, as the infection completely paralyzes your joint connector.</b>"))
						threshold_penalty = 120 // piss easy to destroy
						var/datum/brain_trauma/severe/paralysis/sepsis = new (limb.body_zone)
						victim.gain_trauma(sepsis)

/datum/wound/infected/get_examine_description(mob/user)
	if(strikes_to_lose_limb <= 0)
		return span_deadsay("<B>[victim.p_their(TRUE)] [limb.name] has locked up completely and is non-functional.</B>")

	var/list/condition = list("[victim.p_their(TRUE)] [limb.name] ")
	if(limb.current_gauze)
		var/bandage_condition
		switch(limb.current_gauze.absorption_capacity)
			if(0 to 1.25)
				bandage_condition = "nearly ruined"
			if(1.25 to 2.75)
				bandage_condition = "badly worn"
			if(2.75 to 4)
				bandage_condition = "slightly pus-stained"
			if(4 to INFINITY)
				bandage_condition = "clean"

		condition += " underneath a dressing of [bandage_condition] [limb.current_gauze.name]"
	else
		switch(limb.infestation)
			if(WOUND_INFECTION_MODERATE to WOUND_INFECTION_SEVERE)
				condition += ", <span class='deadsay'>with early signs of infection.</span>"
			if(WOUND_INFECTION_SEVERE to WOUND_INFECTION_CRITICAL)
				condition += ", <span class='deadsay'>with growing clouds of infection.</span>"
			if(WOUND_INFECTION_CRITICAL to WOUND_INFECTION_SEPTIC)
				condition += ", <span class='deadsay'>with streaks of rotten, pulsating infection!</span>"
			if(WOUND_INFECTION_SEPTIC to INFINITY)
				return span_deadsay("<B>[victim.p_their(TRUE)] [limb.name] is a mess of charred skin and infected rot!</B>")
			else
				return
	
	. = "<B>[condition.Join()]</B>"

/datum/wound/infected/get_scanner_description(mob/user)
	if(strikes_to_lose_limb == 0)
		var/oopsie = "Type: [name]\nSeverity: [severity_text()]"
		oopsie += "<div class='ml-3'>Infection Level: <span class='deadsay'>The bodypart has suffered complete sepsis and must be removed. Amputate or augment limb immediately.</span></div>"
		return oopsie

	. = ..()
	. += "<div class='ml-3'>"

	if(limb.infestation > 0)
		. += "Current Sanitization Effect: [span_brass("[clamp(round(limb.sanitization/limb.infestation*100, 1),0,100)]%")]\n"
		if(limb.sanitization > 0)
			. += "[span_green("Sanitization in effect, infection level is decreasing.")]\n"
		switch(limb.infestation)
			if(0 to WOUND_INFECTION_MODERATE)
				. += "Infection Level: Minimal\n"
			if(WOUND_INFECTION_MODERATE to WOUND_INFECTION_SEVERE)
				. += "Infection Level: Moderate\n"
			if(WOUND_INFECTION_SEVERE to WOUND_INFECTION_CRITICAL)
				. += "Infection Level: Severe\n"
			if(WOUND_INFECTION_CRITICAL to WOUND_INFECTION_SEPTIC)
				. += "Infection Level: <span class='deadsay'>CRITICAL</span>\n"
			if(WOUND_INFECTION_SEPTIC to INFINITY)
				. += "Infection Level: <span class='deadsay'>LOSS IMMINENT</span>\n"
	else
		. += "[span_green("No infection detected.")]\n"
	if(limb.infestation > limb.sanitization)
		. += "\tSurgical debridement and antibiotics will rid infection. Paramedic UV penlights and sterilizers are also effective when applied on open infected wounds.\n"

/datum/wound/infected/infestation_treat(obj/item/I, mob/user)
	return

/datum/wound/infected/on_xadone(power)
	return

/datum/wound/infected/on_healium(power)
	return

/datum/wound/infected/applySanitization(amount)	//flesh is already dead 
	return

/datum/wound/infected/on_stasis()
	if(limb.infestation < WOUND_INFECTION_SEPTIC)	//limb.sanitization > 0 && 
		limb.applyInfestation(-WOUND_BURN_SANITIZATION_RATE * 0.2)
		limb.sanitization += 0.05	//UV lights & cold
	return
