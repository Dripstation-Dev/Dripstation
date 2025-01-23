/obj/projectile/bullet/gauss
	name = "ferromagnetic pellet"
	icon_state = "gaussweak"
	damage = 28
	range = 35
	light_color = COLOR_VIVID_YELLOW
	light_range = 3
	speed = 1.2	//the OVERspeed
	wound_bonus = -30
	penetrations = 2
	penetration_flags = PENETRATE_OBJECTS | PENETRATE_MOBS
	armour_penetration = 40
	hard_armour_penetration = 20
	demolition_mod = 1.5 // anti-armor

/obj/projectile/bullet/gauss/lance
	name = "ferromagnetic lance"
	icon_state = "gauss"
	damage = 32
	speed = 1	//more mass - more damage - bit slower
	armour_penetration = 80
	penetrations = 4
	penetration_flags = PENETRATE_OBJECTS | PENETRATE_MOBS

/obj/projectile/bullet/gauss/slug
	name = "ferromagnetic slug"
	icon_state = "gaussstrong"
	damage = 60
	wound_bonus = -40
	speed = 1	//more mass - more damage - bit slower
	penetration_flags = PENETRATE_OBJECTS

/obj/projectile/bullet/rail
	name = "ferromagnetic railslug"
	icon_state = "gaussstrong"
	damage = 100	//painful expirience
	range = 60
	light_color = COLOR_VIVID_YELLOW
	light_range = 4
	speed = 1.6	//the OVERspeeeeeed
	wound_bonus = -60
	armour_penetration = 100 //completely deny it
	hard_armour_penetration = 40 //even hardened armor can`t stand
	penetrations = INFINITY
	penetration_flags = PENETRATE_OBJECTS | PENETRATE_MOBS
	demolition_mod = 1.8 // anti-armor
