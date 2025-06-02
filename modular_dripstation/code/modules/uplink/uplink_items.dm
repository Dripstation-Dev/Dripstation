////////////Syndicate/////////////
/datum/uplink_item
	var/restricted_corp_property = FALSE //If this uplink item is only available to manufacturer.
	var/list/restricted_corps = list(/datum/corporation/nanotrasen/isd) // Corporations that disallow this item.

/datum/uplink_item/suits
	category = "Armor & Space Suits"

/datum/uplink_item/suits/swat_suit
	name = "Syndicate SWAT Suit"
	desc = "This red and black Syndicate SWAT suit is less encumbering than Nanotrasen variant. \
			Nanotrasen crew members are trained to report red SWAT suit sightings, however."
	item = /obj/item/storage/box/syndie_kit/swat
	cost = 3
	exclude_modes = list(/datum/game_mode/infiltration) // yogs: infiltration

/datum/uplink_item/suits/hardened_armor
	name = "Gorlex Hardened Armor"
	desc = "This red and black gorlex armor set is hardened for armor piercing bullets shotout. \
			Nanotrasen crew members are trained to report red armor sightings, however."
	item = /obj/item/storage/box/syndie_kit/hardarmor
	cost = 4
	exclude_modes = list(/datum/game_mode/infiltration) // yogs: infiltration

/datum/uplink_item/suits/hardsuit
	name = "Blood-red RIG"
	desc = "The feared suit of a Syndicate nuclear operative. Features slightly better armoring and a built in jetpack \
			that runs off standard atmospheric tanks. Toggling the suit in and out of \
			combat mode will allow you all the mobility of a loose fitting uniform without sacrificing armoring. \
			Additionally the suit is collapsible, making it small enough to fit within a backpack. \
			Nanotrasen crew who spot these suits are known to panic."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred
	cost = 8
	manufacturer = /datum/corporation/gorlex
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/infiltration) //you can't buy it in nuke, because the elite hardsuit costs the same while being better // yogs: infiltration

/datum/uplink_item/suits/hardsuit/waffle
	name = "Waffle Co RIG"
	desc = "Not as famous as a standard blood-red Gorlex rig, this one provides some additional abilities. \
			Features some other sort of armoring and a built in magboots, that slightly faster than standard issued. \
			Toggling the suit in and out of	combat mode will allow you all the mobility of a loose fitting uniform \
			without sacrificing armoring. Additionally the suit is collapsible, making it small enough to fit within a backpack."
	manufacturer = /datum/corporation/traitor/waffleco
	item = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/waffle
	cost = 6

/datum/uplink_item/suits/hardsuit/winter
	name = "White Gorlex RIG"
	desc = "Not as famous as a standard blood-red Gorlex rig, this one provides some additional abilities. \
			Features additional termoregulation in combat mode, allowing operate in extremely cold regions of outer space. \
			Toggling the suit in and out of	combat mode will allow you all the mobility of a loose fitting uniform \
			without sacrificing armoring. Additionally the suit is collapsible, making it small enough to fit within a backpack."
	manufacturer = /datum/corporation/gorlex
	item = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/winter
	cost = 9
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/infiltration) //you can't buy it in nuke, because the elite hardsuit costs the same while being better // yogs: infiltration

/datum/uplink_item/suits/hardsuit/elite
	name = "Elite Syndicate RIG"
	desc = "An upgraded, elite version of the Syndicate RIG. It features fireproofing, and also \
			provides the user with superior armor and mobility compared to the blood-red RIG."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/elite
	cost = 8
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)
	exclude_modes = list()

/datum/uplink_item/suits/hardsuit/shielded
	name = "Shield RIG module"
	desc = "Simple module that features energy shielding system. \
			The shield can handle only one impact within a short duration \
			but will rapidly recharge while not under fire."
	item = /obj/item/module/shield/syndicate
	cost = 12
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)
	exclude_modes = list()

/datum/uplink_item/suits/infiltrator_bundle
	name = "Infiltrator Case"
	desc = "Developed by Roseus Galactic in conjunction with the Gorlex Marauders to produce a functional suit for urban operations, \
			this suit proves to be cheaper than your standard issue hardsuit, with none of the movement restrictions of the outdated spacesuits employed by the company. \
			Comes with a armor vest, helmet, sneaksuit, sneakboots, specialized combat gloves and a high-tech balaclava. The case is also rather useful as a storage container."
	item = /obj/item/storage/toolbox/infiltrator
	cost = 6
	limited_stock = 1 //you only get one so you don't end up with too many gun cases
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)

// Stealthy Weapons

/datum/uplink_item/stealthy_weapons/energy_knuclers
	name = "Energy Knuclers"
	desc = "A pair of gloves that are fireproof, however unlike the regular clack gloves this one uses energy projected knuclers \
			to help the wearer beat all the shit out of people."
	item = /obj/item/clothing/gloves/combat/energy_knuclers
	cost = 8
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)
	surplus = 0

// Dangerous Weapons
/datum/uplink_item/dangerous/rapid
	cost = 5	//rapid gloves don`t cost like 8 wtf

/datum/uplink_item/dangerous/errata
	name = "Nanoforged Katana"
	desc = "A tailor-made blade forged from unknown ninja clan within the Syndicate. \
			Merely weilding this weapon grants incredible agility."
	item = /obj/item/storage/belt/errata
	cost = 12
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops, /datum/game_mode/infiltration) // yogs: infiltration

/datum/uplink_item/dangerous/murasame
	name = "Cursed Katana"
	desc = "Edgy looking katana that has a posibility to kill humans in one blow. Wield with caution -\
			blade is coated with poison - one pierce of the skin will end your life, agent."
	item = /obj/item/katana/murasame
	cost = 20
	surplus = 0
	player_minimum = 25
	exclude_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops, /datum/game_mode/infiltration) // yogs: infiltration

/datum/uplink_item/dangerous/machinegun
	name = "L6 Squad Automatic Weapon"
	desc = "A fully-loaded Militech Armoury belt-fed machine gun. \
			This deadly weapon has a massive 100-round magazine of light 5.56x45mm ammunition."
	item = /obj/item/gun/ballistic/automatic/l6_saw
	cost = 16
	surplus = 0
	include_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/dangerous/heavymachinegun
	name = "L4 General Purpose Machine Gun"
	desc = "A fully-loaded Militech Armoury belt-fed machine gun. \
			This deadly weapon has a massive 50-round magazine of devastating 7.12x82mm ammunition."
	item = /obj/item/gun/ballistic/automatic/l6_saw/m60
	cost = 20
	surplus = 0
	include_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/ammo/machinegun/basic
	desc = "A 50-round magazine of 7.12x82mm ammunition for use with the L4 GPMG. \
			By the time you need to use this, you'll already be standing on a pile of corpses."

/datum/uplink_item/ammo/machinegun/ap
	desc = "A 50-round magazine of 7.12x82mm ammunition for use in the L4 GPMG; equipped with special properties \
			to puncture even the most durable armor."

