/mob
	plane = GAME_PLANE_FOV_HIDDEN

/mob/key_down(key, client/client, full_key)
	..()
	SEND_SIGNAL(src, COMSIG_MOB_KEYDOWN, key, client, full_key)

/// Can this mob read
/mob/proc/can_read(atom/viewed_atom, reading_check_flags = (READING_CHECK_LITERACY|READING_CHECK_LIGHT), silent = FALSE)
	if(is_blind(src))
		to_chat(src, span_warning("As you are trying to read [viewed_atom], you suddenly feel very stupid! Yeah, you remember that you can`t."))
		return
	if((reading_check_flags & READING_CHECK_LITERACY) && !is_literate())
		if(!silent)
			to_chat(src, span_warning("You try to read [viewed_atom], but can't comprehend any of it."))
		return FALSE

	if((reading_check_flags & READING_CHECK_LIGHT) && !has_light_nearby() && !has_nightvision())
		if(!silent)
			to_chat(src, span_warning("It's too dark in here to read!"))
		return FALSE

	return TRUE

/**
 * Checks if there is enough light where the mob is located
 *
 * Args:
 *  light_amount (optional) - A decimal amount between 1.0 through 0.0 (default is 0.2)
**/
/mob/proc/has_light_nearby(light_amount = LIGHTING_TILE_IS_DARK)
	var/turf/mob_location = get_turf(src)
	var/area/mob_area = get_area(src)

	if(mob_location.get_lumcount() > light_amount)
		return TRUE
	else if(!mob_area.static_lighting)
		return TRUE

	return FALSE
