/datum/outfit/shellguard
	name = "Shellguard Clerk"

	id = /obj/item/card/id/idtags/shellguard
	back = /obj/item/storage/backpack/unknown
	glasses = /obj/item/clothing/glasses/hud/security/military
	uniform = /obj/item/clothing/under/shellguard
	suit = /obj/item/clothing/suit/armor/vest/shellguard/brand
	shoes = /obj/item/clothing/shoes/combat/combat_knife
	gloves = /obj/item/clothing/gloves/combat/shelg
	ears = /obj/item/radio/headset/military/shellguard
	box = /obj/item/storage/box/shellguard
	implants = list()
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pistolm9mm,
		)
	l_pocket = /obj/item/gun/ballistic/automatic/pistol/glock18/shelg
	r_pocket = null


/datum/outfit/shellguard/guard
	name = "Shellguard Guard"

	head = /obj/item/clothing/head/helmet/shellguard
	suit = /obj/item/clothing/suit/armor/vest/shellguard
	ears = /obj/item/radio/headset/military/shellguard/alt
	uniform = /obj/item/clothing/under/shellguard/guard
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pistolm9mm = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/storage/box/beanbag = 1,
		/obj/item/storage/box/slug = 1,
		)
	belt = /obj/item/storage/belt/military/webbing/shellguard/full
	r_hand = /obj/item/gun/ballistic/shotgun/automatic/combat

/datum/outfit/shellguard/feldsher
	name = "Shellguard Feldsher"
	
	head = /obj/item/clothing/head/beret/sec/shellguard
	glasses = /obj/item/clothing/glasses/hud/health/military
	suit = /obj/item/clothing/suit/armor/vest/shellguard/brand
	ears = /obj/item/radio/headset/military/shellguard/alt
	uniform = /obj/item/clothing/under/shellguard/feldsher
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pistolm9mm = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		)
	belt = /obj/item/storage/belt/military/webbing/shellguardmed/full

/datum/outfit/shellguard/riotop
	name = "Shellguard Riot Control Specialist"
	
	head = /obj/item/clothing/head/helmet/shellguard_sallet/combat
	suit = /obj/item/clothing/suit/armor/riot/shellguard/brand
	ears = /obj/item/radio/headset/military/shellguard/alt
	uniform = /obj/item/clothing/under/shellguard/combat
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pistolm9mm = 1,
		/obj/item/storage/box/beanbag = 1,
		/obj/item/ammo_box/magazine/m12g/slug = 1,
		/obj/item/ammo_box/magazine/m12g/frag = 1,
		/obj/item/ammo_box/magazine/m12g/flechette = 1,
		/obj/item/ammo_box/magazine/m12g/dragon = 1,
		)
	belt = /obj/item/storage/belt/military/webbing/shellguard/full
	suit_store = /obj/item/gun/ballistic/shotgun/bulldog/m12

/datum/outfit/shellguard/op
	name = "Shellguard Operator"
	
	head = /obj/item/clothing/head/helmet/shellguard_sallet/combat
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/combat/shellguard/brand
	ears = /obj/item/radio/headset/military/shellguard/alt
	uniform = /obj/item/clothing/under/shellguard/combat
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pistolm9mm = 1,
		/obj/item/ammo_box/magazine/sa450 = 1,
		)
	belt = /obj/item/storage/belt/military/webbing/shellguard/op
	suit_store = /obj/item/gun/ballistic/automatic/sa450

/datum/outfit/shellguard/officer
	name = "Shellguard Officer"

	head = /obj/item/clothing/head/beret/captain/shellguard
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/aviators 
	suit = /obj/item/clothing/suit/armor/vest/hosjacket/shellguard
	ears = /obj/item/radio/headset/military/shellguard/alt
	uniform = /obj/item/clothing/under/shellguard/combat
	backpack_contents = list(
		/obj/item/assembly/flash/handheld = 1,
		)
	belt = /obj/item/storage/belt/holster/shellguard
	l_pocket = /obj/item/storage/pouch/general/large/pmc
	r_pocket = /obj/item/storage/pouch/magazine/pistol/mateba

/datum/outfit/shellguard/officer/operative
	name = "Shellguard Officer - Heavy"
	
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/combat/shellguard/brand

/datum/outfit/shellguard/tech
	name = "Shellguard Tech Specialist"

	head = /obj/item/clothing/head/beret/captain/shellguard/black
	glasses = /obj/item/clothing/glasses/hud/diagnostic/military
	ears = /obj/item/radio/headset/military/shellguard/alt
	suit = /obj/item/clothing/suit/armor/vest/shellguard
	uniform = /obj/item/clothing/under/shellguard/tech
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pistolm9mm = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		)
	belt = /obj/item/storage/belt/military/webbing/shellguard/tech
