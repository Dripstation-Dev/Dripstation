///Sniper///
/obj/item/gun/ballistic/rifle/sniper_rifle
	name = "\improper anti-material sniper rifle"
	icon_state = "antimaterial_rifle"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/rifle/sniper_rifle/syndicate
	icon_state = "antimaterial_rifle_blc"

/obj/item/gun/ballistic/rifle/sniper_rifle/ultrasecure
	icon_state = "antimaterial_rifle_blc"

/obj/item/gun/ballistic/rifle/sniper_rifle/waffle
	name = "\improper anti-material sniper rifle W-7"
	icon_state = "waffle_sniper"
	item_state = "waffle_sniper"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	pin = /obj/item/firing_pin/fucked

/obj/item/gun/ballistic/rifle/sniper_rifle/waffle/unrestricted
	pin = /obj/item/firing_pin

///Boltaction///
/obj/item/gun/ballistic/rifle/boltaction/brand_new
	desc = "A brand new Mosin Nagant issued by Nanotrasen for their interns. You would rather not to damage it."
	icon_state = "mosinprime"
	item_state = "mosinprime"
	sawn_desc = "A sawn-off Brand New Nagant... Doing this was a sin, I hope you're happy. \
		You are now probably one of the few people in the universe to ever hold a \"Brand New Obrez\". \
		Even thinking about that name combination makes you ill."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	zoomable = TRUE
	zoom_amt = 7 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 2
	actions_types = list()

/obj/item/gun/ballistic/rifle/boltaction/brand_new/sawoff(mob/user)
	. = ..()
	if(.)
		name = "\improper Brand New Obrez" // wear it loud and proud

/obj/item/gun/ballistic/rifle/boltaction/qmrifle
	name = "\improper 'Forbidden' precision rifle"
	desc = "Modernized boltaction rifle, the frame feels robust as cargotech liver. \
	This thing was probably built with a conversion kit from a shady NTnet site. \
	<br><br>\
	<i>BRAND NEW: Cannot be sawn off.</i>"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	icon_state = "mosintactical"
	item_state = "mosintactical"
	can_be_sawn_off = FALSE

// The Lionhunter, a gun for heretics
// The ammo it uses takes time to "charge" before firing,
// releasing a homing, very damaging projectile
/obj/item/gun/ballistic/rifle/boltaction/lionhunter
	name = "\improper Lionhunter's Rifle"
	desc = "An antique looking rifle that looks immaculate despite being clearly very old. There are visually no aiming devices on the weapon."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'