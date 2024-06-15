/obj/item/gun/energy/laser
	name = "NT-E2 gun"
	desc = "The NT-E2 is a basic energy gun that has only one mode. Kill."
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/laser/hitscan
	name = "laser gun"
	desc = "The NT-L5 is a basic energy-based laser gun that uses full potential of beam guns and hits targets through glass and thin metal at the speed of light."
	icon_state = "laser_hitscan"
	item_state = LASER
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(/datum/material/iron=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hitscan)
	ammo_x_offset = 1
	shaded_charge = 1

/obj/item/gun/energy/laser/captain
	name = "antique energy gun"
	desc = "The NT-S01 energy gun is NT`s first attempt to provide an inbuilt recharger, and is the first in its line as an 'S' or special class weapon given to Nanotrasen`s Special Operations Department members. Due to how expensive it is to produce, and that the material used to do so deteriorates quickly, it was decommissioned, and the few models left are used as prizes meant to never see the light of day."

/obj/item/gun/energy/laser/centcom
	name = "\improper NT-S05 Laser Service Pistol"
	icon_state = "centcomlaser"
	item_state = "gun"
	w_class = WEIGHT_CLASS_NORMAL
	desc = "The NT-S05 laser gun is NT`s real recreation of NT-S01 aiming to provide an inbuilt recharger with real laser functions. It also has 'S' or special class weapon given to Nanotrasen`s Special Operations Department members. Now in service with NanoTrasen`s Special Operations Department agents."
	force = 10
	selfcharge = 1
	charge_amount = 2
	cell_type = /obj/item/stock_parts/cell/pulse/pistol
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hitscan)
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/gun/energy/laser/hellgun
	icon_state = "immolator"
	modifystate = TRUE

/obj/item/gun/energy/laser/hellgun/scattershot
	name = "scatter shot hellfire laser rifle"
	icon_state = "multilensimmolator"
	item_state = LASER
	desc = "An military-grade heavy laser rifle with a modified laser lens to scatter its shot into multiple smaller lasers. The inner-core can self-charge for theoretically infinite use."
	w_class = WEIGHT_CLASS_BULKY
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hellfire/scatter, /obj/item/ammo_casing/energy/laser/hellfire/precise)
	shaded_charge = 1
	selfcharge = 1

/obj/item/gun/energy/lasercannon
	modifystate = TRUE
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/xray
	w_class = WEIGHT_CLASS_BULKY
	ammo_x_offset = 4
	modifystate = TRUE
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/energy/laser/retro
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/laser/redtag
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/laser/bluetag
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/laser/practice
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/laser/instakill
	icon = 'icons/obj/guns/energy.dmi'