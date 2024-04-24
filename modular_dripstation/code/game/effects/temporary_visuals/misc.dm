/obj/effect/temp_visual/annoyed
	name = "annoyed"
	icon = 'modular_dripstation/icons/effects/effects.dmi'
	icon_state = "annoyed"
	duration = 25

/obj/effect/temp_visual/annoyed/Initialize(mapload)
	. = ..()
	pixel_x = rand(-4,0)
	pixel_y = rand(8,12)
	animate(src, pixel_y = pixel_y + 16, alpha = 0, time = duration)

/obj/effect/frosty_breath
	icon = 'modular_dripstation/icons/effects/effects.dmi'
	icon_state = "frosty_breath"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = ABOVE_MOB_LAYER
	anchored = TRUE

/obj/effect/frosty_breath/Initialize(mapload, mob/living/carbon/human/H)
	. = ..()
	dir = H.dir
	if(H.buckled)
		pixel_y = (H.get_standard_pixel_y_offset(H.lying) + 10)
	if(dir == NORTH)
		layer = BELOW_MOB_LAYER
	flick("breath_[H.lying_prev]", src)
	QDEL_IN(src, 2 SECONDS)