/obj/item/gun/ballistic/shotgun
	muzzleflash_iconstate = "muzzle_flash_medium"
	manufacturer = /datum/corporation/wardtakhashi

/obj/item/gun/ballistic/shotgun/lever
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

/obj/item/gun/ballistic/shotgun/lever/chamber_round()
	..()
	flick("wintonrifle_flick", src)

/obj/item/gun/ballistic/shotgun/repeater
	name = "Leicester Repeater"
	desc = "The gun that won the west or so they say. But space is a very different kind of frontier all together. Chambered for .45-70 Governemnt."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "repeater"
	fire_sound = "sound/weapons/leverfire.ogg"
	fire_sound_volume = 50
	rack_sound = "sound/weapons/leverrack.ogg"
	load_sound = "sound/weapons/leverload.ogg"
	fire_delay = 10
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lever/adv

/obj/item/ammo_box/magazine/internal/shot/lever/adv
	max_ammo = 13
	ammo_type = /obj/item/ammo_casing/m4570
	caliber = CALIBER_4570

/obj/item/gun/ballistic/shotgun/riot
	desc = "A sturdy shotgun with a standart magazine and a fixed tactical stock designed for non-lethal riot control."
	icon_state = "policeshotgun"
	item_state = "policeshotgun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	fire_delay = 8
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	can_be_sawn_off  = FALSE

/obj/item/gun/ballistic/shotgun/riot/remington
	name = "\improper Remington 870 Riot"
	desc = "A sturdy shotgun with a longer magazine and a fixed tactical stock designed for total riot control."
	icon_state = "riotshotgun"
	item_state = "riotshotgun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_left.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_right.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	mag_type = /obj/item/ammo_box/magazine/internal/shot/adv
	fire_delay = 6
	can_be_sawn_off  = TRUE

/obj/item/ammo_box/magazine/internal/shot/adv
	name = "riot adv shotgun internal magazine"
	max_ammo = 8
	ammo_type = /obj/item/ammo_casing/shotgun/rubbershot

/obj/item/ammo_box/magazine/internal/shot/adv/lethal
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot

/obj/item/gun/ballistic/shotgun/automatic
	icon_state = "autoshotgun"
	item_state = "autoshotgun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	mag_type = /obj/item/ammo_box/magazine/internal/shot/adv
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/shotgun/automatic/lethal
	mag_type = /obj/item/ammo_box/magazine/internal/shot/adv/lethal

/obj/item/gun/ballistic/shotgun/automatic/cats
	name = "\improper C.A.T. Shotgun"
	desc = "Combat Automatic Tactical Shotgun - a powerful automatic rifle mainly used by the Terra Government forces."
	icon_state = "cats"
	item_state = "autoshotgun"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/catm12g
	can_suppress = FALSE
	burst_size = 2
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT, SELECT_FULLY_AUTOMATIC)
	bolt_type = BOLT_TYPE_STANDARD
	fire_delay = 6
	fire_delay = 1
	mag_display = TRUE
	mag_display_ammo = FALSE
	empty_indicator = FALSE
	semi_auto = TRUE
	internal_magazine = FALSE
	tac_reloads = TRUE
	manufacturer = /datum/corporation/hephaestus/militech

/obj/item/gun/ballistic/shotgun/automatic/combat
	name = "\improper CS-16A Shotgun"
	icon_state = "cshotgun"
	item_state = "cshotgun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_left.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_right.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	burst_size = 2
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT)
	auto_fire_delay = 0
	manufacturer = /datum/corporation/hephaestus/militech

/obj/item/gun/ballistic/shotgun/automatic/combat/compact
	name = "\improper CS-16C Shotgun"
	weapon_weight = WEAPON_MEDIUM

/obj/item/gun/ballistic/shotgun/automatic/breaching
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)
	burst_size = 0
	auto_fire_delay = 0

/obj/item/gun/ballistic/shotgun/automatic/dual_tube
	name = "\improper AD-12 DualTube Assault Shotgun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "cycler"

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/chamber_round()
	..()
	flick("cycler_flick", src)

/obj/item/gun/ballistic/shotgun/bulldog
	desc = "A semi-auto, mag-fed Scarborough Arms shotgun for combat in narrow corridors, nicknamed the 'Bulldog' by boarding parties. Only compatible with specialized 8-round drum magazines."
	manufacturer = /datum/corporation/scarborough

/obj/item/gun/ballistic/shotgun/bulldog/m12
	name = "\improper Combat Assault Shotgun M-12"
	desc = "A semi-auto, mag-fed Militech shotgun for combat in narrow corridors, nicknamed 'Saiga' by boarding parties. Compatible only with specialized 8-round drum magazines."
	icon_state = "militech_bulldogCAS"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	mag_display_ammo = FALSE
	pin = /obj/item/firing_pin/dna
	manufacturer = /datum/corporation/hephaestus/militech

/obj/item/gun/ballistic/shotgun/bulldog/waffle
	name = "\improper Waffle Combat Assault Shotgun WA-12"
	desc = "A semi-auto, mag-fed Waffle shotgun for combat in narrow corridors. Compatible only with specialized 8-round drum magazines."
	icon_state = "waffle_shotgun"
	item_state = "waffle_shotgun"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	can_suppress = TRUE
	mag_display_ammo = FALSE
	empty_indicator = FALSE
	pin = /obj/item/firing_pin/fucked
	manufacturer = /datum/corporation/traitor/waffleco

/obj/item/gun/ballistic/shotgun/bulldog/waffle/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/shotgun/bulldog/waffle/traitor
	pin = /obj/item/firing_pin
	mag_type = /obj/item/ammo_box/magazine/m12g/less_painfull

/obj/item/gun/ballistic/shotgun/doublebarrel
	item_state = "shotgun_db"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_left.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_right.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64

/obj/item/gun/ballistic/shotgun/doublebarrel/improvised
	item_state = "ishotgun"

/obj/item/gun/ballistic/shotgun/doublebarrel/improvised/sawn
	item_state = "ishotgun_sawn"
