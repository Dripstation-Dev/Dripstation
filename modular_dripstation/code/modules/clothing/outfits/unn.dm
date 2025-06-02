/datum/outfit/unn
	name = "UNN Tech"

	id = /obj/item/card/id/unn
	back = /obj/item/storage/backpack/satchel/unknown
	uniform = /obj/item/clothing/under/unn
	suit = /obj/item/clothing/suit/hooded/wintercoat/security/unn
	belt = /obj/item/storage/belt/utility/full/engi
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	ears = /obj/item/radio/headset/military/unn
	l_pocket = /obj/item/storage/pouch/magazine/pistol/pmag
	r_pocket = /obj/item/storage/pouch/pistol/glock17

	box = /obj/item/storage/box/survival
	implants = list()
	backpack_contents = list()

/datum/outfit/unn/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.access += ACCESS_UNN
	W.access += ACCESS_MAINT_TUNNELS
	W.access += ACCESS_EXTERNAL_AIRLOCKS
	W.registered_name = H.real_name
	W.assignment = name
	W.originalassignment = "UNN"
	W.update_label()

/datum/outfit/unn/cameraman
	name = "UNN cameraman"

	suit = /obj/item/clothing/suit/armor/vest/bulletproof/spesspress
	belt = null
	l_pocket = null
	r_pocket = null

	backpack_contents = list(/obj/item/camera = 1,
							/obj/item/taperecorder = 1,
							/obj/item/clothing/neck/bodycam = 1)

/datum/outfit/unn/reporter
	name = "UNN reporter"

	suit = /obj/item/clothing/suit/armor/vest/bulletproof/spesspress
	uniform = /obj/item/clothing/under/unn/reporter
	shoes = /obj/item/clothing/shoes/laceup
	belt = null
	l_pocket = null
	r_pocket = null

	backpack_contents = list(/obj/item/camera = 1,
							/obj/item/taperecorder = 1,)

/datum/outfit/unn/security
	name = "UNN Security Specialist"

	head = /obj/item/clothing/head/helmet/unn_enclosed
	glasses = /obj/item/clothing/glasses/hud/security/military
	ears = /obj/item/radio/headset/military/unn/alt
	suit = /obj/item/clothing/suit/armor/vest/unn_ringmail
	suit_store = /obj/item/gun/ballistic/automatic/c20r/vector
	belt = /obj/item/storage/belt/military/assault
	gloves = /obj/item/clothing/gloves/fingerless/combat
	l_pocket = /obj/item/storage/pouch/pistol/flash
	r_pocket = null
	
	box = /obj/item/storage/box/unn
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1)
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/unn/security/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/storage/belt/military/assault/belt_store = H.belt
	for(var/i = 2 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/smgm45, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/extinguisher/mini, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/reagent_containers/autoinjector/medipen/stimpack/traitor/export, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/restraints/handcuffs, null, TRUE, TRUE)


/datum/outfit/unn/operative
	name = "UNN Contracted Operative"
	
	mask = /obj/item/clothing/mask/neck_gaiter
	glasses = /obj/item/clothing/glasses/night/unn
	uniform = /obj/item/clothing/under/unn/combat
	accessory = null
	head = /obj/item/clothing/head/helmet/alt/unn
	ears = /obj/item/radio/headset/military/unn/alt
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/unn
	belt = /obj/item/storage/belt/military/assault
	gloves = /obj/item/clothing/gloves/fingerless/combat
	l_pocket = /obj/item/storage/pouch/pistol/flash
	r_pocket = /obj/item/storage/pouch/firstaid/unn

	box = /obj/item/storage/box/unn
	implants = list(/obj/item/implant/mindshield)
	var/randomise_weapon = TRUE
	var/list/random_weapon = list(
		/obj/item/gun/energy/pulse/pistol/unn,
		/obj/item/gun/energy/pulse/carbine/unn,
		/obj/item/gun/energy/pulse/unn,
	)

/datum/outfit/unn/operative/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(randomise_weapon)
		l_hand = pick(random_weapon)
	var/obj/item/organ/cyberimp/eyes/hud/security/Seyes = new(H)
	Seyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)
	to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted.")

/datum/outfit/unn/operative/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/storage/belt/military/assault/belt_store = H.belt
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/extinguisher/mini, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/reagent_containers/autoinjector/medipen/stimpack/traitor/export, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/restraints/handcuffs, null, TRUE, TRUE)

/datum/outfit/unn/operative/heavy

	suit = /obj/item/clothing/suit/armor/vest/bulletproof/combat
	gloves = /obj/item/clothing/gloves/combat/odst/unn
