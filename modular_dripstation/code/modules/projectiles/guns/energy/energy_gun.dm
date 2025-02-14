/obj/item/gun/energy/e_gun
	cell_type = /obj/item/stock_parts/cell/gun
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/e_gun/secure
	icon_state = "energyalt"
	can_cell = TRUE ///if the gun's cell can be replaced
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/energy/e_gun/ancient
	name = "NT-E1 gun"
	desc = "The NT-E2 is a basic energy gun that has only one mode. Kill."
	icon_state = "energyold"
	ammo_type = list(/obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/e_gun/nuclear
	ammo_x_offset = 2

/obj/item/gun/energy/e_gun/stun
	desc = "NT-ME5 Hybrid Energy Gun"
	desc = "The NT-ME5 hybrid energy gun is the newest generation of standardized energy equipment for use by NT private military forces. This hybrid energy gun comes equipped with two settings: disable and kill."
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	can_cell = TRUE ///if the gun's cell can be replaced
	cell_type = /obj/item/stock_parts/cell/gun/pulse/pistol	//specops grade cell

/obj/item/gun/energy/e_gun/energyrevolver
	name = "\improper NT-S02 Revolver Energy Gun"
	desc = "An expensive, modern recreation of the antique laser gun, and the second of the 'S' or personal defense weapons meant for the use of high ranking Nanotrasen`s Special Operations Department personnel. Like the standard energy gun, it has a stun and kill setting, but also provides specops grade taser setting."
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	icon_state = "energyrevolver"
	item_state = "gun"
	ammo_x_offset = 2
	force = 10
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
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
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	can_cell = TRUE ///if the gun's cell can be replaced
	cell_type = /obj/item/stock_parts/cell/gun/pulse/pistol
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode/spec, /obj/item/ammo_casing/energy/laser_spec, /obj/item/ammo_casing/energy/ion)

/obj/item/gun/energy/sniperrifle
	name = "L.W.A.P. Sniper Rifle"
	desc = "A beam rifle constructed of lightweight materials, fitted with a SMART aiming-system scope."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "esniper"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hitscan/sniper)
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	zoomable = TRUE
	zoom_amt = 7 //Long range, enough to see in front of you, but no tiles behind you.
	fire_delay = 10
	ammo_x_offset = 2
	charge_sections = 3
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/energy/sniperrifle/secure
	icon_state = "esniper_black"
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/energy/plasmarifle
	name = "Plasma Assault Rifle"
	desc = "A plasma rifle constructed of lightweight materials, Cybersun Armory. Slowly fires powerful plasma projectiles."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "cybersun_plasmarifle"
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/combat)
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	pin = /obj/item/firing_pin/fucked
	charge_sections = 1
	shaded_charge = 1

/obj/item/gun/energy/plasmarifle/unsecure
	pin = null

/obj/item/gun/energy/e_gun/mini
	name = "miniature energy gun"
	desc = "A small, pistol-sized version of the energy gun with a built-in flashlight. The NT-E4 functions as a popular self defense weapon among the elite due to its small size and cheap price. It has three settings: disable, stun and kill."
	icon_state = "mini"
	item_state = "gun"
	w_class = WEIGHT_CLASS_SMALL
	cell_type = /obj/item/stock_parts/cell/gun/mini
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/e_gun/mini/secure
	icon_state = "minialt"
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/energy/e_gun/mini/specops	//easy concealable gun for NT special operations department
	cell_type = /obj/item/stock_parts/cell/gun/pulse/pistol	//specops grade cell
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/electrode/spec, /obj/item/ammo_casing/energy/laser_spec)

/obj/item/gun/energy/e_gun/mini/practice_phaser
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/bouncer
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/dragnet
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/turret
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/e_gun/advtaser/secure
	icon_state = "advtaser_alt"
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	can_cell = TRUE ///if the gun's cell can be replaced
	charge_sections = 1