/datum/uplink_item/ammo/machinegun/hollow
	desc = "A 50-round magazine of 7.12x82mm ammunition for use in the L4 GPMG; equipped with hollow-point tips to help \
			with the unarmored masses of crew."

/datum/uplink_item/ammo/machinegun/inc
	desc = "A 50-round magazine of 7.12x82mm ammunition for use in the L4 GPMG; tipped with a special flammable \
			mixture that'll ignite anyone struck by the bullet. Some men just want to watch the world burn."

/datum/uplink_item/ammo/machinegun556
	cost = 4
	surplus = 0
	include_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/ammo/machinegun556/basic
	name = "5.56x45mm Box Magazine"
	desc = "A 100-round magazine of 5.56x45mm ammunition for use with the L6 SAW. \
			By the time you need to use this, you'll already be standing on a pile of corpses."
	item = /obj/item/ammo_box/magazine/mm556x45_100

/datum/uplink_item/ammo/machinegun556/ap
	name = "5.56x45mm (Armor-Piercing) Box Magazine"
	desc = "A 100-round magazine of 5.56x45mm ammunition for use in the L6 SAW; equipped with special properties \
			to puncture regular grade bulletproof armor."
	item = /obj/item/ammo_box/magazine/mm556x45_100/ap

/datum/uplink_item/ammo/machinegun556/ssaap
	name = "5.56x45mm (TGov SSA AP) Box Magazine"
	desc = "A 100-round magazine of 5.56x45mm ammunition for use in the L6 SAW; equipped with special properties \
			to puncture special grade bulletproof armor."
	item = /obj/item/ammo_box/magazine/mm556x45_100/ssaap
	cost = 6

/datum/uplink_item/ammo/machinegun556/inc
	name = "5.56x45mm (Incendiary) Box Magazine"
	desc = "A 100-round magazine of 5.56x45mm ammunition for use in the L6 SAW; tipped with a special flammable \
			mixture that'll ignite anyone struck by the bullet. Some men just want to watch the world burn."
	item = /obj/item/ammo_box/magazine/mm556x45_100/inc

/datum/uplink_item/role_restricted/hardsuit
	name = "GEC Blood-Red RIG"
	desc = "Hardsuit of Global Engineering Consortium, represented in Syndicate as a minor force. Freedom for Engineers!"
	item = /obj/item/clothing/suit/space/hardsuit/syndi/engineering/syndicate
	cost = 4
	restricted_roles = list("Station Engineer","Atmospheric Technician","Network Admin","Chief Engineer")

/datum/uplink_item/role_restricted/hardsuit/winter
	name = "White GEC RIG"
	desc = "Cold-proof hardsuit of Global Engineering Consortium, represented in Syndicate as a minor force. Unite the Engineers!"
	item = /obj/item/clothing/suit/space/hardsuit/syndi/engineering/syndicate/winter
	cost = 5

/datum/uplink_item/race_restricted/digirig
	name = "Degitagrade Blood-Red RIG"
	desc = "Recently Gorlex started to employ degitagrade specimen in their ranks. This suit constructed for this kind of agents within Syndicate."
	cost = 8
	manufacturer = /datum/corporation/gorlex
	item = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/unathi
	restricted_species = list("lizard", "draconid", "polysmorph")

/datum/uplink_item/race_restricted/humantofelinid
	name = "Felinid Mutation Toxin"
	desc = "Oh, so... You really want this?"
	cost = 2
	manufacturer = /datum/corporation/traitor/vahlen
	item = /obj/item/reagent_containers/syringe/felinid
	restricted_species = list("human")

/datum/uplink_item/race_restricted/wirecrawl
	name = "Modified yellow slime extract"
	desc = "An experimental yellow slime extract that when absorbed by an jellypeople, grants control over electrical powers."
	cost = 8
	item = /obj/item/book/granter/action/wirecrawl
	restricted_species = list("slime", "jelly", "lum")

/obj/item/reagent_containers/syringe/felinid
	name = "syringe (felinid)"
	desc = "Contains felinid mutation toxin."
	list_reagents = list(/datum/reagent/mutationtoxin/felinid = 15)

/datum/uplink_item/corp_restricted
	category = "Corporation restricted"
	restricted_corp_property = TRUE
	surplus = 0

/datum/uplink_item/corp_restricted/blood_magic
	name = "S`Sarsĥs holy rites"
	desc = "Rites about S`Sarsĥs written with real unathi blood. On human leather. You need to have ability to read on unathi language to understand the contents."
	cost = 10
	item = /obj/item/book/granter/action/spell/blood_magic
	manufacturer = /datum/corporation/independent/traitor
	restricted_corp_property = TRUE

/datum/uplink_item/corp_restricted/gorlex_microbomb
	name = "Microbomb Implant"
	desc = "An implant injected into the body, and later activated either manually or automatically upon death. \
			This will permanently destroy your body, however."
	item = /obj/item/storage/box/syndie_kit/imp_microbomb
	limited_stock = 1 // Might be too annoying if traitor has mulitple.
	cost = 2
	manufacturer = /datum/corporation/gorlex
	include_modes = list(/datum/game_mode/traitor)

/datum/uplink_item/corp_restricted/waffle_gloves
	name = "Waffle Tackler Gloves"
	desc = "Faimous rocket gloves, allows user to accelerate and reach high speed in seconds."
	item = /obj/item/clothing/gloves/tackler/combat/waffle
	cost = 3
	manufacturer = /datum/corporation/traitor/waffleco

/datum/uplink_item/corp_restricted/adv_pinpointer
	name = "Advanced Pinpointer"
	desc = "A pinpointer that tracks any specified coordinates, DNA string, high value item or the nuclear authentication disk."
	item = /obj/item/pinpointer/adv
	cost = 4
	manufacturer = /datum/corporation/traitor/cybersun

////////////Nanotrasen Production/////////////
/datum/uplink_item/corp_restricted/mini_egun
	name = "NT SpecOps Department miniature energy gun"
	desc = "Visually standart energy gun. Has three modes, overcharged combat energy projectiles and specops battery onboard."
	item = /obj/item/gun/energy/e_gun/mini/specops
	cost = 4
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/iongun
	name = "NT SpecOps Department Ion pistol"
	desc = "The NT-I3 Prototype Ion Projector is a compact ion pistol, built for personal defense. \
	The serial number of this gun has been erased."
	item = /obj/item/gun/energy/ionrifle/pistol/stealth
	cost = 3
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/nt_pistol
	name = "NB-2 'Ancile'"
	desc = "Nanotrasen`s easily concealable servise pistol that fires 9mm rounds."
	item = /obj/item/gun/ballistic/automatic/pistol/glock17/ancile
	cost = 3
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/nt_ammo
	name = "9mm pmag"
	desc = "A 9mm pmag. This magazine contain twenty one 9mm rounds each; usable with any 9mm pistol sistem."
	item = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	cost = 1
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/nt_revolver
	name = "Mateba Revolver"
	desc = "A brutally simple retro, high-powered autorevolver that fires .44 Magnum rounds and has 6 chambers."
	item = /obj/item/gun/ballistic/revolver/mateba
	cost = 10
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/nt_revolverammo
	name = ".44 Speed Loader"
	desc = "A .44 speed loader. This speed loader contain six .44 rounds each; usable with the Mateba revolver."
	item = /obj/item/ammo_box/m44
	cost = 1
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/nt_hardlightbow
	name = "Hardlight Bow"
	desc = "A modern bow that can fabricate hardlight arrows, designed for silent takedowns of targets."
	item = /obj/item/gun/ballistic/bow/energy/ntia
	cost = 6
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/obj/item/gun/ballistic/bow/energy/ntia
	mag_type = /obj/item/ammo_box/magazine/internal/bow/energy/ntia
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 5
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	fire_sound = null
	draw_sound = null
	can_fold = TRUE

