/datum/market_item/syndibase
	/// Is it available? Probably yes.
	availability_prob = 100
	/// CARGO_CRATE_VALUE = 200
	price = CARGO_CRATE_VALUE
	/// Keep it 1, if you wand it unlimited
	stock = 1
	/// It`s unlimited
	limitedstock = FALSE
	/// Your crate name
	var/crate_name
	/// Your crate type
	item
	/// Contains of that crate type
	var/list/contains = null
	/// Our access needed to open
	var/access = FALSE
	/// Any of the accesses needed to open
	var/access_any = FALSE
	markets = list(/datum/market/syndicatecargo)

/datum/market_item/syndibase/spawn_item(loc)
	var/obj/structure/closet/crate/C = new item(loc)
	C.name = crate_name
	if(access)
		C.req_access = list(access)
	if(access_any)
		C.req_one_access = access_any
	fill(C)
	return C

/datum/market_item/syndibase/proc/fill(obj/structure/closet/crate/C)
	for(var/thing in contains)
		new thing(C)

/datum/market_item/syndibase/emergency
	category = "Emergency"

/datum/market_item/syndibase/emergency/equipment
	name = "Emergency Equipment Crate"
	desc = "Explosions got you down? These supplies are guaranteed to patch up holes, in stations and people alike! Comes with two floorbots, two medbots, five oxygen masks and five small oxygen tanks."
	price = CARGO_CRATE_VALUE * 10
	contains = list(/mob/living/simple_animal/bot/floorbot,
					/mob/living/simple_animal/bot/floorbot,
					/mob/living/simple_animal/bot/medbot,
					/mob/living/simple_animal/bot/medbot,
					/obj/item/tank/internals/air,
					/obj/item/tank/internals/air,
					/obj/item/tank/internals/air,
					/obj/item/tank/internals/air,
					/obj/item/tank/internals/air,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/grenade/gas_crystal/pluonium_crystal,
					/obj/item/grenade/gas_crystal/pluonium_crystal)
	crate_name = "emergency crate"
	item = /obj/structure/closet/crate/internals

/datum/market_item/syndibase/emergency/firefighting
	name = "Firefighting Crate"
	desc = "Only you can prevent station fires. Partner up with two firefighter suits, gas masks, flashlights, large oxygen tanks, extinguishers, and hardhats!"
	price = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/clothing/suit/fire/firefighter,
					/obj/item/clothing/suit/fire/firefighter,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/flashlight,
					/obj/item/flashlight,
					/obj/item/tank/internals/oxygen/red,
					/obj/item/tank/internals/oxygen/red,
					/obj/item/extinguisher/advanced,
					/obj/item/extinguisher/advanced,
					/obj/item/clothing/head/hardhat/red,
					/obj/item/clothing/head/hardhat/red)
	crate_name = "firefighting crate"
	item = /obj/structure/closet/crate/internals

/datum/market_item/syndibase/emergency/foamtank
	name = "Firefighting Foam Tank Crate"
	desc = "Contains a tank of firefighting foam. Also known as \"plasmaman's bane\"."
	price = CARGO_CRATE_VALUE * 3
	contains = list(/obj/structure/reagent_dispensers/foamtank)
	crate_name = "foam tank crate"
	item = /obj/structure/closet/crate/large

/datum/market_item/syndibase/emergency/atmostank
	name = "Firefighting Tank Backpack"
	desc = "Mow down fires with this high-capacity fire fighting tank backpack."
	price = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/watertank/atmos)
	crate_name = "firefighting backpack crate"
	item = /obj/structure/closet/crate/internals

/datum/market_item/syndibase/emergency/metalfoam
	name = "Metal Foam Grenade Crate"
	desc = "Seal up those pesky hull breaches with 7 Metal Foam Grenades."
	price = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/storage/box/metalfoam)
	crate_name = "metal foam grenade crate"
	item = /obj/structure/closet/crate/internals

/datum/market_item/syndibase/emergency/bomb
	name = "Explosive Emergency Crate"
	desc = "Science gone bonkers? Beeping behind the airlock? Buy now and be the hero the station des... I mean needs! (time not included)"
	price = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/clothing/head/bomb_hood,
					/obj/item/clothing/suit/bomb_suit,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/screwdriver,
					/obj/item/wirecutters,
					/obj/item/multitool)
	crate_name = "bomb suit crate"
	item = /obj/structure/closet/crate/internals

/datum/market_item/syndibase/emergency/bio
	name = "Biological Emergency Crate"
	desc = "This crate holds 2 full bio suits which will protect you from viruses."
	price = CARGO_CRATE_VALUE * 9
	contains = list(/obj/item/clothing/head/bio_hood,
					/obj/item/clothing/head/bio_hood,
					/obj/item/clothing/suit/bio_suit,
					/obj/item/clothing/suit/bio_suit,
					/obj/item/storage/bag/bio,
					/obj/item/reagent_containers/syringe/antiviral,
					/obj/item/reagent_containers/syringe/antiviral,
					/obj/item/clothing/gloves/color/latex/nitrile,
					/obj/item/clothing/gloves/color/latex/nitrile)
	crate_name = "bio suit crate"
	item = /obj/structure/closet/crate/internals

