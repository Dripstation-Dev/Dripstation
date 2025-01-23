/obj/machinery/door/window
	var/cancolor = TRUE

/obj/machinery/door/window/Initialize(mapload, set_dir, unres_sides)
	. = ..()
	if(!color && cancolor)
		color = color_windows(src)

/obj/machinery/door/window/clockwork
	cancolor = FALSE

/obj/machinery/door/window/brigdoor/tinted
	cancolor = FALSE
	opacity = TRUE

/obj/machinery/door/window/brigdoor/tinted/open(forced=FALSE)
	if (operating) //doors can still open when emag-disabled
		return 0
	if(!forced)
		if(!hasPower())
			return 0
	if(forced < 2)
		if(obj_flags & EMAGGED)
			return 0
	if(!operating) //in case of emag
		operating = TRUE
	do_animate("opening")
	playsound(src, 'sound/machines/windowdoor.ogg', 100, 1)
	icon_state ="[base_state]open"
	sleep(1 SECONDS)

	density = FALSE
	opacity = FALSE
	air_update_turf()
	update_freelook_sight()

	if(operating == 1) //emag again
		operating = FALSE
	return 1

/obj/machinery/door/window/brigdoor/tinted/close(forced=FALSE)
	if (operating)
		return 0
	if(!forced)
		if(!hasPower())
			return 0
	if(forced < 2)
		if(obj_flags & EMAGGED)
			return 0
	operating = TRUE
	do_animate("closing")
	playsound(src, 'sound/machines/windowdoor.ogg', 100, 1)
	icon_state = base_state

	density = TRUE
	opacity = TRUE
	air_update_turf()
	update_freelook_sight()
	sleep(1 SECONDS)

	operating = FALSE
	return 1
