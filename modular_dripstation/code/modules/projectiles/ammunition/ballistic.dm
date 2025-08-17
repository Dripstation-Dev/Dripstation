///AP 5.56
/obj/item/ammo_casing/a556/ap
	name = "5.56mm M995 bullet casing"
	desc = "A 5.56x45mm M995 cartridge with a 3.4 gram armor-piercing bullet with a tungsten carbide penetrator over an aluminum base with a copper jacket, in a brass case. "

///New SSAAP 5.56
/obj/item/ammo_casing/a556/ssaap
	name = "5.56mm TGov SSA AP bullet casing"
	desc = "A 5.56x45mm TGov SSA AP cartridge with a two-part armor-piercing projectile, the bullet consists of a sabot and a tungsten carbide penetrator body, in a brass case."
	icon_state = "556ap-casing"
	projectile_type = /obj/projectile/bullet/a556/ssaap

/obj/projectile/bullet/a556/ihdf
	name = "5.56mm TMC frag casing"
	desc = "A 5.56mm fragmentation bullet casing."
	projectile_type = /obj/projectile/bullet/a556/ihdf


///Shotgun
/obj/item/ammo_casing/shotgun/syndie
	name = "12g AP-CSS (Armor Piercing Ceramic Shotgun Slug)"
	desc = "A high penetrative 12-gauge ceramic slug without manufacturer's marking."

/obj/item/ammo_casing/shotgun/buckshot/syndie
	name = "12/70 RIP-S shell (Syndicate Radically Invasive Projectile)"
	desc = "An 12-gauge heavy tungsten buckshot shell without manufacturer's marking."

///5.45
/obj/item/ammo_casing/a545
	name = "5.45mm bullet casing"
	desc = "A 5.45mm bullet casing."
	icon_state = "556-casing"
	projectile_type = /obj/projectile/bullet/a545
	caliber = CALIBER_545USSP

/obj/item/ammo_casing/a545/inc
	name = "5.45mm incendiary bullet casing"
	desc = "A 5.45mm incendiary bullet casing."
	icon_state = "556i-casing"
	projectile_type = /obj/projectile/bullet/incendiary/a545

/obj/item/ammo_casing/a545/ap
	name = "5.45mm AP bullet casing"
	desc = "A 5.45mm armor-piercing bullet casing."
	icon_state = "556ap-casing"
	projectile_type = /obj/projectile/bullet/a545/ap

///7.62
/obj/item/ammo_casing/a762x39
	name = "7.62mm bullet casing"
	desc = "A 7.62mm bullet casing."
	icon_state = "556-casing"
	projectile_type = /obj/projectile/bullet/a762x39
	caliber = CALIBER_762USSP

/obj/item/ammo_casing/a762x39/inc
	name = "7.62mm incendiary bullet casing"
	desc = "A 7.62mm incendiary bullet casing."
	icon_state = "556i-casing"
	projectile_type = /obj/projectile/bullet/incendiary/a762x39

/obj/item/ammo_casing/a762x39/ap
	name = "7.62mm AP bullet casing"
	desc = "A 7.62mm armor-piercing bullet casing."
	icon_state = "556ap-casing"
	projectile_type = /obj/projectile/bullet/a762x39/ap

/obj/item/ammo_casing/a762x39/ihdf
	name = "7.62mm frag casing"
	desc = "A 7.62mm fragmentation bullet casing."
	projectile_type = /obj/projectile/bullet/a762x39/ihdf

/obj/item/ammo_casing/a762x39/civ
	name = "7.62mm PS GJ bullet casing"
	desc = "A 7.62mm PS GJ bullet casing."
	icon_state = "556-casing"
	projectile_type = /obj/projectile/bullet/a762x39/civ

/obj/item/ammo_casing/a762x51
	name = "7.62x51mm bullet casing"
	desc = "A 7.62x51mm bullet casing."
	icon_state = "762-casing"
	projectile_type = /obj/projectile/bullet/a762x51
	caliber = CALIBER_762X51

/obj/item/ammo_casing/m4570
	name = ".45-70 bullet casing"
	desc = "A .45-70 Government bullet casing."
	icon_state = "762-casing"
	projectile_type = /obj/projectile/bullet/a4570
	caliber = CALIBER_762X51

/obj/item/ammo_casing/a939
	name = "9x39mm bullet casing"
	desc = "A 9x39mm bullet casing."
	projectile_type = /obj/projectile/bullet/a939
	caliber = CALIBER_9X39

/obj/item/ammo_casing/a939/rubber
	name = "9x39mm rubber bullet casing"
	desc = "A 9x39mm rubber bullet casing."
	projectile_type = /obj/projectile/bullet/a939/rubber

/obj/item/ammo_casing/a127
	name = "12.7x55mm Light bullet casing"
	desc = "A 12.7x55mm Light bullet casing."
	icon_state = "762-casing"
	projectile_type = /obj/projectile/bullet/a127
	caliber = CALIBER_127X55

/obj/item/ammo_casing/a127/ap
	name = "12.7x55mm Armor-Piercing bullet casing"
	desc = "A 12.7x55mm bullet casing."
	projectile_type = /obj/projectile/bullet/a127/ap

/obj/item/ammo_casing/a127/heavy
	name = "12.7x55mm Heavy bullet casing"
	desc = "A 12.7x55mm Heavy bullet casing."
	projectile_type = /obj/projectile/bullet/a127/heavy

///GAUSS///
/obj/item/ammo_casing/caseless/gauss
	name = "ferromagnetic pellet"
	desc = "A small metal pellet."
	caliber = "pellet"
	icon_state = "gauss-pellet"
	projectile_type = /obj/projectile/bullet/gauss
	caliber = GAUSS_PELLET
	//auto_rotate = FALSE
	var/energy_cost = 80

/obj/item/ammo_casing/caseless/gauss/lance
	name = "ferromagnetic lance"
	desc = "A sharp metal rod."
	caliber = "lance"
	icon_state = "gauss-lance"
	projectile_type = /obj/projectile/bullet/gauss/lance
	//auto_rotate = TRUE
	energy_cost = 160

/obj/item/ammo_casing/caseless/gauss/slug
	name = "ferromagnetic slug"
	desc = "A large metal slug."
	caliber = "lance"
	icon_state = "gauss-slug"
	projectile_type = /obj/projectile/bullet/gauss/slug
	//auto_rotate = TRUE
	energy_cost = 640

/obj/item/ammo_casing/caseless/rail
	name = "ferromagnetic railslug"
	desc = "A large metal railslug."
	caliber = "lance"
	icon_state = "rail-slug"
	caliber = RAIL_PELLET
	projectile_type = /obj/projectile/bullet/rail
	//auto_rotate = TRUE
	var/energy_cost = 1200


/////NITRO EXPRESS//////
/obj/item/ammo_casing/nitro_express
	name = ".700 Nitro Express bullet casing"
	desc = "A .700 NE bullet casing."
	projectile_type = /obj/projectile/bullet/nitro_express
	caliber = NITRO_EXPRESS
	icon_state = ".50"


/obj/item/ammo_casing/a57x28
	name = "5.7x28 FMJ AP NATO bullet casing"
	desc = "A 5.7x28 NATO bullet casing."
	projectile_type = /obj/projectile/bullet/c57x28mm
	caliber = CALIBER_57X28NATO