/datum/market_item/syndibase/emergency/radiation
	name = "Radiation Protection Crate"
	desc = "Survive the Nuclear Apocalypse and Supermatter Engine alike with two sets of Radiation suits. Each set contains a helmet, suit, and Geiger counter. We'll even throw in a bottle of vodka and some glasses too, considering the life-expectancy of people who order this."
	price = CARGO_CRATE_VALUE * 9
	contains = list(/obj/item/clothing/head/radiation,
					/obj/item/clothing/head/radiation,
					/obj/item/clothing/suit/radiation,
					/obj/item/clothing/suit/radiation,
					/obj/item/geiger_counter,
					/obj/item/geiger_counter,
					/obj/item/reagent_containers/food/drinks/bottle/vodka,
					/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass,
					/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass)
	crate_name = "radiation protection crate"
	item = /obj/structure/closet/crate/radiation

/datum/market_item/syndibase/emergency/weedcontrol
	name = "Weed Control Crate"
	desc = "Keep those invasive species OUT. Contains a scythe, gasmask, and two anti-weed chemical grenades. Warranty void if used on ambrosia."
	price = CARGO_CRATE_VALUE * 7
	access = null	//ACCESS_HYDROPONICS
	contains = list(/obj/item/scythe,
					/obj/item/clothing/mask/gas/syndicate,
					/obj/item/grenade/chem_grenade/antiweed,
					/obj/item/grenade/chem_grenade/antiweed)
	crate_name = "weed control crate"
	item = /obj/structure/closet/crate/secure/hydroponics

/datum/market_item/syndibase/emergency/spacesuit
	name = "Space Suit Crate"
	desc = "Contains one space suit produced by Waffle Co and an oxygen jetpack."
	price = CARGO_CRATE_VALUE * 12
	contains = list(/obj/item/clothing/suit/space/syndicate/black,
					/obj/item/clothing/head/helmet/space/syndicate/black,
					/obj/item/clothing/mask/breath,
					/obj/item/tank/jetpack/oxygen)
	crate_name = "space suit crate"
	item = /obj/structure/closet/crate/waffle


/////Gorlex Security Stuff
/datum/market_item/syndibase/security
	category = "Gorlex Security"

/datum/market_item/syndibase/security/supplies
	name = "Security Supplies Crate"
	desc = "Contains seven flashbangs, seven teargas grenades, six flashes, and seven handcuffs."
	contains = list(/obj/item/storage/box/flashbangs,
					/obj/item/storage/box/teargas,
					/obj/item/storage/box/flashes,
					/obj/item/storage/box/handcuffs)
	price = CARGO_CRATE_VALUE * 2
	crate_name = "security supply crate"
	item = /obj/structure/closet/crate/donk

/datum/market_item/syndibase/security/secway
	name = "Secway Crate"
	desc = "A stylish way to travel for all law enforcement."
	price = CARGO_CRATE_VALUE * 14
	contains = list(/obj/vehicle/ridden/secway,
					/obj/item/key/security)
	crate_name = "secway crate"
	item = /obj/structure/closet/crate/donk

/datum/market_item/syndibase/security/firingpins
	name = "Standard Firing Pins Crate"
	desc = "Upgrade your arsenal with 5 standard firing pins."
	price = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/storage/box/firingpins)
	crate_name = "firing pins crate"
	item = /obj/structure/closet/crate/donk

/datum/market_item/syndibase/security/stechkin
	name = "Waffle Co Stechkin Pistol Crate"
	desc = "Waffle Co two standart service pistols with spare magasines. Fire at will!"
	contains = list(/obj/item/gun/ballistic/automatic/pistol,
					/obj/item/gun/ballistic/automatic/pistol,
					/obj/item/ammo_box/magazine/m10mm,
					/obj/item/ammo_box/magazine/m10mm)
	price = CARGO_CRATE_VALUE * 12
	crate_name = "Stechkin Pistol Crate"
	item = /obj/structure/closet/crate/waffle

/datum/market_item/syndibase/security/stechkin_ammo
	name = "Waffle Co Stechkin - 10mm Magazine"
	desc = "Waffle Co three standart magazines with 10mm ammo. Fire at will!"
	contains = list(/obj/item/ammo_box/magazine/m10mm,
					/obj/item/ammo_box/magazine/m10mm,
					/obj/item/ammo_box/magazine/m10mm)
	price = CARGO_CRATE_VALUE * 3
	crate_name = "Stechkin - 10mm Magazine crate"
	item = /obj/structure/closet/crate/waffle

/datum/market_item/syndibase/security/stechkin_ammo_ap
	name = "Waffle Co Stechkin - 10mm Armour Piercing Magazine"
	desc = "Waffle Co three standart magazines with 10mm AP ammo. Fire at will!"
	contains = list(/obj/item/ammo_box/magazine/m10mm/ap,
					/obj/item/ammo_box/magazine/m10mm/ap,
					/obj/item/ammo_box/magazine/m10mm/ap)
	price = CARGO_CRATE_VALUE * 3
	crate_name = "Stechkin - 10mm Armour Piercing Magazine crate"
	item = /obj/structure/closet/crate/waffle

