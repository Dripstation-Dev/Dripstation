/obj/item/organ/appendix/lizard
	name = "lizard healing gland"
	desc = "The gland rapidly consumes nutrients in blood to heal wounds."
	var/hunger_reduction = 2
	var/toxin_damage = FALSE
	COOLDOWN_DECLARE(check_ligapp_cd)

/obj/item/organ/appendix/lizard/on_life()
	..()
	var/mob/living/carbon/human/H = owner
	if(!(organ_flags & ORGAN_FAILING))
		if(H.nutrition <= NUTRITION_LEVEL_STARVING && H.get_damaged_bodyparts(TRUE,TRUE,null,BODYPART_ORGANIC))
			if(H.blood_volume >= BLOOD_VOLUME_SAFE(H))
				H.blood_volume -= 0.5
				if(prob(33))
					to_chat(H, span_warning("You feel like you are wasting away!"))
			else
				H.adjustOrganLoss(ORGAN_SLOT_APPENDIX, 1)
				if(prob(33))
					to_chat(H, span_userdanger("Your healing gland works on it`s maximum!"))
			H.heal_overall_damage(0.5, 0.5, 0, required_status = BODYPART_ORGANIC, updating_health = TRUE)
	else
		H.adjustToxLoss(1)
		if(prob(33))
			to_chat(H, span_warning("You don`t feel so well."))
	if(!COOLDOWN_FINISHED(src, check_ligapp_cd))	//just stop firing this checks all the time
		return
	if(islizard(H))
		if(inflamed)
			for(var/datum/disease/appendicitis/A in H.diseases)
				A.cure()
			inflamed = FALSE
		var/datum/component/regeneration/regen = H.GetComponent(/datum/component/regeneration)
		//if(!regen)
		//return
		var/effectiveness = canheal(H)
		if(!effectiveness)
			regen?.health_per_second = 0
		else
			regen?.health_per_second = effectiveness
		COOLDOWN_START(src, check_ligapp_cd, 4 SECONDS)	//give life like 4 seconds to cool down

/obj/item/organ/appendix/lizard/Insert(mob/living/carbon/M, special = 0)
	..()
	if(!islizard(M))
		inflamed = TRUE
		M.ForceContractDisease(new /datum/disease/appendicitis(), FALSE, TRUE)
	var/datum/component/regeneration/regen = M.GetComponent(/datum/component/regeneration)
	regen?.hunger_mod = hunger_reduction

/obj/item/organ/appendix/lizard/Remove(mob/living/carbon/M, special = 0)
	..()
	var/datum/component/regeneration/regen = M.GetComponent(/datum/component/regeneration)
	regen?.hunger_mod = initial(regen?.hunger_mod)
	regen?.health_per_second = initial(regen?.health_per_second)

/obj/item/organ/appendix/lizard/update_name(updates=ALL)
	. = ..()
	name = "lizard healing gland"

/obj/item/organ/appendix/lizard/update_icon(updates=ALL)
	. = ..()
	icon_state = "appendix"

/obj/item/organ/appendix/lizard/proc/canheal(mob/living/carbon/human/H)
	if(HAS_TRAIT(H, TRAIT_NOHUNGER))
		return 0
	if(!H.get_damaged_bodyparts(TRUE,TRUE,null,BODYPART_ORGANIC))
		return 0
	
	switch(H.nutrition)
		if(0)
			return 0
		if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
			return 0.5
		if(NUTRITION_LEVEL_HUNGRY to NUTRITION_LEVEL_FED)
			return 1
		if(NUTRITION_LEVEL_WELL_FED to NUTRITION_LEVEL_FULL)
			return 1.5
		else
			return 2
		
/*
/obj/item/organ/appendix/lizard/proc/heal(mob/living/carbon/human/H, actual_power)
	var/heal_amt = actual_power
	var/list/parts = H.get_damaged_bodyparts(TRUE,TRUE)

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

	for(var/obj/item/bodypart/L in parts)
		if(L.heal_damage(heal_amt/parts.len, heal_amt/parts.len))
			H.update_damage_overlays()
			if(prob(25))
				to_chat(H, span_notice("You feel your wounds getting warm."))

	return TRUE
*/