/obj/item/ammo_box/magazine/internal/bow/energy/ntia
	selectable_types = list(/obj/item/ammo_casing/reusable/arrow/energy, /obj/item/ammo_casing/reusable/arrow/energy/disabler, /obj/item/ammo_casing/reusable/arrow/energy/xray)

/datum/uplink_item/corp_restricted/canesword
	name = "Cane blade"
	desc = "Stored in sheath that looks like a cane. Elegant, but not so stealth and effective. It`s capable of hurting unarmored targets badly."
	item = /obj/item/storage/belt/sabre/cane
	cost = 6
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/ntx4
	name = "Composition NTX-4"
	desc = "A variety of plastic explosive with a stronger explosive charge. It is both safer to use and is capable of breaching even the most secure areas."
	item = /obj/item/grenade/plastic/x4
	cost = 3
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/eknife
	name = "Energy Knife"
	desc = "A knife made of energy that looks and functions as a pen when off."
	item = /obj/item/pen/red/edagger/nt
	cost = 2
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/militechmantisblade
	name = "H.E.P.H.A.E.S.T.U.S. Mantis Blades"
	desc = "One H.E.P.H.A.E.S.T.U.S. Mantis blade implant able to be retracted inside your body at will for easy storage and concealing. Two blades can be used at once."
	item = /obj/item/autosurgeon/nt_mantis/stealth
	cost = 5
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/obj/item/autosurgeon/nt_mantis/stealth
	starting_organ = /obj/item/organ/cyberimp/arm/nt_mantis/stealth

/obj/item/organ/cyberimp/arm/nt_mantis/stealth
	desc = "Stealth mosification of H.E.P.H.A.E.S.T.U.S. retractable arm-blade implant. Wielding two will let you double-attack."
	syndicate_implant = TRUE

/datum/uplink_item/corp_restricted/combatglovesplus
	name = "Combat Gloves Plus"
	desc = "A pair of gloves that are fireproof and shock resistant, however unlike the regular Combat Gloves this one uses nanotechnology \
			to learn the abilities of krav maga to the wearer."
	item = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	cost = 5
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/ntradio
	name = "Internal Nanotrasen Radio Implant"
	desc = "An implant injected into the body, allowing the use of an internal Centcom radio. \
			Used just like a regular headset, but can be disabled to use external headsets normally and to avoid detection."
	item = /obj/item/storage/box/syndie_kit/imp_ntisa_radio
	cost = 4
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/obj/item/storage/box/syndie_kit/imp_ntisa_radio
	real_name = "implant box"
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_ntisa_radio/PopulateContents()
	new /obj/item/implanter/radio/ntisa(src)

/obj/item/implanter/radio/ntisa
	name = "implanter"
	imp_type = /obj/item/implant/radio/ntisa

/obj/item/implant/radio/ntisa
	desc = "Are you there God? It's me, Internal Security Agent."
	radio_key = /obj/item/encryptionkey/headset_cent
	subspace_transmission = TRUE

/datum/uplink_item/corp_restricted/reviver
	name = "Reviver Implant"
	desc = "This implant will attempt to revive and heal you if you are critically injured. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/reviver/stealth
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()
	cost = 8

/obj/item/autosurgeon/reviver/stealth
	starting_organ = /obj/item/organ/cyberimp/chest/reviver/stealth

/obj/item/organ/cyberimp/chest/reviver/stealth
	syndicate_implant = TRUE

/datum/uplink_item/corp_restricted/nt_minibomb
	name = "Nanotrasen Minibomb"
	desc = "The minibomb is a grenade with a five-second fuse. Upon detonation, it will create a small hull breach \
			in addition to dealing high amounts of damage to nearby personnel."
	item = /obj/item/grenade/syndieminibomb/nt
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()
	cost = 6

/obj/item/grenade/syndieminibomb/nt
	name = "\improper nanotrasen minibomb"
	desc = "A nanotrasen manufactured explosive used to sow destruction and chaos."
	icon = 'modular_dripstation/icons/obj/weapons/grenade.dmi'
	icon_state = "nanotrasen"

/datum/uplink_item/corp_restricted/teargas
	name = "Teargas Grenade"
	desc = "A grenade containing teargas."
	item = /obj/item/grenade/chem_grenade/teargas
	cost = 1
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/variag
	name = "Varyag Militech Forsing Tool"
	desc = "Smash stuff. Pry open doors. Kill enemies."
	item = /obj/item/melee/emergency_forcing_tool/varyag
	cost = 6
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/nt_bodybag
	name = "Nanotrasen Bluespace Transport Bag"
	desc = "A folded bluespace body bag designed for the storage and transportation."
	item = /obj/item/bodybag/bluespace
	cost = 1
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/oldspacesuit
	name = "Old Style Spacesuit"
	desc = "A box of modern spacesuit disguised into \"Old Style\"."
	item = /obj/item/storage/box/full_spacesuit_set
	cost = 1
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/obj/item/storage/box/full_spacesuit_set
	name = "Spacesuit Box"
	desc = "It has no logo on it."

/obj/item/storage/box/full_spacesuit_set/PopulateContents()
	new /obj/item/clothing/suit/space(src)
	new /obj/item/clothing/head/helmet/space(src)

/datum/uplink_item/corp_restricted/mercrig
	name = "Merk RIG"
	desc = "The feared suit of a free mercenary unit. Toggling the suit in and out of \
			combat mode will allow you all the mobility of a loose fitting uniform without sacrificing armoring. \
			Additionally the suit is collapsible, making it small enough to fit within a backpack."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/merk
	cost = 8
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/suits/nt_hardened_armor
	name = "NT Hardened Armor"
	desc = "This white and black Nanotrasen armor set is hardened for armor piercing bullets shotout. \
			Nanotrasen crew members are trained to report red armor sightings, however."
	item = /obj/item/storage/box/hardarmor
	cost = 4

/datum/uplink_item/corp_restricted/ntstamp
	category = "(Pointless) Badassery"
	name = "CentCom Official Stamp"
	desc = "To let them know you're the real deal."
	item = /obj/item/stamp/cent
	cost = 1
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()

