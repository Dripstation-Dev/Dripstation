/datum/outfit/merc
	name = "Freelancer Mercenary - Basic"
	
	mask = /obj/item/clothing/mask/russian_balaclava/black
	uniform = /obj/item/clothing/under/freemerk
	glasses = /obj/item/clothing/glasses/hud/security/pmc_ballistic
	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/armor/vest/iotv
	belt = /obj/item/storage/belt/military/assault
	l_pocket = /obj/item/storage/pouch/firstaid/full
	r_pocket = /obj/item/storage/pouch/pistol/glock18
	ears = /obj/item/radio/headset/military/alt
	shoes = /obj/item/clothing/shoes/combat/combat_knife
	box = /obj/item/storage/box/survival
	id = /obj/item/card/id/idtags/freelancer
	back = /obj/item/storage/backpack/unknown
	backpack_contents = list(
		/obj/item/reagent_containers/spray/pepper = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/grenade/syndieminibomb/concussion/frag = 1,
		/obj/item/clothing/glasses/night = 1,
		)
	implants = list(/obj/item/implant/freedom)

/datum/outfit/merc/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.access += ACCESS_MAINT_TUNNELS
	W.access += ACCESS_EXTERNAL_AIRLOCKS
	W.registered_name = H.real_name
	W.originalassignment = "Freelancer"
	W.update_label()

	if(istype(H.belt, /obj/item/storage/belt/military/assault))
		var/obj/item/storage/belt/military/assault/milbelt_store = H.belt
		SEND_SIGNAL(milbelt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/f556, null, TRUE, TRUE)
		SEND_SIGNAL(milbelt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/f556, null, TRUE, TRUE)
		SEND_SIGNAL(milbelt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/f556, null, TRUE, TRUE)
		SEND_SIGNAL(milbelt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/pistolm9mm/pmag, null, TRUE, TRUE)
		SEND_SIGNAL(milbelt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/melee/emergency_forcing_tool/varyag, null, TRUE, TRUE)
		SEND_SIGNAL(milbelt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/extinguisher/mini, null, TRUE, TRUE)
		SEND_SIGNAL(milbelt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/reagent_containers/autoinjector/medipen/stimpack/traitor/export, null, TRUE, TRUE)

/datum/outfit/merc/operative
	name = "Freelancer Mercenary - Operative"

	suit = /obj/item/clothing/suit/space/hardsuit/syndi/merk
	suit_store = /obj/item/gun/ballistic/automatic/ar/famas

/datum/outfit/merc/operative/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(istype(H.belt, /obj/item/storage/belt/military/assault))
		var/obj/item/storage/belt/military/assault/milbelt_store = H.belt
		for(var/i = 2 to 0 step -1)
			SEND_SIGNAL(milbelt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/r556, null, TRUE, TRUE)

/datum/outfit/merc/officer
	name = "Freelancer Mercenary - Officer"

	suit = /obj/item/clothing/suit/space/hardsuit/syndi/merk
	suit_store = /obj/item/gun/ballistic/automatic/powered/gauss_rifle
	belt = /obj/item/storage/belt/holster/syndicate/fnx45
	r_pocket = /obj/item/storage/pouch/general/large/pmc
	box = /obj/item/storage/box/syndie/nuke
	backpack_contents = list(
		/obj/item/grenade/smokebomb = 1,
		/obj/item/grenade/syndieminibomb/concussion/frag = 1,
		/obj/item/clothing/glasses/night = 1,
		/obj/item/screwdriver/nuke = 1,
		/obj/item/ammo_box/magazine/gauss = 1,
		/obj/item/ammo_box/magazine/gauss/lance = 1,
		/obj/item/stock_parts/cell/gun/upgraded = 2,
		/obj/item/melee/emergency_forcing_tool/varyag = 1,
		)

/datum/outfit/merc/operative/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/datum/martial_art/cqc/justanop = new
	justanop.teach(H)
