/datum/disease/rabies
	name = "The Rabies"
	max_stages = 5
	stage_prob = 1
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Spaceacillin"
	spread_text = "On contact"
	cures = list(/datum/reagent/medicine/spaceacillin)
	cure_chance = 20
	required_organs = list(/obj/item/organ/brain)
	agent = "lyssavirus"
	viable_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey, /mob/living/simple_animal)
	permeability_mod = 0.75
	desc = "If left untreated the subject will get encephalitis. Isn`t curable at stage 4 and higher."
	severity = DISEASE_SEVERITY_BIOHAZARD
	disease_flags = CURABLE
	var/timer
	var/min_time_between_stages = 60 SECONDS

/datum/disease/rabies/stage_act()
	if(!iscarbon(affected_mob))
		return
	var/cure = has_cure()

	stage = min(stage, max_stages)

	if(!cure && timer < world.time)
		if(prob(stage_prob))
			update_stage(min(stage + 1,max_stages))
			timer = world.time + min_time_between_stages

	switch(stage)
		if(4)
			cure = FALSE
			if(prob(2))
				affected_mob.emote("stare")
			if(prob(2))
				affected_mob.emote("drool")
			if(prob(3))
				affected_mob.adjust_stutter(1 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5, 100)
		if(5)
			cure = FALSE
			if(prob(5))
				affected_mob.emote("stare")
			if(prob(5))
				affected_mob.emote("drool")
			if(prob(10))
				affected_mob.adjust_stutter(2 SECONDS)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)

	if(disease_flags & CURABLE)
		if(cure && prob(cure_chance))
			cure()
