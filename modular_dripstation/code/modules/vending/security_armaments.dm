/obj/machinery/armaments_dispenser
	icon = 'modular_dripstation/icons/obj/vending.dmi'
	contents = newlist(/obj/item/gun/energy/disabler/secure, 
					   /obj/item/gun/ballistic/automatic/pistol/ntusp)

/obj/machinery/armaments_dispenser/update_overlays()
	. = ..()
	if(!(stat & BROKEN) && powered())
		. += emissive_appearance(icon, "armament-light-mask", src)
