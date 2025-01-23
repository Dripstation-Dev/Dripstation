//////intermediate bullets//////
// 5.56mm (M-90gl Rifle + NT ARG)
///Standart 5.56
/obj/projectile/bullet/a556
	armour_penetration = 10

///Incendiary 5.56
/obj/projectile/bullet/incendiary/a556
	armour_penetration = 20
	wound_bonus = -35

///New SSAAP 5.56
/obj/projectile/bullet/a556/ssaap
	name = "5.56mm TGov SSA AP bullet"
	damage = 29
	armour_penetration = 60
	penetration_flags = PENETRATE_MOBS
	penetrations = 1
	wound_bonus = -45

///AP 5.56
/obj/projectile/bullet/a556/ap
	damage = 32
	name = "5.56mm M995 bullet"
	armour_penetration = 40
	wound_bonus = -45

// 5.45mm (AK)
///Standart 5.45
/obj/projectile/bullet/a545
	name = "5.45mm bullet"
	damage = 28
	wound_bonus = -25
	armour_penetration = 5

///Incendiary 5.45
/obj/projectile/bullet/incendiary/a545
	name = "5.45mm incendiary bullet"
	damage = 20
	wound_bonus = -30
	fire_stacks = 2
	armour_penetration = 15

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

///Incendiary 7.62
/obj/projectile/bullet/incendiary/a762x39
	name = "7.62x39mm incendiary bullet"
	damage = 24
	stamina = 27
	wound_bonus = -25
	fire_stacks = 2
	armour_penetration = 10

///AP 7.62
/obj/projectile/bullet/a762x39/ap
	name = "7.62x39mm AP bullet"
	damage = 27
	armour_penetration = 30
	wound_bonus = -30



/////Nitro Express/////
/obj/projectile/bullet/nitro_express
	name = ".700 NE bullet"
	speed = 0.3
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
