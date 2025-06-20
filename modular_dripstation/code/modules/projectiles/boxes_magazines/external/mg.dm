//L6 SAW
/obj/item/ammo_box/magazine/mm556x45_100
	name = "box magazine (5.56x45mm)"
	desc = "A 100-round box magazine designed for the L6 SAW."
	icon_state = "a556-100"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/a556
	caliber = CALIBER_556NATO
	max_ammo = 100

/obj/item/ammo_box/magazine/mm556x45_100/update_icon_state()
	. = ..()
	icon_state = "a556[sprite_designation]-[round(ammo_count(),20)]"

/obj/item/ammo_box/magazine/mm556x45_100/ap
	name = "box magazine (Armor-Piercing 5.56x45mm)"
	desc = "A 100-round box magazine designed for the L6 SAW. \
			These rounds deal less damage but penetrate cleanly through standart protective equipment."
	icon_state = "a556A-100"
	ammo_type = /obj/item/ammo_casing/a556/ap
	sprite_designation = "A"

/obj/item/ammo_box/magazine/mm556x45_100/ssaap
	name = "box magazine (TGov SSA AP 5.56x45mm)"
	desc = "A 100-round box magazine designed for the L6 SAW. \
			These rounds deal less damage but penetrate cleanly through special protective equipment."
	icon_state = "a556SA-100"
	ammo_type = /obj/item/ammo_casing/a556/ssaap
	sprite_designation = "SA"

/obj/item/ammo_box/magazine/mm556x45_100/inc
	name = "box magazine (Incendiary 5.56x45mm)"
	desc = "A 100-round box magazine designed for the L6 SAW. \
			These rounds deal less damage but ignite targets."
	icon_state = "a556I-100"
	ammo_type = /obj/item/ammo_casing/a556/inc
	sprite_designation = "I"



//L4 GPMG
/obj/item/ammo_box/magazine/mm712x82
	name = "box magazine (7.12x82mm)"
	desc = "A 50-round box magazine designed for the L4 GPMG."
	icon_state = "a762-50"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/mm712x82
	caliber = CALIBER_712X82
	max_ammo = 50

/obj/item/ammo_box/magazine/mm712x82/update_icon_state()
	. = ..()
	icon_state = "a762[sprite_designation]-[ammo_count() ? "50" : "0"]"

/obj/item/ammo_box/magazine/mm712x82/hollow
	name = "box magazine (Hollow-Point 7.12x82mm)"
	desc = "A 50-round box magazine designed for the L4 GPMG. \
			These rounds suffer against armor but can massively wound bare limbs."
	icon_state = "a762H-50"
	ammo_type = /obj/item/ammo_casing/mm712x82/hollow
	sprite_designation = "H"

/obj/item/ammo_box/magazine/mm712x82/ap
	name = "box magazine (Armor-Piercing 7.12x82mm)"
	desc = "A 50-round box magazine designed for the L4 GPMG. \
			These rounds deal less damage but penetrate cleanly through the best protective equipment."
	icon_state = "a762A-50"
	ammo_type = /obj/item/ammo_casing/mm712x82/ap
	sprite_designation = "A"

/obj/item/ammo_box/magazine/mm712x82/incen
	name = "box magazine (Incendiary 7.12x82mm)"
	desc = "A 50-round box magazine designed for the L4 GPMG. \
			These rounds deal less damage but ignite targets."
	icon_state = "a762I-50"
	ammo_type = /obj/item/ammo_casing/mm712x82/inc
	sprite_designation = "I"

/obj/item/ammo_box/magazine/mm712x82/update_icon_state()
	. = ..()
	icon_state = "a762[sprite_designation]-[round(ammo_count(),10)]"
