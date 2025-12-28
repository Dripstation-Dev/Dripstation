//Bulldog Shotgun

/obj/item/ammo_box/magazine/m12g/slug
	name = "shotgun magazine (12g ceramic slugs)"
	desc = "A drum magazine designed for the Bulldog shotgun. \
			Ceramic AP slugs are the best armor issue choice. \
			Armor Piercing death to the Nanotrasen scum!"

/obj/item/ammo_box/magazine/m12g
	name = "shotgun magazine (12g RIP-S)"
	desc = "A drum magazine designed for the Bulldog shotgun. \
			RIP-S is more effective choice for anti-personnel use. \
			RIP and death to the Nanotrasen!"


///waffle traitor
/obj/item/ammo_box/magazine/m12g/less_painfull
	name = "shotgun magazine (12g Buckshot)"
	desc = "A drum magazine designed for the Bulldog sistem shotgun. \
			Buckshot is effective choice for anti-personnel use."
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot

/obj/item/ammo_box/magazine/m12g/slug/less_painfull
	name = "shotgun magazine (12g slugs)"
	desc = "A drum magazine designed for the Bulldog sistem shotgun. \
			Slugs are good at armour penetraiting."
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/ammo_box/magazine/catm12g
	name = "shotgun magazine (12g Buckshot)"
	desc = "A drum magazine designed for the CAT sistem shotgun. \
			Buckshot is effective choice for anti-personnel use."
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	icon_state = "catm12gb-6"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	caliber = CALIBER_12GA
	max_ammo = 6
	sprite_designation = "b"

/obj/item/ammo_box/magazine/catm12g/update_icon_state()
	. = ..()
	if(ammo_count())
		icon_state = "catm12g[sprite_designation]-6"
	else
		icon_state = "catm12g[sprite_designation]-0"

/obj/item/ammo_box/magazine/catm12g/slug
	name = "shotgun magazine (12g slugs)"
	desc = "A drum magazine designed for the CAT sistem shotgun. \
			Slugs are good at armour penetraiting."
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	icon_state = "catm12gs-6"
	sprite_designation = "s"
