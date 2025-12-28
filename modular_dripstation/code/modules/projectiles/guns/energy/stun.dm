/obj/item/gun/energy/taser
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'
	muzzleflash_iconstate = "muzzle_flash_light"
	muzzle_flash_color = COLOR_VERY_SOFT_YELLOW

/obj/item/gun/energy/tesla_revolver
	modifystate = TRUE
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'

/obj/item/gun/energy/disabler
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'
	muzzleflash_iconstate = "muzzle_flash_disabler"
	muzzle_flash_color = COLOR_DISABLER_BLUE
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/hitscan)

/obj/item/gun/energy/disabler/secure
	name = "NT-D2S"
	desc = "The NT-D2 is a self-defense weapon that exhausts organic targets, weakening them until they collapse. Has white painting and secured pin."
	icon_state = "disabler_secure"
	pin = /obj/item/firing_pin/implant/mindshield
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/energy/disabler/ak
	name = "DK-244"
	desc = "The DK-244 is a self-defense weapon that exhausts organic targets, weakening them until they collapse."
	icon_state = "ak_244disabler"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	manufacturer = /datum/corporation/vostok
