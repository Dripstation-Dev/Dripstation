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
					/obj/item/suppressor,
					/obj/item/storage/box/syndie_kit/imp_uplink,
					/obj/item/storage/box/syndie_kit/imp_freedom,
					/obj/item/storage/box/syndie_kit/imp_microbomb,
					/obj/item/storage/box/syndie_kit/imp_storage)
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

/datum/supply_pack/security/stingbang
	name = "Sting grenade Crate"
	desc = "Contains three sting grenades. Requires Security access to open."
	cost = 1000
	contains = list(/obj/item/grenade/stingbang,
					/obj/item/grenade/stingbang,
					/obj/item/grenade/stingbang,
					/obj/item/grenade/stingbang)
	crate_name = "stingbang crate"

/datum/supply_pack/weaponry/russian
	name = "Vostok Surplus Crate"
	order_limit_in_one_order = 2
	order_limit = 3
	desc = "Hello Comrade, we have the most reliable military equipment the soviet space can offer, for the right price of course. Sadly we couldnt remove the lock so it requires Armory access to open."
	contains = list()

/datum/supply_pack/weaponry/russian/fill(obj/structure/closet/crate/C)
	switch (rand(0,5))
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
			new /obj/item/gun/ballistic/automatic/ar/akm/civ(C)
			new /obj/item/ammo_box/magazine/r762x39/civ(C)
			new /obj/item/ammo_box/magazine/r762x39/civ(C)
		if(4)
			new /obj/item/gun/ballistic/automatic/pistol/APS(C)
			new /obj/item/ammo_box/magazine/pistolm9mm(C)
			new /obj/item/ammo_box/magazine/pistolm9mm(C)
		if(5)
			new /obj/item/reagent_containers/food/snacks/rationpack(C)
	for(var/i in 1 to 2)
		//Under
		var/item = pick(/obj/item/clothing/under/syndicate/rus_army,
					/obj/item/clothing/under/syndicate/soviet/afganka,
					/obj/item/clothing/under/syndicate/soviet/gorka,
					/obj/item/clothing/under/costume/soviet,
					/obj/item/clothing/under/vostok)
		new item(C)
		//Gear
		item = pick(/obj/item/clothing/shoes/russian,
					/obj/item/clothing/gloves/combat,
					/obj/item/storage/belt/military/army,
					/obj/item/storage/belt/military/webbing/soviet,
					/obj/item/clothing/suit/armor/vest/russian,
					/obj/item/clothing/suit/armor/slav_heavy,
					/obj/item/clothing/suit/armor/vest/sacrificial/slav,
					/obj/item/clothing/suit/armor/vest/russian_coat)
		new item(C)
		//headgear
	var/head = pick(/obj/item/clothing/mask/russian_balaclava,
				/obj/item/clothing/head/helmet/riot/altin,
				/obj/item/clothing/head/helmet/rus_ushanka,
				/obj/item/clothing/head/helmet/rus_helmet,
				/obj/item/clothing/head/helmet/tanker/slav)
	new head(C)

/datum/supply_pack/weaponry/rusrevolver
	name = "Vostok Revolvers Crate"
	desc = "Hello Comrade, we have the best revolvers, for the right price of course. Comes with lethal rounds. Sadly we couldnt remove the lock so it requires Armory access to open."
	cost = 4000
	contraband = TRUE
	contains = list(/obj/item/gun/ballistic/revolver/rh9,
					/obj/item/gun/ballistic/revolver/rh9)
	crate_name = "rh9 crate"

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

/datum/supply_pack/weaponry/ammo_ten
	name = "Ammo Crate (10mm)"
	desc = "This crate contains 3 boxes of 10mm ammo. Requires Armory access to open."
	cost = 4000
	contains = list(/obj/item/ammo_box/c10mm,
					/obj/item/ammo_box/c10mm,
					/obj/item/ammo_box/c10mm)

/datum/supply_pack/weaponry/ammo_mateba
	name = "Ammo Crate (.44mm)"
	desc = "This crate contains 3 Shellguard Brand boxes of .44. Requires Armory access to open."
	cost = 8000
	contraband = TRUE
	access_view = ACCESS_SECURITY
	/obj/item/ammo_box/m44
	contains = list(/obj/item/ammo_box/m44,
					/obj/item/ammo_box/m44,
					/obj/item/ammo_box/m44)
	crate_type = /obj/structure/closet/crate/secure/shellguard

/datum/supply_pack/weaponry/ammo_syndirevolver
	name = "Ammo Crate (.357mm)"
	desc = "This crate contains 3 unknown Brand boxes of .357. Requires Armory access to open."
	cost = 6000
	hidden = TRUE
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/ammo_box/no_direct/a357,
					/obj/item/ammo_box/no_direct/a357,
					/obj/item/ammo_box/no_direct/a357)
	crate_type = /obj/structure/closet/crate/secure/shellguard


