/obj/item/gun/energy/laser
	name = "NT-L4 laser gun"
	desc = "The NT-L4 is a basic energy-based laser gun that uses full potential of beam guns and hits targets through glass and thin metal at the speed of light."
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hitscan)

/obj/item/gun/energy/laser/practice
	ammo_type = list(/obj/item/ammo_casing/energy/laser/practice/hitscan)

/obj/item/gun/energy/laser/tactical
	name = "NT-L5 laser gun"
	desc = "The NT-L5 is a basic energy-based laser gun that uses full potential of beam guns and hits targets through glass and thin metal at the speed of light. Has a preinstalled mindshield pin."
	icon_state = "laser-new"
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/energy/laser/cybersun
	name = "laser carbine (Cybersun)"
	desc = "Basic energy-based laser gun that uses full potential of beam guns and hits targets through glass and thin metal at the speed of light. Cybersun model used by contract paramilitary forces."
	icon_state = "lasercarbine-cybersun"
	item_state = LASER
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(/datum/material/iron=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hitscan)
	ammo_x_offset = 1
	shaded_charge = 1

/obj/item/gun/energy/laser/captain
	name = "antique energy gun"
	desc = "The NT-S01 energy gun is NT`s first attempt to provide an inbuilt recharger, and is the first in its line as an 'S' or special class weapon given to Nanotrasen`s Special Operations Department members. Due to how expensive it is to produce, and that the material used to do so deteriorates quickly, it was decommissioned, and the few models left are used as prizes meant to never see the light of day."
	ammo_type = list(/obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/laser/centcom
	name = "\improper NT-S05 Laser Service Pistol"
	icon_state = "centcomlaser"
	item_state = "gun"
	w_class = WEIGHT_CLASS_NORMAL
	desc = "The NT-S05 laser gun is NT`s recreation of NT-S01 aiming to provide an inbuilt recharger with laser functions. It also has 'S' or special class weapon given to Nanotrasen`s Special Operations Department members. Now in service with NanoTrasen`s Special Operations Department agents."
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	force = 10
	selfcharge = 1
	charge_amount = 2
	cell_type = /obj/item/stock_parts/cell/pulse/pistol
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hitscan)
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/gun/energy/laser/hellgun
	name ="hellfire energy gun"
	desc = "The NT-E2, nicknamed 'hellgun', is the second non-experimental model laser gun, built before NT began installing regulators on its laser weaponry. This pattern of laser gun became infamous for the gruesome burn wounds and fires that it caused, and was quietly discontinued once it began to affect NT's reputation."
	icon_state = "immolator"
	modifystate = TRUE

/obj/item/gun/energy/laser/hellgun/scattershot
	name = "scatter shot hellfire laser rifle"
	icon_state = "multilensimmolator"
	item_state = LASER
	desc = "The NT-E2 gun equipped with a refraction kit that spreads and precise energy bolts."
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

/obj/item/gun/energy/laser/redtag
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/laser/bluetag
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/laser/instakill
	icon = 'icons/obj/guns/energy.dmi'