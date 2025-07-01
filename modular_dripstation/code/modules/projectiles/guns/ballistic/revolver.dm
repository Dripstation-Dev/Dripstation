/obj/item/gun/ballistic/revolver
	item_state = "revolver"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	muzzleflash_iconstate = "muzzle_flash_medium"

/obj/item/gun/ballistic/revolver/mateba
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/mateba.ogg'

/obj/item/gun/ballistic/revolver/mateba/shellguard
	name = "\improper Shellhuard MA-7"
	desc = "Modern revolver chambered in .44 in Shellguard Arms painting. Property of Shellguard Co."
	icon_state = "revolver-shellguard"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	manufacturer = /datum/corporation/shellguard

/obj/item/ammo_box/magazine/internal/cylinder/grenademulti/sec
	ammo_type = /obj/item/ammo_casing/a40mm/gas

/obj/item/gun/ballistic/revolver/grenadelauncher/multi
	name = "multi grenade launcher"
	desc = "A 6-shot grenade launcher."
	icon = 'modular_dripstation/icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_grenadelnchr"
	item_state = "carbine"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/grenademulti
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/revolver/grenadelauncher/multi/sec
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/grenademulti/sec

/obj/item/ammo_casing/a40mm
	projectile_type = /obj/projectile/bullet/a40mm/he

/obj/item/ammo_casing/a40mm/gas
	name = "40mm TG shell"
	desc = "A cased tear gas grenade that can only be activated once fired out of a grenade launcher."
	projectile_type = /obj/projectile/bullet/a40mm/gas

/obj/item/ammo_casing/a40mm/chlorinetwogas
	name = "40mm Ch2G shell"
	desc = "A cased chlorine two gas grenade that can only be activated once fired out of a grenade launcher."
	projectile_type = /obj/projectile/bullet/a40mm/gas/chlorinetwo

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
