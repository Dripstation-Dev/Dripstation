/datum/supply_pack
	var/order_limit = -1 // The number of times one can order a cargo crate, before it becomes restricted. -1 for infinite
	var/times_ordered = 0 // Number of times a crate has been ordered in a shift
	var/order_limit_in_one_order = -1 // The number of times one can order a cargo crate, before it becomes restricted. -1 for infinite
	var/times_ordered_in_one_order = 0 // Number of times a crate has been ordered in one package

//specialops edit
/datum/supply_pack/emergency/specialops
	desc = "(*!&@#TOO CHEAP FOR THAT NULL_ENTRY, HUH OPERATIVE? WELL, THIS LITTLE ORDER CAN STILL HELP YOU OUT IN A PINCH. CONTAINS A BOX OF FIVE EMP GRENADES, THREE SMOKEBOMBS, AN INCENDIARY GRENADE, A \"SLEEPY PEN\" FULL OF NICE TOXINS AND YOUR NEW GEAR!#@*$"
	cost = 6000
	order_limit = 2
	contains = list(/obj/item/storage/box/emps,
					/obj/item/grenade/smokebomb,
					/obj/item/grenade/smokebomb,
					/obj/item/grenade/smokebomb,
					/obj/item/pen/blue/sleepy,
					/obj/item/grenade/chem_grenade/incendiary,
					/obj/item/clothing/glasses/night,
					/obj/item/storage/belt/holster/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/under/syndicate/combat,
					/obj/item/clothing/shoes/combat)
	crate_name = "crate"
	crate_type = /obj/structure/closet/crate

//telepad for black market
/datum/supply_pack/costumes_toys/blackmarket_telepad
	name = "Black Market LTSRBT"
	desc = "Need a faster and better way of transporting your illegal goods from and to the \
		station? Fear not, the Long-To-Short-Range-Bluespace-Transceiver (LTSRBT for short) \
		is here to help. Contains a LTSRBT circuit, two bluespace crystals, and one ansible."
	cost = 26000
	contraband = TRUE
	contains = list(/obj/item/circuitboard/machine/ltsrbt,
					/obj/item/stack/ore/bluespace_crystal/artificial = 2,
					/obj/item/stock_parts/subspace/ansible)
	crate_name = "crate"

//nullcrate check
/datum/supply_pack/emergency/nullcrate
	name = "NULL_ENTRY"
	desc = "(#@&^$THIS IS YOUR LOVELY PACKAGE THAT CONTAINS SOME RANDOM SYNDICATE STUFF. GIVE EM HELL, OPERATIVE@&!*()"
	hidden = TRUE
	order_limit_in_one_order = 2
	order_limit = 10
	cost = 12000
	crate_name = "crate"
	crate_type = /obj/structure/closet/crate
	contains = list()

/datum/supply_pack/emergency/nullcrate/fill(obj/structure/closet/crate/C)
	switch (rand(0,2))
		if(0)
			new /obj/item/gun/ballistic/automatic/pistol(C)
			new /obj/item/ammo_box/magazine/m10mm(C)
			new /obj/item/ammo_box/magazine/m10mm(C)
		if(1)
			new /obj/item/gun/energy/kinetic_accelerator/crossbow/large(C)
		if(2)
			new /obj/item/pen/red/edagger(C)
			new /obj/item/grenade/plastic/c4(C)
	for(var/i in 1 to 2)
		//Gear
		var/item = pick(/obj/item/clothing/shoes/magboots/syndie,
					/obj/item/clothing/gloves/fingerless/bigboss,
					/obj/item/storage/backpack/duffelbag/syndie,
					/obj/item/storage/belt/chameleon/syndicate,
					/obj/item/clothing/under/chameleon,
					/obj/item/clothing/suit/chameleon,
					/obj/item/syndicateReverseCard,
					/obj/item/camera_bug,
					/obj/item/storage/box/syndie_kit/throwing_weapons,
					/obj/item/storage/toolbox/syndicate)
		new item(C)
		//Misk
		item = pick(/obj/item/storage/box/syndie_kit/cutouts,
					/obj/item/disk/nuclear/fake,
					/obj/item/toy/plush/carpplushie/dehy_carp,
					/obj/item/storage/pill_bottle/gummies/omnizine,
					/obj/item/storage/pill_bottle/gummies/sleepy,
					/obj/item/storage/fancy/cigarettes/cigpack_syndicate,
					/obj/item/storage/backpack/syndie,
					/obj/item/stack/tape/guerrilla,
					/obj/item/soap/syndie,
					/obj/item/flashlight/lantern/syndicate,
					/obj/item/storage/box/syndie_kit/bugs,
					/obj/item/computer_hardware/hard_drive/portable/syndicate/ntnet_dos,
					/obj/item/flashlight/emp,
					/obj/item/multitool/ai_detect,
					/obj/item/stamp/syndiround,
					/obj/item/suppressor)
		new item(C)

