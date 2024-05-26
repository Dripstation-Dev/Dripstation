/obj/machinery/rnd/production/protolathe
	name = "protolathe"
	desc = "Converts raw materials into useful objects."
	icon_state = "protolathe"
	circuit = /obj/item/circuitboard/machine/protolathe
	categories = list(
								"Power Designs",
								"Medical Designs",
								"Bluespace Designs",
								"Stock Parts",
								"Equipment",
								"Tool Designs",
								"Mining Designs",
								"Electronics",
								"Weapons",
								"Ammo",
								"Firing Pins",
								"Computer Parts",
								//"Spacepod Designs", // dripstation spacepod move to new fab
								"Service",
								"Assemblies"
								)
	production_animation = "protolathe_n"
	allowed_buildtypes = PROTOLATHE
	light_mask = "protolathe_lightmask"

/obj/machinery/rnd/production/protolathe/disconnect_console()
	linked_console.linked_lathe = null
	..()

/obj/machinery/rnd/production/protolathe/update_overlays()
	. = ..()
	if(!(stat & BROKEN) && powered())
		if(busy)
			. += emissive_appearance(icon, "[light_mask]_n", src)
		else
			. += emissive_appearance(icon, light_mask, src)
