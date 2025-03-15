/obj/item/gun/energy/pulse
	icon = 'modular_dripstation/icons/obj/weapons/energy.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	muzzleflash_iconstate = "muzzle_flash_pulse"
	muzzle_flash_color = COLOR_PULSE_BLUE

/obj/item/gun/energy/pulse/unn
	name = "\improper UNN PV277"
	desc = "Pulse rifle, designated 'UNN PV277'. This pulse rifle is commonly found in the hands of UNN elite operatives."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "unn_pulserifle"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse, /obj/item/ammo_casing/energy/disabler)
	pin = /obj/item/firing_pin/dna/secure
	automatic_charge_overlays = FALSE

/obj/item/gun/energy/pulse/pistol
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse/pistol, /obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/pulse/pistol/unn
	icon_state = "unn_pulse"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse/pistol, /obj/item/ammo_casing/energy/disabler)
	pin = /obj/item/firing_pin/dna/secure
	automatic_charge_overlays = FALSE

/obj/item/gun/energy/pulse/destroyer
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "pulse_destroyer"
	item_state = "pulse"

/obj/item/gun/energy/pulse/pistol/m1911
	icon = 'icons/obj/guns/energy.dmi'

/obj/item/gun/energy/pulse/carbine
	item_state = "pulse"

/obj/item/gun/energy/pulse/carbine/unn
	name = "\improper UNN XTC665"
	desc = "Automatic pulse carabine, designated 'UNN XTC665'. This pulse rifle is commonly found in the hands of UNN elite operatives."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "unn_pulseauto"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse, /obj/item/ammo_casing/energy/disabler)
	burst_size = 3
	fire_delay = 8
	pin = /obj/item/firing_pin/dna/secure
	automatic_charge_overlays = FALSE

/obj/item/gun/energy/pulse/carbine/tgm
	name = "\improper TGM 19c4"
	desc = "Assault pulse carabine, designated 'TGM 19c4'. This pulse rifle is commonly found in the hands of Terra Gov Marines."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "tgm19c4"
	item_state = "pulse"

/obj/item/gun/energy/pulse/loyalpin
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/energy/pulse/carbine/loyalpin
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/energy/pulse/pistol/loyalpin
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/energy/pulse/pistol/m1911
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/energy/pulse/destroyer/loyalpin
	pin = /obj/item/firing_pin/implant/centcom_mindshield
