/obj/item/gun/ballistic/shotgun/automatic/dual_tube
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "cycler"

/obj/item/gun/ballistic/shotgun/bulldog/m12
	name = "\improper Combat Assault Shotgun M-12"
	desc = "A semi-auto, mag-fed Militech shotgun for combat in narrow corridors, nicknamed 'Saiga' by boarding parties. Compatible only with specialized 8-round drum magazines."
	icon_state = "militech_bulldogCAS"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	mag_display_ammo = FALSE
	pin = /obj/item/firing_pin/dna

/obj/item/gun/ballistic/shotgun/bulldog/waffle
	name = "\improper Waffle Combat Assault Shotgun W-12"
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