/datum/supply_pack/weaponry/ammo_nine
	name = "Ammo Crate (9mm)"
	desc = "This crate contains 3 boxes of 9mm ammo. Requires Armory access to open."
	cost = 3000
	contains = list(/obj/item/ammo_box/c9mm,
					/obj/item/ammo_box/c9mm,
					/obj/item/ammo_box/c9mm)

/datum/supply_pack/weaponry/ammo_ff
	name = "Ammo Crate (.45)"
	desc = "This crate contains 3 boxes of .45 ammo. Requires Armory access to open."
	cost = 4000
	contains = list(/obj/item/ammo_box/c45,
					/obj/item/ammo_box/c45,
					/obj/item/ammo_box/c45)

/datum/supply_pack/weaponry/ammo_ffap
	name = "Ammo Crate (.45 Armor-Piercing)"
	desc = "This crate contains 3 boxes of AP .45 ammo. Requires Armory access to open."
	cost = 6000
	contains = list(/obj/item/ammo_box/c45/ap,
					/obj/item/ammo_box/c45/ap,
					/obj/item/ammo_box/c45/ap)

/datum/supply_pack/weaponry/ammo_ffhp
	name = "Ammo Crate (.45 Hollow-Point)"
	desc = "This crate contains 3 boxes of HP .45 ammo. Requires Armory access to open."
	cost = 6000
	hidden = TRUE
	contains = list(/obj/item/ammo_box/c45/hp,
					/obj/item/ammo_box/c45/hp,
					/obj/item/ammo_box/c45/hp)

/datum/supply_pack/weaponry/ammo_riflenato
	name = "Ammo Crate (5.56x39)"
	desc = "This crate contains 3 boxes of 5.56 intermediate rifle ammo. Requires Armory access to open."
	cost = 5500
	contains = list(/obj/item/ammo_box/c556,
					/obj/item/ammo_box/c556,
					/obj/item/ammo_box/c556)

/datum/supply_pack/weaponry/ammo_rifleussp
	name = "Ammo Crate (5.45x39)"
	desc = "This crate contains 3 boxes of 5.45 intermediate rifle ammo. Requires Armory access to open."
	cost = 5000
	contains = list(/obj/item/ammo_box/c545,
					/obj/item/ammo_box/c545,
					/obj/item/ammo_box/c545)

/datum/supply_pack/weaponry/ammo_riflehussp
	name = "Ammo Crate (7.62x39)"
	desc = "This crate contains 3 boxes of 7.62 intermediate rifle ammo. Requires Armory access to open."
	cost = 6000
	contains = list(/obj/item/ammo_box/c762x39,
					/obj/item/ammo_box/c762x39,
					/obj/item/ammo_box/c762x39)

/datum/supply_pack/weaponry/ammo_civriflehussp
	name = "Ammo Crate (PS GJ 7.62x39)"
	desc = "This crate contains 3 boxes of 7.62 intermediate PS GJ rifle ammo. Requires Security access to open."
	cost = 3000
	access = ACCESS_SECURITY
	contains = list(/obj/item/ammo_box/c762x39/civ,
					/obj/item/ammo_box/c762x39/civ,
					/obj/item/ammo_box/c762x39/civ)

/datum/supply_pack/weaponry/ammo_rifleclip
	name = "Ammo Crate (7.62x54)"
	desc = "This crate contains 3 clips of 7.62 rifle ammo. Requires Armory access to open."
	cost = 5000
	contains = list(/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762,
					/obj/item/ammo_box/a762)

/datum/supply_pack/weaponry/ammo_9x39
	name = "Ammo Crate (9x39)"
	desc = "This crate contains 3 ammo boxes of 9x39 rifle ammo. Requires Armory access to open."
	cost = 4000
	contains = list(/obj/item/ammo_box/no_direct/a939,
					/obj/item/ammo_box/no_direct/a939,
					/obj/item/ammo_box/no_direct/a939)
	crate_name = "9x39 ammo crate"

/datum/supply_pack/weaponry/ammo_9x39rubber
	name = "Ammo Crate (9x39 rubber)"
	desc = "This crate contains 3 ammo boxes of 9x39 rifle ammo. Requires Armory access to open."
	cost = 3000
	contains = list(/obj/item/ammo_box/no_direct/a939/rubber,
					/obj/item/ammo_box/no_direct/a939/rubber,
					/obj/item/ammo_box/no_direct/a939/rubber)
	crate_name = "9x39 rubber ammo crate"

