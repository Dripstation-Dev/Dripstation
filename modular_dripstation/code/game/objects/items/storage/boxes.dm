//ammo boxes for 12mm
/obj/item/storage/box/beanbag
	icon_state = "beanbag_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'

/obj/item/storage/box/rubbershot
	icon_state = "beanbag_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'

/obj/item/storage/box/slug
	name = "box of slug shotgun shots"
	desc = "A box full of slug lethal shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "slug_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/slug/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/slug/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun(src)

/obj/item/storage/box/incendiary
	name = "box of incendiary slug shotgun shots"
	desc = "A box full of incendiary lethal shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "incendiary_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/incendiary/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/incendiary/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/incendiary(src)

/obj/item/storage/box/laserbuckshot
	name = "box of laserbuckshot slug shotgun shots"
	desc = "A box full of laserbuckshot lethal shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "laserbuckshot_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/laserbuckshot/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun))

/obj/item/storage/box/laserbuckshot/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/laserbuckshot(src)

/obj/item/storage/box/ion
	name = "box of ion shotgun shots"
	desc = "A box full of ion shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "ion_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/ion/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun/ion))

/obj/item/storage/box/ion/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/ion(src)

/obj/item/storage/box/pulseslug
	name = "box of pulse slug shotgun shots"
	desc = "A box full of pulse slug shots designed for shotguns. The box itself is designed for holding any kind of shotgun shell."
	icon_state = "pulseslug_box"
	icon = 'modular_dripstation/icons/obj/ammo.dmi'
	illustration = null

/obj/item/storage/box/pulseslug/Initialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.set_holdable(list(/obj/item/ammo_casing/shotgun/pulseslug))

/obj/item/storage/box/pulseslug/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_casing/shotgun/pulseslug(src)

/obj/item/storage/box
	icon = 'modular_dripstation/icons/obj/storage.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/boxes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/boxes_righthand.dmi'
	item_state = "box"

/obj/item/storage/box/cyber_implants
	illustration = null

/obj/item/storage/box/survival
	name = "emergency survival box"
	icon_state = "air"
	item_state = "box_emergency"
	illustration = null

/obj/item/storage/box/survival/engineer
	name = "extended emergency survival box"
	icon_state = "air_upgrade"
	item_state = "box_emergency"
	illustration = null

/obj/item/storage/box/survival/engineer/PopulateContents()
	..()
	new /obj/item/flashlight/glowstick/yellow(src)

/obj/item/storage/box/syndie
	name = "emergency survival box"
	icon_state = "syndie_air"
	illustration = null

/obj/item/storage/box/survival_mining
	name = "mining emergency survival box"
	icon_state = "air_upgrade"
	item_state = "box_emergency"
	illustration = null

/obj/item/storage/box/seccarts
	icon_state = "secbox"
	item_state = "secbox"

/obj/item/storage/box/security
	name = "security survival box"
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "emergencytank"	

/obj/item/storage/box/plasmaman
	name = "plasmaman survival box"
	icon_state = "plasmaman"
	illustration = null

/obj/item/storage/box/ipc
	name = "robot survival box"
	icon_state = "robot"
	illustration = null

/obj/item/storage/box/gorillacubes
	icon_state = "gorillacubebox"

/obj/item/storage/box/mixedcubes
	icon_state = "mixedcubebox"

/obj/item/storage/box/goatcubes
	icon_state = "goatcubebox"

/obj/item/storage/box/syringes
	icon_state = "syringes"
	item_state = "syringe"
	illustration = null

/obj/item/storage/box/medipens
	illustration = "epipen"

/obj/item/storage/box/medipens/utility
	illustration = "epipen"

/obj/item/storage/box/beakers/bluespace
	illustration = "blubeaker"

/obj/item/storage/box/vials/bluespace
	illustration = "vialblue"
	item_state = "beaker"

/obj/item/storage/box/injectors
	illustration = "dna"

/obj/item/storage/box/flashes
	illustration = "flash"

/obj/item/storage/box/mechabeacons
	illustration = "circuit"

/obj/item/storage/box/pinpointer_pairs
	illustration = "pda"

/obj/item/storage/box/medsprays
	illustration = "epipen"

/obj/item/storage/box/wall_flash
	illustration = "flash"

/obj/item/storage/box/teargas
	icon_state = "secbox"
	item_state = "secbox"	
	illustration = "grenade"

/obj/item/storage/box/emps
	illustration = "emp"

/obj/item/storage/box/drinkingglasses
	illustration = "drinkglass"	
	item_state = "beaker"

/obj/item/storage/box/condimentbottles
	illustration = "condiment"
	item_state = "beaker"

/obj/item/storage/box/cups
	illustration = "cup"

/obj/item/storage/box/cheese
	illustration = "condiment"

/obj/item/storage/box/firingpins
	illustration = "firingpin"

/obj/item/storage/box/firingpins/syndicate
	illustration = "firingpin"

/obj/item/storage/box/secfiringpins
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "firingpin"

