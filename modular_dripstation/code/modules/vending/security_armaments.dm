/obj/machinery/armaments_dispenser
	icon = 'modular_dripstation/icons/obj/vending.dmi'
	var/list/allowed_types = list(/obj/item/ammo_box/magazine/v38/rubber, /obj/item/ammo_box/magazine/recharge/ntusp)
	
	contents = newlist(/obj/item/gun/ballistic/automatic/pistol/v38/less_lethal, 
					   /obj/item/gun/ballistic/automatic/pistol/ntusp)

/obj/machinery/armaments_dispenser/update_overlays()
	. = ..()
	if(!(stat & BROKEN) && powered())
		. += emissive_appearance(icon, "armament-light-mask", src)
