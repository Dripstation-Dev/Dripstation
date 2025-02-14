/datum/outfit/hephaestus
	name = "Hephaestus Tech"

	id = /obj/item/card/id/hephaestus
	back = /obj/item/storage/backpack/unknown
	uniform = /obj/item/clothing/under/hephaestus
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless/combat
	ears = /obj/item/radio/headset/military/militech
	l_pocket = /obj/item/storage/pouch/magazine/pistol/pmag
	r_pocket = /obj/item/storage/pouch/pistol/glock18
	box = /obj/item/storage/box/survival
	implants = list()
	backpack_contents = list()
	var/list/random_cybernetic = list(
		/obj/item/organ/heart/cybernetic/upgraded,
		/obj/item/organ/liver/cybernetic/upgraded,
		/obj/item/organ/stomach/cybernetic/upgraded,
		/obj/item/organ/lungs/cybernetic/upgraded,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/eyes/robotic/xray,
		/obj/item/organ/cyberimp/eyes/hud/medical,
		/obj/item/organ/cyberimp/eyes/hud/diagnostic,
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/brain/anti_stun,
		/obj/item/organ/cyberimp/brain/anti_drop,
		/obj/item/organ/cyberimp/arm/toolset/surgery,
		/obj/item/organ/cyberimp/arm/toolset,
		/obj/item/organ/cyberimp/arm/nt_mantis,
		/obj/item/organ/cyberimp/chest/reviver,
		/obj/item/organ/cyberimp/chest/spinalspeed,
		/obj/item/organ/cyberimp/chest/nutriment
	)

/datum/outfit/hephaestus/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.registered_name = H.real_name
	W.assignment = name
	W.originalassignment = "Hephaestus"
	W.update_label()

	var/cybernetic_type = pick(random_cybernetic)
	if(cybernetic_type)
		var/obj/item/organ/cybernetic = new cybernetic_type()
		// Timer is needed because doing it immediately doesn't REPLACE organs for some unknown reason, so got to do it next tick or whatever.
		addtimer(CALLBACK(cybernetic, TYPE_PROC_REF(/obj/item/organ, Insert), H), 1)
		to_chat(H, "You have been implanted with a [cybernetic.name].")
		return

/datum/outfit/hephaestus/official
	name = "Hephaestus Official"

	back = /obj/item/storage/backpack/satchel/unknown
	uniform = /obj/item/clothing/under/hephaestus/official
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/military/militech/alt
	belt = /obj/item/storage/belt/holster/syndicate/fnx45
	l_pocket = null
	r_pocket = null
	backpack_contents = list()

/datum/outfit/hephaestus/operative
	name = "Militech Operative - Basic"
	
	mask = /obj/item/clothing/mask/russian_balaclava/black
	uniform = /obj/item/clothing/under/hephaestus/militech
	glasses = /obj/item/clothing/glasses/night
	gloves = /obj/item/clothing/gloves/combat/militech
	suit = /obj/item/clothing/suit/armor/vest/iotv
	belt = /obj/item/storage/belt/military/army
	ears = /obj/item/radio/headset/military/militech/alt
	shoes = /obj/item/clothing/shoes/combat/combat_knife
	box = /obj/item/storage/box/militech
	id = /obj/item/card/id/idtags/militech
	backpack_contents = list(
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/grenade/smokebomb = 1,
		)
	implants = list(/obj/item/implant/freedom)

/datum/outfit/hephaestus/operative/grenadier
	name = "Militech Operative - Grenadier"

	mask = /obj/item/clothing/mask/russian_balaclava/no_ru
	head = /obj/item/clothing/head/helmet/alt
	suit = /obj/item/clothing/suit/armor/vest/iotv/gen4
	uniform = /obj/item/clothing/under/hephaestus/militech/turtle
	r_pocket = /obj/item/storage/pouch/shotgun/full_rip
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/glock18 = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/ammo_box/magazine/m12g/slug = 1,
		/obj/item/ammo_box/magazine/m12g = 1,
		)
	belt = /obj/item/storage/belt/military/webbing/grenade/full
	suit_store = /obj/item/gun/ballistic/shotgun/bulldog/m12