/datum/supply_pack/costumes_toys/randomised/syndicate
	name = "Tactical Crate"
	desc = "(*!&@#UH THIS IS ANOTHER OPTION. YOU WANNA HAVE SOME DRIP? WELL, ITS YOURS, BUT FOR THE FAIR PRICE, OPERATIVE.#@*$"
	hidden = TRUE
	cost = 2000
	num_contained = 1
	contains = list(/obj/item/storage/box/donkdrip,
					/obj/item/storage/box/donkdrip/combat,
					/obj/item/storage/box/donkdrip/maid)
	crate_name = "crate"

/datum/supply_pack/costumes_toys/wardrobes/security
	name = "Law and Order Wardrobe Supply Crate"
	desc = "This crate contains refills for the SecDrobe, DetDrobe and LawDrobe."
	cost = 2000
	contains = list(/obj/item/vending_refill/wardrobe/sec_wardrobe,
					/obj/item/vending_refill/wardrobe/law_wardrobe,
					/obj/item/vending_refill/wardrobe/det_wardrobe)

/datum/supply_pack/security/tackler
	name = "Gripper Gloves Crate"
	desc = "Contains three pairs of gripper gloves. Requires Security access to open."
	cost = 1000
	contains = list(/obj/item/clothing/gloves/tackler,
					/obj/item/clothing/gloves/tackler,
					/obj/item/clothing/gloves/tackler)
	crate_name = "gripper crate"

/datum/supply_pack/weaponry/russian
	name = "Vostok Surplus Crate"
	desc = "Hello Comrade, we have the most reliable military equipment the soviet space can offer, for the right price of course. Sadly we couldnt remove the lock so it requires Armory access to open."
	contains = list()

/datum/supply_pack/weaponry/russian/fill(obj/structure/closet/crate/C)
	switch (rand(0,4))
		if(0)
			new /obj/item/gun/ballistic/revolver/nagant(C)
			new /obj/item/ammo_box/no_direct/n762(C)
			new /obj/item/ammo_box/no_direct/n762(C)
		if(1)
			new /obj/item/gun/ballistic/rifle/boltaction(C)
			new /obj/item/storage/toolbox/ammo(C)
		if(2)
			new /obj/item/gun/ballistic/rifle/boltaction(C)
			new /obj/item/ammo_box/a762(C)
			new /obj/item/ammo_box/a762(C)
			new /obj/item/ammo_box/a762(C)
		if(3)
			new /obj/item/gun/ballistic/automatic/ar/ak47(C)
			new /obj/item/ammo_box/magazine/r762x39(C)
		if(4)
			new /obj/item/reagent_containers/food/snacks/rationpack(C)
	for(var/i in 1 to 2)
		//Under
		var/item = pick(/obj/item/clothing/under/syndicate/rus_army,
					/obj/item/clothing/under/syndicate/soviet/afganka,
					/obj/item/clothing/under/syndicate/soviet/gorka,
					/obj/item/clothing/under/soviet,
					/obj/item/clothing/under/vostok)
		new item(C)
		//Gear
		item = pick(/obj/item/clothing/shoes/russian,
					/obj/item/clothing/gloves/combat,
					/obj/item/clothing/mask/russian_balaclava,
					/obj/item/clothing/head/helmet/riot/altin,
					/obj/item/clothing/head/helmet/rus_ushanka,
					/obj/item/clothing/suit/armor/vest/russian,
					/obj/item/clothing/suit/armor/vest/russian_coat)
		new item(C)

