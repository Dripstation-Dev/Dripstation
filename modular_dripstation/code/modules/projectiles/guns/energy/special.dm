/obj/item/gun/energy/ionrifle
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/ionrifle/pistol
	name = "ion pistol"
	desc = "The NT-I3 Prototype Ion Projector is a compact ion pistol, built for personal defense."
	icon_state = "ionpistol"
	item_state = "gun"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/ion/weak)
	cell_type = /obj/item/stock_parts/cell/mini_egun
	ammo_x_offset = 2
	charge_sections = 2

/obj/item/gun/energy/ionrifle/cybersun
	name = "compact ion rifle"
	desc = "The CS-I7 Prototype Ion Projector is a compact ion rifle, built to be very ergonomic and deadly efficient."
	icon_state = "ioncarbine-cybersun"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/energy/temperature
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/temperature/security
	icon_state = "freezegun_secure"
	pin = /obj/item/firing_pin/implant/mindshield
