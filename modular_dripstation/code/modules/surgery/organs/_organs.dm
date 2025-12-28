/obj/item/organ
	var/is_ruptured = FALSE

/obj/item/organ/proc/rupture()
	return

/obj/item/organ/heart/rupture()
	if(owner && !is_ruptured)
		owner.flick_pain(100, TRUE)
		var/datum/disease/heart_failure/heart_attack = new(owner)
		owner.ForceContractDisease(heart_attack)
		is_ruptured = TRUE

/obj/item/organ/heart/on_life()
	..()
	if(is_ruptured)
		if(damage == 0)
			is_ruptured = FALSE

/obj/item/organ/eyes
	var/native_fov = FOV_180_DEGREES

/obj/item/organ/eyes/Insert(mob/living/carbon/M, special = FALSE, drop_if_replaced = FALSE, initialising)
	. = ..()
	if(native_fov)
		M.add_fov_trait(type, native_fov)

/obj/item/organ/eyes/Remove(mob/living/carbon/M, special = 0)
	. = ..()
	if(native_fov)
		M.remove_fov_trait(type)
