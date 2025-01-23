/datum/disease/rabies
	name = "The Rabies"
	max_stages = 5
	stage_prob = 1
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Spaceacillin"
	cures = list(/datum/reagent/medicine/spaceacillin)
	cure_chance = 20
	required_organs = list(/obj/item/organ/brain)
	agent = "lyssavirus"
	viable_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	permeability_mod = 0.75
	desc = "If left untreated the subject will get encephalitis. Isn`t curable at stage 4 and higher."
	severity = DISEASE_SEVERITY_BIOHAZARD
	disease_flags = CURABLE

/datum/disease/rabies/cure(add_resistance = TRUE)
	if(stage >= 4)
		return
	qdel(src)

/datum/disease/rabies/stage_act()
	..()
	switch(stage)
		if(4)
			if(prob(2))
				affected_mob.emote("stare")
			if(prob(2))
				affected_mob.emote("drool")
			if(prob(3))
				affected_mob.adjust_stutter(1 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10, 100)
		if(5)
			if(prob(5))
				affected_mob.emote("stare")
			if(prob(5))
				affected_mob.emote("drool")
			if(prob(10))
				affected_mob.adjust_stutter(2 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15)