/datum/uplink_item/corp_restricted/ntposters
	category = "(Pointless) Badassery"
	name = "Box of Posters"
	desc = "A box of Nanotrasen-approved posters to boost crew morale."
	item = /obj/item/storage/box/official_posters
	cost = 1
	manufacturer = /datum/corporation/nanotrasen/isd
	restricted_corps = list()
/////////////////////////////////////////////////
///Nanotrasen Agents can use this syndi stuff////
/datum/uplink_item/dangerous/throwingweapons
	restricted_corps = list()

/datum/uplink_item/dangerous/sword
	restricted_corps = list()

/datum/uplink_item/dangerous/backstab
	restricted_corps = list()

/datum/uplink_item/dangerous/bostaff
	restricted_corps = list()

/datum/uplink_item/dangerous/powerfist
	restricted_corps = list()

/datum/uplink_item/dangerous/watergun
	restricted_corps = list()

/datum/uplink_item/stealthy_weapons/cqc
	restricted_corps = list()

/datum/uplink_item/stealthy_weapons/dart_pistol
	restricted_corps = list()

/datum/uplink_item/stealthy_weapons/derringer
	restricted_corps = list()

/datum/uplink_item/stealthy_weapons/origami_kit
	restricted_corps = list()

/datum/uplink_item/stealthy_weapons/traitor_chem_bottle
	restricted_corps = list()

/datum/uplink_item/stealthy_weapons/sleepy_pen
	restricted_corps = list()

/datum/uplink_item/stealthy_weapons/suppressor
	restricted_corps = list()

/datum/uplink_item/explosives/c4
	restricted_corps = list()

/datum/uplink_item/explosives/detomatix
	restricted_corps = list()

/datum/uplink_item/explosives/door_charge
	restricted_corps = list()

/datum/uplink_item/explosives/trap_disk
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/agent_card
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/shadowcloak
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/syndireverse
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/chameleon
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/chameleon_proj
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/syndigaloshes
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/emplight
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/mulligan
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/smugglersatchel
	restricted_corps = list()

/datum/uplink_item/stealthy_tools/armorpolish
	restricted_corps = list()

/datum/uplink_item/device_tools/cutouts
	restricted_corps = list()

/datum/uplink_item/device_tools/binary
	restricted_corps = list()

/datum/uplink_item/device_tools/briefcase_launchpad
	restricted_corps = list()

/datum/uplink_item/device_tools/camera_bug
	restricted_corps = list()

/datum/uplink_item/device_tools/frame
	restricted_corps = list()

/datum/uplink_item/device_tools/failsafe
	restricted_corps = list()

/datum/uplink_item/device_tools/tactical_gloves
	restricted_corps = list()

/datum/uplink_item/device_tools/stimpack
	restricted_corps = list()

/datum/uplink_item/device_tools/thermal
	restricted_corps = list()

/datum/uplink_item/device_tools/holo_sight
	restricted_corps = list()

/datum/uplink_item/device_tools/vert_grip
	restricted_corps = list()

/datum/uplink_item/device_tools/laser_sight
	restricted_corps = list()

/datum/uplink_item/device_tools/mechpilotguide
	restricted_corps = list()

/datum/uplink_item/implants/antistun
	restricted_corps = list()

/datum/uplink_item/implants/freedom
	restricted_corps = list()

/datum/uplink_item/implants/stealthimplant
	restricted_corps = list()

/datum/uplink_item/implants/storage
	restricted_corps = list()
/////////////////////////////////////////////////


/datum/uplink_item/implants/mantis
	manufacturer = /datum/corporation/gorlex

/datum/uplink_item/dangerous/revolver
	manufacturer = /datum/corporation/traitor/waffleco

/datum/uplink_item/device_tools/loic_remote
	manufacturer = /datum/corporation/self

/datum/uplink_item/device_tools/tacklers
	name = "Combat Tackler Gloves"
	desc = "Combat gloves, that are good at performing tackle takedowns as well as absorbing electrical shocks."
	item = /obj/item/clothing/gloves/tackler/combat
	cost = 2

/datum/uplink_item/device_tools/morphbelt
	name = "Morphing combat belt"
	desc = "Military grade belt with some tacticool advantage."
	item = /obj/item/storage/belt/military/webbing/syndicate/morphing
	cost = 1
	include_modes = list(/datum/game_mode/nuclear)

/datum/uplink_item/device_tools/tactical_gloves
	exclude_modes = list(/datum/game_mode/nuclear) //you can't buy it in nuke, because they have another pair that costs the same while being better

/datum/uplink_item/device_tools/tactical_gloves/combat
	include_modes = list(/datum/game_mode/nuclear, /datum/game_mode/nuclear/clown_ops)
	exclude_modes = list()
	item = /obj/item/clothing/gloves/fingerless/bigboss/combat

/datum/uplink_item/infiltration/access_kit
	cost = 4

/datum/uplink_item/infiltration/gloves
	name = "Tackler Chameleon Gloves"
	desc = "An infiltration tackler gloves, capable of changing it's appearance instantly. Will be helpfull in cases when you need to run."
	item = /obj/item/clothing/gloves/tackler/combat/infiltrator/chameleon
	cost = 2

/datum/uplink_item/role_restricted/velvetfu
	name = "Velvet-Fu VHS tape"
	desc = "Velvet-Fu is a knock-off Hollywood Martial Art.\
			Has a notice, 'Removes the ability to Grab/Push'.\
			Has been modified to beam its knowledge directly into your eyes, removing the need for a TV."
	item = /obj/item/book/granter/martial/velvetfu
	cost = 7
	restricted_roles = list("Janitor")
	manufacturer = /datum/corporation/traitor/cybersun

/datum/uplink_item/dangerous/pistol
	name = "WSP-10M Pistol"
	manufacturer = /datum/corporation/traitor/waffleco

/datum/uplink_item/ammo/pistol
	desc = "A box that contains two additional 10-round 10mm magazines; compatible with the WSP-10M Pistol."

/datum/uplink_item/ammo/pistol/random
	name = "Random 10mm Handgun Magazines"
	desc = "A box that contains four random 10-round 10mm magazines at a discount; compatible with the WSP-10M Pistol."
	item = /obj/item/storage/box/syndie_kit/pistolammo/random
	cost = 2 // same mentality as the 357. You can get 4 mags for 2-4 TC, so giving in to the random chance give you a deal

/datum/uplink_item/ammo/pistol/cs
	desc = "A box that contains two additional 10-round 10mm magazines; compatible with the WSP-10M Pistol. \
			These rounds will leave no casings behind when fired."

/datum/uplink_item/ammo/pistol/ap
	desc = "An additional 10-round 10mm magazine; compatible with the WSP-10M Pistol. \
			These rounds are less effective at injuring the target but penetrate protective gear."

/datum/uplink_item/ammo/pistol/hp
	desc = "An additional 10-round 10mm magazine; compatible with the WSP-10M Pistol. \
			These rounds are more damaging but ineffective against armour."

