/mob/living
	/// Does it have FoV?
	var/has_field_of_vision = FALSE
	/// In case has_field_of_vision = TRUE, this is our fov type
	var/fov_view = FOV_180_DEGREES
	/// Lazy list of FOV traits that will apply a FOV view when handled.
	var/list/fov_traits

// Add FoV
/mob/living/Initialize(mapload)
	. = ..()
	if(has_field_of_vision)
		update_fov()
	update_shadow()

/mob/living/Login()
	. = ..()
	if(has_field_of_vision)
		update_fov_client()

// Update the hud smoothly
/mob/living/changeNext_move(num)
	. = ..()
	if(client && hud_used && hud_used.swap_hand)
		hud_used.swap_hand.smooth_update(world.time, next_move)

/*
/// Hides FoV when perspective is changed
/mob/living/reset_perspective(atom/A)
	. = ..()
	if(client?.perspective != MOB_PERSPECTIVE)
		SEND_SIGNAL(src, COMSIG_FOV_HIDE)
	else
		SEND_SIGNAL(src, COMSIG_FOV_SHOW)
*/

/// Is `observed_atom` in a mob's fog of war? This takes blindness, nearsightness and FOV into consideration
/mob/living/proc/in_fow(atom/observed_atom, ignore_self = FALSE)
	if(ignore_self && observed_atom == src)
		return TRUE
	if(observed_atom.alpha <= 45)
		return FALSE
	if(is_blind(src))
		return FALSE
	var/turf/T = get_turf(observed_atom)
	if(T.get_lumcount() <= LIGHTING_TILE_IS_DARK && !HAS_TRAIT(src, TRAIT_NIGHT_VISION) && !HAS_TRAIT(src, TRAIT_INFRARED_VISION) && !HAS_TRAIT(src, TRAIT_TRUE_NIGHT_VISION) && !HAS_TRAIT(src, TRAIT_MESON_VISION) && !HAS_TRAIT(src, TRAIT_THERMAL_VISION) && !HAS_TRAIT(src, TRAIT_XRAY_VISION))
		return FALSE

	var/turf/my_turf = get_turf(src) //Because being inside contents of something will cause our x,y to not be updated
	// If turf doesn't exist, then we wouldn't get a fov check called by `play_fov_effect` or presumably other new stuff that might check this.
	//  ^ If that case has changed and you need that check, add it.
	var/rel_x = observed_atom.x - my_turf.x
	var/rel_y = observed_atom.y - my_turf.y

	// Handling nearsightnedness
	if(HAS_TRAIT(src, TRAIT_NEARSIGHT))
		if((rel_x >= NEARSIGHTNESS_FOV_BLINDNESS || rel_x <= -NEARSIGHTNESS_FOV_BLINDNESS) || (rel_y >= NEARSIGHTNESS_FOV_BLINDNESS || rel_y <= -NEARSIGHTNESS_FOV_BLINDNESS))
			return FALSE

	if(!fov_view)
		return TRUE

	if(rel_x >= -1 && rel_x <= 1 && rel_y >= -1 && rel_y <= 1) //Cheap way to check inside that 3x3 box around you
		return TRUE //Also checks if both are 0 to stop division by zero

	// Get the vector length so we can create a good directional vector
	var/vector_len = sqrt(abs(rel_x) ** 2 + abs(rel_y) ** 2)

	/// Getting a direction vector
	var/dir_x
	var/dir_y
	switch(dir)
		if(SOUTH)
			dir_x = 0
			dir_y = -vector_len
		if(NORTH)
			dir_x = 0
			dir_y = vector_len
		if(EAST)
			dir_x = vector_len
			dir_y = 0
		if(WEST)
			dir_x = -vector_len
			dir_y = 0

	///Calculate angle
	var/angle = arccos((dir_x * rel_x + dir_y * rel_y) / (sqrt(dir_x**2 + dir_y**2) * sqrt(rel_x**2 + rel_y**2)))

	/// Calculate vision angle and compare
	var/vision_angle = (360 - fov_view) / 2
	return angle < vision_angle

/// Updates the applied FOV value and applies the handler to client if able
/mob/living/proc/update_fov()
	var/highest_fov
	for(var/trait_type in fov_traits)
		var/fov_type = fov_traits[trait_type]
		if(fov_type > highest_fov)
			highest_fov = fov_type
	fov_view = highest_fov
	if(HAS_TRAIT(src, TRAIT_EXPANDED_FOV))
		fov_view += 30
	update_fov_client()

