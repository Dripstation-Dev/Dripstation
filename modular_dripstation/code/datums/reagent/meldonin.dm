/datum/reagent/medicine/meldonin
	name = "Meldonin"
	description = "Increases brute and stamina resistance, increaces stamina regeneration and force multiplier. Overdose causes weakness and toxin damage."
	color = "#2B8D94"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 40

/datum/reagent/medicine/meldonin/on_mob_metabolize(mob/living/L)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.physiology.brute_mod *= 0.75
		H.physiology.stamina_mod *= 0.75
		H.physiology.force_multiplier *= 1.2

/datum/reagent/medicine/meldonin/on_mob_end_metabolize(mob/living/L)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.physiology.brute_mod /= 0.75
		H.physiology.stamina_mod /= 0.75
		H.physiology.force_multiplier /= 1.2
	..()

/datum/reagent/medicine/meldonin/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(-4*REM, 0)
	..()

/datum/reagent/medicine/meldonin/overdose_process(mob/living/M)
	if(prob(33))
		M.adjust_jitter(2 SECONDS)
		M.adjustToxLoss(1*REM, 0)
		M.adjust_disgust(4*REM)
	..()