/datum/uplink_item/ammo/pistol/sleepy
	desc = "A box that contains 2 additional 10-round 10mm magazines; compatible with the WSP-10M Pistol. \
			These rounds will deliver small doses of tranqulizers on hit, knocking the target out after a few successive hits."

/datum/uplink_item/ammo/pistol/fire
	desc = "An additional 10-round 10mm magazine; compatible with the WSP-10M Pistol. \
			Loaded with incendiary rounds which inflict reduced damage, but ignite the target."

/datum/uplink_item/ammo/pistol/emp
	desc = "An additional 10-round 10mm magazine; compatible with the WSP-10M pistol. \
			Loaded with bullets which release micro-electromagnetic pulses on hit, disrupting electronics on the target hit."

///////NT///////////
/datum/uplink_item/nt

/datum/uplink_item/nt/hardsuit/standard
	name = "ERT RIG"
	desc = "Trully NT Marine."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert
	cost = 5

/datum/uplink_item/nt/hardsuit/cmd
	name = "ERT Commander RIG"
	desc = "Show them who's boss."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com
	cost = 5
	required_ert_uplink = list(NT_ERT_COMMANDER)

/datum/uplink_item/nt/hardsuit/sec
	name = "ERT Security RIG"
	desc = "Make them fear the long arm of law."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/sec
	cost = 5
	required_ert_uplink = list(NT_ERT_TROOPER)

/datum/uplink_item/nt/hardsuit/engi
	name = "ERT Engineering RIG"
	desc = "HOW DID YOU DELAMINATE THE SM 5 MINUTES IN?"
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/engi
	cost = 5
	required_ert_uplink = list(NT_ERT_ENGINEER)

/datum/uplink_item/nt/hardsuit/med
	name = "ERT Medical RIG"
	desc = "Dying is illegal."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/med
	cost = 5
	required_ert_uplink = list(NT_ERT_MEDIC)

/datum/uplink_item/nt/hardsuit/ds
	name = "SWAT MKV Deathsquad"
	desc = "A prototype rig. Black ops here."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/deathsquad
	cost = 80
	cant_discount = TRUE

/datum/uplink_item/nt/hardsuit/ds
	name = "SWAT MKV Deathsquad"
	desc = "A prototype hardsuit. Fully bulletproof and incredibly robust."
	item = /obj/item/clothing/suit/space/hardsuit/deathsquad/mk5
	cost = 100
	cant_discount = TRUE

/datum/uplink_item/nt/hardsuit/dsshield
	name = "BlackOps shield module"
	desc = "A prototype RIG module that provides energy shielding protection. \
			Slowly recharges, but incredibly robust."
	item = /obj/item/module/shield/nt
	cost = 30
	cant_discount = TRUE

/datum/uplink_item/nt/gear/combatglovesplus
	name = "Combat Gloves Plus"
	desc = "A pair of gloves that are fireproof and shock resistant, however unlike the regular Combat Gloves this one uses nanotechnology \
			to learn the abilities of krav maga to the wearer."
	item = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	cost = 5

/datum/uplink_item/nt/energy_weps
	category = "Energy Weapons"

/datum/uplink_item/nt/energy_weps/egun
	name = "Energy Gun"
	desc = "A standard energy gun with disable and laser modes equipped."
	item = /obj/item/gun/energy/e_gun
	cost = 3
	limited_stock = 2 //One for you and a friend, no infinite guns though
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/energy_weps/tac_egun
	name = "Tactical Energy Gun"
	desc = "A military-grade augmented energy gun, fitted with a tasing mode."
	item = /obj/item/gun/energy/e_gun/stun
	cost = 20
	limited_stock = 1
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/energy_weps/mini_egun
	name = "Miniature Energy Gun"
	desc = "A smaller model of the standard energy gun that holds much less charge."
	item = /obj/item/gun/energy/e_gun/mini
	cost = 1
	limited_stock = 1

/datum/uplink_item/nt/energy_weps/specops_mini_egun
	name = "Spec Ops Miniature E-Gun"
	desc = "Visually standart energy gun. Has three modes, overcharged combat energy projectiles and specops battery onboard."
	item = /obj/item/gun/energy/e_gun/mini/specops
	cost = 4

/datum/uplink_item/nt/energy_weps/iongun
	name = "Ion pistol"
	desc = "The NT-I3 Prototype Ion Projector is a compact ion pistol, built for personal defense."
	item = /obj/item/gun/energy/ionrifle/pistol
	cost = 3

/datum/uplink_item/nt/energy_weps/laserrifle
	name = "Laser Rifle"
	desc = "An abnormality in energy weaponry. Chambers a laser magazine which can be recharged externally."
	item = /obj/item/gun/ballistic/automatic/laser
	cost = 8
	limited_stock = 1
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/energy_weps/m1911
	name = "M1911-P"
	desc = "A compact pulse core in a classic handgun frame for Nanotrasen officers."
	item = /obj/item/gun/energy/pulse/pistol/m1911
	cost = 35
	required_ert_uplink = list(NT_ERT_COMMANDER)

/datum/uplink_item/nt/energy_weps/pulsecarbine
	name = "Pulse Carbine"
	desc = "A severely lethal energy carbine that fires additionaly fires pulse rounds. Must be recharged instead of reloaded."
	item = /obj/item/gun/energy/pulse/carbine
	cost = 45
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_COMMANDER) //Medics and engies can buy pulse pistols

/datum/uplink_item/nt/energy_weps/pulsepistol
	name = "Pulse Pistol"
	desc = "A severely lethal but compact version of the Pulse Carbine design. Holds significantly less charge. \
			Must be recharged instead of reloaded."
	item = /obj/item/gun/energy/pulse/pistol
	cost = 35

/datum/uplink_item/nt/energy_weps/hardlightbow
	name = "HL-P1 Multipurpose Combat Bow"
	desc = "An expensive hardlight bow designed by Nanotrasen and often sold to the SIC's espionage branch. Capable of firing disabler, energy, pulse, and taser bolts."
	item = /obj/item/gun/ballistic/bow/energy/ert
	cost = 75 //Doesn't need to be recharged but also fires once every now and then instead of being spammable

/datum/uplink_item/nt/ball_weps
	category = "Ballistic Weapons"
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/ball_weps/boarder
	name = "NT-ARG 'Boarder' Rifle"
	desc = "A heavy-damage 3-round burst assault rifle. Chambered in 5.56mm."
	item = /obj/item/gun/ballistic/automatic/ar
	cost = 18
	limited_stock = 1

/datum/uplink_item/nt/ball_weps/lwtdmr
	name = "LWT-650 DMR"
	desc = "A designated marksman rifle that deals hefty damage. Chambered in .308."
	item = /obj/item/gun/ballistic/automatic/lwt650
	cost = 10
	limited_stock = 1

/datum/uplink_item/nt/ball_weps/saber
	name = "NT-SABR 'Saber' SMG"
	desc = "A low-damage 3-round burst SMG. Chambered in 9mm."
	item = /obj/item/gun/ballistic/automatic/proto/unrestricted
	cost = 7