/// Updates the FOV for the client.
/mob/living/proc/update_fov_client()
	if(!client || !has_field_of_vision)
		return
	var/datum/component/field_of_vision/fov_component = GetComponent(/datum/component/field_of_vision)
	if(fov_view)
		if(!fov_component)
			AddComponent(/datum/component/field_of_vision, fov_view)
		else
			fov_component.set_fov_angle(fov_view)
	else if(fov_component)
		qdel(fov_component)

/mob/living/proc/check_surrounding_darkness()
	var/lit_tiles = 0
	var/unlit_tiles = 0

	for(var/turf/open/turf_to_check in range(1, src.loc))
		var/light_amount = turf_to_check.get_lumcount()
		if(light_amount > 0.2)
			lit_tiles++
		else
			unlit_tiles++

	return lit_tiles < unlit_tiles

/// Adds a trait which limits a user's FOV
/mob/living/proc/add_fov_trait(source, type)
	LAZYINITLIST(fov_traits)
	fov_traits[source] = type
	update_fov()

/// Removes a trait which limits a user's FOV
/mob/living/proc/remove_fov_trait(source, type)
	if(!fov_traits) //Clothing equip/unequip is bad code and invokes this several times
		return
	fov_traits -= source
	UNSETEMPTY(fov_traits)
	update_fov()

//did you know you can subtype /image and /mutable_appearance? // Stop telling them that they might actually do it
/image/fov_image
	icon = 'modular_dripstation/icons/hud/fov/fov_effects.dmi'
	layer = EFFECTS_LAYER + FOV_EFFECT_LAYER
	appearance_flags = RESET_COLOR | RESET_TRANSFORM
	plane = FULLSCREEN_PLANE

/image/fov_image/inverse
	plane = GAME_PLANE_OBJECT_PERMANENCE

/// Plays a visual effect representing a sound cue for people with vision obstructed by FOV or blindness
/proc/play_fov_effect(atom/center, range, icon_state, dir = SOUTH, ignore_self = FALSE, angle = 0, time = 1.5 SECONDS, list/override_list)
	var/turf/anchor_point = get_turf(center)
	var/image/fov_image/fov_image
	var/list/clients_shown

	for(var/mob/living/living_mob in override_list || get_hearers_in_view(range, center))
		var/client/mob_client = living_mob.client
		if(!mob_client)
			continue
		if(HAS_TRAIT(living_mob, TRAIT_DEAF)) //Deaf people can't hear sounds so no sound indicators
			continue
		if(living_mob.in_fow(center, ignore_self))
			continue
		if(!fov_image) //Make the image once we found one recipient to receive it
			fov_image = new()
			fov_image.loc = anchor_point
			fov_image.icon_state = icon_state
			fov_image.dir = dir
			if(angle)
				var/matrix/matrix = new
				matrix.Turn(angle)
				fov_image.transform = matrix
			fov_image.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
		LAZYADD(clients_shown, mob_client)

		mob_client.images += fov_image
		//when added as an image mutable_appearances act identically. we just make it an MA becuase theyre faster to change appearance

	if(clients_shown)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(remove_image_from_clients), fov_image, clients_shown), time)

/atom/movable/screen/fov_blocker
	icon = 'modular_dripstation/icons/hud/fov/field_of_view.dmi'
	icon_state = "90"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FIELD_OF_VISION_BLOCKER_PLANE
	screen_loc = "BOTTOM,LEFT"//screen_loc = "BOTTOM+0.28,LEFT-0.46"

/atom/movable/screen/fov_shadow
	icon = 'modular_dripstation/icons/hud/fov/field_of_view.dmi'
	icon_state = "90_v"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = ABOVE_LIGHTING_PLANE
	screen_loc = "BOTTOM,LEFT"//"BOTTOM,LEFT-0.5"



//////DRIPSTATION - SHADOWS, ported from Escape From Nevada
/// List of vis_contents shadows for mobs
GLOBAL_LIST_EMPTY(shadow_movables)