/datum/market_item/syndibase/security/stechkin_ammo_fire
	name = "Waffle Co Stechkin - 10mm Incendiary Magazine"
	desc = "Waffle Co three standart magazines with 10mm Incendiary ammo. Fire at will!"
	contains = list(/obj/item/ammo_box/magazine/m10mm/fire,
					/obj/item/ammo_box/magazine/m10mm/fire,
					/obj/item/ammo_box/magazine/m10mm/fire)
	price = CARGO_CRATE_VALUE * 3
	crate_name = "Stechkin - 10mm Incendiary Magazine crate"
	item = /obj/structure/closet/crate/waffle

/datum/market_item/syndibase/security/stechkin_ammo_hp
	name = "Waffle Co Stechkin - 10mm Hollow Point Magazine"
	desc = "Waffle Co three standart magazines with 10mm HP ammo. Fire at will!"
	contains = list(/obj/item/ammo_box/magazine/m10mm/hp,
					/obj/item/ammo_box/magazine/m10mm/hp,
					/obj/item/ammo_box/magazine/m10mm/hp)
	price = CARGO_CRATE_VALUE * 3
	crate_name = "Stechkin - 10mm Hollow Point Magazine crate"
	item = /obj/structure/closet/crate/waffle

/datum/market_item/syndibase/security/energy_crossbow
	name = "Cybersun Miniature Energy Crossbow"
	desc = "Well, that`s the crossbow. Energy one."
	contains = list(/obj/item/gun/energy/kinetic_accelerator/crossbow)
	price = CARGO_CRATE_VALUE * 20
	crate_name = "Energy Crossbow crate"
	item = /obj/structure/closet/crate/donk

/datum/market_item/syndibase/security/armor
	name = "Armor Crate"
	desc = "Three sets of well-rounded, decently-protective armor and helmet. Requires Security access to open."
	contains = list(/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet,
					/obj/item/clothing/head/helmet)
	price = CARGO_CRATE_VALUE * 6
	crate_name = "Armor crate"
	item = /obj/structure/closet/crate/secure/syndicate

/datum/market_item/syndibase/security/combat_webbing
	name = "Combat Webbing Crate"
	desc = "Combat webbing for all!"
	contains = list(/obj/item/storage/belt/military/webbing/syndicate/morphing,
					/obj/item/storage/belt/military/webbing/syndicate/morphing,
					/obj/item/storage/belt/military/webbing/syndicate/morphing)
	price = CARGO_CRATE_VALUE * 10
	crate_name = "Combat Webbing Crate"
	item = /obj/structure/closet/crate/secure/syndicate

/datum/market_item/syndibase/security/bola
	name = "Tactical Bola's Crate"
	desc = "Six Tactical Bolas for price of one(box)!"
	contains = list(/obj/item/restraints/legcuffs/bola/tactical,
					/obj/item/restraints/legcuffs/bola/tactical,
					/obj/item/restraints/legcuffs/bola/tactical,
					/obj/item/restraints/legcuffs/bola/tactical,
					/obj/item/restraints/legcuffs/bola/tactical,
					/obj/item/restraints/legcuffs/bola/tactical,)
	price = CARGO_CRATE_VALUE * 3
	crate_name = "Tactical Bola's crate"
	item = /obj/structure/closet/crate/donk



///Scarborough Arms
/datum/market_item/syndibase/armory
	category = "Outside Weaponry"

/datum/market_item/syndibase/armory/c20smg
	name = "Scarborough Arms C-20r SMG Crate"
	desc = "Scarborough best arms! One SMG - two spare magazines."
	contains = list(/obj/item/gun/ballistic/automatic/c20r,
					/obj/item/ammo_box/magazine/smgm45,
					/obj/item/ammo_box/magazine/smgm45)
	price = CARGO_CRATE_VALUE * 20
	crate_name = "C-20r SMG Crate"
	item = /obj/structure/closet/crate

/datum/market_item/syndibase/armory/smgammo
	name = "Scarborough Arms .45 SMG Magazines Crate"
	desc = "Scarborough starndart SMG ammo."
	contains = list(/obj/item/ammo_box/magazine/smgm45,
					/obj/item/ammo_box/magazine/smgm45,
					/obj/item/ammo_box/magazine/smgm45)
	price = CARGO_CRATE_VALUE * 5
	crate_name = ".45 SMG Magazines Crate"
	item = /obj/structure/closet/crate

/datum/market_item/syndibase/armory/iweapons
	name = "Incendiary Weapons Crate"
	desc = "Light them up with flamethrower and three plasma grenades."
	contains = list(/obj/item/flamethrower/full,
					/obj/item/tank/internals/plasma,
					/obj/item/tank/internals/plasma,
					/obj/item/tank/internals/plasma,
					/obj/item/grenade/chem_grenade/incendiary,
					/obj/item/grenade/chem_grenade/incendiary,
					/obj/item/grenade/chem_grenade/incendiary)
	price = CARGO_CRATE_VALUE * 10
	crate_name = "incendiary weapons crate"
	item = /obj/structure/closet/crate/secure/plasma



/datum/market_item/syndibase/engineering
	category = "GEC Stuff"

/datum/market_item/syndibase/engineering/fueltank
	name = "Fuel Tank Crate"
	desc = "Contains a welding fuel tank. Caution, highly flammable."
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	price = CARGO_CRATE_VALUE * 0.5
	crate_name = "fuel tank crate"
	item = /obj/structure/closet/crate/large