/datum/uplink_item/nt/ball_weps/wtcarbine
	name = "WT-550 Automatic Carbine"
	desc = "A classic 2-round burst carbine with a number of ammo options. Chambered in 4.6x30mm."
	item = /obj/item/gun/ballistic/automatic/wt550
	cost = 5
	required_ert_uplink = list(NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/ball_weps/m1911
	name = "M1911"
	desc = "A classic .45 sidearm with a small magazine capacity."
	item = /obj/item/gun/ballistic/automatic/pistol/m1911
	cost = 3
	required_ert_uplink = list()

/datum/uplink_item/nt/ammo
	category = "Ammunition"

/datum/uplink_item/nt/ammo/recharger
	name = "Weapon Recharger"
	desc = "Standard issue energy weapon recharger. Must be anchored in an APC-powered area."
	item = /obj/machinery/recharger
	cost = 2

/datum/uplink_item/nt/ammo/powerpack
	name = "Power Pack"
	desc = "An additional 20-round laser magazine; suitable for use with the laser rifle."
	item = /obj/item/ammo_box/magazine/recharge
	cost = 5

/datum/uplink_item/nt/ammo/arg
	name = "5.56mm Magazine"
	desc = "An additional 30-round 5.56mm magazine; suitable for use with the NT-ARG."
	item = /obj/item/ammo_box/magazine/r556
	cost = 4

/datum/uplink_item/nt/ammo/arg/ap
	name = "5.56 AP Magazine"
	desc = "An alternative 30-round 5.56 magazine loaded with armor-piercing rounds; suitable for use with the NT-ARG."
	item = /obj/item/ammo_box/magazine/r556/ap
	cost = 6

/datum/uplink_item/nt/ammo/arg/inc
	name = "5.56 Incendiary Magazine"
	desc = "An alternative 30-round 5.56 magazine loaded with incendiary rounds; suitable for use with the NT-ARG."
	item = /obj/item/ammo_box/magazine/r556/inc

/datum/uplink_item/nt/ammo/arg/rubber
	name = "5.56 Rubber Magazine"
	desc = "An alternative 30-round 5.56 magazine loaded with less-lethal rounds; suitable for use with the NT-ARG."
	item = /obj/item/ammo_box/magazine/r556/rubber

/datum/uplink_item/nt/ammo/lwt
	name = ".308 Magazine"
	desc = "An additional 15-round .308 magazine; suitable for use with the LWT-650."
	item = /obj/item/ammo_box/magazine/m308
	cost = 2

/datum/uplink_item/nt/ammo/lwt/penetrator
	name = ".308 Penetrator Magazine"
	desc = "An alternative 15-round .308 penetrator magazine; suitable for use with the LWT-650. \
			These rounds do less damage but puncture bodies and body armor alike."
	item = /obj/item/ammo_box/magazine/m308/pen
	cost = 4

/datum/uplink_item/nt/ammo/lwt/laser
	name = ".308 Heavy Laser Magazine"
	desc = "An alternative 15-round .308 heavy laser magazine; suitable for use with the LWT-650. \
			These rounds fire heavy lasers which do much more than a standard laser. The magazine is rechargable like the laser rifle's."
	item = /obj/item/ammo_box/magazine/m308/laser
	cost = 7

/datum/uplink_item/nt/ammo/m45ammo
	name = ".45 Handgun Magazine"
	desc = "An additional 8-round .45 magazine; suitable for use with the M1911."
	item = /obj/item/ammo_box/magazine/m45
	cost = 2

/datum/uplink_item/nt/ammo/saberammo
	name = "9mm Magazine"
	desc = "An additional 21-round 9mm magazine; suitable for use with the Saber SMG."
	item = /obj/item/ammo_box/magazine/smgm9mm
	cost = 1

/datum/uplink_item/nt/ammo/saberammo/ap
	name = "9mm AP Magazine"
	desc = "An additional 21-round 9mm magazine loaded with armor-piercing rounds; suitable for use with the Saber SMG."
	item = /obj/item/ammo_box/magazine/smgm9mm/ap
	cost = 2

/datum/uplink_item/nt/ammo/saberammo/inc
	name = "9mm Incendiary Magazine"
	desc = "An additional 21-round 9mm magazine loaded with incendiary rounds; suitable for use with the Saber SMG."
	item = /obj/item/ammo_box/magazine/smgm9mm/inc

/datum/uplink_item/nt/ammo/wt
	name = "4.6x30mm Magazine"
	desc = "An additional 20-round 4.6x30mm magazine; suitable for use with the WT-550."
	item = /obj/item/ammo_box/magazine/wt550m9
	cost = 2

/datum/uplink_item/nt/ammo/wt/ap
	name = "4.6x30mm AP Magazine"
	desc = "An additional 20-round 4.6x30mm magazine loaded with armor-piercing rounds; suitable for use with the WT-550."
	item = /obj/item/ammo_box/magazine/wt550m9/wtap
	cost = 4

/datum/uplink_item/nt/ammo/wt/ic
	name = "4.6x30mm Incendiary Magazine"
	desc = "An additional 20-round 4.6x30mm magazine loaded with incendiary rounds; suitable for use with the WT-550."
	item = /obj/item/ammo_box/magazine/wt550m9/wtic
	cost = 4

/datum/uplink_item/nt/ammo/wt/r
	name = "4.6x30mm Rubber Shot Magazine"
	desc = "An additional 20-round 4.6x30mm magazine loaded with less-lethal rounds; suitable for use with the WT-550."
	item = /obj/item/ammo_box/magazine/wt550m9/wtr
	cost = 1

/datum/uplink_item/nt/mech
	category = "Exosuits"
	required_ert_uplink = list(NT_ERT_ENGINEER)

/datum/uplink_item/nt/mech/marauder
	name = "Marauder exosuit"
	desc = "A heavy-duty exosuit for when the going gets tough. Armed with three smoke bombs, and capable of mounting four pieces of equipment."
	item = /obj/mecha/combat/marauder
	cost = 12

/datum/uplink_item/nt/mech/seraph
	name = "Seraph exosuit"
	desc = "An ultra-heavy exosuit designed for destroying armies. Faster, tougher, and stronger than it's Marauder cousin."
	item = /obj/mecha/combat/marauder/seraph/unloaded
	cost = 30

/datum/uplink_item/nt/mech/laser
	name = "CH-PS Laser"
	desc = "A mounted laser cannon. Fires standard lasers."
	item = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser
	cost = 2

/datum/uplink_item/nt/mech/hades
	name = "FNX-99 Carbine"
	desc = "A mounted incendiary cannon. Fires bullets that do little damage, but light targets on fire."
	item = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/carbine
	cost = 4

/datum/uplink_item/nt/mech/scattershot
	name = "LBX AC 10"
	desc = "A mounted shotgun. Fires a larger variant of buckshot, making it devastating at close range."
	item = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	cost = 4

/datum/uplink_item/nt/mech/lmg
	name = "Ultra AC 2"
	desc = "A mounted machine gun, fires in three round bursts."
	item = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg
	cost = 4

/datum/uplink_item/nt/mech/missile_launcher
	name = "SRM-8"
	desc = "A mounted missile rack."
	item = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack
	cost = 4

/datum/uplink_item/nt/mech/pulse
	name = "eZ-13"
	desc = "A mounted heavy pulse cannon capable of firing heavy pulses, which can destroy multiple walls at once as well as decimating soft targets."
	item = /obj/item/mecha_parts/mecha_equipment/weapon/energy/pulse
	cost = 10

/datum/uplink_item/nt/mech/droid
	name = "Repair droid"
	desc = "A repair droid that will patch up most damage to a mech. Consumes a lot of power in the process."
	item = /obj/item/mecha_parts/mecha_equipment/repair_droid
	cost = 2

/datum/uplink_item/nt/mech/tesla
	name = "Tesla relay"
	desc = "A remote, passive recharger for mechs. Very, very slow."
	item = /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	cost = 1

/datum/uplink_item/nt/mech/hadesammo
	name = "FNX-99 Ammunition"
	desc = "An ammo box for the FNX-99 carbine."
	item = /obj/item/mecha_ammo/incendiary
	cost = 1

/datum/uplink_item/nt/mech/scattershotammo
	name = "LBX AC 10 Ammunition"
	desc = "An ammo box for the LBX AC 10."
	item = /obj/item/mecha_ammo/scattershot
	cost = 1

/datum/uplink_item/nt/mech/ultrammo
	name = "Ultra AC 2 Ammunition"
	desc = "An ammo box for the Ultra AC 2"
	item = /obj/item/mecha_ammo/lmg
	cost = 1

/datum/uplink_item/nt/mech/missiles
	name = "SRM-8 Missiles"
	desc = "Additional missiles for the SRM-8 missile launcher."
	item = /obj/item/mecha_ammo/missiles_he
	cost = 1

/datum/uplink_item/nt/cqc
	category = "Close Quarters Combat"

/datum/uplink_item/nt/cqc/cknife
	name = "Combat Knife"
	desc = "A less flashy but surprisingly robust pocket knife."
	item = /obj/item/kitchen/knife/combat
	cost = 1

/datum/uplink_item/nt/cqc/edagger
	name = "Energy Knife"
	desc = "A knife made of energy that looks and functions as a pen when off."
	item = /obj/item/pen/red/edagger/nt
	cost = 2

/datum/uplink_item/nt/cqc/vib_blade
	name = "Bibration Blade"
	desc = "A blade with an edge that vibrates rapidly, enabling it to easily cut through armor and flesh alike."
	item = /obj/item/melee/transforming/vib_blade
	cost = 4

/datum/uplink_item/nt/cqc/esword
	name = "Energy Sword"
	desc = "The energy sword is an edged weapon with a blade of pure energy. The sword is small enough to be \
			pocketed when inactive."
	item = /obj/item/melee/transforming/energy/sword/saber
	cost = 8
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/cqc/eshield
	name = "Energy Shield"
	desc = "A shield that blocks all energy projectiles but is useless against physical attacks."
	item = /obj/item/shield/energy
	cost = 16
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/cqc/mantisblade
	name = "H.E.P.H.A.E.S.T.U.S. Mantis Blades"
	desc = "A pair of retractable arm-blade implants. Activating both will let you double-attack."
	item = /obj/item/storage/briefcase/nt_mantis
	cost = 10
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/cqc/stealthmantisblade
	name = "H.E.P.H.A.E.S.T.U.S. Mantis Blade (stealth)"
	desc = "One H.E.P.H.A.E.S.T.U.S. Mantis blade implant able to be retracted inside your body at will for easy storage and concealing. Two blades can be used at once."
	item = /obj/item/autosurgeon/nt_mantis/stealth
	cost = 6
	required_ert_uplink = list(NT_ERT_COMMANDER)

/datum/uplink_item/nt/cqc/cqc
	name = "CQC Manual"
	desc = "A manual that teaches a single user tactical Close-Quarters Combat before self-destructing."
	item = /obj/item/book/granter/martial/cqc
	cost = 13
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/cqc/teleshield
	name = "Telescopic Shield"
	desc = "A foldable shield that blocks attacks when active but can break."
	item = /obj/item/shield/riot/tele
	cost = 3
	required_ert_uplink = list(NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/cqc/stunbaton
	name = "Stun Baton"
	desc = "A robust charged baton that will swiftly take down most criminals."
	item = /obj/item/melee/baton/loaded
	cost = 1
	required_ert_uplink = list(NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/cqc/telebaton
	name = "Telescopic Baton"
	desc = "A foldable baton that doesn't run on charge. Takes more hits to down, but swings faster."
	item = /obj/item/melee/classic_baton/telescopic
	cost = 1 //Engies and medics can buy these, like normal ERTs!

/datum/uplink_item/nt/cqc/flash
	name = "Flash"
	desc = "A bright flashing device that can disable silicons and blind humans."
	item = /obj/item/assembly/flash
	cost = 1

/datum/uplink_item/nt/support
	category = "Support"

/datum/uplink_item/nt/support/c4
	name = "Composition C-4"
	desc = "C-4 is plastic explosive of the common variety Composition C. You can use it to breach walls, disrupt equipment, or connect \
			an assembly to it in order to alter the way it detonates. It can be attached to almost all objects and has a modifiable timer with a \
			minimum setting of 10 seconds."
	item = /obj/item/grenade/plastic/c4
	cost = 1
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/x4
	name = "Composition X-4"
	desc = "A variety of plastic explosive with a stronger explosive charge. It is both safer to use and is capable of breaching even the most secure areas."
	item = /obj/item/grenade/plastic/x4
	cost = 3
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/medkit
	name = "Medic Kit"
	desc = "A station-standard medical kit. Stocked with sutures, regenerative mesh, medical gauze, \
			a health analyzer, and an epinephrine pen."
	item = /obj/item/storage/firstaid/regular
	cost = 1

/datum/uplink_item/nt/support/advmedkit
	name = "Tactical Combat Medic Kit"
	desc = "Included is a combat stimulant injector \
			for rapid healing, a medical night vision HUD for quick identification of injured personnel, \
			and other supplies helpful for a field medic."
	item = /obj/item/storage/firstaid/tactical
	cost = 4
	required_ert_uplink = list(NT_ERT_MEDIC, NT_ERT_COMMANDER) //Only real medics get the good stuff

/datum/uplink_item/nt/support/healermech
	name = "Healer Nanite Serum"
	desc = "An auto-injector full of reverse-engineered syndicate healing nanites. These will quickly repair most damage on a patient, pre-filled with fifteen doses."
	item = /obj/item/reagent_containers/autoinjector/combat/healermech
	cost = 8
	required_ert_uplink = list(NT_ERT_MEDIC, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/resurrectormech
	name = "Resurrector Nanite Serum"
	desc = "A single-use superdose of nanites capable of fully repairing a body, including replacing lost organs and limbs and restoring blood volume. Will do nothing to a living person."
	item = /obj/item/reagent_containers/autoinjector/medipen/resurrector
	cost = 8
	required_ert_uplink = list(NT_ERT_MEDIC, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/medbeam
	name = "Medbeam Gun"
	desc = "A wonder of Nanotrasen engineering, the Medbeam gun, or Medi-Gun enables a medic to keep his fellow \
			officers in the fight, even while under fire. Don't cross the streams!"
	item = /obj/item/gun/medbeam
	cost = 7
	limited_stock = 1

/datum/uplink_item/nt/support/toolbelt
	name = "Full Toolbelt"
	desc = "Comes pre-stocked with every engineering tool you'll ever need."
	item = /obj/item/storage/belt/utility/full/engi
	cost = 1
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/advanced_toolbelt
	name = "Advanced toolbelt"
	desc = "A toolbelt filled with advanced tools, for when you need to work quickly."
	item = /obj/item/storage/belt/utility/chief/full/ert
	cost = 5
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/rcd
	name = "Rapid Construction Device"
	desc = "Standard RCD that can repair or destroy structures very quickly. Holds up to 160 matter units."
	item = /obj/item/construction/rcd/loaded
	cost = 2
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/combatrcd
	name = "Industrial RCD"
	desc = "Heavy combat RCD that holds up to 500 matter units."
	item = /obj/item/construction/rcd/combat
	cost = 5
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/advancedrcd
	name = "Advanced RCD"
	desc = "An RCD with improved capacity, although slightly less than an industrial RCD. However, it can construct and deconstruct from range."
	item = /obj/item/construction/rcd/arcd
	cost = 10
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/rcdammo
	name = "Compressed Matter Cartridge"
	desc = "Highly compressed matter that restores 160 matter units on an RCD."
	item = /obj/item/rcd_ammo
	cost = 1
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/support/foamnades
	name = "Box of Smart Metal Foam Grenades"
	desc = "A box of 7 smart metal foam grenades to patch hull breaches with."
	item = /obj/item/storage/box/smart_metal_foam
	cost = 1
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/hardsuit
	category = "Armor & Hardsuits"

/datum/uplink_item/nt/hardsuit/armor
	name = "Armor Vest"
	desc = "A standard issue security armor vest."
	item = /obj/item/clothing/suit/armor/vest
	cost = 1

/datum/uplink_item/nt/hardsuit/helmet
	name = "Helmet"
	desc = "A standard issue security helmet. Can have a seclite attached."
	item = /obj/item/clothing/head/helmet
	cost = 1

/datum/uplink_item/nt/hardsuit/bulletvest
	name = "Bulletproof Armor Vest"
	desc = "An armor vest that is extremely robust against ballistics but weak to everything else."
	item = /obj/item/clothing/suit/armor/bulletproof
	cost = 1

/datum/uplink_item/nt/hardsuit/bullethelmet
	name = "Bulletproof Helmet"
	desc = "A helmet that is extremely robust against ballistics but weak to everything else."
	item = /obj/item/clothing/head/helmet
	cost = 1

/datum/uplink_item/nt/hardsuit/riotvest
	name = "Riot Suit"
	desc = "A bulky suit that protects you against melee attacks but not much else."
	item = /obj/item/clothing/suit/armor/riot
	cost = 1
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/hardsuit/riothelmet
	name = "Riot Helmet"
	desc = "A helmet that protects you against melee attacks but not much else."
	item = /obj/item/clothing/head/helmet/riot
	cost = 1
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/gear
	category = "Other Gear"

/datum/uplink_item/nt/gear/secbelt
	name = "Stocked Security Belt"
	desc = "Standard issue security gear, all in a stylish belt."
	item = /obj/item/storage/belt/security/full
	cost = 2
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/gear/flashbangs
	name = "Box of Flashbangs"
	desc = "A box of 7 flashbangs to make the crew hate you."
	item = /obj/item/storage/box/flashbangs
	cost = 2
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/gear/handcuffs
	name = "Box of Handcuffs"
	desc = "A box of 7 pairs of handcuffs to keep prisoners in line."
	item = /obj/item/storage/box/handcuffs
	cost = 1
	required_ert_uplink = list(NT_ERT_TROOPER, NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/gear/bowman
	name = "Bowman Headset"
	desc = "A headset specially crafted to protect your ears from any damage, including flashbangs."
	item = /obj/item/radio/headset/headset_cent/bowman
	cost = 1

/datum/uplink_item/nt/gear/sechud
	name = "Security HUDglasses"
	desc = "A pair of sunglasses fitted with a security HUD."
	item = /obj/item/clothing/glasses/hud/security/sunglasses
	cost = 1
	required_ert_uplink = list(NT_ERT_SECURITY_SPECIALIST, NT_ERT_COMMANDER)

/datum/uplink_item/nt/gear/medhud
	name = "Medical HUDglasses"
	desc = "A pair of sunglasses fitted with a medical HUD."
	item = /obj/item/clothing/glasses/hud/health/sunglasses
	cost = 1
	required_ert_uplink = list(NT_ERT_MEDIC, NT_ERT_COMMANDER)

/datum/uplink_item/nt/gear/mesonhud
	name = "Meson Sunglasses"
	desc = "A pair of sunglasses fitted with meson technology."
	item = /obj/item/clothing/glasses/meson/sunglasses
	cost = 1
	required_ert_uplink = list(NT_ERT_ENGINEER, NT_ERT_COMMANDER)

/datum/uplink_item/nt/gear/thermalhud
	name = "Optical Thermal Scanner"
	desc = "A pair of goggles that provide thermal scanning vision through walls."
	item = /obj/item/clothing/glasses/thermal
	cost = 4

/datum/uplink_item/nt/gear/dsmask
	name = "MK.II SWAT mask"
	desc = "A strange mask that encrypts your voice so that only others wearing the mask can understand you, \
			but you won't be able to understand anyone who isn't wearing the mask. \
			Why would anyone spend this much on a mask?"
	item = /obj/item/clothing/mask/gas/sechailer/swat/encrypted
	cost = 10

/datum/uplink_item/nt/gear/ntstamp
	name = "CentCom Official Stamp"
	desc = "To let them know you're the real deal."
	item = /obj/item/stamp/cent
	cost = 1
	required_ert_uplink = list(NT_ERT_COMMANDER)

/datum/uplink_item/nt/gear/ntposters
	name = "Box of Posters"
	desc = "A box of Nanotrasen-approved posters to boost crew morale."
	item = /obj/item/storage/box/official_posters
	cost = 1

/datum/uplink_item/nt/gear/syndiebears
	name = "Omnizine Gummy Bears"
	desc = "Omnizine infused gummy bears. Grape flavor. Chew throughly!"
	item = /obj/item/storage/pill_bottle/gummies/omnizine
	cost = 1