/proc/get_mob_shadow(icon_state = NORMAL_MOB_SHADOW, plane = FLOOR_PLANE_FOV_HIDDEN, layer = SHADOW_LAYER, pixel_y = -4, vis_flags = VIS_INHERIT_DIR | VIS_UNDERLAY, appearance_flags = RESET_TRANSFORM)
	. = GLOB.shadow_movables["[icon_state]-[plane]-[layer]-[pixel_y]-[vis_flags]-[appearance_flags]"]
	if(.)
		return
	var/atom/movable/shadow/shadow = new()
	shadow.icon_state = icon_state
	shadow.plane = plane
	shadow.layer = layer
	shadow.pixel_y = pixel_y
	GLOB.shadow_movables["[icon_state]-[plane]-[layer]-[pixel_y]-[vis_flags]-[appearance_flags]"] = shadow
	return shadow

/mob/living/update_transform()
	update_shadow()
	SEND_SIGNAL(src, COMSIG_LIVING_POST_UPDATE_TRANSFORM) // ...and we want the signal to be sent now.

/mob/proc/update_shadow()
	return

/mob/living
	var/has_shadow = FALSE
	var/standing_shadow_yshift = -1

/mob/living/update_shadow()
	if(has_shadow)
		vis_contents -= get_mob_shadow(NORMAL_MOB_SHADOW, pixel_y = standing_shadow_yshift)

/mob/living/simple_animal/hostile/syndicate
	has_shadow = TRUE

/mob/living/simple_animal/hostile/nanotrasen
	has_shadow = TRUE

/mob/living/simple_animal/sheep
	has_shadow = TRUE

/mob/living/simple_animal/hostile/retaliate/goat
	has_shadow = TRUE

/mob/living/simple_animal/cow
	has_shadow = TRUE

/mob/living/simple_animal/pig
	name = "pig"
	desc = "Oink oink."
	icon_state = "pig"
	icon_living = "pig"
	icon_dead = "pig_dead"
	icon = 'modular_dripstation/icons/mob/simple_human.dmi'
	gender = MALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list("oink?","oink","OINK")
	speak_emote = list("oinks")
	emote_hear = list("brays")
	emote_see = list("rolls around")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/ham = 6)
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicks"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 50
	maxHealth = 50
	gold_core_spawnable = FRIENDLY_SPAWN
	blood_volume = BLOOD_VOLUME_GENERIC
	attack_vis_effect = ATTACK_EFFECT_KICK
	footstep_type = FOOTSTEP_MOB_SHOE
	has_shadow = TRUE

/obj/item/reagent_containers/food/snacks/meat/ham
	name = "ham"
	desc = "For when you need to go ham."
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/cooking_oil = 10) //Meat has fats that a food processor can process into cooking oil

/mob/living/simple_animal/pet
	has_shadow = TRUE

/mob/living/simple_animal/bot
	has_shadow = TRUE

/mob/living/simple_animal/bot/secbot
	standing_shadow_yshift = -3

/mob/living/simple_animal/bot/cleanbot
	standing_shadow_yshift = -3

/mob/living/simple_animal/bot/firebot
	standing_shadow_yshift = -3

/mob/living/simple_animal/bot/medbot
	standing_shadow_yshift = -5

/mob/living/simple_animal/hostile/bloodsucker
	has_shadow = TRUE

/mob/living/simple_animal/hostile/poison/giant_spider
	has_shadow = TRUE
	standing_shadow_yshift = -5

/mob/living/simple_animal/hostile/construct
	has_shadow = TRUE
	standing_shadow_yshift = -3

/mob/living/carbon/update_shadow()
	vis_contents -= get_mob_shadow(NORMAL_MOB_SHADOW, pixel_y = standing_shadow_yshift)
	vis_contents -= get_mob_shadow(LYING_MOB_SHADOW, pixel_y = standing_shadow_yshift-10)
	if(mobility_flags & MOBILITY_STAND)
		vis_contents |= get_mob_shadow(NORMAL_MOB_SHADOW, pixel_y = standing_shadow_yshift)
	else
		vis_contents |= get_mob_shadow(LYING_MOB_SHADOW, pixel_y = standing_shadow_yshift-10)

/mob/living/carbon/monkey
	standing_shadow_yshift = -5

/atom/movable/shadow
	name = "shadow"
	icon = 'modular_dripstation/icons/effects/shadow.dmi'
	icon_state = "shadow"
	plane = FLOOR_PLANE_FOV_HIDDEN
	layer = SHADOW_LAYER
	appearance_flags = RESET_TRANSFORM
	vis_flags = VIS_INHERIT_DIR | VIS_UNDERLAY
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