/datum/market_item/syndibase/engineering/tools
	name = "Syndicate Toolbox Crate"
	desc = "Any robust spaceman is never far from their trusty toolbox. Contains three combat toolboxes in the most robust crate."
	contains = list(/obj/item/storage/toolbox/syndicate,
					/obj/item/storage/toolbox/syndicate,
					/obj/item/storage/toolbox/syndicate)
	price = CARGO_CRATE_VALUE * 4
	crate_name = "Syndicate Toolbox crate"
	item = /obj/structure/closet/crate/donk

/datum/market_item/syndibase/engineering/engivend
	name = "EngiVend Supply Crate"
	desc = "The engineers are out of metal foam grenades? This should help."
	price = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/engivend)
	crate_name = "engineering supply crate"
	item = /obj/structure/closet/crate/donk

/datum/market_item/syndibase/engineering/power
	name = "Power Cell Crate"
	desc = "Looking for power overwhelming? Look no further. Contains three high-voltage power cells."
	contains = list(/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high)
	price = CARGO_CRATE_VALUE * 3
	crate_name = "electrical maintenance crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engineering/engiequipment
	name = "Engineering Gear Crate"
	desc = "Gear up with three toolbelts, high-visibility vests, welding goggles, hardhats, and two pairs of meson goggles!"
	contains = list(/obj/item/storage/belt/utility,
					/obj/item/storage/belt/utility,
					/obj/item/storage/belt/utility,
					/obj/item/clothing/suit/hazardvest,
					/obj/item/clothing/suit/hazardvest,
					/obj/item/clothing/suit/hazardvest,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/hardhat,
					/obj/item/clothing/head/hardhat,
					/obj/item/clothing/head/hardhat)
	price = CARGO_CRATE_VALUE * 4
	crate_name = "engineering gear crate"
	item = /obj/structure/closet/crate/donk

/datum/market_item/syndibase/engineering/shieldgen
	name = "Anti-breach Shield Projector Crate"
	desc = "Hull breaches again? Say no more with the Nanotrasen Anti-Breach Shield Projector! Uses forcefield technology to keep the air in, and the space out. Contains two shield projectors."
	price = CARGO_CRATE_VALUE * 10
	contains = list(/obj/machinery/shieldgen,
					/obj/machinery/shieldgen)
	crate_name = "anti-breach shield projector crate"
	item = /obj/structure/closet/crate

/datum/market_item/syndibase/engineering/ripley
	name = "APLU MK-I Crate"
	desc = "A do-it-yourself kit for building an ALPU MK-I \"Ripley\", designed for lifting and carrying heavy equipment, and other station tasks. Batteries not included."
	price = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/mecha_parts/chassis/ripley,
					/obj/item/mecha_parts/part/ripley_torso,
					/obj/item/mecha_parts/part/ripley_right_arm,
					/obj/item/mecha_parts/part/ripley_left_arm,
					/obj/item/mecha_parts/part/ripley_right_leg,
					/obj/item/mecha_parts/part/ripley_left_leg,
					/obj/item/stock_parts/capacitor,
					/obj/item/stock_parts/scanning_module,
					/obj/item/circuitboard/mecha/ripley/main,
					/obj/item/circuitboard/mecha/ripley/peripherals,
					/obj/item/mecha_parts/mecha_equipment/drill,
					/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp)
	crate_name= "APLU MK-I kit"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engineering/sologamermitts
	name = "Combat Insulated Gloves Single-Pack"
	desc = "The backbone of modern society. Barely ever ordered for actual engineering. Single Order. Extra fashion."
	price = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/clothing/gloves/combat)
	crate_name= "combat gloves crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engineering/inducers
	name = "NT-75 Electromagnetic Power Inducers Crate"
	desc = "No rechargers? No problem, with the NT-75 EPI, you can recharge any standard cell-based equipment anytime, anywhere. Contains two Inducers."
	price = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/inducer/sci {cell_type = /obj/item/stock_parts/cell/inducer_supply; opened = 0}, /obj/item/inducer/sci {cell_type = /obj/item/stock_parts/cell/inducer_supply; opened = 0}) //FALSE doesn't work in modified type paths apparently.
	crate_name = "inducer crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engineering/portable_scrubbers
	name = "Portable Scrubbers"
	desc = "A set of spare portable scrubbers. Perfect for when plasma 'accidentally' gets into the air supply."
	price = CARGO_CRATE_VALUE * 14
	contains = list(
		/obj/machinery/portable_atmospherics/scrubber,
		/obj/machinery/portable_atmospherics/scrubber
	)
	crate_name = "portable scrubber crate"
	item = /obj/structure/closet/crate/large

/datum/market_item/syndibase/engineering/space_heaters
	name = "Space heaters"
	desc = "A set of spare Space heaters. Perfect for when it`s cold outside."
	price = CARGO_CRATE_VALUE * 4
	contains = list(
		/obj/item/circuitboard/machine/space_heater,
		/obj/item/circuitboard/machine/space_heater
	)
	crate_name = "space heater crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engine
	category = "Engines"