/datum/supply_pack/weaponry/ammo_127x55
	name = "Ammo Crate (12.7x55)"
	desc = "This crate contains 3 ammo boxes of 12.7x55 rifle ammo. Requires Armory access to open."
	cost = 10000
	contains = list(/obj/item/ammo_box/no_direct/a127,
					/obj/item/ammo_box/no_direct/a127,
					/obj/item/ammo_box/no_direct/a127)
	crate_name = "12.7x55 ammo crate"

/datum/supply_pack/weaponry/ammo_a40smoke
	name = "Ammo Crate (40mm Smoke)"
	desc = "This crate contains 2 ammo box of 40mm grenades. Requires Armory access to open."
	cost = 4000
	contains = list(/obj/item/ammo_box/a40mm/smoke,
					/obj/item/ammo_box/a40mm/smoke)

/datum/supply_pack/weaponry/ammo_a40teargas
	name = "Ammo Crate (40mm Tear Gas)"
	desc = "This crate contains 2 ammo box of 40mm grenades. Requires Armory access to open."
	cost = 6000
	contains = list(/obj/item/ammo_box/a40mm/teargas,
					/obj/item/ammo_box/a40mm/teargas)

/datum/supply_pack/security/armory
	crate_type = /obj/structure/closet/crate/secure/nanotrasen

/datum/supply_pack/security/armory/wt550
	name = "Surplus Security Autocarbine Crate"
	desc = "Contains two cases of high-powered, semiautomatic carbines chambered in 4.6x30mm rounds. Requires Armory access to open."
	cost = 4500
	contains = list(/obj/item/storage/box/gunset/wt550,
					/obj/item/storage/box/gunset/wt550)
	crate_name = "autocarbine crate"

/datum/supply_pack/security/armory/wt550_single
	name = "Surplus Security Autocarbine Single-Pack"
	desc = "Contains one cases of high-powered, semiautomatic carbine chambered in 4.6x30mm rounds. Requires Armory access to open."
	cost = 3000
	contains = list(/obj/item/storage/box/gunset/wt550)
	small_item = TRUE

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

/datum/supply_pack/security/armory/sacrificial
	name = "Sacrificial Armor Crate"
	desc = "Contains two pieces of sacrificial armored vest. Requires Security access to open."
	cost = 8000
	contains = list(/obj/item/clothing/suit/armor/vest/sacrificial,
					/obj/item/clothing/suit/armor/vest/sacrificial,
					/obj/item/clothing/under/syndicate/camo/peacekeeper,
					/obj/item/clothing/under/syndicate/camo/peacekeeper,
					/obj/item/clothing/head/helmet/sacrificial,
					/obj/item/clothing/head/helmet/sacrificial)
	crate_name = "sacrificial armor crate"

/datum/supply_pack/security/securityclothes
	name = "Spearhead brand Clothing Crate"
	contains = list(/obj/item/clothing/under/rank/security/navyblue,
					/obj/item/clothing/under/rank/security/navyblue,
					/obj/item/clothing/suit/armor/officerjacket,
					/obj/item/clothing/suit/armor/officerjacket,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/under/rank/security/warden/navyblue,
					/obj/item/clothing/suit/armor/wardenjacket,
					/obj/item/clothing/head/beret/sec/navywarden)


/datum/supply_pack/security/securityarmor
	name = "Full Security Armor Crate"
	desc = "Contains three fullbody vests, shoulderpads and knee pads included. Requires Security access to open."
	cost = 1000
	contains = list(/obj/item/clothing/suit/armor/vest/alt/full,
					/obj/item/clothing/suit/armor/vest/alt/full,
					/obj/item/clothing/suit/armor/vest/alt/full)
	crate_name = "full security armor crate"


/datum/supply_pack/security/shellguardclothes
	name = "Shellguard brand Clothing Crate"
	desc = "Contains appropriate outfits for the PMC operatives. Contains outfits for the Guard, Warden. Each outfit comes with a rank-appropriate jumpsuit, suit, and beret. Requires Security access to open."
	cost = 3000
	contraband = TRUE
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/clothing/under/shellguard/guard,
					/obj/item/clothing/under/shellguard/warden,
					/obj/item/clothing/head/beret/sec/shellguard,
					/obj/item/clothing/head/beret/sec/navywarden/shellguard,
					/obj/item/clothing/suit/armor/vest/shellguard,
					/obj/item/clothing/suit/armor/vest/warden/shellguard)
	crate_name = "shellguard clothing crate"
	crate_type = /obj/structure/closet/crate/secure/shellguard

