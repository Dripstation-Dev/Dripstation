
/obj/projectile/bullet/shotgun/slug
	speed = 1 //Shotgun = slower
	simplemob_additional_damage = 40

/obj/projectile/bullet/shotgun/slug/uranium
	icon_state = "bullet"

/obj/projectile/bullet/pellet
	icon_state = "buckshot"
	icon = 'modular_dripstation/icons/effects/projectiles/projectiles.dmi'
	speed = 1 //Shotgun = slower
	weak_against_armour = TRUE
	light_system = NO_LIGHT_SUPPORT
	simplemob_additional_damage = 10
	embedding = list("pain_multiplier" = 0, "embed_chance" = 25, "jostle_chance" = 4, "rip_time" = -1, "fall_chance" = 0, "ignore_throwspeed_threshold" = TRUE, "pain_stam_pct" = 0.7, "remove_pain_mult" = 3)

/obj/projectile/bullet/pellet/shotgun_flechette
	icon_state = "flechette"
	speed = 1.2

/obj/projectile/bullet/pellet/shotgun_buckshot/syndie
	name = "12/70 RIP-S"
	bare_wound_bonus = 6 //shotgunning assistants, PAINfully
	embedding = list("pain_multiplier" = 0, "embed_chance" = 35, "jostle_chance" = 4, "rip_time" = -1, "fall_chance" = 0, "ignore_throwspeed_threshold" = TRUE, "pain_stam_pct" = 0.7, "remove_pain_mult" = 3)

/obj/projectile/bullet/shotgun/slug/syndie
	name = "12g AP-CSS"
	damage = 50 //damage reduced
	armour_penetration = 20 // Armor Piercing
	wound_bonus = -10 // better bleeding chance

/obj/projectile/bullet/pellet/hardlight
	speed = 1.4 //hardest light i`ve ever seen
	damage = 12 // 12*6 = 72 Why advanced pellet should be possibly LESS damaging THAN conventional one? Like 10 with tile dropoff on. Who the f did just thought about it?
	armour_penetration = -10	//this is so stupid, i don`t want to talk about that
	weak_against_armour = FALSE	//pointless i guess, but why not
	tile_dropoff = 0	//hardest light don`t drop it`s damage frfr

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
