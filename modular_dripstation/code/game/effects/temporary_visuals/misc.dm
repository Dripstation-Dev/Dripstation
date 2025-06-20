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

/obj/effect/temp_visual/block //color is white by default, set to whatever is needed
	name = "blocking glow"
	icon_state = "block"
	icon = 'modular_dripstation/icons/effects/effects.dmi'
	duration = 6.7

/obj/effect/temp_visual/block/Initialize(mapload, set_color)
	if(set_color)
		add_atom_colour(set_color, FIXED_COLOUR_PRIORITY)
	. = ..()
	pixel_x = rand(-12, 12)
	pixel_y = rand(-9, 0)