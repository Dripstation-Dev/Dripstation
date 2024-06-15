//ammo boxes for 9mm
/obj/item/ammo_box/c9mm/fire
	name = "ammo box (9mm Incendiary)"
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/c9mm/ap
	name = "ammo box (9mm Armor-Piercing)"
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/no_direct/c38
	name = "ammo box (.38 special)"
	icon_state = "38box"
	ammo_type = /obj/item/ammo_casing/c38
	max_ammo = 20

/obj/item/ammo_box/no_direct/c38/rubber
	name = "ammo box (.38 rubber)"
	ammo_type = /obj/item/ammo_casing/c38/rubber

//APS, Glock, STM-9 Mag
/obj/item/ammo_box/magazine/pistolm9mm/ap
	name = "pistol magazine (9mm Armor-Piercing)"
	icon_state = "9x19pA-10"
	desc= "A 15-round 9mm magazine designed for the Stechkin APS Pistol. Loaded with rounds which penetrate armor but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/pistolm9mm/ap/update_icon_state()
	. = ..()
	icon_state = "9x19pA-[ammo_count() ? "10" : "0"]"

/obj/item/ammo_box/magazine/pistolm9mm/fire
	name = "pistol magazine (9mm Incendiary)"
	icon_state = "9x19pI-10"
	desc = "A 15-round 9mm magazine designed for the A Stechkin APS Pistol. Loaded with rounds which trade lethality for ignition of target."
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/magazine/pistolm9mm/fire/update_icon_state()
	. = ..()
	icon_state = "9x19pI-[ammo_count() ? "10" : "0"]"

/obj/item/ammo_box/magazine/pistolm9mm/pmag
	name = "Glock PMAG magazine (9mm)"
	desc = "A 21-round magazine for TSF side arm that contains 9mm rounds."
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	icon_state = "pmag9x19-21"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 21

/obj/item/ammo_box/magazine/pistolm9mm/pmag/update_icon_state()
	. = ..()
	icon_state = "pmag9x19-[ammo_count() ? "21" : "0"]"

/obj/item/ammo_box/magazine/pistolm9mm/pmag/ap
	name = "Glock PMAG magazine (9mm Armor-Piercing)"
	icon_state = "pmag9x19A"
	desc= "A 21-round magazine for TSF side arm. Loaded with rounds which penetrate armor but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/pistolm9mm/pmag/ap/update_icon_state()
	. = ..()
	icon_state = "pmag9x19A-[ammo_count() ? "21" : "0"]"

/obj/item/ammo_box/magazine/pistolm9mm/pmag/fire
	name = "Glock PMAG magazine (9mm Incendiary)"
	icon_state = "pmag9x19I"
	desc = "A 21-round magazine for TSF side arm. Loaded with rounds which trade lethality for ignition of target."
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/magazine/pistolm9mm/pmag/fire/update_icon_state()
	. = ..()
	icon_state = "pmag9x19I-[ammo_count() ? "21" : "0"]"

/obj/item/ammo_box/magazine/pistolm9mm/drum
	name = "Glock Drum magazine (9mm)"
	desc = "A 50-round magazine for TSF side arm that contains 9mm rounds."
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	icon_state = "stm9mag-50"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 50

/obj/item/ammo_box/magazine/pistolm9mm/pmag/drum/update_icon_state()
	. = ..()
	icon_state = "stm9mag-[ammo_count() ? "50" : "0"]"

/obj/item/ammo_box/magazine/pistolm9mm/drum/ap
	name = "Glock Drum magazine (9mm Armor-Piercing)"
	icon_state = "stm9magA-50"
	desc= "A 50-round magazine for TSF side arm. Loaded with rounds which penetrate armor but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/pistolm9mm/pmag/drum/ap/update_icon_state()
	. = ..()
	icon_state = "stm9magA-[ammo_count() ? "50" : "0"]"

/obj/item/ammo_box/magazine/pistolm9mm/drum/fire
	name = "Glock Drum magazine (9mm Incendiary)"
	icon_state = "stm9magI-50"
	desc = "A 50-round magazine for TSF side arm. Loaded with rounds which trade lethality for ignition of target."
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/magazine/pistolm9mm/pmag/drum/fire/update_icon_state()
	. = ..()
	icon_state = "stm9magI-[ammo_count() ? "50" : "0"]"

/obj/item/ammo_box/magazine/fn45
	name = "FNX-45 magazine (.45 ACP)"
	desc = "An 15-round .45 ACP magazine designed for the FNX-45 pistol."
	icon_state = "fn45"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	max_ammo = 15
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/fn45/ap
	name = "FNX-45 magazine (Armor-Piercing .45 ACP)"
	icon_state = "fn45A"
	ammo_type = /obj/item/ammo_casing/c45/ap

/obj/item/ammo_box/magazine/fn45/hp
	name = "FNX-45 magazine (Hollow-Point .45 ACP)"
	icon_state = "fn45H"
	ammo_type = /obj/item/ammo_casing/c45/hp

/obj/item/ammo_box/magazine/fn45/v
	name = "FNX-45 magazine (Venom .45 ACP)"
	icon_state = "fn45V"
	ammo_type = /obj/item/ammo_casing/c45/venom