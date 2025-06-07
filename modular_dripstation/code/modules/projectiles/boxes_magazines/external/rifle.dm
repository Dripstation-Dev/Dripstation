//////intermediate bullets//////
///Standart 5.56
/obj/item/ammo_box/magazine/r556
	desc = "A standard 30-round magazine filled with 5.56 rounds, designed for assault rifles."
	icon_state = "ar556"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'

/obj/item/ammo_box/magazine/r556/update_icon_state()
	. = ..()
	if(ammo_count())
		icon_state = "ar556[sprite_designation]"
	else
		icon_state = "ar556[sprite_designation]_empty"

/obj/item/ammo_box/magazine/f556
	name = "famas rifle magazine (5.56mm)"
	desc = "A standard 30-round magazine filled with 5.56 rounds, designed for famas rifle."
	icon_state = "famas"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = CALIBER_556NATO
	max_ammo = 30

/obj/item/ammo_box/magazine/f556/update_icon_state()
	. = ..()
	if(ammo_count())
		icon_state = "f556[sprite_designation]"
	else
		icon_state = "f556[sprite_designation]_empty"
		
/obj/item/ammo_box/magazine/m556
	name = "toploader magazine (5.56mm)"
	desc = "A 30-round toploading magazine filled with 5.56 rounds, designed for assault rifles." //Da fack they should be designed for submachine gun?

///Incendiary 5.56
/obj/item/ammo_box/magazine/r556/inc
	desc = "An alternative 30-round magazine filled with incendiary 5.56 rounds, designed for assault rifles. \
			These rounds do less damage but set targets ablaze."
	icon_state = "ar556I"

/obj/item/ammo_box/magazine/m556/inc
	desc = "A 30-round toploading magazine filled with incendiary 5.56 rounds, designed for assault rifles. \
			These rounds do less damage but set targets ablaze."

///Rubber 5.56
/obj/item/ammo_box/magazine/r556/rubber
	desc = "An alternative 30-round magazine filled with rubber 5.56 rounds, designed for assault rifles. \
			These rounds possess minimal lethality but batter and weaken targets before they collapse from exhaustion."
	icon_state = "ar556R"

/obj/item/ammo_box/magazine/m556/rubber
	name = "toploader magazine (Rubber 5.56mm)"
	desc = "A 30-round toploading magazine filled with rubber 5.56 rounds, designed for assault rifles. \
			These rounds possess minimal lethality but batter and weaken targets before they collapse from exhaustion."
	icon_state = "5.56mR-30"
	ammo_type = /obj/item/ammo_casing/a556/rubber
	sprite_designation = "R"

///AP 5.56

/obj/item/ammo_box/magazine/m556/ap
	name = "toploader magazine (Armor-Piercing M995 5.56mm)"
	desc = "A 30-round toploading magazine filled with M995 5.56 rounds, designed for assault rifles. \
			These rounds sacrifice some stopping power for bypassing standard protective equipment."

/obj/item/ammo_box/magazine/r556/ap
	name = "rifle magazine (Armor-Piercing M995 5.56mm)"
	desc = "An alternative 30-round magazine filled with M995 5.56 rounds, designed for assault rifles. \
			These rounds sacrifice some stopping power for bypassing standard protective equipment."
	icon_state = "ar556A"


///New SSAAP 5.56
/obj/item/ammo_box/magazine/m556/ssaap
	name = "toploader magazine (SSA AP 5.56mm)"
	desc = "A 30-round toploading magazine filled with armor-piercing 5.56 rounds, designed for TGov military. \
			These rounds sacrifice some stopping power for bypassing special protective equipment."
	icon_state = "5.56mA-30"
	ammo_type = /obj/item/ammo_casing/a556/ssaap
	sprite_designation = "A"

/obj/item/ammo_box/magazine/r556/ssaap
	name = "rifle magazine (SSA AP 5.56mm)"
	desc = "An alternative 30-round magazine filled with armor-piercing 5.56 rounds, designed for TGov military. \
			These rounds sacrifice some stopping power for bypassing special protective equipment."
	icon_state = "ar556A"
	ammo_type = /obj/item/ammo_casing/a556/ssaap
	sprite_designation = "A"