/datum/supply_pack/security/shockers
	name = "Shockers Crate"
	desc = "Contains three shokers. Nonstandart equipment for Spearhead security. Requires Security access to open."
	cost = 700
	contraband = TRUE
	access_view = ACCESS_SECURITY
	contains = list(/obj/item/melee/shocker,
					/obj/item/melee/shocker,
					/obj/item/melee/shocker)
	crate_name = "shockers crate"

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

/datum/supply_pack/security/qm_rifle
	name = "QM`s rifle"
	desc = "Contains QM`s personal rifle."
	cost = 5000
	order_limit = 1
	dangerous = TRUE
	contraband = TRUE
	access = ACCESS_QM
	access_view = ACCESS_QM
	crate_type = /obj/structure/closet/crate/secure/weapon
	contains = list(/obj/item/gun/ballistic/rifle/boltaction/qmrifle)
	crate_name = "qm rifle crate"

/datum/supply_pack/weaponry/ballistic
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains three Militech-designed CS-16A Shotguns, and three pouches. Requires Armory access to open."
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/storage/pouch/shotgun/full,
					/obj/item/storage/pouch/shotgun/full,
					/obj/item/storage/pouch/shotgun/full)
	crate_type = /obj/structure/closet/crate/secure/militech

/datum/supply_pack/weaponry/ballistic_single
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains one Militech-designed CS-16A Shotgun, and one pouch. Requires Armory access to open."
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/storage/pouch/shotgun/full)
	crate_type = /obj/structure/closet/crate/secure/militech

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

/datum/supply_pack/medical/medipen_variety_zenghu
	name = "Combat Medipen Variety-Pak (Zeng Hu Brand)"
	desc = "Contains nine different medipens in three different varieties, to assist in regeneration and overall combat performing."
	cost = 10000
	contains = list(/obj/item/reagent_containers/autoinjector/medipen/propithal,
					/obj/item/reagent_containers/autoinjector/medipen/propithal,
					/obj/item/reagent_containers/autoinjector/medipen/propithal,
					/obj/item/reagent_containers/autoinjector/medipen/tramadol,
					/obj/item/reagent_containers/autoinjector/medipen/tramadol,
					/obj/item/reagent_containers/autoinjector/medipen/tramadol,
					/obj/item/reagent_containers/autoinjector/medipen/meldonin,
					/obj/item/reagent_containers/autoinjector/medipen/meldonin,
					/obj/item/reagent_containers/autoinjector/medipen/meldonin,
	)
	crate_name = "medipen crate"
	crate_type = /obj/structure/closet/crate/secure/zeng_hu

/datum/supply_pack/medical/replica_heart
	name = "Licensed Replica Spare Part (TMC-17H)"
	desc = "Contains one replica spare part in the shape of a heart."
	cost = 4000
	contains = list(/obj/item/organ/heart/replica)
	small_item = TRUE

/datum/supply_pack/medical/replica_controller
	name = "Licensed Replica Spare Part (TMC-89C)"
	desc = "Contains one replica spare behaviour controller cyberimplant."
	cost = 4000
	contains = list(/obj/item/organ/cyberimp/brain/replica_controller)
	small_item = TRUE

/datum/supply_pack/medical/replica_eyes
	name = "Licensed Replica Spare Part (TMC-11Y)"
	desc = "Contains one replica spare part in the shape of a eyes."
	cost = 4000
	contains = list(/obj/item/organ/eyes/robotic/preternis/replica)
	small_item = TRUE

/datum/supply_pack/medical/replica_tongue
	name = "Licensed Replica Spare Part (TMC-19T)"
	desc = "Contains one replica spare part in the shape of a tongue."
	cost = 1000
	contains = list(/obj/item/organ/tongue/replica)
	small_item = TRUE

/datum/supply_pack/medical/replica_ears
	name = "Licensed Replica Spare Part (TMC-16E)"
	desc = "Contains one replica spare part in the shape of a ears."
	cost = 1000
	contains = list(/obj/item/organ/ears/replica)
	small_item = TRUE

/datum/supply_pack/medical/replica_stomach
	name = "Licensed Replica Spare Part (TMC-24S)"
	desc = "Contains one replica spare part in the shape of a stomach."
	cost = 1000
	contains = list(/obj/item/organ/stomach/cell/preternis/replica)
	small_item = TRUE

/datum/supply_pack/medical/replica_lungs
	name = "Licensed Replica Spare Part (TMC-32L)"
	desc = "Contains one replica spare part in the shape of the lungs."
	cost = 4000
	contains = list(/obj/item/organ/lungs/replica)
	small_item = TRUE

/datum/supply_pack/critter/pig
	name = "Pig Crate"
	desc = "The pig goes oink!"
	cost = 1500
	contains = list(/mob/living/simple_animal/pig)
	crate_name = "pig crate"

