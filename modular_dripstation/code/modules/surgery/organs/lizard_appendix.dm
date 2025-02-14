/obj/item/organ/appendix/lizard
	name = "lizard healing gland"
	desc = "The gland rapidly consumes nutrients in blood to heal wounds."
	var/hunger_reduction = 8
	var/toxin_damage = FALSE

/obj/item/organ/appendix/lizard/on_life(mob/living/carbon/human/H)
	. = ..()
	if(islizard(H))
		if(inflamed)
			var/mob/living/carbon/M = H
			for(var/datum/disease/appendicitis/A in M.diseases)
				A.cure()
			inflamed = FALSE
		var/effectiveness = canheal(H)
		if(!effectiveness)
			return
		else
			heal(H, effectiveness)

/obj/item/organ/appendix/lizard/Insert(mob/living/carbon/M, special = 0)
	..()
	if(!islizard(M))
		inflamed = TRUE
		M.ForceContractDisease(new /datum/disease/appendicitis(), FALSE, TRUE)

/obj/item/organ/appendix/lizard/update_name(updates=ALL)
	. = ..()
	name = "lizard healing gland"

/obj/item/organ/appendix/lizard/update_icon(updates=ALL)
	. = ..()
	icon_state = "appendix"

/obj/item/organ/appendix/lizard/proc/canheal(mob/living/carbon/human/H)
	if(HAS_TRAIT(H, TRAIT_NOHUNGER))
		return FALSE
	if(!H.get_damaged_bodyparts(1,1))
		return FALSE
	
	switch(H.nutrition)
		if(0)
			return FALSE
		if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
			return 0.5
		if(NUTRITION_LEVEL_HUNGRY to NUTRITION_LEVEL_FED)
			return 1
		if(NUTRITION_LEVEL_WELL_FED to NUTRITION_LEVEL_FULL)
			return 1.5
		else
			return 2
		
/obj/item/organ/appendix/lizard/proc/heal(mob/living/carbon/human/H, actual_power)
	var/heal_amt = actual_power
	var/list/parts = H.get_damaged_bodyparts(1,1)

	if(!parts.len)
		return
		
	H.adjust_nutrition(-(hunger_reduction * heal_amt)) // So heal to nutrient ratio doesnt change
	
	if(H.nutrition <= NUTRITION_LEVEL_STARVING && !(organ_flags & ORGAN_FAILING))
		H.blood_volume -= 10
		if(prob(45))
			to_chat(H, span_warning("You feel like you are wasting away!"))
	
	else if(H.nutrition <= NUTRITION_LEVEL_STARVING && (organ_flags & ORGAN_FAILING))
		H.adjustToxLoss(2)
		if(prob(45))
			to_chat(H, span_warning("You dont feel so well."))
	
	if(prob(25))
		to_chat(H, span_notice("You feel your wounds getting warm."))

	for(var/obj/item/bodypart/L in parts)
		if(L.heal_damage(heal_amt/parts.len, heal_amt/parts.len))
			H.update_damage_overlays()

	return TRUE
