/obj/item/gun/ballistic/shotgun/riot
	desc = "A sturdy shotgun with a standart magazine and a fixed tactical stock designed for non-lethal riot control."
	icon_state = "policeshotgun"
	item_state = "policeshotgun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
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
	mag_type = /obj/item/ammo_box/magazine/internal/shot/riot/adv
	fire_delay = 6
	can_be_sawn_off  = TRUE

/obj/item/ammo_box/magazine/internal/shot/riot/adv
	name = "riot adv shotgun internal magazine"
	max_ammo = 8

/obj/item/gun/ballistic/shotgun/automatic
	icon_state = "autoshotgun"
	item_state = "autoshotgun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	inhand_x_dimension = 32
	inhand_y_dimension = 32

/obj/item/gun/ballistic/shotgun/automatic/combat
	icon_state = "cshotgun"
	item_state = "cshotgun"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_left.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_right.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64

/obj/item/gun/ballistic/shotgun/automatic/breaching
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/shotgun/automatic/dual_tube
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "cycler"

/obj/item/gun/ballistic/shotgun/bulldog
	desc = "A semi-auto, mag-fed Scarborough Arms shotgun for combat in narrow corridors, nicknamed the 'Bulldog' by boarding parties. Only compatible with specialized 8-round drum magazines."

/obj/item/gun/ballistic/shotgun/bulldog/m12
	name = "\improper Combat Assault Shotgun M-12"
	desc = "A semi-auto, mag-fed Militech shotgun for combat in narrow corridors, nicknamed 'Saiga' by boarding parties. Compatible only with specialized 8-round drum magazines."
	icon_state = "militech_bulldogCAS"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	mag_display_ammo = FALSE
	pin = /obj/item/firing_pin/dna

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

/obj/item/gun/ballistic/shotgun/bulldog/waffle/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/shotgun/doublebarrel
	item_state = "shotgun_db"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_left.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/64x_guns_right.dmi'

/obj/item/gun/ballistic/shotgun/doublebarrel/improvised
	item_state = "ishotgun"

/obj/item/gun/ballistic/shotgun/doublebarrel/improvised/sawn
	item_state = "ishotgun_sawn"
