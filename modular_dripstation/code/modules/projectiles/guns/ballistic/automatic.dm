/obj/item/gun/ballistic/automatic/proto
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/c20r
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/c20r/cobra
	name = "\improper 'Cobra' 18"
	desc = "An older model of SMG manufactured by Scarborough Arms, a predecessor to the military C-20 series. Chambered in .45."
	can_bayonet = FALSE
	can_suppress = TRUE
	icon_state = "c18_cobra"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/c20r/waffle
	name = "\improper W-20"
	desc = "A brand new SMG manufactured by Waffle Arms. Chambered in .45."
	can_bayonet = FALSE
	empty_indicator = FALSE
	can_suppress = TRUE
	spread = 0
	icon_state = "waffle_smg"
	pin = /obj/item/firing_pin/fucked

/obj/item/gun/ballistic/automatic/c20r/waffle/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/c20r/vector
	name = "\improper UNN PDW-45 'Vector'"
	desc = "A brand new SMG manufactured by UNN nicknamed Vector. Chambered in .45."
	can_bayonet = FALSE
	empty_indicator = TRUE
	can_suppress = FALSE
	icon_state = "unn_vector"
	fire_delay = 0
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	pin = /obj/item/firing_pin/dna/secure

/obj/item/gun/ballistic/automatic/c20r/aegis
	name = "\improper 'Aegis'"
	desc = "An SMG manufactured for Nanotrasen`s Special Operations Department. Chambered in .45."
	can_bayonet = FALSE
	can_suppress = FALSE
	mag_display_ammo = FALSE
	icon_state = "nt_aegis"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/wt550
	item_state = "wt550"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/wt550/armory
	icon_state = "wt550_secure"
	item_state = "wt550_secure"
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/ballistic/automatic/sa450
	name = "\improper Shellgard security auto carbine"
	desc = "A personal defence weapon that uses 4.6x30mm rounds, designated the SA-450 Automatic Carbine. Has a four-round burst or a semi-automatic firing mode."
	icon_state = "shelg_smg"
	item_state = "shelg_smg"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	mag_type = /obj/item/ammo_box/magazine/sa450
	fire_delay = 2
	burst_size = 4
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	can_suppress = TRUE
	can_bayonet = TRUE
	knife_x_offset = 25
	knife_y_offset = 12
	mag_display = TRUE

/obj/item/gun/ballistic/automatic/mini_uzi
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/automatic/tommygun
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/automatic/m90
	name = "\improper Militech M-90gl"
	desc = "A three-round burst 5.56 toploading rifle, designated 'M-90gl'. Has an attached underbarrel grenade launcher which can be toggled on and off."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	mag_display_ammo = TRUE

/obj/item/gun/ballistic/automatic/m90/m31a1
	name = "\improper Militech M-31a1 Advanced Infantry Combat Weapon"
	desc = "A three-round burst 5.56 toploading rifle, designated 'M-31a1', is more expensive in manufacturing predecessor of 'M-90gl'. It has an attached underbarrel grenade launcher which can be toggled on and off."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "m31a1"
	empty_indicator = FALSE
	can_suppress = TRUE
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/p90
	name = "\improper P-90 Personal Defense Weapon"
	desc = "A three-round burst 5.56 toploading rifle, designated 'P-90PDW'."
	icon_state = "p90"
	item_state = "m90"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'sound/weapons/gunshot_smg.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	pin = /obj/item/firing_pin
	mag_display = TRUE
	empty_indicator = TRUE

/obj/item/gun/ballistic/automatic/ar
	mag_display = TRUE
	can_suppress = TRUE
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	fire_sound = 'sound/weapons/rifleshot.ogg'
	item_state = "arifle"
	fire_sound_volume = 80
	vary_fire_sound = 0

/obj/item/gun/ballistic/automatic/ar/mk4
	name = "\improper Militech M-K4 Infantry Assault Rifle"
	desc = "A robust assault rifle used by Militech fighting forces."
	icon_state = "militech_mkIV"
	pin = /obj/item/firing_pin/dna

