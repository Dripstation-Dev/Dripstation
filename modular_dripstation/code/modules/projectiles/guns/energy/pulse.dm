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
	item_state = "oldrifle"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse, /obj/item/ammo_casing/energy/disabler)
	pin = /obj/item/firing_pin/dna/secure
	automatic_charge_overlays = FALSE
	manufacturer = /datum/corporation/unn

/obj/item/gun/energy/pulse/pistol
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse/pistol, /obj/item/ammo_casing/energy/electrode, /obj/item/ammo_casing/energy/laser)

/obj/item/gun/energy/pulse/pistol/unn
	name = "\improper UNN PV146"
	desc = "Pulse pistol, designated 'UNN PV146'. This pulse pistol is commonly found in the hands of UNN elite operatives."
	icon_state = "unn_pulse"
	item_state = "nt_ancile"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse/pistol, /obj/item/ammo_casing/energy/disabler)
	pin = /obj/item/firing_pin/dna/secure
	automatic_charge_overlays = FALSE
	manufacturer = /datum/corporation/unn

/obj/item/gun/energy/pulse/destroyer
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "pulse_destroyer"
	item_state = "pulse"

/obj/item/gun/energy/pulse/pistol/m1911
	icon = 'icons/obj/guns/energy.dmi'
	automatic_charge_overlays = FALSE
	item_state = "colt"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/energy/pulse/carbine
	item_state = "pulse"

/obj/item/gun/energy/pulse/carbine/unn
	name = "\improper UNN XTC665"
	desc = "Automatic pulse carabine, designated 'UNN XTC665'. This pulse carabine is commonly found in the hands of UNN elite operatives."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "unn_pulseauto"
	item_state = "oldrifle"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse, /obj/item/ammo_casing/energy/disabler)
	burst_size = 3
	fire_delay = 8
	pin = /obj/item/firing_pin/dna/secure
	automatic_charge_overlays = FALSE
	manufacturer = /datum/corporation/unn

/obj/item/gun/energy/pulse/carbine/tgaf
	name = "\improper TGAF 19c4"
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
