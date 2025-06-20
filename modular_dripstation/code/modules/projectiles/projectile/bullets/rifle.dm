//////intermediate bullets//////
// 5.56mm (M-90gl Rifle + NT ARG)
///Standart 5.56
/obj/projectile/bullet/a556
	armour_penetration = 10

///Incendiary 5.56
/obj/projectile/bullet/incendiary/a556
	armour_penetration = 20

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