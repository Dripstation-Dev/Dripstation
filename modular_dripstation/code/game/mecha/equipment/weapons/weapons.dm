/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/hmg712
	name = "\improper Gorlex MG-712 \"HEAVY\" HMG"
	desc = "A weapon for combat exosuits. Shoots a rapid, two shot burst of 7.12x82mm bullets."
	icon = 'modular_dripstation/icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_hmg"
	equip_cooldown = 10
	projectile = /obj/projectile/bullet/mm712x82
	projectiles = 48
	projectiles_cache = 48
	projectiles_cache_max = 192
	projectiles_per_shot = 2
	variance = 5
	randomspread = 1
	projectile_delay = 2
	harmful = TRUE
	ammo_type = "hmg"

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg556fire
	name = "\improper Gorlex MG-556 \"HELL\" LMG"
	desc = "A weapon for combat exosuits. Shoots a rapid, three shot burst of incendiary bullets."
	icon = 'modular_dripstation/icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_lmg"
	equip_cooldown = 10
	projectile = /obj/projectile/bullet/incendiary/a556
	projectiles = 240
	projectiles_cache = 240
	projectiles_cache_max = 960
	projectiles_per_shot = 3
	variance = 5
	randomspread = 1
	projectile_delay = 1
	harmful = TRUE
	ammo_type = "incendiarylmg"

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/hmg712hp
	name = "\improper Gorlex MG-712 \"HOLLOW POINT\" HMG"
	desc = "A weapon for combat exosuits. Shoots a rapid, three shot burst of hollow-point bullets."
	icon = 'modular_dripstation/icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_hmg"
	equip_cooldown = 10
	projectile = /obj/projectile/bullet/mm712x82/hp
	projectiles = 48
	projectiles_cache = 48
	projectiles_cache_max = 192
	projectiles_per_shot = 2
	variance = 5
	randomspread = 1
	projectile_delay = 2
	harmful = TRUE
	ammo_type = "hphmg"

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	projectile = /obj/projectile/bullet/pellet/scattershot

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/syndieshot
	name = "\improper Gorlex AC 20 \"Syndieshot\""
	desc = "A weapon for combat exosuits. Shoots a spread of syndieshot pellets."
	icon = 'modular_dripstation/icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_sindieshot"
	equip_cooldown = 20
	projectile = /obj/projectile/bullet/pellet/syndieshot
	projectiles = 72
	projectiles_cache = 72
	projectiles_cache_max = 288
	projectiles_per_shot = 6
	variance = 16
	harmful = TRUE
	ammo_type = "syndieshot"