/datum/supply_pack/weaponry/nitro_express
	name = "Nitro Express Rifle Crate"
	desc = "This crate contains one BW-5 Nitro Express Rifle and 6 rounds of .700 Nitro Express. Requires Armory access to open."
	cost = 12000
	order_limit = 1
	contains = list(/obj/item/gun/ballistic/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express)

/datum/supply_pack/weaponry/nitro_express_ammo
	name = "Nitro Express Ammo Crate"
	desc = "This crate contains 10 rounds of .700 Nitro Express. Requires Armory access to open."
	cost = 2000
	order_limit = 1
	contains = list(/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express,
					/obj/item/ammo_casing/nitro_express)

/datum/supply_pack/security/armory/swat
	desc = "Contains two fullbody sets of tough, fireproof, pressurized suits designed in a joint effort by Terragov and Nanotrasen. Each set contains a suit, helmet, mask, combat belt, and NT brand tackler gloves. Requires Armory access to open."
	contains = list(/obj/item/clothing/head/helmet/swat/nanotrasen,
					/obj/item/clothing/head/helmet/swat/nanotrasen,
					/obj/item/clothing/suit/space/swat,
					/obj/item/clothing/suit/space/swat,
					/obj/item/clothing/mask/gas/sechailer/swat,
					/obj/item/clothing/mask/gas/sechailer/swat,
					/obj/item/storage/belt/military/assault,
					/obj/item/storage/belt/military/assault,
					/obj/item/clothing/gloves/tackler/nt,
					/obj/item/clothing/gloves/tackler/nt)

/datum/supply_pack/security/securityclothes
	contains = list(/obj/item/clothing/under/rank/security/navyblue,
					/obj/item/clothing/under/rank/security/navyblue,
					/obj/item/clothing/suit/armor/officerjacket,
					/obj/item/clothing/suit/armor/officerjacket,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/under/rank/security/warden/navyblue,
					/obj/item/clothing/suit/armor/wardenjacket,
					/obj/item/clothing/head/beret/sec/navywarden)

/datum/supply_pack/security/armory/laserarmor
	name = "Reflective Armor Crate"
	desc = "Contains two vests and two helmets of highly reflective material. Each armor piece diffuses a laser's energy by over half, as well as offering a good chance to reflect the laser entirely. Requires Armory access to open."
	cost = 3000
	contains = list(/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/head/helmet/laserproof/raised,
					/obj/item/clothing/head/helmet/laserproof/raised)

/datum/supply_pack/clearance/heavymining
	name = "Old Mining Hardsuit Crate"
	desc = "Contains one old specialised piece of equipment."
	cost = 3000
	order_limit = 1
	contains = list(/obj/item/clothing/suit/space/hardsuit/heavymining)

/datum/supply_pack/security/armory/mindshield
	desc = "Prevent against radical thoughts with three Mindshield implants. Requires Armory access to open."

/datum/supply_pack/security/armory/amnestic
	name = "Amnestic Implants Crate"
	desc = "Revert radical thoughts with three Amnestic implants. Requires Armory access to open."
	cost = 4000
	contains = list(/obj/item/storage/lockbox/amnestic)
	crate_name = "amnestic implant crate"

/datum/supply_pack/security/armory/hos
	name = "Head of Security Armor Crate"
	desc = "Contains set of HoS heavy armor."
	cost = 5000
	order_limit = 1
	special = TRUE
	crate_type = /obj/structure/closet/crate/secure/weapon
	contains = list(/obj/item/clothing/head/helmet/HoS,
					/obj/item/clothing/suit/armor/riot/hos)
	crate_name = "hos supply crate"

