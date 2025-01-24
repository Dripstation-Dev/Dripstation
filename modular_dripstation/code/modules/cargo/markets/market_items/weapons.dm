/datum/market_item/weapon
	category = "Weapons"

/datum/market_item/weapon/bear_trap
	name = "Bear Trap"
	desc = "Get the janitor back at his own game with this affordable prank kit."
	item = /obj/item/restraints/legcuffs/beartrap

	price_min = CARGO_CRATE_VALUE * 1.5
	price_max = CARGO_CRATE_VALUE * 2.75
	stock_max = 3
	availability_prob = 50

/datum/market_item/weapon/shotgun_dart
	name = "Shotgun Dart"
	desc = "These handy darts can be filled up with any chemical and be shot with a shotgun! \
	Prank your friends by shooting them with laughter! \
	Not recommended for comercial use."
	item = /obj/item/ammo_casing/shotgun/dart

	price_min = CARGO_CRATE_VALUE * 0.05
	price_max = CARGO_CRATE_VALUE * 0.25
	stock_min = 10
	stock_max = 60
	availability_prob = 40

/datum/market_item/weapon/bone_spear
	name = "Bone Spear"
	desc = "Authentic tribal spear, made from real bones! A steal at any price, especially if you're a caveman."
	item = /obj/item/melee/spear/bonespear

	price_min = CARGO_CRATE_VALUE
	price_max = CARGO_CRATE_VALUE * 1.5
	stock_max = 3
	availability_prob = 60

/datum/market_item/weapon/chainsaw
	name = "Chainsaw"
	desc = "A lumberjack's best friend, perfect for cutting trees or limbs efficiently."
	item = /obj/item/melee/chainsaw

	price_min = CARGO_CRATE_VALUE * 1.75
	price_max = CARGO_CRATE_VALUE * 3
	stock_max = 1
	availability_prob = 35

/datum/market_item/weapon/switchblade
	name = "Switchblade"
	desc = "Tunnel Snakes rule!"
	item = /obj/item/switchblade

	price_min = CARGO_CRATE_VALUE * 1.25
	price_max = CARGO_CRATE_VALUE * 1.75
	stock_max = 3
	availability_prob = 45

/datum/market_item/weapon/emp_grenade
	name = "EMP Grenade"
	desc = "Use this grenade for SHOCKING results!"
	item = /obj/item/grenade/empgrenade

	price_min = CARGO_CRATE_VALUE * 0.5
	price_max = CARGO_CRATE_VALUE * 2
	stock_max = 2
	availability_prob = 50

/datum/market_item/weapon/glock
	name = "Glock 17"
	desc = "A weapon from bygone times. Blocky firearm from the 21st century. For self defence, really."
	item = /obj/item/gun/ballistic/automatic/pistol/glock17
	added_market_item = /datum/market_item/weapon/spare_9mmag

	price_min = CARGO_CRATE_VALUE * 4
	price_max = CARGO_CRATE_VALUE * 6.5
	stock_max = 2
	availability_prob = 35

/datum/market_item/weapon/spare_9mmag
	name = "Spare Glock 17 Mag"
	desc = "9mm magazine for your needs."
	item = /obj/item/ammo_box/magazine/pistolm9mm/pmag

	price_min = CARGO_CRATE_VALUE * 1
	price_max = CARGO_CRATE_VALUE * 2.5
	stock_max = 3
	availability_prob = 0	//only spawns when we have Glock 17

/datum/market_item/weapon/sport_rifle
	name = "Sport Rifle Crate"
	desc = "Hello Comrade! You catch yourself thinking that you are tired of chasing after some ugly Terra Gov bastards or corp rats? Well, we can provide you access to our modern sport rifle! Shoot em out, tovarish."
	item = /obj/item/gun/ballistic/automatic/stm9
	added_market_item = /datum/market_item/weapon/spare_9mmag

	price_min = CARGO_CRATE_VALUE * 5
	price_max = CARGO_CRATE_VALUE * 7.5
	stock_max = 1
	availability_prob = 15
