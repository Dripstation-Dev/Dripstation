/datum/outfit/syndicate
	id = /obj/item/card/id/syndicate/nuke
	back = /obj/item/storage/backpack/syndie
	belt = /obj/item/storage/belt/holster/syndicate/fnx45
	box = /obj/item/storage/box/syndie/nuke	//box for syndicate`s MODERN COMBAT personel
	backpack_contents = list(/obj/item/kitchen/knife/combat/survival = 1)

/datum/outfit/syndicate/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/implant/mindshield/tot_obvious/tms = new(H)	//all syndyboys can glow red on sec scanners for additional identification if they want, medical scaners just check them as mindshielded with nt standart implant. Protecting valuable syndicate assets from outerreality roofers
	tms.implant(H)

/datum/outfit/syndicate/leader
	gloves = /obj/item/clothing/gloves/combat
	l_pocket = /obj/item/storage/pouch/general/large/nuclear

/datum/outfit/syndicate/leader/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	var/datum/martial_art/cqc/justanop = new
	justanop.teach(H)
	var/obj/item/organ/cyberimp/eyes/hud/security/syndicate/Seyes = new(H)
	Seyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)
	to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted.")

/obj/item/tank/internals/oxygen/syndicate
	name = "unknown oxygen tank"
	desc = "A grey colored tank of oxygen."
	icon_state = "syndicate"
	item_state = "air"
	icon = 'modular_dripstation/icons/obj/tank.dmi'	

/datum/outfit/syndicate/full
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred
	belt = /obj/item/storage/belt/military/webbing/syndicate/gorlex
	back = /obj/item/storage/backpack/syndie
	suit_store = /obj/item/tank/internals/oxygen/syndicate
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/fn45=1,\
		/obj/item/kitchen/knife/combat/survival = 1)

/datum/antagonist/nukeop/lone/equip_op()
	if(!ishuman(owner.current))
		return
	var/mob/living/carbon/human/H = owner.current

	H.set_species(/datum/species/human) //Plasamen burn up otherwise, and lizards are vulnerable to asimov AIs

	H.equipOutfit(nukeop_outfit)
	var/obj/item/clothing/head/helmet/space/hardsuit/syndi/HE = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(istype(HE, /obj/item/clothing/head/helmet/space/hardsuit/syndi))
		HE.spaceready(H)
	return TRUE

/datum/outfit/nuclear_operative
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/bloodred/preview
	head = /obj/item/clothing/head/helmet/space/hardsuit/syndi/bloodred/preview

/datum/outfit/nuclear_operative_elite
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/elite/preview
	head = /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/preview

/datum/outfit/syndicate/no_crystals
	var/faction = "an agent of The Syndicate"

/datum/outfit/syndicate/no_crystals/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	to_chat(H, span_notice("<B>You're [faction], sent to accompany the nuclear squad on their mission. \
		Support your allies, and remember: Down with Nanotrasen.</B>"))
	. = ..()

/datum/outfit/syndicate/no_crystals/gorlex
	name = "Syndicate Operative - Gorlex Reinforcement"
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/hardened/gorlex
	head = /obj/item/clothing/head/helmet/hardened/gorlex
	gloves = /obj/item/clothing/gloves/combat/gorlex
	neck = /obj/item/clothing/neck/scarf/red
	glasses = /obj/item/clothing/glasses/cold
	faction = "an agent of the Gorlex Marauders"

/datum/outfit/syndicate/no_crystals/independent
	name = "Syndicate Operative - ACLF Reinforcement"
	suit = /obj/item/clothing/suit/jacket/leather/overcoat/armored
	gloves = /obj/item/clothing/gloves/fingerless/bigboss/combat
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	belt = /obj/item/gun/ballistic/revolver
	mask = /obj/item/clothing/mask/cigarette/cigar
	faction = "The Independent Merk"

/datum/outfit/syndicate/no_crystals/independent/post_equip(mob/living/carbon/human/H)
	..()
	var/limb_slot = pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)	//augmented legs don`t work, hands don`t tested yet

	var/obj/item/bodypart/old_part = H.get_bodypart(limb_slot)
	var/obj/item/bodypart/prosthetic
	switch(limb_slot)
		if(BODY_ZONE_L_ARM)
			prosthetic = new/obj/item/bodypart/l_arm/robot(H)
		if(BODY_ZONE_R_ARM)
			prosthetic = new/obj/item/bodypart/r_arm/robot(H)
		if(BODY_ZONE_L_LEG)
			var/obj/item/bodypart/l_leg/L = H.get_bodypart(BODY_ZONE_L_LEG)
			prosthetic = new/obj/item/bodypart/l_leg/robot(H)
			prosthetic.set_digitigrade(L.use_digitigrade)
		if(BODY_ZONE_R_LEG)
			var/obj/item/bodypart/r_leg/R = H.get_bodypart(BODY_ZONE_R_LEG)
			prosthetic = new/obj/item/bodypart/r_leg/robot(H)
			prosthetic.set_digitigrade(R.use_digitigrade)
	prosthetic.replace_limb(H)
	qdel(old_part)
	H.regenerate_icons()

/datum/outfit/syndicate/no_crystals/cybersun
	name = "Syndicate Operative - Cybersun Reinforcement"
	uniform = /obj/item/clothing/under/syndicate/cybersun/combat
	head = /obj/item/clothing/head/helmet/alt/cybersun
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/cybersun
	belt = /obj/item/melee/transforming/energy/machete
	gloves = /obj/item/clothing/gloves/combat/cybersun/bloody
	glasses = /obj/item/clothing/glasses/sunglasses
	faction = "an agent of the Cybersun Industries"

/datum/outfit/syndicate/no_crystals/cybersun/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/organ/cyberimp/eyes/hud/security/syndicate/Seyes = new(H)
	Seyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)
	to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted.")

/datum/outfit/syndicate/no_crystals/donk
	name = "Syndicate Operative - Donk Reinforcement"
	uniform = /obj/item/clothing/under/syndicate/donk
	suit = /obj/item/clothing/suit/hazardvest/donk
	head = /obj/item/clothing/head/hardhat/weldhat/orange
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/welding
	faction = "an agent of the Donk Corporation"

/datum/outfit/syndicate/no_crystals/donk/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/organ/cyberimp/arm/toolset/tl = new(H)	//don`t work
	tl.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	to_chat(H, "Your arm have been implanted with a cybernetic toolset which will help you keep tools with you.")	

/datum/outfit/syndicate/no_crystals/waffle
	name = "Syndicate Operative - Waffle Reinforcement"
	uniform = /obj/item/clothing/under/syndicate/waffle
	gloves = /obj/item/clothing/gloves/tackler/combat/waffle
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/combat
	head = /obj/item/clothing/head/helmet/alt/waffle
	glasses = /obj/item/clothing/glasses/thermal
	backpack_contents = list(/obj/item/kitchen/knife/combat/survival = 1, \
		/obj/item/reagent_containers/food/snacks/waffles = 1)
	faction = "an agent of the Waffle Corporation"
