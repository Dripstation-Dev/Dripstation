
/obj/projectile/bullet/shotgun/slug
	speed = 1 //Shotgun = slower

/obj/projectile/bullet/shotgun/slug/uranium
	icon_state = "bullet"

/obj/projectile/bullet/pellet
	icon_state = "buckshot"
	icon = 'modular_dripstation/icons/effects/projectiles/projectiles.dmi'
	speed = 1 //Shotgun = slower
	weak_against_armour = TRUE
	light_system = NO_LIGHT_SUPPORT

/obj/projectile/bullet/pellet/shotgun_flechette
	icon_state = "flechette"
	speed = 1.2

/obj/projectile/bullet/pellet/shotgun_buckshot/syndie
	name = "12/70 RIP-S"
	bare_wound_bonus = 6 //shotgunning assistants, PAINfully

/obj/projectile/bullet/shotgun/slug/syndie
	name = "12g AP-CSS"
	damage = 50 //damage reduced
	armour_penetration = 20 // Armor Piercing
	wound_bonus = -10 // better bleeding chance

// Mecha Scattershot
/obj/projectile/bullet/pellet/scattershot
	damage = 16
	wound_bonus = 5
	bare_wound_bonus = 5
	armour_penetration = -10

/obj/projectile/bullet/pellet/syndieshot
	damage = 17.5
	speed = 1.2 //FAAAST
	wound_bonus = 5
	bare_wound_bonus = 10
	tile_dropoff = 0.3 //Ranged pellet because I guess?
	armour_penetration = 10 //Big flechette (it's for nukies only)
	weak_against_armour = FALSE