/datum/market_item/syndibase/engine/shuttle_engine
	name = "Shuttle Engine Crate"
	desc = "Through advanced bluespace-shenanigans, our engineers have managed to fit an entire shuttle engine into one tiny little crate."
	price = CARGO_CRATE_VALUE * 20
	contains = list(/obj/structure/shuttle/engine/propulsion/burst/cargo)
	crate_name = "shuttle engine crate"
	item = /obj/structure/closet/crate/secure/engineering

/datum/market_item/syndibase/engine/emitter
	name = "Emitter Crate"
	desc = "Useful for powering forcefield generators while destroying locked crates and intruders alike. Contains two high-powered energy emitters."
	price = CARGO_CRATE_VALUE * 5
	contains = list(/obj/machinery/power/emitter,
					/obj/machinery/power/emitter)
	crate_name = "emitter crate"
	item = /obj/structure/closet/crate/secure/engineering

/datum/market_item/syndibase/engine/field_gen
	name = "Field Generator Crate"
	desc = "Typically the only thing standing between the station and a messy death. Powered by emitters. Contains two field generators."
	price = CARGO_CRATE_VALUE * 9
	contains = list(/obj/machinery/field/generator,
					/obj/machinery/field/generator)
	crate_name = "field generator crate"
	item = /obj/structure/closet/crate/secure/engineering

/datum/market_item/syndibase/engine/grounding_rods
	name = "Grounding Rod Crate"
	desc = "Four grounding rods guaranteed to keep any uppity tesla's lightning under control."
	price = CARGO_CRATE_VALUE * 9
	contains = list(/obj/machinery/power/grounding_rod,
					/obj/machinery/power/grounding_rod,
					/obj/machinery/power/grounding_rod,
					/obj/machinery/power/grounding_rod)
	crate_name = "grounding rod crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engine/PA
	name = "Particle Accelerator Crate"
	desc = "A supermassive black hole or hyper-powered teslaball are the perfect way to spice up any party! This \"My First Apocalypse\" kit contains everything you need to build your own Particle Accelerator! Ages 10 and up."
	price = CARGO_CRATE_VALUE * 15
	contains = list(/obj/structure/particle_accelerator/fuel_chamber,
					/obj/machinery/particle_accelerator/control_box,
					/obj/structure/particle_accelerator/particle_emitter/center,
					/obj/structure/particle_accelerator/particle_emitter/left,
					/obj/structure/particle_accelerator/particle_emitter/right,
					/obj/structure/particle_accelerator/power_box,
					/obj/structure/particle_accelerator/end_cap)
	crate_name = "particle accelerator crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engine/collector
	name = "Radiation Collector Crate"
	desc = "Contains three radiation collectors. Useful for collecting energy off nearby Supermatter Crystals, Singularities or Teslas!"
	price = CARGO_CRATE_VALUE * 12
	contains = list(/obj/machinery/power/rad_collector,
					/obj/machinery/power/rad_collector,
					/obj/machinery/power/rad_collector)
	crate_name = "collector crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engine/sing_gen
	name = "Singularity Generator Crate"
	desc = "The key to unlocking the power of Lord Singuloth. Particle Accelerator not included."
	price = CARGO_CRATE_VALUE * 15
	contains = list(/obj/machinery/the_singularitygen)
	crate_name = "singularity generator crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engine/solar
	name = "Solar Panel Crate"
	desc = "Go green with this DIY advanced solar array. Contains twenty one solar assemblies, a solar-control circuit board, and tracker. If you have any questions, please check out the enclosed instruction book."
	price = CARGO_CRATE_VALUE * 10
	contains  = list(/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/circuitboard/computer/solar_control,
					/obj/item/electronics/tracker,
					/obj/item/paper/guides/jobs/engi/solars)
	crate_name = "solar panel crate"
	item = /obj/structure/closet/crate/engineering/electrical

/datum/market_item/syndibase/engine/supermatter_shard
	name = "Supermatter Shard Crate"
	desc = "The power of the heavens condensed into a single crystal."
	price = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/choice_beacon/supermatter)
	crate_name = "supermatter shard crate"
	item = /obj/structure/closet/crate/secure/engineering

/datum/market_item/syndibase/engine/hypertorus_fusion_reactor
	name = "HFR Crate"
	desc = "The new and improved fusion reactor."
	price = CARGO_CRATE_VALUE * 50
	contains = list(/obj/item/hfr_box/corner,
					/obj/item/hfr_box/corner,
					/obj/item/hfr_box/corner,
					/obj/item/hfr_box/corner,
					/obj/item/hfr_box/body/fuel_input,
					/obj/item/hfr_box/body/moderator_input,
					/obj/item/hfr_box/body/waste_output,
					/obj/item/hfr_box/body/interface,
					/obj/item/hfr_box/core)
	crate_name = "HFR crate"
	item = /obj/structure/closet/crate/secure/engineering

/datum/market_item/syndibase/engine/fuel_rod_basic
	name = "Uranium-235 Fuel Rods Crate"
	desc = "Contains 5 Enriched Uranium Control Rods."
	price = CARGO_CRATE_VALUE * 25
	contains = list(/obj/item/fuel_rod,
					/obj/item/fuel_rod,
					/obj/item/fuel_rod,
					/obj/item/fuel_rod,
					/obj/item/fuel_rod)
	crate_name = "Uranium-235 Fuel Rods"
	item = /obj/structure/closet/crate/secure/radiation

