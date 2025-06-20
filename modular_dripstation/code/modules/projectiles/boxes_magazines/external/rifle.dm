//////intermediate bullets//////
///Standart 5.56
/obj/item/ammo_box/magazine/m556
	name = "toploader magazine (5.56mm)"
	desc = "A 30-round toploading magazine filled with 5.56 rounds, designed for assault rifles." //Da fack they should be designed for submachine gun?

///AP 5.56

/obj/item/ammo_box/magazine/m556/ap
	name = "toploader magazine (Armor-Piercing M995 5.56mm)"
	desc = "A 30-round toploading magazine filled with M995 5.56 rounds, designed for assault rifles. \
			These rounds sacrifice some stopping power for bypassing standard protective equipment."

/obj/item/ammo_box/magazine/r556/ap
	name = "rifle magazine (Armor-Piercing M995 5.56mm)"
	desc = "An alternative 30-round magazine for the NT ARG 'Boarder' Rifle. Filled with M995 5.56 rounds. \
			These rounds sacrifice some stopping power for bypassing standard protective equipment."


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
	desc = "An alternative 30-round magazine for the NT ARG 'Boarder' Rifle. Filled with TGov SSA AP 5.56 rounds. \
			These rounds sacrifice some stopping power for bypassing special protective equipment."
	icon_state = "arg556A"
	ammo_type = /obj/item/ammo_casing/a556/ssaap
	sprite_designation = "A"
