/atom/movable/screen/plane_master/text_effect
	name = "text effect plane"
	plane = TEXT_EFFECT_PLANE
	render_relay_planes = list(RENDER_PLANE_NON_GAME)

/atom/movable/screen/plane_master/game_world_fov_hidden
	name = "lower game world fov hidden"
	documentation = "If you want something to be hidden by fov, stick it on this plane. We're masked by the fov blocker plane, so the items on us can actually well, disappear."
	plane = GAME_PLANE_FOV_HIDDEN
	render_relay_planes = list(RENDER_PLANE_GAME_WORLD)

/atom/movable/screen/plane_master/game_world_fov_hidden/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	add_filter("vision_cone", 1, alpha_mask_filter(render_source = OFFSET_RENDER_TARGET(FIELD_OF_VISION_BLOCKER_RENDER_TARGET, offset), flags = MASK_INVERSE))

/atom/movable/screen/plane_master/field_of_vision_blocker
	name = "Field of vision blocker"
	documentation = "This is one of those planes that's only used as a filter. It masks out things that want to be hidden by fov.\
		<br>Literally just contains FOV images, or masks."
	plane = FIELD_OF_VISION_BLOCKER_PLANE
	appearance_flags = PLANE_MASTER|NO_CLIENT_COLOR
	render_target = FIELD_OF_VISION_BLOCKER_RENDER_TARGET
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	render_relay_planes = list()
	// We do NOT allow offsetting, because there's no case where you would want to block only one layer, at least currently
	allows_offsetting = FALSE
	start_hidden = TRUE
	// We mark as multiz_scaled FALSE so transforms don't effect us, and we draw to the planes below us as if they were us.
	// This is safe because we will ALWAYS be on the top z layer, so it DON'T MATTER
	multiz_scaled = FALSE

/atom/movable/screen/plane_master/field_of_vision_blocker/Initialize(mapload, datum/hud/hud_owner, datum/plane_master_group/home, offset)
	. = ..()
	mirror_parent_hidden()

/// Contains object permanence images for FoV
/atom/movable/screen/plane_master/game_world_object_permanence
	name = "object permanence plane master"
	documentation = "If you want something to be reviled by fov, stick it on this plane. We're masked by the fov blocker plane, so the items on us can actually well, appear."
	plane = GAME_PLANE_OBJECT_PERMANENCE
	render_relay_planes = list(RENDER_PLANE_GAME_WORLD)

/atom/movable/screen/plane_master/game_world_object_permanence/Initialize(mapload)
	. = ..()
	// only render images inside the FOV mask
	add_filter("vision_cone", 1, alpha_mask_filter(render_source = OFFSET_RENDER_TARGET(FIELD_OF_VISION_BLOCKER_RENDER_TARGET, offset)))

/atom/movable/screen/plane_master/floor_fov_hidden
	name = "floor fov hidden plane master"
	documentation = "Holds shadows."
	plane = FLOOR_PLANE_FOV_HIDDEN
	render_relay_planes = list(RENDER_PLANE_GAME_WORLD)

/atom/movable/screen/plane_master/floor_fov_hidden/Initialize(mapload)
	. = ..()
	add_filter("vision_cone", 1, alpha_mask_filter(render_source = OFFSET_RENDER_TARGET(FIELD_OF_VISION_BLOCKER_RENDER_TARGET, offset), flags = MASK_INVERSE))