/datum/market_item/syndibase/engine/fuel_rod_plutonium
	name = "Plutonium-239 Fuel Rods Crate"
	desc = "Contains 5 Plutonium-239 Control Rods."
	price = CARGO_CRATE_VALUE * 75
	contains = list(/obj/item/fuel_rod/plutonium,
					/obj/item/fuel_rod/plutonium,
					/obj/item/fuel_rod/plutonium,
					/obj/item/fuel_rod/plutonium,
					/obj/item/fuel_rod/plutonium)
	crate_name = "Plutonium-239 Fuel Rods"
	item = /obj/structure/closet/crate/secure/radiation

/datum/market_item/syndibase/engine/fuel_rod_bananium
	name = "Bananium Fuel Rods Crate"
	desc = "Contains 5 Bananium Control Rods."
	price = CARGO_CRATE_VALUE * 25
	contains = list(/obj/item/fuel_rod/material/bananium,
					/obj/item/fuel_rod/material/bananium,
					/obj/item/fuel_rod/material/bananium,
					/obj/item/fuel_rod/material/bananium,
					/obj/item/fuel_rod/material/bananium)
	crate_name = "Bananium Fuel Rods"
	item = /obj/structure/closet/crate/secure/radiation

/datum/market_item/syndibase/materials
	category = "Canisters"

/datum/market_item/syndibase/materials/bz
	name = "BZ Canister Crate"
	desc = "Contains a canister of BZ. Requires Toxins access to open."
	price = CARGO_CRATE_VALUE * 30
	contains = list(/obj/machinery/portable_atmospherics/canister/bz)
	crate_name = "BZ canister crate"
	item = /obj/structure/closet/crate/secure/science

/datum/market_item/syndibase/materials/carbon_dio
	name = "Carbon Dioxide Canister"
	desc = "Contains a canister of Carbon Dioxide."
	price = CARGO_CRATE_VALUE * 15
	contains = list(/obj/machinery/portable_atmospherics/canister/carbon_dioxide)
	crate_name = "carbon dioxide canister crate"
	item = /obj/structure/closet/crate/large

/datum/market_item/syndibase/materials/hightank
	name = "Large Water Tank Crate"
	desc = "Contains a high-capacity water tank. Useful for botany or other service jobs."
	price = CARGO_CRATE_VALUE * 6
	contains = list(/obj/structure/reagent_dispensers/watertank/high)
	crate_name = "high-capacity water tank crate"
	item = /obj/structure/closet/crate/large

/datum/market_item/syndibase/materials/nitrogen
	name = "Nitrogen Canister"
	desc = "Contains a canister of Nitrogen."
	price = CARGO_CRATE_VALUE * 10
	contains = list(/obj/machinery/portable_atmospherics/canister/nitrogen)
	crate_name = "nitrogen canister crate"
	item = /obj/structure/closet/crate/large

/datum/market_item/syndibase/materials/nitrous_oxide_canister
	name = "Nitrous Oxide Canister"
	desc = "Contains a canister of Nitrous Oxide. Requires Atmospherics access to open."
	price = CARGO_CRATE_VALUE * 15
	contains = list(/obj/machinery/portable_atmospherics/canister/nitrous_oxide)
	crate_name = "nitrous oxide canister crate"
	item = /obj/structure/closet/crate/secure

/datum/market_item/syndibase/materials/oxygen
	name = "Oxygen Canister"
	desc = "Contains a canister of Oxygen. Canned in Druidia."
	price = CARGO_CRATE_VALUE * 14
	contains = list(/obj/machinery/portable_atmospherics/canister/oxygen)
	crate_name = "oxygen canister crate"
	item = /obj/structure/closet/crate/large

/datum/market_item/syndibase/materials/watertank
	name = "Water Tank Crate"
	desc = "Contains a tank of dihydrogen monoxide... sounds dangerous."
	price = CARGO_CRATE_VALUE * 4
	contains = list(/obj/structure/reagent_dispensers/watertank)
	crate_name = "water tank crate"
	item = /obj/structure/closet/crate/large

/datum/market_item/syndibase/materials/water_vapor
	name = "Water Vapor Canister"
	desc = "Contains a canister of Water Vapor. I swear to god if you open this in the halls..."
	price = CARGO_CRATE_VALUE * 12
	contains = list(/obj/machinery/portable_atmospherics/canister/water_vapor)
	crate_name = "water vapor canister crate"
	item = /obj/structure/closet/crate/large


/datum/market_item/syndibase/vahlen_chem
	category = "Vahlen Pharmaceuticals"

/datum/market_item/syndibase/vahlen_chem/bloodpacks
	name = "Blood Pack Variety Crate"
	desc = "Contains eight different blood packs for reintroducing blood to patients."
	price = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/reagent_containers/blood,
					/obj/item/reagent_containers/blood,
					/obj/item/reagent_containers/blood/APlus,
					/obj/item/reagent_containers/blood/AMinus,
					/obj/item/reagent_containers/blood/BPlus,
					/obj/item/reagent_containers/blood/BMinus,
					/obj/item/reagent_containers/blood/OPlus,
					/obj/item/reagent_containers/blood/OMinus,
					/obj/item/reagent_containers/blood/lizard,
					/obj/item/reagent_containers/blood/ethereal)
	crate_name = "blood freezer"
	item = /obj/structure/closet/crate/freezer

