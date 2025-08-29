/obj/item/gun/ballistic/revolver
	item_state = "revolver"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	muzzleflash_iconstate = "muzzle_flash_medium"
	manufacturer = /datum/corporation/scarborough

/obj/item/gun/ballistic/revolver/ipcmartial
	manufacturer = null

/obj/item/gun/ballistic/revolver/detective
	manufacturer = /datum/corporation/wardtakhashi

/obj/item/gun/ballistic/revolver/nagant
	manufacturer = /datum/corporation/vostok

/obj/item/gun/ballistic/revolver/russian
	manufacturer = /datum/corporation/vostok

/obj/item/gun/ballistic/revolver/rh9
	name = "\improper Vostok RH-9"
	desc = "Modern revolver chambered in 9x39. Pricy autorevolver typically worn by regular contracted slav military alike."
	icon_state = "revolver-rh9"
	item_state = "revolver-rh9"
	fire_delay = 25 //Chunky as hell, but somewhat powerful
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/mateba.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev9
	manufacturer = /datum/corporation/vostok

/obj/item/gun/ballistic/revolver/rh12
	name = "\improper Vostok RH-12"
	desc = "Modern revolver chambered in 12.7x55. Pricy autorevolver typically worn by madman."
	icon_state = "revolver-rh12"
	item_state = "revolver-rh9"
	recoil = 2
	fire_delay = 30 //Chunky as hell, but powerful
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/sniper.ogg'	//it`s like BOOOM
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev12
	manufacturer = /datum/corporation/vostok

/obj/item/gun/ballistic/revolver/mateba/shellguard
	name = "\improper Shellhuard MA-7"
	desc = "Modern revolver chambered in .44 in Shellguard Arms painting. Property of Shellguard Co."
	icon_state = "revolver-shellguard"
	item_state = "shelg_lawyer"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	manufacturer = /datum/corporation/shellguard

/obj/item/gun/ballistic/revolver/grenadelauncher/multi
	name = "\improper GL-70 grenade launcher"
	desc = "The GL-70 is the standard grenade launcher used by the government police forces and PMC for area denial and big explosions."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "t70"
	item_state = "t70"
	fire_delay = 20
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/grenademulti
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/revolver/grenadelauncher/multi/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	. = ..()
	if(!.)
		return
	flick("t70_f", src)

/obj/item/gun/ballistic/revolver/grenadelauncher/multi/sec
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/grenademulti/sec

/obj/item/ammo_casing/a40mm
	projectile_type = /obj/projectile/bullet/a40mm/he

/obj/item/ammo_casing/a40mm/gas
	name = "40mm TG shell"
	desc = "A cased tear gas grenade that can only be activated once fired out of a grenade launcher."
	projectile_type = /obj/projectile/bullet/a40mm/gas

/obj/item/ammo_box/a40mm/teargas
	name = "ammo box (40mm Tear Gas grenades)"
	icon_state = "40mm"
	ammo_type = /obj/item/ammo_casing/a40mm/gas
	caliber = CALIBER_40GL
	max_ammo = 4
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_casing/a40mm/chlorinetwogas
	name = "40mm Ch2G shell"
	desc = "A cased chlorine two gas grenade that can only be activated once fired out of a grenade launcher."
	projectile_type = /obj/projectile/bullet/a40mm/gas/chlorinetwo

/obj/item/ammo_box/a40mm/teargas
	name = "ammo box (40mm Ch2G grenades)"
	icon_state = "40mm"
	ammo_type = /obj/item/ammo_casing/a40mm/chlorinetwogas
	caliber = CALIBER_40GL
	max_ammo = 4
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_casing/a40mm/smoke
	name = "40mm smoke shell"
	desc = "A cased smoke grenade that can only be activated once fired out of a grenade launcher."
	projectile_type = /obj/projectile/bullet/a40mm/smoke

/obj/item/ammo_box/a40mm/smoke
	name = "ammo box (40mm smoke grenades)"
	icon_state = "40mm"
	ammo_type = /obj/item/ammo_casing/a40mm/smoke
	caliber = CALIBER_40GL
	max_ammo = 4
	multiple_sprites = AMMO_BOX_PER_BULLET
