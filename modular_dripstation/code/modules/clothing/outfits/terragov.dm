/datum/outfit/terragov
	name = "TerraGov Military Infantry"
	
	suit = /obj/item/clothing/suit/armor/vest/light_tgarmy
	head = /obj/item/clothing/head/helmet/terragov
	ears = /obj/item/radio/headset/military/alt
	mask = /obj/item/clothing/mask/gas/bio
	glasses = /obj/item/clothing/glasses/ballistic
	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/color/grey
	back = /obj/item/storage/backpack/unknown
	r_pocket = /obj/item/storage/pouch/pistol/m1911
	l_pocket = /obj/item/flashlight/seclite
	id = /obj/item/card/id/idtags
	box = /obj/item/storage/box/survival
	suit_store = /obj/item/gun/ballistic/automatic/ar/tgm16

/datum/outfit/terragov/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.registered_name = H.real_name
	W.assignment = name
	W.originalassignment = "Terragov"
	W.update_label()

/datum/outfit/terragov/mil_officer
	name = "TerraGov Military Officer"

	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	r_pocket = /obj/item/storage/pouch/pistol/m1911signature
	l_pocket = /obj/item/storage/pouch/general/large/pmc
	back = /obj/item/storage/backpack/satchel/unknown

/datum/outfit/terragov/tgmc
	name = "TerraGov Marine"

	uniform = /obj/item/clothing/under/terramarine
	suit = null
	shoes = /obj/item/clothing/shoes/combat/combat_knife
	gloves = /obj/item/clothing/gloves/combat
	mask = /obj/item/clothing/mask/gas/tactical
	belt = /obj/item/storage/belt/military/webbing/terragov
	r_pocket = /obj/item/storage/pouch/pistol/fn45
	box = /obj/item/storage/box/militech
	suit_store = /obj/item/gun/energy/pulse/carbine/tgmc
	backpack_contents = list(
		)


/datum/outfit/terragov/odst
	name = "Orbital Drop Ship Trooper"


	gloves = /obj/item/clothing/gloves/combat/odst
	r_pocket = /obj/item/storage/pouch/pistol/fn45
	box = /obj/item/storage/box/militech

/datum/outfit/terragov/helldiver
	name = "Terra Government National Guard"

	
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
	box = /obj/item/storage/box/survival
