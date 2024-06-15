/obj/item/gun/ballistic/automatic/proto
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/c20r
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/automatic/wt550
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/mini_uzi
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/automatic/c20r
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/automatic/tommygun
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/automatic/m90
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	mag_display_ammo = TRUE

/obj/item/gun/ballistic/automatic/ar
	mag_display = TRUE
	can_suppress = TRUE
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	fire_sound = 'sound/weapons/rifleshot.ogg'
	fire_sound_volume = 80
	vary_fire_sound = 0

/obj/item/gun/ballistic/automatic/wt550/armory
	icon_state = "wt550_secure"
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/ballistic/automatic/c20r/cobra
	name = "\improper Cobra 18"
	desc = "An older model of SMG manufactured by Scarborough Arms, a predecessor to the military C-20 series. Chambered in .45. "
	can_bayonet = FALSE

	icon_state = "c18_cobra"
	item_state = "c18_cobra"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'

//STM-9
/obj/item/gun/ballistic/automatic/stm9
	name = "\improper Souze TM-9 Gen.3"
	desc = "STM 9х19mm sport pistol-carbine supplied by some unknown union to TSF. Speed, accuracy and comfort recoil."
	icon_state = "stm9"
	item_state = "lwt650"
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	fire_delay = 0		//800 shots per minute, hello there
	burst_size = 1
	spread = 3				//need simple scope
	recoil = 0.5
	pin = /obj/item/firing_pin
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	mag_display = TRUE
	can_suppress = TRUE
	can_unsuppress = TRUE
	actions_types = list()
	vary_fire_sound = FALSE
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	load_sound = "sound/weapons/rifleload.ogg"
	load_empty_sound = "sound/weapons/rifleload.ogg"
	rack_sound = "sound/weapons/riflerack.ogg"
	eject_sound = "sound/weapons/rifleunload.ogg"
	eject_empty_sound = "sound/weapons/rifleunload.ogg"

/obj/item/gun/ballistic/automatic/k41s
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'



/obj/item/gun/ballistic/automatic/pistol
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/pistol/stickman
	icon = 'icons/obj/guns/projectile.dmi'


/obj/item/gun/ballistic/automatic/pistol/glock17
	name = "\improper Glock-17"
	desc = "A weapon from bygone times, this has been made to look like an old, blocky firearm from the 21st century. Chambered in 9x19mm."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "glock"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	can_suppress = FALSE
	fire_sound = 'modular_dripstation/sound/weapons/pistol/shot_alt.ogg'
	fire_delay = 1

/obj/item/gun/ballistic/automatic/pistol/glock18
	name = "\improper Glock-18"
	desc = "Terra Gov burst firing cheap polymer pistol chambered in 9x19mm. Its heavy duty barrel affects firerate."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "glock18"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	can_suppress = FALSE
	fire_sound = 'modular_dripstation/sound/weapons/pistol/shot_alt.ogg'
	burst_size = 3
	fire_delay = 2

/obj/item/gun/ballistic/automatic/pistol/fn45
	name = "\improper FNX-45 Tactical"
	desc = "Tactical modern Terra Gov service pistol. Better, faster, stronger than other service pistols. \
	Do not as iconic as M1911, but reliable and modern. Chambered in .45 caliber. Has a threaded barrel for suppressors."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "fnx"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/fn45
	starting_mag_type = /obj/item/ammo_box/magazine/fn45
	spread = 3
	can_suppress = TRUE
	can_unsuppress = TRUE
	fire_sound = "sound/weapons/pistolshotsmall.ogg"
	feedback_types = list(
		"fire" = 3
	)

	
/obj/item/gun/ballistic/automatic/pistol/ntusp
	icon = 'icons/obj/guns/projectile.dmi'
