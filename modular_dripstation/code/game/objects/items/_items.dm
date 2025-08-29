/obj/item
	plane = GAME_PLANE_FOV_HIDDEN
	// Only mattters when worn on the head
	//var/fov_shadow_angle = ""


//fov stuff
/*
/obj/item/equipped(mob/user, slot, initial)
	. = ..()
	if(fov_shadow_angle && (slot & ITEM_SLOT_HEAD | ITEM_SLOT_MASK) && iscarbon(user))
		var/datum/component/field_of_vision/fov = user.GetComponent(/datum/component/field_of_vision)
		if(fov)
			fov.generate_fov_holder(source = user, shadow_angle = fov_shadow_angle, angle = get_fov_angle(fov_shadow_angle))
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		carbon_user.update_eyes()

/obj/item/dropped(mob/user, silent)
	. = ..()
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		carbon_user.update_eyes()

/mob/living/carbon/update_sight()
	update_eyes()
	return ..()

/mob/living/carbon/proc/update_eyes()
	if(!client)
		return

	var/fuck_with_fov = TRUE
	if(head?.fov_shadow_angle)
		fuck_with_fov = FALSE

	var/datum/component/field_of_vision/fov = GetComponent(/datum/component/field_of_vision)
	if(fuck_with_fov)
		if(fov?.shadow_angle == FOV_180PLUS45_DEGREES)
			fov.generate_fov_holder(source = src, shadow_angle = FOV_90_DEGREES, angle = get_fov_angle(FOV_90_DEGREES), register = FALSE, delete_holder = TRUE)
		else if(left_damage >= 3)
			fov.generate_fov_holder(source = src, shadow_angle = FOV_180PLUS45_DEGREES, angle = get_fov_angle(FOV_180PLUS45_DEGREES), register = FALSE, delete_holder = TRUE)

		if(fov?.shadow_angle == FOV_180MINUS45_DEGREES)
			fov.generate_fov_holder(source = src, shadow_angle = FOV_90_DEGREES, angle = get_fov_angle(FOV_90_DEGREES), register = FALSE, delete_holder = TRUE)
		else if(right_damage >= 3)
			fov.generate_fov_holder(source = src, shadow_angle = FOV_180MINUS45_DEGREES, angle = get_fov_angle(FOV_180MINUS45_DEGREES), register = FALSE, delete_holder = TRUE)

	return TRUE
*/
