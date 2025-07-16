/datum/reagent/medicine/tramadol
	name = "tramadol"
	description = "A painkiller that allows the patient to move faster with wounds. Overdose will cause a variety of effects."
	reagent_state = LIQUID
	color = "#A9FBFB"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 35
	addiction_threshold = 45

/datum/reagent/medicine/tramadol/on_mob_metabolize(mob/living/L)
	..()
	ADD_TRAIT(L, TRAIT_RESISTDAMAGESLOWDOWN, type)
	SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "[type]_high", /datum/mood_event/high)

/datum/reagent/medicine/tramadol/on_mob_end_metabolize(mob/living/L)
	REMOVE_TRAIT(L, TRAIT_RESISTDAMAGESLOWDOWN, type)
	..()

/datum/reagent/medicine/tramadol/overdose_process(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjust_dizzy(2)
		M.adjust_jitter(2 SECONDS)
		M.adjust_disgust(2)
	..()

/datum/reagent/medicine/tramadol/addiction_act_stage1(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjust_jitter(2 SECONDS)
	..()

/datum/reagent/medicine/tramadol/addiction_act_stage2(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(1*REM, 0)
		. = 1
		M.adjust_dizzy(3)
		M.adjust_jitter(3 SECONDS)
		M.adjust_disgust(3)
	..()

/datum/reagent/medicine/tramadol/addiction_act_stage3(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REM, 0)
		. = 1
		M.adjust_dizzy(4)
		M.adjust_jitter(4 SECONDS)
		M.adjust_disgust(4)
	..()

/datum/reagent/medicine/tramadol/addiction_act_stage4(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(3*REM, 0)
		. = 1
		M.adjust_dizzy(5)
		M.adjust_jitter(5 SECONDS)
		M.adjust_disgust(5)
	..()
