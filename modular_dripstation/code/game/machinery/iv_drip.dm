/obj/machinery/iv_drip
	var/datum/beam/current_beam
	base_pixel_x = 15
	base_pixel_y = -2

/obj/machinery/iv_drip/proc/update_beam()
	if(current_beam && !attached)
		QDEL_NULL(current_beam)
	else if(!current_beam && attached && !QDELETED(src))
		current_beam = Beam(attached, "iv_tube", 'modular_dripstation/icons/effects/beam.dmi', beam_type = /obj/effect/ebeam/ivdrip, emissive = FALSE, override_origin_pixel_x = base_pixel_x, override_origin_pixel_y = base_pixel_y)

/obj/effect/ebeam/ivdrip
	layer = OBJ_LAYER
