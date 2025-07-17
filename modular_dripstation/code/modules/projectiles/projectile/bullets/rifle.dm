//////intermediate bullets//////
// 5.56mm (M-90gl Rifle + NT ARG)
///Standart 5.56
/obj/projectile/bullet/a556
	armour_penetration = 10
	ap_falloff_tile = 2.5

///Incendiary 5.56
/obj/projectile/bullet/incendiary/a556
	armour_penetration = 20
	wound_bonus = -35
	ap_falloff_tile = 2.5

///New SSAAP 5.56
/obj/projectile/bullet/a556/ssaap
	name = "5.56mm TGov SSA AP bullet"
	damage = 29
	armour_penetration = 60
	penetration_flags = PENETRATE_MOBS
	penetrations = 1
	hard_armour_penetration = 10	//penetrates hard armor
	wound_bonus = -45
	ap_falloff_tile = 1

///AP 5.56
/obj/projectile/bullet/a556/ap
	damage = 32
	name = "5.56mm M995 bullet"
	armour_penetration = 40
	wound_bonus = -45

/obj/projectile/bullet/a556/ihdf
	name = "5.56mm frag bullet"
	damage = 20
	bare_wound_bonus = 50
	embedding = list("pain_multiplier" = 3, "embed_chance" = 65, "jostle_chance" = 2, "rip_time" = -1, "fall_chance" = 0, "impact_pain_multiplier" = 6, "ignore_throwspeed_threshold" = TRUE, "remove_pain_mult" = 4)

// 5.45mm (AK)
///Standart 5.45
/obj/projectile/bullet/a545
	name = "5.45mm bullet"
	damage = 28
	wound_bonus = -25
	armour_penetration = 5
	ap_falloff_tile = 2.5

///Incendiary 5.45
/obj/projectile/bullet/incendiary/a545
	name = "5.45mm incendiary bullet"
	damage = 20
	wound_bonus = -30
	fire_stacks = 2
	armour_penetration = 15
	ap_falloff_tile = 2.5

///AP 5.45
/obj/projectile/bullet/a545/ap
	damage = 22
	name = "5.45mm AP bullet"
	armour_penetration = 35
	wound_bonus = -40

// 7.62mm (AK)
///Standart 7.62
/obj/projectile/bullet/a762x39
	name = "7.62x39mm bullet"
	damage = 32
	stamina = 27
	bare_wound_bonus = 10
	wound_bonus = -20
	armour_penetration = 0
	ap_falloff_tile = 2.5

///Incendiary 7.62
/obj/projectile/bullet/incendiary/a762x39
	name = "7.62x39mm incendiary bullet"
	damage = 24
	stamina = 27
	wound_bonus = -25
	fire_stacks = 2
	armour_penetration = 10
	ap_falloff_tile = 2.5

///AP 7.62
/obj/projectile/bullet/a762x39/ap
	name = "7.62x39mm AP bullet"
	damage = 27
	armour_penetration = 30
	wound_bonus = -30

/obj/projectile/bullet/a762x39/ihdf
	name = "7.62x39mm Frag bullet"
	damage = 18
	bare_wound_bonus = 50
	embedding = list("pain_multiplier" = 3, "embed_chance" = 65, "jostle_chance" = 2, "rip_time" = -1, "fall_chance" = 0, "impact_pain_multiplier" = 6, "ignore_throwspeed_threshold" = TRUE, "remove_pain_mult" = 4)

/obj/projectile/bullet/a762x39/civ	//you can hunt wolfs with this
	name = "7.62x39mm PS GJ bullet"
	damage = 35
	bare_wound_bonus = -20
	wound_bonus = -30
	armour_penetration = -40	//any armor will fucking nullify this bullet

///Standart 9x39
/obj/projectile/bullet/a939
	name = "9x39mm bullet"
	damage = 30
	armour_penetration = 20
	bare_wound_bonus = 10
	wound_bonus = -20
	ap_falloff_tile = 5
	speed = 1

/obj/projectile/bullet/a939/rubber
	name = "9x39mm rubber bullet"
	damage = 7
	stamina = 40
	bare_wound_bonus = 0

/obj/projectile/bullet/a127
	name = "12.7x55mm Light bullet"
	damage = 50
	stamina = 27
	armour_penetration = 20
	bare_wound_bonus = 0
	wound_bonus = -10
	ap_falloff_tile = 2.5

/obj/projectile/bullet/a127/ap
	name = "12.7x55mm Armor-Piercing bullet"
	damage = 60
	armour_penetration = 100
	wound_bonus = -40
	speed = 1.7

/obj/projectile/bullet/a127/heavy
	name = "12.7x55mm Heavy bullet"
	damage = 70
	stamina = 40
	armour_penetration = 40
	bare_wound_bonus = 20
	wound_bonus = 0
	speed = 1

///Standart 7.62x51
/obj/projectile/bullet/a762x51
	name = "7.62x51mm bullet"
	damage = 47
	stamina = 27
	bare_wound_bonus = 0
	wound_bonus = -40
	armour_penetration = 20
	ap_falloff_tile = 2.5
	wound_falloff_tile = 0

/obj/projectile/bullet/m308
	damage = 50
	stamina = 28
	armour_penetration = 10

/obj/projectile/bullet/a4570
	name = "heavy impact rifle bullet"
	damage = 60
	stamina = 27
	wound_bonus = -50
	armour_penetration = 20
	ap_falloff_tile = 5
	wound_falloff_tile = 2.5

/////Nitro Express/////
/obj/projectile/bullet/nitro_express
	name = ".700 NE bullet"
	speed = 1.2
	damage = 75
	wound_bonus = -50	//25% wound chance I guess?
	wound_falloff_tile = -2.5
	paralyze = 40
	dismemberment = 4	//like normal arm/leg(50hp) needs to receve 49+ damage by this bullet to dismember instantly. Probably any limb will dismember while it hasn`t like 55+ bullet armor on it.
	armour_penetration = 25
	icon_state = "gaussstrong"
	penetrations = 2
	penetration_flags = PENETRATE_MOBS
	demolition_mod = 3 // breaks any physical shield instantly
	ap_falloff_tile = 2.5

/obj/projectile/bullet/p50
	ap_falloff_tile = 2.5

/obj/projectile/bullet/a546
	ap_falloff_tile = 2.5

/obj/projectile/bullet/mm712x82
	damage = 54
	ap_falloff_tile = 2.5
