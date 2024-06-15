/obj/item/gun/energy/e_gun
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/nuclear
	ammo_x_offset = 2

/obj/item/gun/energy/e_gun/stun
	cell_type = /obj/item/stock_parts/cell/pulse/pistol	//specops grade cell

/obj/item/gun/energy/e_gun/energyrevolver
	name = "\improper NT-S02 Revolver Energy Gun"
	desc = "An expensive, modern recreation of the antique laser gun, and the second of the 'S' or personal defense weapons meant for the use of high ranking Nanotrasen`s Special Operations Department personnel. Like the standard energy gun, it has a stun and kill setting, but also provides specops grade taser setting."
	pin = /obj/item/firing_pin/implant/mindshield
	icon_state = "energyrevolver"
	item_state = "gun"
	ammo_x_offset = 2
	force = 10
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode/spec, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/e_gun/hos
	name = "\improper NT-S03 MultiPhase Energy Gun"
	desc = "An expensive recreation of the antique laser gun, and the third of the 'S' or personal defense weapons meant for the use of high ranking Nanotrasen`s Special Operations Department personnel. Like the standard energy gun, it has a stun and kill setting, but due to the increase in demand of portable EMP-based weaponry, this weapon is equipped with an ion mode. Lacks the ability to recharge on its own but provides military grade taser setting."
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/ion/hos)

/obj/item/gun/energy/e_gun/pdwpistol
	name = "\improper NT-S04 MultiPhase Energy Gun"
	desc = "An expensive, modern remake of the NT-S03 MultiPhase Energy gun, and the fourth of the 'S' or special class weapons meant for the use of high ranking Nanotrasen`s Special Operations Department personnel. Robust gun with multiple modes for combat issue. Glory to the NanoTrasen!"
	icon_state = "pdwpistol"
	item_state = "gun"
	force = 15
	ammo_x_offset = 2
	pin = /obj/item/firing_pin/implant/mindshield
	cell_type = /obj/item/stock_parts/cell/pulse/pistol
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode/spec, /obj/item/ammo_casing/energy/laser_spec, /obj/item/ammo_casing/energy/ion)

/obj/item/gun/energy/e_gun/mini
	name = "miniature energy gun"
	desc = "A small, pistol-sized version of the energy gun with a built-in flashlight. The NT-E4 functions as a popular self defense weapon among the elite due to its small size and cheap price. It has three settings: disable, stun and kill."
	icon_state = "mini"
	item_state = "gun"
	w_class = WEIGHT_CLASS_SMALL
	cell_type = /obj/item/stock_parts/cell/mini_egun
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/e_gun/mini/secure
	icon_state = "minialt"
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/energy/e_gun/mini/specops	//easy concealable gun for NT special operations department
	cell_type = /obj/item/stock_parts/cell/pulse/pistol	//specops grade cell
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode/spec, /obj/item/ammo_casing/energy/laser_spec)

/obj/item/gun/energy/e_gun/mini/practice_phaser
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/bouncer
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/dragnet
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/turret
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/stun
	desc = "Military issue energy gun, is able to fire stun rounds."
	desc = "The NT-ME5 hybrid energy gun is the newest generation of standardized energy equipment for use by NT private military forces. This hybrid energy gun comes equipped with two settings: disable and kill."
	pin = /obj/item/firing_pin/implant/mindshield