/datum/market_item/syndibase/vahlen_chem/medipen_variety
	name = "Medipen Variety-Pak"
	desc = "Contains eight different medipens in three different varieties, to assist in quickly treating seriously injured patients."
	price = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/reagent_containers/autoinjector/medipen,
					/obj/item/reagent_containers/autoinjector/medipen,
					/obj/item/reagent_containers/autoinjector/medipen/ekit,
					/obj/item/reagent_containers/autoinjector/medipen/ekit,
					/obj/item/reagent_containers/autoinjector/medipen/ekit,
					/obj/item/reagent_containers/autoinjector/medipen/blood_loss,
					/obj/item/reagent_containers/autoinjector/medipen/blood_loss,
					/obj/item/reagent_containers/autoinjector/medipen/blood_loss,
	)
	crate_name = "medipen crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/firstaidadvanced_single
	name = "Advanced Treatment Kit Single-Pack"
	desc = "Contains one advanced first aid kit able to heal many advanced ailments."
	price = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/storage/firstaid/tactical/alt)
	crate_name = "ATC crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/hypospraykitvial_single
	name = "Hypospray Kit Single-Pack"
	desc = "Contains a hypospray kit containing a hypospray and empty vials for applying reagents to patients."
	price = CARGO_CRATE_VALUE
	contains = list(/obj/item/storage/firstaid/hypospray/vial)
	crate_name = "hypospray crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/hypovialkitbasic_single
	name = "Basic Hypospray Vial Kit Single-Pack"
	desc = "Contains a hypospray vial kit containing hypospray vials for most common situations."
	price = CARGO_CRATE_VALUE * 0.5
	contains = list(/obj/item/storage/firstaid/hypospray/basic)
	crate_name = "hypospray crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/hypovialkitbrute_single
	name = "Brute Hypospray Vial Kit Single-Pack"
	desc = "Contains a hypospray vial kit containing hypospray vials to treat most blunt trauma."
	price = CARGO_CRATE_VALUE * 0.5
	contains = list(/obj/item/storage/firstaid/hypospray/brute)
	crate_name = "hypospray crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/hypovialkitburn_single
	name = "Burn Hypospray Vial Kit Single-Pack"
	desc = "Contains a hypospray vial kit containing hypospray vials to treat most burns."
	price = CARGO_CRATE_VALUE * 0.5
	contains = list(/obj/item/storage/firstaid/hypospray/burn)
	crate_name = "hypospray crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/hypovialkittox_single
	name = "Toxin Hypospray Vial Kit Single-Pack"
	desc = "Contains a hypospray vial kit containing hypospray vials to cure toxic damage."
	price = CARGO_CRATE_VALUE * 0.5
	contains = list(/obj/item/storage/firstaid/hypospray/toxin)
	crate_name = "hypospray crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/hypovialkitoxy_single
	name = "Oxygen Hypospray Vial Kit Single-Pack"
	desc = "Contains a hypospray vial kit containing a vials to treat suffication."
	price = CARGO_CRATE_VALUE * 0.5
	contains = list(/obj/item/storage/firstaid/hypospray/oxygen)
	crate_name = "hypospray crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/hypovialkitadv_single
	name = "Advanced Hypospray Vial Kit Single-Pack"
	desc = "Contains an advanced hypospray vial kit containing vials for most situations."
	price = CARGO_CRATE_VALUE
	contains = list(/obj/item/storage/firstaid/hypospray/advanced)
	crate_name = "hypospray crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/medipen_twopak
	name = "Medipen Two-Pak"
	desc = "Contains one standard epinephrine medipen and one standard emergency first-aid kit medipen. For when you want to prepare for the worst."
	price = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/reagent_containers/autoinjector/medipen, /obj/item/reagent_containers/autoinjector/medipen/ekit)
	crate_name = "medipen crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/chemical
	name = "Chemical Starter Kit Crate"
	desc = "Contains thirteen different chemicals, for all the fun experiments you can make."
	price = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/reagent_containers/glass/bottle/hydrogen,
					/obj/item/reagent_containers/glass/bottle/carbon,
					/obj/item/reagent_containers/glass/bottle/nitrogen,
					/obj/item/reagent_containers/glass/bottle/oxygen,
					/obj/item/reagent_containers/glass/bottle/fluorine,
					/obj/item/reagent_containers/glass/bottle/phosphorus,
					/obj/item/reagent_containers/glass/bottle/silicon,
					/obj/item/reagent_containers/glass/bottle/chlorine,
					/obj/item/reagent_containers/glass/bottle/radium,
					/obj/item/reagent_containers/glass/bottle/sacid,
					/obj/item/reagent_containers/glass/bottle/ethanol,
					/obj/item/reagent_containers/glass/bottle/potassium,
					/obj/item/reagent_containers/glass/bottle/sugar,
					/obj/item/clothing/glasses/science,
					/obj/item/reagent_containers/dropper,
					/obj/item/storage/box/beakers)
	crate_name = "chemical crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/lemoline
	name = "Lemoline Import Crate"
	desc = "Contains a beaker of lemoline, used in the production of several powerful medicines."
	price = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/reagent_containers/glass/beaker/large/lemoline)
	crate_name = "imported chemical crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/iv_drip
	name = "IV Drip Crate"
	desc = "Contains a single IV drip for administering blood to patients."
	price = CARGO_CRATE_VALUE * 5
	contains = list(/obj/machinery/iv_drip)
	crate_name = "iv drip crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/vahlen_chem/surgery
	name = "Surgical Supplies Crate"
	desc = "Do you want to perform surgery, but don't have one of those fancy shmancy degrees? Just get started with this crate containing a medical duffelbag, Sterilizine spray and collapsible roller bed."
	price = CARGO_CRATE_VALUE * 15
	contains = list(/obj/item/storage/backpack/duffelbag/syndie/surgery,
					/obj/item/reagent_containers/medspray/sterilizine,
					/obj/item/roller)
	crate_name = "surgical supplies crate"
	item = /obj/structure/closet/crate/medical/vahlen

