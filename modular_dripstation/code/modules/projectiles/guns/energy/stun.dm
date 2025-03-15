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

/obj/item/gun/energy/disabler/secure
	name = "NT-D2S"
	desc = "The NT-D2 is a self-defense weapon that exhausts organic targets, weakening them until they collapse. Has white painting and secured pin."
	icon_state = "disabler_secure"
	pin = /obj/item/firing_pin/implant/mindshield