///Standart 5.45
/obj/item/ammo_box/magazine/r545
	name = "rifle magazine (5.45mm)"
	desc = "A standard 30-round magazine filled with 5.45 rounds, designed for assault rifles."
	icon_state = "akbac"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/a545
	caliber = CALIBER_545USSP
	max_ammo = 30

/obj/item/ammo_box/magazine/r545/update_icon_state()
	. = ..()
	if(ammo_count())
		icon_state = "akbac[sprite_designation]"
	else
		icon_state = "akbac[sprite_designation]_empty"

///Incendiary 5.45
/obj/item/ammo_box/magazine/r545/inc
	name = "rifle magazine (Incendiary 5.45mm)"
	desc = "An alternative 30-round magazine filled with incendiary 5.45 rounds, designed for assault rifles. \
			These rounds do less damage but set targets ablaze."
	icon_state = "akbacI"
	ammo_type = /obj/item/ammo_casing/a545/inc
	sprite_designation = "I"

///AP 5.45
/obj/item/ammo_box/magazine/r545/inc
	name = "rifle magazine (Armor-Piercing 5.45mm)"
	desc = "An alternative 30-round magazine filled with armor-piercing 5.45 rounds, designed for assault rifles. \
			These rounds sacrifice some stopping power for bypassing standard protective equipment."
	icon_state = "akbacI"
	ammo_type = /obj/item/ammo_casing/a545/ap
	sprite_designation = "A"

///Standart 7.62x39
/obj/item/ammo_box/magazine/r762x39
	name = "rifle magazine (7.62mm)"
	desc = "A standard 30-round magazine filled with 7.62 rounds, designed for assault rifles."
	icon_state = "akbl"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/a762x39
	caliber = CALIBER_762USSP
	max_ammo = 30

/obj/item/ammo_box/magazine/r762x39/update_icon_state()
	. = ..()
	if(ammo_count())
		icon_state = "akbl[sprite_designation]"
	else
		icon_state = "akbl[sprite_designation]_empty"

///Incendiary 7.62x39
/obj/item/ammo_box/magazine/r762x39/inc
	name = "rifle magazine (Incendiary 7.62mm)"
	desc = "An alternative 30-round magazine filled with incendiary 7.62 rounds, designed for assault rifles. \
			These rounds do less damage but set targets ablaze."
	icon_state = "akblI"
	ammo_type = /obj/item/ammo_casing/a762x39/inc
	sprite_designation = "I"

///AP 7.62x39
/obj/item/ammo_box/magazine/r762x39/ap
	name = "rifle magazine (Armor-Piercing 7.62mm)"
	desc = "An alternative 30-round magazine filled with armor-piercing 7.62 rounds, designed for assault rifles. \
			These rounds sacrifice some stopping power for the ability to bypass standard protective equipment."
	icon_state = "akblA"
	ammo_type = /obj/item/ammo_casing/a762x39/ap
	sprite_designation = "A"

///Standart 7.62x54
/obj/item/ammo_box/magazine/svd
	name = "sniper magazine (7.62x54mm)"
	desc = "A standard 10-round magazine filled with 7.62x54 rounds, designed for sniper rifles."
	icon_state = "svd"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/a762
	caliber = CALIBER_762X54R
	max_ammo = 10

/obj/item/ammo_box/magazine/svd/update_icon_state()
	. = ..()
	if(ammo_count())
		icon_state = "svd[sprite_designation]"
	else
		icon_state = "svd[sprite_designation]_empty"

///Standart 7.62x51
/obj/item/ammo_box/magazine/r762x51
	name = "rifle magazine (7.62x51mm)"
	desc = "A standard 20-round magazine filled with 7.62 rounds, designed for marksman rifles."
	icon_state = "svd"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/a762x51
	caliber = CALIBER_762X51
	max_ammo = 20

/obj/item/ammo_box/magazine/r762x51/update_icon_state()
	. = ..()
	if(ammo_count())
		icon_state = "svd[sprite_designation]"
	else
		icon_state = "svd[sprite_designation]_empty"

/obj/item/ammo_box/magazine/m308
	icon = 'modular_dripstation/icons/obj/ammo.dmi'

/obj/item/ammo_box/magazine/m308/pen
	icon = 'modular_dripstation/icons/obj/ammo.dmi'

/obj/item/ammo_box/magazine/m308/laser
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