/datum/market_item/syndibase/cybersun_med
	category = "Cybersun Medical Solutions"

/datum/market_item/syndibase/cybersun_med/defibs
	name = "Combat defibrillator Crate"
	desc = "Contains combat defibrillator for bringing the recently deceased back to life."
	price = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/defibrillator/compact/combat/loaded)
	crate_name = "defibrillator crate"
	item = /obj/structure/closet/crate/medical/cybersun

/datum/market_item/syndibase/cybersun_med/salglucanister
	name = "Heavy-Duty Saline Canister"
	desc = "Contains a bulk supply of saline-glucose condensed into a single canister that should last several days, with a large pump to fill containers with. Direct injection of saline should be left to medical professionals as the pump is capable of overdosing patients. Requires medbay access to open."
	price = CARGO_CRATE_VALUE * 15
	contains = list(/obj/machinery/iv_drip/saline)
	crate_name = "saline canister crate"
	item = /obj/structure/closet/crate/medical/cybersun

/datum/market_item/syndibase/cybersun_med/vending
	name = "Medical Vending Crate"
	desc = "Contains one NanoMed Plus refill, one wall-mounted NanoMed refill, and one wall-mounted HypoMed refill."
	price = CARGO_CRATE_VALUE * 12
	contains = list(/obj/item/vending_refill/medical,
					/obj/item/vending_refill/wallmed,
					/obj/item/vending_refill/wallhypo)
	crate_name = "medical vending crate"
	item = /obj/structure/closet/crate/medical/cybersun

/datum/market_item/syndibase/cybersun_med/borg
	name = "Medical Borg Crate"
	desc = "A single-use teleporter designed to reinforce stationary agents with additional crew."
	price = CARGO_CRATE_VALUE * 20
	contains = list(/obj/item/antag_spawner/nuke_ops/borg_tele/medical)
	crate_name = "medical borg crate"
	item = /obj/structure/closet/crate/medical/cybersun

/datum/market_item/syndibase/cybersun_sci
	category = "Cybersun Virtual Solutions"

/datum/market_item/syndibase/cybersun_sci/borg
	name = "Engineering Borg Crate"
	desc = "A single-use teleporter designed to reinforce stationary agents with additional crew."
	price = CARGO_CRATE_VALUE * 30
	contains = list(/obj/item/antag_spawner/nuke_ops/borg_tele/saboteur)
	crate_name = "engineering borg crate"
	item = /obj/structure/closet/crate/science/cybersun

/datum/market_item/syndibase/cybersun_sci/shieldwalls
	name = "Shield Generator Crate"
	desc = "These high powered Shield Wall Generators are guaranteed to keep any unwanted lifeforms on the outside, where they belong! Contains four shield wall generators. Requires Teleporter access to open."
	price = CARGO_CRATE_VALUE * 10
	contains = list(/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen)
	crate_name = "shield generators crate"
	item = /obj/structure/closet/crate/science/cybersun

/datum/market_item/syndibase/cybersun_sci/plasma
	name = "Plasma Assembly Crate"
	desc = "Everything you need to burn something to the ground, this contains three plasma assembly sets. Each set contains a plasma tank, igniter, proximity sensor, and timer! Warranty void if exposed to high temperatures. Requires Toxins access to open."
	price = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/tank/internals/plasma,
					/obj/item/tank/internals/plasma,
					/obj/item/tank/internals/plasma,
					/obj/item/assembly/igniter,
					/obj/item/assembly/igniter,
					/obj/item/assembly/igniter,
					/obj/item/assembly/prox_sensor,
					/obj/item/assembly/prox_sensor,
					/obj/item/assembly/prox_sensor,
					/obj/item/assembly/timer,
					/obj/item/assembly/timer,
					/obj/item/assembly/timer)
	crate_name = "plasma assembly crate"
	item = /obj/structure/closet/crate/science/cybersun

/datum/market_item/syndibase/cybersun_sci/rped
	name = "RPED crate"
	desc = "Need to rebuild the ORM but science got annihialted after a bomb test?"
	price = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/storage/part_replacer/cargo)
	crate_name = "\improper RPED crate"
	item = /obj/structure/closet/crate/science/cybersun