/obj/item/gun/ballistic/automatic/ar/mk4/grn
	name = "\improper Militech M-K4 Infantry Assault Rifle"
	desc = "A robust assault rifle used by Militech fighting forces."
	icon_state = "militech_mkIV_grn"
	item_state = "militech_mkIV_grn"

/obj/item/gun/ballistic/automatic/ar/tgm16
	name = "\improper TGM-16 Infantry Assault Rifle"
	desc = "A robust assault rifle used by Terra Gov Marine Corps."
	icon_state = "tgm16"
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/ar/waffle
	name = "\improper W-5 Infantry Assault Rifle"
	desc = "A robust assault rifle used by Waffle Special Operations Division."
	icon_state = "waffle_assault"
	pin = /obj/item/firing_pin/fucked

/obj/item/gun/ballistic/automatic/ar/waffle/unrestricted
	pin = /obj/item/firing_pin

//STM-9
/obj/item/gun/ballistic/automatic/stm9
	name = "\improper Souze TM-9 Gen.3"
	desc = "STM 9x19mm sport pistol-carbine supplied by some unknown union to Terra Gov. Speed, accuracy and comfort recoil."
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

/obj/item/gun/ballistic/automatic/pistol/glock17/ancile
	name = "\improper NB-2 'Ancile'"
	desc = "Nanotrasen easily concealable servise pistol. Chambered in 9x19mm."
	icon_state = "nt_ancile"
	w_class = WEIGHT_CLASS_SMALL
	can_suppress = FALSE
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm

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

/obj/item/gun/ballistic/automatic/pistol/glock18/shelg
	name = "\improper SSP-7 'Lawyer'"
	desc = "Burst firing cheap pocket polymer pistol chambered in 9x19mm manufactured by Shellgard Arms branch. Nicknamed 'Lawyer' by Shellgard security officers."
	icon_state = "shelg_lawyer"
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 1
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm

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

/obj/item/gun/ballistic/automatic/pistol/m1911/alt
	name = "\improper M1911M"
	desc = "A modern variant of classic .45 handgun with a small magazine capacity."
	icon_state = "m1911b"

/obj/item/gun/ballistic/automatic/pistol/m1911/signature
	name = "\improper M1911 Signature"
	desc = "A rare variant of classic .45 handgun with a small magazine capacity."
	icon_state = "ma_signature1911"

/obj/item/gun/ballistic/automatic/pistol/ntusp
	icon = 'icons/obj/guns/projectile.dmi'


// L6 SAW //

/obj/item/gun/ballistic/automatic/l6_saw
	desc = "A modified 5.56x45mm light machine gun, designated 'L6 SAW'. Has 'Militech Armoury - 2503' engraved on the receiver below the designation."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	item_state = "l6"
	mag_type = /obj/item/ammo_box/magazine/mm556x45_100

/obj/item/gun/ballistic/automatic/l6_saw/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_ICON)

/obj/item/gun/ballistic/automatic/l6_saw/update_icon()
	. = ..()
	item_state = "[initial(item_state)][cover_open ? "open" : "closed"][magazine ? "mag" : "nomag"]"
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()

/obj/item/gun/ballistic/automatic/l6_saw/m60
	name = "\improper L4 GPMG"
	desc = "A general purpose 7.62 machine gun, designated 'L4 GPMG'. Heavyly modified for single combatant usage."
	icon_state = "m60"
	item_state = "m60"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	mag_type = /obj/item/ammo_box/magazine/mm712x82

/obj/item/gun/ballistic/automatic/l6_saw/m60/unrestricted
	pin = /obj/item/firing_pin

///Borg L6
/obj/item/gun/energy/printer
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

///Laser rifle
/obj/item/gun/ballistic/automatic/laser
	name = "\improper energy carbine"

/obj/item/gun/ballistic/automatic/laser/tgmc
	name = "\improper TGM 43"
	desc = "Assault energy carabine, designated 'TGM 43'. This energy rifle is commonly found in the hands of Terra Gov Marines."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "tgm43"
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE