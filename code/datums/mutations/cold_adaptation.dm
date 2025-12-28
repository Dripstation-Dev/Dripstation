//Cold Resistance gives your entire body an orange halo, and makes you immune to the effects of vacuum and cold.
/datum/mutation/human/cold_adaptation
	name = "Cold Adaptation"
	desc = "A strange mutation that renders the host immune to the coldness. Do not negate effects of vacuum."
	quality = POSITIVE
	difficulty = 16
	text_gain_indication = span_notice("Your body feels warm!")
	time_coeff = 5
	instability = 40
	conflicts = list(HEATMUT)

/datum/mutation/human/cold_adaptation/New(class_ = MUT_OTHER, timer, datum/mutation/human/copymut)
	..()
	if(!(type in visual_indicators))
		visual_indicators[type] = list(mutable_appearance('icons/effects/genetics.dmi', "fire", -MUTATIONS_LAYER))

/datum/mutation/human/cold_adaptation/get_visual_indicator()
	return visual_indicators[type][1]

/datum/mutation/human/cold_adaptation/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	ADD_TRAIT(owner, TRAIT_RESISTCOLD, "cold_adaptation")
	//ADD_TRAIT(owner, TRAIT_RESISTLOWPRESSURE, "cold_adaptation")
	ADD_TRAIT(owner, TRAIT_NO_PASSIVE_COOLING, "cold_adaptation")

/datum/mutation/human/cold_adaptation/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_RESISTCOLD, "cold_adaptation")
	//REMOVE_TRAIT(owner, TRAIT_RESISTLOWPRESSURE, "cold_adaptation")
	REMOVE_TRAIT(owner, TRAIT_NO_PASSIVE_COOLING, "cold_adaptation")