/obj/item/storage/box/lasertagpins
	illustration = "firingpin"

/obj/item/storage/box/holy_grenades
	icon_state = "secbox"
	illustration = "grenade"

/obj/item/storage/box/fakesyndiesuit
	illustration = "syndiesuit"	

/obj/item/storage/box/exileimp
	icon_state = "secbox"
	item_state = "syringe"

/obj/item/storage/box/minertracker
	icon_state = "secbox"
	item_state = "syringe"

/obj/item/storage/box/trackimp
	icon_state = "secbox"
	item_state = "syringe"

/obj/item/storage/box/chemimp
	icon_state = "secbox"
	item_state = "syringe"

/obj/item/storage/box/silver_ids
	icon_state = "nt"
	item_state = "nt"

/obj/item/storage/box/sec_ids
	name = "box of spare security IDs"
	desc = "Shiny IDs for security personel. Cards has IFF signal."
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "id"

/obj/item/storage/box/sec_ids/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/card/id/spearhead(src)

/obj/item/storage/box/deputy
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "depband"

/obj/item/storage/box/smart_metal_foam
	illustration = "grenade"

/obj/item/storage/box/emptysandbags
	illustration = "sandbag"

/obj/item/storage/box/rndboards
	illustration = "scicircuit"	

/obj/item/storage/box/rndboards/miner
	illustration = "circuit"

/obj/item/storage/box/official_posters
	illustration = "paper"

/obj/item/storage/box/evidence
	icon_state = "secbox"
	item_state = "secbox"
	illustration = "evidence_icon"

/obj/item/storage/box/coffee_cart_rack
	illustration = "circuit"

/obj/item/storage/box/coffee_condi_display
	illustration = "vial"
	item_state = "beaker"

/obj/item/storage/box/jumpbootimplant
	icon_state = "cyber_implants"
	illustration = null

/obj/item/storage/box/silver_sulf
	illustration = "firepatch"	

/obj/item/storage/box/fountainpens
	illustration = "fpen"	

/obj/item/storage/box/holy_grenades
	illustration = "circuit"

/obj/item/storage/box/stockparts
	illustration = "circuit"

/obj/item/storage/box/stockparts/basic //for ruins where it's a bad idea to give access to an autolathe/protolathe, but still want to make stock parts accessible
	illustration = "circuit"

/obj/item/storage/box/stockparts/deluxe
	illustration = "circuit"	

/obj/item/storage/box/syndie_kit
	item_state = "box_of_doom"

/obj/item/storage/box/syndie_kit/imp_freedom
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_microbomb
	illustration = "implant"	

/obj/item/storage/box/syndie_kit/origami_bundle
	illustration = "paper"

/obj/item/storage/box/syndie_kit/romerol
	illustration = "syringe"

/obj/item/storage/box/syndie_kit/ez_clean
	illustration = "grenade"

/obj/item/storage/box/syndie_kit/mimery
	illustration = "paper"

/obj/item/storage/box/syndie_kit/imp_macrobomb
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_uplink
	illustration = "implant"

/obj/item/storage/box/syndie_kit/bioterror
	illustration = "syringe"

/obj/item/storage/box/syndie_kit/imp_adrenal
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_storage
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_stealth
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_radio
	illustration = "implant"

/obj/item/storage/box/syndie_kit/cluwnification
	illustration = "clown"

/obj/item/storage/box/syndie_kit/imp_mindslave
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_greytide
	illustration = "implant"

/obj/item/storage/box/syndie_kit/xeno_organ_kit
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_mindshield
	illustration = "implant"

/obj/item/storage/box/syndie_kit/space
	illustration = "syndiesuit"

/obj/item/storage/box/flashbangs
	item_state = "flashbang"

/obj/item/storage/box/syndie_kit/emp
	illustration = "emp"

/obj/item/storage/box/syndie_kit/chemical
	illustration = "beaker"
	item_state = "beaker"

/obj/item/storage/box/syndie_kit/tuberculosisgrenade
	illustration = "grenade"

/obj/item/storage/box/syndie_kit/bee_grenades
	illustration = "grenade"

/obj/item/storage/box/syndie_kit/augmentation
	icon_state = "cyber_implants"
	item_state = "box"
	illustration = null

/obj/item/storage/box/syndie_kit/buster
	icon_state = "cyber_implants"
	item_state = "box"
	illustration = null

/obj/item/storage/box/syndie_kit/emp_shield
	illustration = "implant"

/obj/item/storage/box/syndie_kit/swat
	illustration = "syndiesuit"

/obj/item/storage/box/syndie_kit/swat/PopulateContents()
	new /obj/item/clothing/suit/space/swat/syndicate(src)
	new /obj/item/clothing/head/helmet/swat(src)

/obj/item/storage/box/syndie_kit/hardarmor
	illustration = "syndiesuit"

/obj/item/storage/box/syndie_kit/hardarmor/PopulateContents()
	new /obj/item/clothing/suit/armor/hardened/gorlex(src)
	new /obj/item/clothing/head/helmet/hardened/gorlex(src)

