/obj/item/ammo_box/magazine/sa450
	name = "\improper SA-450 magazine (4.6x30mm)"
	desc = "A 30-round 4.6x30mm magazine, designed for the SA-450 Carbine."
	icon_state = "arg556"
	ammo_type = /obj/item/ammo_casing/c46x30mm
	caliber = CALIBER_46X30
	max_ammo = 30
	icon_state = "arg556"

/obj/item/ammo_box/magazine/sa450/update_icon_state()
	. = ..()
	if(ammo_count())
		icon_state = "arg556[sprite_designation]"
	else
		icon_state = "arg556[sprite_designation]_empty"

/obj/item/ammo_box/magazine/sa450/ap
	name = "\improper SA-450 magazine (Armor-Piercing 4.6x30mm)"
	desc = "A 30-round 4.6x30mm magazine, designed for the SA-450 Carbine."
	icon_state = "arg556A"
	ammo_type = /obj/item/ammo_casing/c46x30mm/ap
	sprite_designation = "A"

/obj/item/ammo_box/magazine/sa450/inc
	name = "\improper SA-450 magazine (Incendiary 4.6x30mm)"
	desc = "A 30-round 4.6x30mm magazine, designed for the SA-450 Carbine."
	icon_state = "arg556I"
	ammo_type = /obj/item/ammo_casing/c46x30mm/inc
	sprite_designation = "I"

/obj/item/ammo_box/magazine/sa450/snake
	name = "\improper SA-450 magazine (snakebite Rounds 4.6x30mm)"
	desc = "A 30-round 4.6x30mm magazine, designed for the SA-450 Carbine."
	icon_state = "arg556R"
	ammo_type = /obj/item/ammo_casing/c46x30mm/snakebite
	sprite_designation = "R"