/datum/supply_pack/weaponry/ballistic
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains three Militech-designed Combat Shotguns, and three Shotgun Bandoliers. Requires Armory access to open."
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/storage/pouch/shotgun/full,
					/obj/item/storage/pouch/shotgun/full,
					/obj/item/storage/pouch/shotgun/full)

/datum/supply_pack/weaponry/ballistic_single
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains one Militech-designed Combat Shotgun, and one Shotgun Bandolier. Requires Armory access to open."
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/storage/pouch/shotgun/full)

/datum/supply_pack/weaponry/riotshotgun
	name = "Riot Shotguns Crate"
	desc = "Tip: techically, it counts as non-lethally subduing a target as long as they don't die before Medbay can get to them. Contains three security-grade riot shotguns. Requires Armory access to open."
	cost = 7000
	contains = list(/obj/item/gun/ballistic/shotgun/riot/remington,
					/obj/item/gun/ballistic/shotgun/riot/remington,
					/obj/item/gun/ballistic/shotgun/riot/remington)
	crate_name = "riot shotguns crate"

/datum/supply_pack/weaponry/riotshotgun_single
	name = "Riot Shotgun Single-Pack"
	desc = "Stop that Clown in his tracks with this magic stick of non-lethal subduction! Contains one security-grade riot shotgun. Requires Armory access to open."
	cost = 2700
	small_item = TRUE
	contains = list(/obj/item/gun/ballistic/shotgun/riot/remington)

/datum/supply_pack/costumes_toys/paintball
	name = "Mixed Paintball Supply Crate"
	desc = "Contains four paintball guns and extra ammo."
	cost = 2500
	contraband = TRUE
	contains = list(/obj/item/gun/ballistic/automatic/toy/paintball/blue,
					/obj/item/gun/ballistic/automatic/toy/paintball/blue,
					/obj/item/gun/ballistic/automatic/toy/paintball,
					/obj/item/gun/ballistic/automatic/toy/paintball,
					/obj/item/ammo_box/magazine/toy/paintball,
					/obj/item/ammo_box/magazine/toy/paintball,
					/obj/item/ammo_box/magazine/toy/paintball,
					/obj/item/ammo_box/magazine/toy/paintball/blue,
					/obj/item/ammo_box/magazine/toy/paintball/blue,
					/obj/item/ammo_box/magazine/toy/paintball/blue)
	crate_name = "mixed paintball supply crate"

/datum/supply_pack/costumes_toys/paintball_ammo
	name = "Paintball Ammo Crate"
	desc = "Plenty of paintball ammo in a variety of colors."
	cost = 700
	contraband = TRUE
	contains = list(/obj/item/ammo_box/magazine/toy/paintball,
					/obj/item/ammo_box/magazine/toy/paintball,
					/obj/item/ammo_box/magazine/toy/paintball,
					/obj/item/ammo_box/magazine/toy/paintball/blue,
					/obj/item/ammo_box/magazine/toy/paintball/blue,
					/obj/item/ammo_box/magazine/toy/paintball/blue,
					/obj/item/ammo_box/magazine/toy/paintball/pink,
					/obj/item/ammo_box/magazine/toy/paintball/pink,
					/obj/item/ammo_box/magazine/toy/paintball/purple,
					/obj/item/ammo_box/magazine/toy/paintball/purple,
					/obj/item/ammo_box/magazine/toy/paintball/orange,
					/obj/item/ammo_box/magazine/toy/paintball/orange)
	crate_name = "paintball ammo crate"

/datum/supply_pack/service/replica_rationpacks
	name = "Replika rationpacks crate"
	desc = "Plenty of rations for your replika."
	cost = 2000
	contains = list(/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack,
					/obj/item/reagent_containers/food/snacks/synthrationpack)
	crate_name = "ratiopapack crate"