/obj/item/storage/box/hardarmor/PopulateContents()
	new /obj/item/clothing/suit/armor/hardened(src)
	new /obj/item/clothing/head/helmet/hardened(src)

/obj/item/storage/box/syndicate/bundle_A
	icon_state = "syndiebox"
	item_state = "box_of_doom"
	illustration = "writing_syndie"

/obj/item/storage/box/syndicate/bundle_B
	icon_state = "syndiebox"
	item_state = "box_of_doom"
	illustration = "writing_syndie"

/obj/item/storage/box/forcing/PopulateContents()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/emergency_oxygen(src)
	new /obj/item/melee/emergency_forcing_tool(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/flashlight/flare/signal(src)

/obj/item/storage/box/captain
	name = "extended emergency survival box"
	icon_state = "air_upgrade"
	item_state = "box_emergency"
	illustration = null

/obj/item/storage/box/captain/PopulateContents()
	new /obj/item/clothing/mask/breath/tactical(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/crowbar/red(src)

/obj/item/storage/box/ert
	name = "combat survival box"
	icon_state = "nt"
	item_state = "nt"
	illustration = "syringe"

/obj/item/storage/box/ert/PopulateContents()
	new /obj/item/clothing/mask/breath/tactical(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)
	new /obj/item/melee/emergency_forcing_tool(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/flashlight/flare/signal(src)

/obj/item/storage/box/militech
	name = "unknown survival box"
	icon_state = "box"
	item_state = "box"
	illustration = null

/obj/item/storage/box/militech/PopulateContents()
	new /obj/item/clothing/mask/gas/tactical(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/radio/military/militech(src)
	new /obj/item/melee/emergency_forcing_tool/varyag(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/flashlight/flare/signal(src)

/obj/item/storage/box/shellguard
	name = "unknown survival box"
	icon_state = "box"
	item_state = "box"
	illustration = null

/obj/item/storage/box/shellguard/PopulateContents()
	new /obj/item/clothing/mask/breath/tactical/shellguard(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/radio/military/shellguard(src)
	new /obj/item/melee/emergency_forcing_tool/varyag(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/flashlight/flare/signal(src)

/obj/item/storage/box/unn
	name = "unknown survival box"
	icon_state = "box"
	item_state = "box"
	illustration = null

/obj/item/storage/box/unn/PopulateContents()
	new /obj/item/clothing/mask/gas/tactical/unn(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/radio/military/unn(src)
	new /obj/item/melee/emergency_forcing_tool(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/flashlight/flare/signal(src)

/obj/item/storage/box/holobadge
	name = "holobadge box"
	desc = "A box claiming to contain holobadges."
	item_state = "syringe"
	illustration = "badges"

/obj/item/storage/box/holobadge/New()
	..()
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)
	new /obj/item/badge/security/cadet(src)

/obj/item/storage/box/security/biosig_nt
	name = "biosignaller implant box"
	desc = "A box claiming to contain 'Nanotrasen \"Profit Margin\" Class Employee Biosignaller' implants."
	illustration = "implant"

/obj/item/storage/box/security/biosig_nt/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/implantcase/biosig_ntcommand(src)
	new /obj/item/implanter/biosig_ntcommand(src)

// Syndie kit
/obj/item/storage/box/donkdrip
	illustration = null	

/obj/item/storage/box/donkdrip/PopulateContents()
	new /obj/item/clothing/under/syndicate/donk(src)
	new /obj/item/clothing/suit/hazardvest/donk(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/shoes/combat(src)

/obj/item/storage/box/donkdrip/combat

/obj/item/storage/box/donkdrip/combat/PopulateContents()
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/clothing/under/syndicate/donk/combat(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/shoes/combat(src)

/obj/item/storage/box/donkdrip/maid

/obj/item/storage/box/donkdrip/maid/PopulateContents()
	new /obj/item/clothing/head/maidheadband/syndicate(src)
	new /obj/item/clothing/under/syndicate/donk/maid(src)
	new /obj/item/clothing/gloves/combat/maid(src)
	new /obj/item/clothing/shoes/combat(src)

// Syndie survival box
/obj/item/storage/box/syndie/nuke
	name = "emergency survival box"
	icon_state = "syndie_air"
	illustration = null

/obj/item/storage/box/syndie/nuke/PopulateContents()
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/reagent_containers/autoinjector/medipen/stimpack/traitor(src)
	new /obj/item/reagent_containers/autoinjector/medipen/ekit/traitor(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/extinguisher/mini(src)

/obj/item/storage/box/gunset
	name = "gun supply box"
	desc = "An unknown weapons supply box."
	icon = 'modular_dripstation/icons/obj/storage/gunset.dmi'
	icon_state = "box"
	var/open_box_state = "box-open"
	var/opened = FALSE
	var/datum/corporation/corp = null
	item_state = "sec-case"
	lefthand_file = 'icons/mob/inhands/equipment/briefcase_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/briefcase_righthand.dmi'
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_BULKY
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound =  'sound/items/handling/ammobox_pickup.ogg'
	foldable = FALSE
	illustration = null

/obj/item/storage/box/gunset/Initialize(mapload)
	. = ..()
	if(corp)
		name = initial(name) + " ([corp])"
		desc = "The [corp] brand weapons supply box."

/obj/item/storage/box/gunset/PopulateContents()
	. = ..()
	//new /obj/item/storage/pouch/shotgun(src)

/obj/item/storage/box/gunset/update_icon()
	. = ..()
	if(opened)
		icon_state = open_box_state
	else
		icon_state = initial(icon_state)

/obj/item/storage/box/gunset/AltClick(mob/user)
	. = ..()
	opened = !opened
	update_appearance(UPDATE_ICON)


/obj/item/storage/box/gunset/attack_self(mob/user)
	. = ..()
	opened = !opened
	update_appearance(UPDATE_ICON)

/obj/item/storage/box/gunset/wt550
	name = "WT-550 case"
	desc = "This case contains a WT-550 and enough ammo."
	corp = /datum/corporation/wardtakhashi

/obj/item/storage/box/gunset/wt550/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.set_holdable(list(
		/obj/item/gun/ballistic/automatic/wt550,
		/obj/item/ammo_box/magazine/wt550m9,
		/obj/item/ammo_box/magazine/wt550m9,
		/obj/item/attachment/grip/angled, 
		/obj/item/attachment/scope/holo
		))

/obj/item/storage/box/gunset/infiltrator
	name = "insidious case"
	desc = "Bearing the emblem of the Syndicate, this case contains a full infiltrator stealth suit, and has enough room to fit weaponry if necessary."
	icon_state = "box_syndicate"
	item_state = "infiltrator_case"
	//icon = 'modular_dripstation/icons/obj/storage.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/misc/boxes_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/misc/boxes_righthand.dmi'
	force = 15
	throwforce = 18
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/box/gunset/infiltrator/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.set_holdable(list(
		/obj/item/clothing/head/helmet/space/infiltrator,
		/obj/item/clothing/suit/armor/vest/infiltrator,
		/obj/item/clothing/under/syndicate/bloodred,
		/obj/item/clothing/gloves/tackler/combat/infiltrator,
		/obj/item/clothing/mask/gas/syndicate/balaclava,
		/obj/item/clothing/shoes/combat/sneakboots,
		/obj/item/gun/ballistic/rifle/sniper_rifle/syndicate,
		/obj/item/gun/ballistic/automatic/k41s,
		/obj/item/gun/ballistic/automatic/ar,	/*ak814 & folded ak101*/
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/gun/ballistic/revolver,
		/obj/item/ammo_box
		))

/obj/item/storage/box/gunset/infiltrator/PopulateContents()
	new /obj/item/clothing/head/helmet/space/infiltrator(src)
	new /obj/item/clothing/suit/armor/vest/infiltrator(src)
	new /obj/item/clothing/under/syndicate/bloodred(src)
	new /obj/item/clothing/gloves/tackler/combat/infiltrator(src)
	new /obj/item/clothing/mask/gas/syndicate/balaclava(src)
	new /obj/item/clothing/shoes/combat/sneakboots(src)

#define CARP_CARP_CARP		1
/obj/item/storage/box/syndicate/bundle_A/PopulateContents()
	switch (pickweight(list("recon" = 2, "bloodyspai" = 3, "stealth" = 2, "guns" = 2, "murder" = 2, "implant" = 1, "hacker" = 3, "sabotage" = 3, "sniper" = 1, "metaops" = 1)))
		if("recon") //28ish TC
			new /obj/item/clothing/glasses/thermal/xray(src) //Would argue 6 TC. Thermals are 4 TC but work on organic targets in darkness
			new /obj/item/storage/briefcase/launchpad(src) //6 TC
			new	/obj/item/binoculars(src) //1 TC, maybe. Very good but mining medic/detective get them for free
			new /obj/item/encryptionkey/syndicate(src) //2 TC
			new /obj/item/storage/box/syndie_kit/space(src) //4 TC
			new /obj/item/grenade/syndieminibomb/concussion/frag(src) //Minibomb with one less range on each part except for fire. 3-4 TC.
			new /obj/item/grenade/syndieminibomb/concussion/frag(src) //See above
			new /obj/item/flashlight/emp(src) //2 TC

		if("bloodyspai") //30 TCish
			new /obj/item/clothing/under/chameleon/syndicate(src) //1 TC, has only two parts of the massive kit
			new /obj/item/clothing/mask/chameleon/syndicate(src) //See above
			new /obj/item/card/id/syndicate(src) //2 TC
			new /obj/item/multitool/ai_detect(src) //1 TC
			new /obj/item/encryptionkey/syndicate(src) //2 TC
			new /obj/item/reagent_containers/syringe/mulligan(src) //4 TC
			new /obj/item/switchblade/backstab(src) //3 TC
			new /obj/item/storage/fancy/cigarettes/cigpack_syndicate (src) //2 TC (for now)
			new /obj/item/flashlight/emp(src) //2 TC
			new /obj/item/chameleon(src) //7 TC
			new /obj/item/card/emag(src) //6 TC

		if("stealth") //32 TC
			new /obj/item/gun/energy/kinetic_accelerator/crossbow(src) //10 TC
			new /obj/item/pen/blue/sleepy(src) //4 TC
			new /obj/item/chameleon(src) //7 TC
			new /obj/item/clothing/glasses/thermal/syndi(src) //4 TC
			new /obj/item/flashlight/emp(src) //2 TC
			new /obj/item/jammer(src) //5 TC

		if("guns") //Total cost of 29 TC
			new /obj/item/gun/ballistic/revolver(src) //6 TC
			new /obj/item/gun/ballistic/revolver(src) //6 TC
			new /obj/item/gun/ballistic/automatic/pistol(src) //6 TC
			new /obj/item/gun/ballistic/automatic/pistol(src) //6 TC
			new /obj/item/ammo_box/a357(src) //1 TC for two
			new /obj/item/ammo_box/a357(src) //See above
			new /obj/item/ammo_box/a357(src) //1 TC for two
			new /obj/item/ammo_box/a357(src) //See above
			new /obj/item/ammo_box/magazine/m10mm(src) //1 TC for two
			new /obj/item/ammo_box/magazine/m10mm(src) //See above
			new /obj/item/ammo_box/magazine/m10mm(src) //1 TC for two
			new /obj/item/ammo_box/magazine/m10mm(src) //See above
			new /obj/item/storage/belt/holster/syndicate(src) //A holster for your four guns. It could be 1 TC I guess, since the tactical webbing can't hold normal items?
			new /obj/item/clothing/gloves/color/latex/nitrile(src) //Free?
			new /obj/item/clothing/mask/gas/clown_hat(src) //Free?
			new /obj/item/clothing/under/suit/really_black(src) //Free?

		if("murder") //Total cost of 28 TC
			new /obj/item/melee/transforming/energy/sword/saber(src) //8 TC
			new /obj/item/clothing/glasses/thermal/syndi(src) //4 TC
			new /obj/item/card/emag(src) //6 TC
			new /obj/item/clothing/shoes/chameleon/noslip/syndicate(src) //2 TC
			new /obj/item/encryptionkey/syndicate(src) //2 TC
			new /obj/item/grenade/syndieminibomb(src) //6 TC

		if("implant") //28 TC cost, then you get a spare 10 for a total of 38 TC (fair and balanced™)
			new /obj/item/implanter/freedom(src) //5 TC
			new /obj/item/implanter/uplink/precharged(src) //4 TC + 10 to use
			new /obj/item/implanter/emp(src) //1 TC, kit with 5 grenades costs 2
			new /obj/item/implanter/adrenalin(src) //8 TC
			new /obj/item/implanter/explosive(src) //2 TC, nukies only
			new /obj/item/implanter/storage(src) //8 TC

		if("hacker") //29 TC cost
			new /obj/item/aiModule/hacked(src) //4 TC
			new /obj/item/card/emag(src) //6 TC
			new /obj/item/encryptionkey/binary(src) //2 TC
			new /obj/item/aiModule/ion/toyAI(src) //Um, free...?
			new /obj/item/multitool/ai_detect(src) //1 TC
			new /obj/item/storage/toolbox/syndicate/real(src) //2 TC
			new /obj/item/camera_bug(src) //1 TC
			new /obj/item/card/id/syndicate(src) //2 TC
			new /obj/item/flashlight/emp(src) //2 TC
			new /obj/item/computer_hardware/hard_drive/portable/syndicate/bomberman(src) //6 TC
			new /obj/item/clothing/glasses/hud/diagnostic/sunglasses(src) //RD glasses. 1 TC, if that
			new /obj/item/pen/red/edagger(src) //2 TC

		if("sabotage") //Maybe 30 TC?
			new /obj/item/grenade/plastic/c4 (src) //1 TC
			new /obj/item/grenade/plastic/c4 (src) //1 TC
			new /obj/item/doorCharge(src) //2 TC
			new /obj/item/doorCharge(src) //2 TC
			new /obj/item/camera_bug(src) //1 TC
			new /obj/item/sbeacondrop/powersink(src) //8 TC
			new /obj/item/computer_hardware/hard_drive/portable/syndicate/bomberman(src) //6 TC
			new /obj/item/storage/toolbox/syndicate/real(src) //2 TC
			new /obj/item/pizzabox/bomb(src) //6 TC
			new /obj/item/storage/box/syndie_kit/emp(src) //2 TC

		if("sniper") //28 TC, you only get 11 shots total with the sniper and 14 with the revolver. A mini-ebow would probably be better than the sniper in a normal traitor game
			new /obj/item/gun/ballistic/rifle/sniper_rifle(src) //12 TC, nukies only
			new /obj/item/ammo_box/magazine/sniper_rounds/penetrator(src) //5 TC, nukies only
			new /obj/item/gun/ballistic/revolver(src) //6 TC
			new /obj/item/ammo_box/a357/heartpiercer(src) //1 TC
			new /obj/item/clothing/glasses/thermal/syndi(src) //4 TC
			new /obj/item/clothing/gloves/color/latex/nitrile(src) //Free?
			new /obj/item/clothing/mask/gas/clown_hat(src) //Free?
			new /obj/item/clothing/under/suit/really_black(src) //Free?

		if("metaops") //30 TC
			new /obj/item/clothing/suit/space/hardsuit/dualmode(src) //8 TC
			new /obj/item/gun/ballistic/shotgun/bulldog/unrestricted(src) //8 TC, nukies only
			new /obj/item/implanter/explosive(src) //2 TC, nukies only
			new /obj/item/ammo_box/magazine/m12g(src) //2 TC, nukies only
			new /obj/item/ammo_box/magazine/m12g(src) //2 TC, nukies only
			new /obj/item/grenade/plastic/c4 (src) //1 TC
			new /obj/item/grenade/plastic/c4 (src) //1 TC
			new /obj/item/card/emag(src) //6 TC

/obj/item/storage/box/syndicate/bundle_B/PopulateContents()
	switch (pickweight(list("v" = 2, "oddjob" = 2, "neo" = 1, "ninja" = 1, "darklord" = 1, "white_whale_holy_grail" = CARP_CARP_CARP, "mad_scientist" = 2, "bee" = 2, "mr_freeze" = 2, "gang_boss" = 1, "solo" = 1, "fixer" = 1)))
		if("v") //Big Boss. Total of ~28 TC.
			new /obj/item/clothing/under/syndicate/camo(src) //Reskinned tactical turtleneck, free
			new /obj/item/clothing/glasses/eyepatch/bigboss(src) //Gives flash protection and night vision, probably around 2-3 TC
			new /obj/item/clothing/shoes/combat(src) //Drip is essential. Free
			new /obj/item/clothing/gloves/fingerless/bigboss(src) //Like a much lighter version of the Gloves of the North Star, but also helps with carrying bodies. Worth maybe 2 TC
			new /obj/item/storage/belt/military(src) //Can't be concealed, basically just 7-slot belt, no normal items allowed. Free
			new /obj/item/book/granter/martial/cqc(src) //13 TC, ABSOLUTELY mandatory
			new /obj/item/gun/ballistic/automatic/toy/pistol/riot(src) //1 TC, not a tranq pistol but it's something
			new /obj/item/kitchen/knife/combat/survival(src) //Simple miner knife, in flavor. Maybe-maybe 1 TC, but basically free
			new /obj/item/implanter/stealth(src) //Just a box. 8 TC
			new /obj/item/clothing/mask/holo_cigar(src) //Phantom Cigar, too badass. 2 TC

		if("oddjob") //Total TC value of 26ish TC
			new /obj/item/clothing/head/det_hat/evil(src) //6 TC. Absolutely necessary
			new /obj/item/clothing/under/syndicate/sniper(src) //Variant of tactical turtleneck that looks like a suit, provides 10 melee armor, has no sensors. Would say it's free
			new /obj/item/clothing/suit/det_suit/grey/evil(src) //Grey det trenchcoat with hos coat values, 2ish TC
			new /obj/item/clothing/shoes/laceup(src) //Fancy shoes. Free
			new /obj/item/gun/ballistic/automatic/pistol/deagle/gold(src) //Gold deagle (golden gun). Since you can print off .357 boxes now I'd honestly say it's like 5 TC, even that's an overestimation
			new /obj/item/ammo_box/magazine/m50(src) //Spare mag for your gun. 1 TC.
			new /obj/item/grenade/syndieminibomb/concussion(src) //Hand grenade. ~6 TC
			new /obj/item/deployablemine/explosive(src) //I don't know if anyone remembers remote mines in Goldeneye because I certainly do. Hilariously less lethal than the 4 TC rubber ducky for clown ops, so I say 3
			new /obj/item/dnainjector/dwarf(src) //Gives you dwarfism (smaller hitbox, instantly climb tables), would argue 2-3 TC. The only other core item to this kit

		if("ninja")	//31 tc
			new /obj/item/melee/katana/bloody(src) // Hard to tell how much tc this is worth. 8 tc?
			new /obj/item/implanter/adrenalin(src) // 8 tc
			for(var/i in 1 to 6)
				new /obj/item/throwing_star(src) // ~5 tc for all 6
			new /obj/item/storage/belt/chameleon/syndicate(src) // Unique but worth at least 1 tc
			new /obj/item/card/id/syndicate(src) // 2 tc
			new /obj/item/chameleon(src) // 7 tc

		if("darklord") //This is now basically just a wizard instead of just desword: the kit. Hard to quantify the TC cost of spells, but taking SP * 4 would yield a theoretical TC of 27-ish
			new /obj/item/melee/transforming/energy/sword/saber/red(src) //8 TC. A red lightsaber. Enough said
			new /obj/item/clothing/mask/chameleon/syndicate(src) //Not even 1 TC, the real value of the chameleon kit is the jumpsuit. However this is absolutely necessary for your Sithsona
			new /obj/item/card/id/syndicate(src) //2 TC, so you can give yourself a proper name
			new /obj/item/clothing/head/yogs/sith_hood(src) //The DRIP
			new /obj/item/clothing/neck/yogs/sith_cloak(src) //See above
			new /obj/item/clothing/suit/yogs/armor/sith_suit(src) //See above
			new /obj/item/clothing/shoes/combat(src) //See above
			new /obj/item/clothing/gloves/combat(src) //Maybe 1 TC, so you don't shock yourself
			new /obj/item/book/granter/action/spell/lightningbolt(src) //Lightning bolt, LIGHTNING BOLT. A 2 SP cost spell that doesn't require robes and provides ranged potential
			new /obj/item/book/granter/action/spell/forcewall(src) //It has the word force in it? But more importantly, it doesn't require robes and it's 1 SP and it's VERY good defense
			new /obj/item/book/granter/action/spell/summonitem(src) //So you can throw your lightsaber and call it back. A 1 SP cost spell that doesn't require robes

		if("white_whale_holy_grail") //Unique items that don't appear anywhere else, more than 100 carps or your TC back
			new /obj/item/pneumatic_cannon/speargun(src)
			new /obj/item/storage/magspear_quiver(src)
			new /obj/item/clothing/suit/space/hardsuit/carp(src) //1 carp
			new /obj/item/clothing/mask/gas/carp(src) //1 carp?
			new /obj/item/pitchfork/trident(src)
			new /obj/item/grenade/clusterbuster/syndie/spawner_spesscarp(src) //when you need A LOT of carps, you'll get at least (but most likely more) 30 carps with that
			new /obj/item/grenade/spawnergrenade/spesscarp(src) //for precise and quick delivery of carps, 5 carps per grenade for a total of 20 carps
			new /obj/item/grenade/spawnergrenade/spesscarp(src)
			new /obj/item/grenade/spawnergrenade/spesscarp(src)
			new /obj/item/grenade/spawnergrenade/spesscarp(src)
			new /obj/item/carpcaller(src) //to spawn carps in space, making the place safer for you and dangerous for everyone else, you should get at least 20 carps per use so 60  carps
			new /obj/item/toy/plush/carpplushie/dehy_carp //1 carp but guaranteed complete loyalty and cuddliness

		if("mad_scientist") // ~22 tc
			new /obj/item/clothing/suit/toggle/labcoat/mad(src) // 0 tc
			new /obj/item/clothing/shoes/jackboots(src) // 0 tc
			new /obj/item/megaphone(src) // 0 tc (because how else are they to know you're mad?)
			new /obj/item/grenade/clusterbuster/random/syndie(src) // RNG worth like 2-10TC
			new /obj/item/grenade/clusterbuster/random/syndie(src) // RNG worth like 2-10TC
			new /obj/item/grenade/chem_grenade/bioterrorfoam(src) // 5 tc
			new /obj/item/storage/box/syndie_kit/ez_clean // 6 tc
			new /obj/item/assembly/signaler(src) // 0 tc
			new /obj/item/assembly/signaler(src) // 0 tc
			new /obj/item/assembly/signaler(src) // 0 tc
			new /obj/item/assembly/signaler(src) // 0 tc
			new /obj/item/storage/toolbox/syndicate/real(src) // 2 tc
			new /obj/item/pen/red/edagger(src) // 2 tc
			new /obj/item/gun/energy/wormhole_projector/upgraded(src) // ~2 tc
			new /obj/item/gun/energy/decloner/unrestricted(src) // these shots do 9 damage. 1 tc

		if("bee") // bee sword too based so its priceless
			new /obj/item/paper/fluff/bee_objectives(src) // 0 tc (motivation)
			new /obj/item/clothing/suit/hooded/bee_costume/authentic(src) // 0 tc
			new /obj/item/clothing/mask/rat/bee(src) // 0 tc
			new /obj/item/storage/belt/fannypack/yellow(src) // 0 tc
			new /obj/item/storage/box/syndie_kit/bee_grenades(src) // 6 tc
			new /obj/item/reagent_containers/glass/bottle/beesease(src) // 10 tc?
			new /obj/item/gun/magic/staff/spellblade/beesword(src) //priceless

		if("mr_freeze") // ~25 tc
			new /obj/item/clothing/glasses/cold(src) // 0 tc
			new /obj/item/clothing/gloves/color/black(src) // 0 tc
			new /obj/item/clothing/mask/chameleon/syndicate(src) // 0 tc on its own
			new /obj/item/clothing/suit/hooded/wintercoat(src) // 0 tc
			new /obj/item/clothing/shoes/winterboots(src) // 0 tc
			new /obj/item/grenade/gluon(src) // all four probably like 1 tc together kind of just a slip bomb
			new /obj/item/grenade/gluon(src) //
			new /obj/item/grenade/gluon(src) //
			new /obj/item/grenade/gluon(src) //
			new /obj/item/dnainjector/geladikinesis(src) // 0 tc
			new /obj/item/dnainjector/cryokinesis(src) // 1 or 2 tc, kind of useful
			new /obj/item/gun/energy/temperature/security(src) // ~4 tc
			new /obj/item/melee/transforming/energy/sword/saber/blue(src) //see see it fits the theme bc its blue and ice is blue, 8 tc
			new /obj/item/reagent_containers/spray/chemsprayer/freeze(src) // filled with frost oil and you can refill it with whatever, ~8 tc

		if("neo")
			new /obj/item/clothing/glasses/sunglasses(src)
			new /obj/item/gun/ballistic/automatic/pistol(src)
			new /obj/item/gun/ballistic/automatic/pistol(src)
			new /obj/item/ammo_box/magazine/m10mm/ap(src)
			new /obj/item/ammo_box/magazine/m10mm/ap(src)
			new /obj/item/ammo_box/magazine/m10mm/ap(src)
			new /obj/item/ammo_box/magazine/m10mm/ap(src)
			new /obj/item/ammo_box/magazine/m10mm(src)
			new /obj/item/ammo_box/magazine/m10mm(src)
			new /obj/item/ammo_box/magazine/m10mm/sp(src)
			new /obj/item/ammo_box/magazine/m10mm/sp(src)
			new /obj/item/ammo_box/magazine/m10mm/fire(src)
			new /obj/item/ammo_box/magazine/m10mm/fire(src)
			new /obj/item/reagent_containers/syringe/plasma(src)
			new /obj/item/reagent_containers/autoinjector/medipen/stimpack/large/redpill(src)
			new /obj/item/slime_extract/sepia(src)
			new /obj/item/slime_extract/sepia(src)
			new /obj/item/slime_extract/sepia(src) // sepia to stop time because we dont really have a time slow event


		if("gang_boss")
			new /obj/item/clothing/under/costume/jabroni(src) //fishnet suit
			new /obj/item/clothing/suit/yogs/pinksweater(src) //close enough
			new /obj/item/guardiancreator/tech(src) //15 TC
			new /obj/item/stand_arrow/boss(src) //priceless, but if it had to get a price it'd be ~45 for 3 holoparasite injectors and ~21 3 mindslave implants. although its difficult to conceal and the holoparasites are random.
			new /obj/item/storage/fancy/donut_box(src) //d o n u t s
			new /obj/item/reagent_containers/glass/bottle/drugs(src)
			new /obj/item/slimecross/stabilized/green(src) //secret identity

		if("solo") //14 + 6x3 + 1 = 3 tc = 31 tc. it was, in fact, busted
			new /obj/item/autosurgeon/syndicate/spinalspeed(src) //12 tc
			new /obj/item/clothing/suit/toggle/cyberpunk/solo(src) //dont know what this costs, vague guesstimate says 6tc
			new /obj/item/autosurgeon/arm/syndicate/syndie_mantis(src) //6 tc
			new /obj/item/autosurgeon/arm/syndicate/syndie_mantis(src) //6 tc
			new /obj/item/autosurgeon/upgraded_cyberlungs(src) //this is to remain true to the source material ok
			new /obj/item/storage/pill_bottle/synaptizine(src) //take your drugs david, this and the lungs make up 1 tc

		if("fixer")	//30 tc
			new /obj/item/clothing/under/syndicate/fixer(src)	//the best silk we can provide, anchanced sniper suit with name and armor, likely 5 tc worth
			new /obj/item/clothing/mask/sense_deprevation(src)	//Somewhat like breach cleaver, but not the weapon, likely 8 TC
			new /obj/item/clothing/shoes/laceup/electric_proof(src) //Fancy shoes to walk in the maint, like 1 tc
			new/obj/item/clothing/gloves/tackler/combat/pocket_dimention(src)	//entire armory in your hand
			new /obj/item/storage/pouch/medical_injectors/slav(src)	//~5 tc
			

#undef CARP_CARP_CARP

/obj/item/storage/box/syndie_kit/fixer
	icon_state = "syndiebox"
	item_state = "box_of_doom"
	illustration = "writing_syndie"

/obj/item/storage/box/syndie_kit/fixer/PopulateContents()
	new /obj/item/clothing/under/syndicate/fixer(src)	//the best silk we can provide, anchanced sniper suit with name and armor, likely 5 tc worth
	new /obj/item/clothing/mask/sense_deprevation(src)	//Somewhat like breach cleaver, but not the weapon, likely 8 TC
	new /obj/item/clothing/shoes/laceup/electric_proof(src) //Fancy shoes to walk in the maint, like 1 tc
	new/obj/item/clothing/gloves/tackler/combat/pocket_dimention(src)	//entire armory in your hand
	new /obj/item/storage/pouch/medical_injectors/slav(src)	//~5 tc