/datum/outfit/hephaestus/operative/ar
	name = "Militech Operative - Rifle Specialist"

	mask = /obj/item/clothing/mask/scarf
	head = /obj/item/clothing/head/helmet/militech
	suit = /obj/item/clothing/suit/armor/vest/iotv/gen4
	belt = /obj/item/storage/belt/military/webbing/militech/ar
	suit_store = /obj/item/gun/ballistic/automatic/ar/mk4/grn
	uniform = /obj/item/clothing/under/hephaestus/militech/turtle

/datum/outfit/hephaestus/operative/mantis
	name = "Militech Operative - Close Combat"

	uniform = /obj/item/clothing/under/hephaestus/militech/turtleblack

/datum/outfit/hephaestus/operative/mantis/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/obj/item/organ/cyberimp/arm/nt_mantis/ntmantis_r = new
	ntmantis_r.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/arm/nt_mantis/left/ntmantis_l = new
	ntmantis_l.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	to_chat(H, "Your arms has been implanted with a cybernetic combat implants which will help you slice some people.")

/datum/outfit/hephaestus/operative/machinegun
	name = "Militech Operative - Machinegunner"

	mask = /obj/item/clothing/mask/scarf
	head = /obj/item/clothing/head/helmet/militech
	suit = /obj/item/clothing/suit/armor/vest/militech_carrier
	belt = /obj/item/storage/belt/military/army
	uniform = /obj/item/clothing/under/hephaestus/militech/turtle
	r_hand = /obj/item/gun/ballistic/automatic/l6_saw/dna
	backpack_contents = list(
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/grenade/smokebomb = 1,
		)

/datum/outfit/hephaestus/operative/machinegun/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/storage/belt/military/army/belt_store = H.belt
	for(var/i = 2 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/mm556x45_100, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/mm556x45_100/ssaap, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/extinguisher/mini, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/reagent_containers/autoinjector/medipen/stimpack/large, null, TRUE, TRUE)

/datum/outfit/hephaestus/operative/sniper
	name = "Militech Operative - Sniper"

	mask = /obj/item/clothing/mask/scarf
	glasses = /obj/item/clothing/glasses/thermal
	suit = /obj/item/clothing/suit/hooded/wintercoat/security/militech
	belt = /obj/item/storage/belt/military/webbing/lbv88
	uniform = /obj/item/clothing/under/hephaestus/militech/turtle
	suit_store = /obj/item/gun/ballistic/rifle/sniper_rifle/militech
	backpack_contents = list(
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/grenade/smokebomb = 1,
		)

/datum/outfit/hephaestus/operative/sniper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/storage/belt/military/webbing/lbv88/belt_store = H.belt
	for(var/i = 3 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/sniper_rounds, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/extinguisher/mini, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/reagent_containers/autoinjector/medipen/stimpack/large, null, TRUE, TRUE)


/datum/outfit/hephaestus/operative/lieutenant
	name = "Militech Operative - Lieutenant"

	mask = /obj/item/clothing/mask/russian_balaclava/black_skull
	head = /obj/item/clothing/head/beret/sec/militech
	suit = /obj/item/clothing/suit/armor/vest/militech_carrier
	belt = /obj/item/storage/belt/holster/syndicate/fnx45
	uniform = /obj/item/clothing/under/hephaestus/militech/gex
	l_pocket = /obj/item/storage/pouch/general/large/pmc
	r_pocket = /obj/item/storage/pouch/magazine/toploader556
	suit_store = /obj/item/gun/ballistic/automatic/m90/m31a1
	backpack_contents = list(
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/grenade/smokebomb = 1,
		)
	
/datum/outfit/hephaestus/operative/lieutenant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/datum/martial_art/cqc/justanop = new
	justanop.teach(H)

	var/obj/item/clothing/suit/armor/vest/militech_carrier/armor_webbing = H.wear_suit
	for(var/i = 2 to 0 step -1)
		SEND_SIGNAL(armor_webbing, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/m556, null, TRUE, TRUE)
