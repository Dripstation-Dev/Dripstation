/datum/outfit/terragov
	name = "T.G.A.F. Infantry Trooper"
	
	suit = /obj/item/clothing/suit/armor/vest/light_tgarmy
	head = /obj/item/clothing/head/helmet/terragov
	ears = /obj/item/radio/headset/military/alt
	mask = /obj/item/clothing/mask/gas/m40
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/ballistic
	uniform = /obj/item/clothing/under/syndicate/camo/urban
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack/unknown
	r_pocket = /obj/item/storage/pouch/pistol/m1911
	l_pocket = /obj/item/storage/pouch/firstaid/full
	belt = /obj/item/storage/belt/military/assault
	id = /obj/item/card/id/idtags
	box = /obj/item/storage/box/forcing
	suit_store = /obj/item/gun/ballistic/automatic/ar/tgaf416
	backpack_contents = list(
		/obj/item/flashlight/seclite = 1,
		/obj/item/ammo_box/magazine/r556 = 1,
		/obj/item/lighter/terragov = 1
	)

/datum/outfit/terragov/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.access += ACCESS_TERRAGOV
	W.access += ACCESS_TERRAGOVMC
	W.access += ACCESS_MAINT_TUNNELS
	W.access += ACCESS_EXTERNAL_AIRLOCKS
	W.registered_name = H.real_name
	W.assignment = name
	W.originalassignment = "Terragov"
	W.update_label()
	
	H.facial_hair_style = "None" // Everyone in the TerraGov Army has no facial hair
	H.hair_style = "Buzzcut"

/datum/outfit/terragov/fullbelt
	backpack_contents = list(
		/obj/item/flashlight/seclite = 1
	)

/datum/outfit/terragov/fullbelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/storage/belt/military/assault/belt_store = H.belt
	for(var/i = 2 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/m45, null, TRUE, TRUE)
	for(var/i = 3 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/r556, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/flashlight/flare, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/grenade, null, TRUE, TRUE)

/datum/outfit/terragov/desert_st
	name = "T.G.A.F. Desert Storm Trooper"
	
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/combat/terragov_army
	shoes = /obj/item/clothing/shoes/combat/desert
	suit = /obj/item/clothing/suit/armor/vest/heavy_tgarmy
	belt = /obj/item/storage/belt/military/army
	mask = /obj/item/clothing/mask/scarf


/datum/outfit/terragov/desert_st/fullbelt
	backpack_contents = list(
		/obj/item/flashlight/seclite = 1,
		/obj/item/lighter/terragov = 1
	)
/datum/outfit/terragov/desert_st/fullbelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/storage/belt/military/army/belt_store = H.belt
	for(var/i = 2 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/m45, null, TRUE, TRUE)
	for(var/i = 3 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/r556, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/flashlight/flare, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/grenade, null, TRUE, TRUE)

/datum/outfit/terragov/desert_st/machinegun
	name = "T.G.A.F. Desert Machineguner"

	r_hand = /obj/item/gun/ballistic/automatic/l6_saw/dna
	backpack_contents = list(
		)

/datum/outfit/terragov/desert_st/machinegun/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/storage/belt/military/army/belt_store = H.belt
	for(var/i = 2 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/mm556x45_100, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/mm556x45_100/ssaap, null, TRUE, TRUE)

/datum/outfit/terragov/tgaf_lieutenant
	name = "T.G.A.F. Lieutenant"

	uniform = /obj/item/clothing/under/syndicate/camo/urban/command
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/clothing/mask/gas/sechailer/swat/military
	head = /obj/item/clothing/head/beret/terragov_officer
	belt = null
	r_pocket = /obj/item/storage/pouch/pistol/m1911signature
	l_pocket = /obj/item/storage/pouch/general/large/pmc
	back = /obj/item/storage/backpack/satchel/unknown

/datum/outfit/terragov/tgmc
	name = "T.G.M.C. Marine"

	uniform = /obj/item/clothing/under/terramarine
	suit = /obj/item/clothing/suit/space/hardsuit/marine
	shoes = /obj/item/clothing/shoes/combat/combat_knife
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/clothing/mask/gas/tactical
	belt = /obj/item/storage/belt/military/webbing/terragov
	r_pocket = /obj/item/storage/pouch/pistol/fn45
	box = /obj/item/storage/box/militech
	suit_store = /obj/item/gun/ballistic/automatic/ar/mk4/attachments
	backpack_contents = list(
		/obj/item/lighter/terragov = 1
		)

/datum/outfit/terragov/tgmc/medic
	name = "T.G.M.C. Medic"

	suit = /obj/item/clothing/suit/space/hardsuit/marine/medic
	suit_store = /obj/item/gun/ballistic/automatic/laser/tgaf

/datum/outfit/terragov/tgmc/command
	name = "T.G.M.C. Officer"

	suit = /obj/item/clothing/suit/space/hardsuit/marine/command
	suit_store = /obj/item/gun/ballistic/automatic/laser/tgaf

/datum/outfit/terragov/odst
	name = "TerraGov Orbital Drop Ship Trooper"

	uniform = /obj/item/clothing/under/blackops/uni
	head = /obj/item/clothing/head/helmet/odst
	suit = /obj/item/clothing/suit/armor/vest/light_odst
	shoes = /obj/item/clothing/shoes/combat/combat_knife
	gloves = /obj/item/clothing/gloves/combat/odst
	r_pocket = /obj/item/storage/pouch/pistol/fn45
	suit_store = /obj/item/gun/energy/pulse/carbine/tgaf
	box = /obj/item/storage/box/militech

/datum/outfit/terragov/odst
	name = "TerraGov Orbital Drop Ship Trooper"

	suit = /obj/item/clothing/suit/armor/vest/light_odst/engineer

/datum/outfit/terragov/odst
	name = "TerraGov Orbital Drop Ship Trooper"

	suit = /obj/item/clothing/suit/armor/vest/light_odst/medic

/datum/outfit/terragov/odst
	name = "TerraGov Orbital Drop Ship Trooper"

	suit = /obj/item/clothing/suit/armor/vest/light_odst/command

/datum/outfit/terragov/helldiver
	name = "Terra Government National Guard"

	head = /obj/item/clothing/head/helmet/helldiver
	suit = /obj/item/clothing/suit/armor/helldiver
	neck = /obj/item/clothing/neck/helldiver
	belt = /obj/item/storage/belt/military/helldiver
	uniform = /obj/item/clothing/under/blackops
	r_pocket = /obj/item/storage/pouch/pistol/fn45
	box = /obj/item/storage/box/militech


/datum/outfit/spacepol
	name = "Spacepol Officer"

	uniform = /obj/item/clothing/under/rank/security/spacepol
	suit = /obj/item/clothing/suit/armor/vest/blueshirt
	belt = /obj/item/storage/belt/holster/m1911
	head = /obj/item/clothing/head/helmet/police
	gloves = /obj/item/clothing/gloves/fingerless/combat
	shoes = /obj/item/clothing/shoes/jackboots
	mask = /obj/item/clothing/mask/gas/sechailer/swat/spacepol
	glasses = /obj/item/clothing/glasses/sunglasses
	r_pocket = /obj/item/storage/pouch/general/large/spacepolice
	l_pocket = /obj/item/flashlight/seclite
	id = /obj/item/card/id/idtags
	back = /obj/item/storage/backpack/unknown
	box = /obj/item/storage/box/forcing
	backpack_contents = list(
		/obj/item/lighter/terragov = 1
		)
