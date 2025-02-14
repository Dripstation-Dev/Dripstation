//////////////////UNIFORM//////////////////
/obj/item/clothing/under/rank/centcom/officer/ert/amber
	name = "amber task force combat uniform"
	desc = "It`s grey cause of old Nanotrasen tradition."

/obj/item/clothing/under/rank/centcom/officer/ert/cmd/amber
	name = "amber task force command uniform"
	desc = "Nanotrasen's Internal Security Division low rank officer`s uniform. Wear it loud and proud."

/obj/item/clothing/under/rank/centcom/officer/ert/med/amber
	name = "amber task force medic uniform"
	desc = "WHO CALLED THE MEDIC!?."

//////////////////HELMET//////////////////
/obj/item/clothing/head/helmet/swat/nanotrasen/ert/clocker
	name = "amber specialist helmet"
	desc = "Standart issue Nanotrasen specops helmet. Has built-in night vision goggles."
	icon_state = "erthelmet_nv"
	var/deploed = 0
	actions_types = list(/datum/action/item_action/toggle_helmet_light)

/obj/item/clothing/head/helmet/swat/nanotrasen/ert/clocker/item_action_slot_check(slot)
	if(slot == ITEM_SLOT_HEAD) //we only give the mob the ability to toggle the nvg if he's wearing the helmet.
		return 1

/obj/item/clothing/head/helmet/swat/nanotrasen/ert/clocker/attack_self(mob/living/carbon/human/user)
	var/obj/item/clothing/glasses/night/clocker/nvg = new /obj/item/clothing/glasses/night/clocker
	if(!deploed)
		user.equip_to_slot_if_possible(nvg, ITEM_SLOT_EYES, TRUE)
		var/obj/item/clothing/glasses/G = user.glasses
		if(istype(G, /obj/item/clothing/glasses/night/clocker))
			deploed = 1
		else
			user.visible_message(span_warning("You should try to free your glasses slot to do that."),\
				span_warning("[user] fails to put on his own NVG."))
	else
		QDEL_NULL(nvg)
		deploed = 0

/obj/item/clothing/head/helmet/swat/nanotrasen/ert/clocker/Destroy()
	if(deploed)
		var/mob/living/carbon/human/user = usr
		QDEL_NULL(user.glasses)

/obj/item/clothing/glasses/night/clocker
	name = "amber specialist NVG"
	desc = "Standart issue Nanotrasen specops NVG. Has been built into the helmet."
	icon_state = "clocker_nvg"
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	flash_protect = 0 // less damage to my precious eyes
	item_flags = ABSTRACT | DROPDEL
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/clothing/head/helmet/swat/nanotrasen/ert/paranormal
	name = "amber paranormal specialist helmet"
	desc = "Custom Nanotrasen specops helmet. This one makes the user psionically deaf."
	icon_state = "erthelmet_paranormal"

/obj/item/clothing/head/helmet/swat/nanotrasen/ert/paranormal/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, FALSE, FALSE, TRUE, ITEM_SLOT_OCLOTHING)

/obj/item/clothing/head/beret/sec/amber_engineer
	name = "amber engineer beret"
	desc = "A beret for the mundane life of an amber task force tech."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "ertberet_eng"

/obj/item/clothing/head/beret/corpsec/amber_commander
	name = "amber officer beret"
	desc = "A special blue beret for the mundane life of an amber task force commander."
	icon = 'modular_dripstation/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "ertberet_cmd"

//////////////////OTHER//////////////////
/obj/item/clothing/shoes/combat/swat/combat_knife/Initialize(mapload)
	. = ..()
	new /obj/item/kitchen/knife/combat(src)

// amber task force vest loadouts
// To note: each vest has 7 normal slots - Hopek
/obj/item/storage/belt/military/webbing/nt/amber/Initialize(mapload) // Amber Trooper
	. = ..()
	new /obj/item/ammo_box/magazine/recharge(src)
	new /obj/item/ammo_box/magazine/recharge(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/flashlight/flare/signal(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)


/obj/item/storage/belt/military/webbing/nt/amber_commander/Initialize(mapload) // Amber Commander
	. = ..()
	new /obj/item/ammo_box/magazine/wt550m9/wtap(src)
	new /obj/item/ammo_box/magazine/wt550m9/wt_kraken(src)
	new /obj/item/reagent_containers/autoinjector/medipen(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/melee/classic_baton/telescopic(src)
	new /obj/item/megaphone(src)
	new /obj/item/restraints/handcuffs/cable/zipties(src)

/obj/item/storage/belt/military/webbing/nt/amber_medical/Initialize(mapload) // Amber Medic
	. = ..()
	new /obj/item/melee/classic_baton/telescopic(src)
	new /obj/item/reagent_containers/medspray/synthflesh(src) // for getting people back to defib range
	new /obj/item/reagent_containers/medspray/styptic(src)
	new /obj/item/reagent_containers/medspray/silver_sulf(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/reagent_containers/autoinjector/medipen/survival(src)
	new /obj/item/reagent_containers/autoinjector/combat(src)


/datum/outfit/amber
	name = "Amber Operative"
	var/assi = "Operative"

	uniform = /obj/item/clothing/under/rank/centcom/officer/ert/amber
	suit = /obj/item/clothing/suit/armor/hardened/amber
	shoes = /obj/item/clothing/shoes/combat/combat_knife
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/headset_cent/alt
	glasses = /obj/item/clothing/glasses/sunglasses
	mask = /obj/item/clothing/mask/gas/sechailer/task_force
	belt = /obj/item/storage/belt/military/webbing/nt/amber
	suit_store = /obj/item/gun/ballistic/automatic/laser
	back = /obj/item/storage/backpack/unknown
	head = /obj/item/clothing/head/helmet/swat/nanotrasen/ert
	l_pocket = /obj/item/flashlight/seclite
	id = /obj/item/card/id/ert/amber
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert)
	box = /obj/item/storage/box/ert
	backpack_contents = list(
		/obj/item/melee/baton/loaded=1,
		)


/datum/outfit/amber/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	H.facial_hair_style = "None" // Everyone in the Amber task force is bald and has no facial hair
	H.hair_style = "None"
	
	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/clothing/mask/bandana/durathread/D = new /obj/item/clothing/mask/bandana/durathread(src)
	D.AltClick(H)

	var/obj/item/card/id/W = H.wear_id
	W.access = get_centcom_access("CentCom Official")
	W.access += ACCESS_MAINT_TUNNELS
	W.access += ACCESS_WEAPONS
	W.access += ACCESS_HEADS
	W.access += ACCESS_BRIG
	W.assignment = "[assi] - Amber Task Force"
	W.registered_name = W.assignment
	W.update_label(W.registered_name, W.assignment)

	H.ignores_capitalism = TRUE // Yogs -- Lets the Amber force buy a damned smoke for christ's sake


/datum/outfit/amber/commander
	name = "Amber Officer"
	assi = "Officer"

	head = /obj/item/clothing/head/beret/corpsec/amber_commander
	belt = /obj/item/storage/belt/military/webbing/nt/amber_commander
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	glasses = /obj/item/clothing/glasses/hud/security
	suit_store = /obj/item/gun/ballistic/automatic/wt550/combat
	uniform = /obj/item/clothing/under/rank/centcom/officer/ert/cmd/amber
	back = /obj/item/storage/backpack/ert
	r_pocket = /obj/item/gun/energy/e_gun/mini/secure
	suit = /obj/item/clothing/suit/armor/hardened/amber/command
	shoes = /obj/item/clothing/shoes/combat/swat/combat_knife
	backpack_contents = list(
		/obj/item/shield/riot/tele,
		/obj/item/clothing/mask/gas/sechailer/task_force = 1
		)


/datum/outfit/amber/melee
	name = "Amber Melee Specialist"
	assi = "Melee Specialist"

	mask = /obj/item/clothing/mask/gas/sechailer/task_force
	suit = /obj/item/clothing/suit/armor/hardened/amber/security
	back = /obj/item/storage/backpack/satchel/unknown
	glasses = /obj/item/clothing/glasses/hud/security
	backpack_contents = list(
		/obj/item/shield/riot/tele,
		/obj/item/melee/transforming/vib_blade = 1
		)

/datum/outfit/amber/melee/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/organ/cyberimp/arm/nt_mantis/ntmantis_r = new
	ntmantis_r.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/arm/nt_mantis/left/ntmantis_l = new
	ntmantis_l.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	to_chat(H, "Your arms has been implanted with a cybernetic combat implants which will help you slice some people.")

/datum/outfit/amber/heavy
	name = "Amber Heavyweapon Specialist"
	assi = "Heavyweapon Specialist"

	suit = /obj/item/clothing/suit/space/hardsuit/swat/mk4
	head = null
	mask = /obj/item/clothing/mask/breath/tactical
	suit_store = /obj/item/gun/energy/laser/hellgun/scattershot
	
/datum/outfit/amber/security
	name = "Amber Detaining Specialist"
	assi = "Detaining Specialist"

	head = /obj/item/clothing/head/helmet/swat/nanotrasen/ert/clocker
	gloves = /obj/item/clothing/gloves/fingerless/bigboss/combat
	mask = /obj/item/clothing/mask/gas/sechailer/task_force
	belt = /obj/item/melee/classic_baton/blc
	back = /obj/item/storage/backpack/satchel/unknown
	suit_store = /obj/item/gun/ballistic/automatic/pistol/glock17
	backpack_contents = list(
		/obj/item/storage/box/zipties=1
		)

/datum/outfit/amber/security/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return
	var/datum/martial_art/cqc/clocker = new
	clocker.teach(H)

/datum/outfit/amber/paranormal
	name = "Amber Paradimentional Specialist"
	assi = "Paradimentional Specialist"

	head = /obj/item/clothing/head/helmet/swat/nanotrasen/ert/paranormal
	suit = /obj/item/clothing/suit/armor/hardened/amber/paradimensional
	mask = /obj/item/clothing/mask/breath/tactical

/datum/outfit/amber/medic
	name = "Amber Field Medic"
	assi = "Medical Specialist"

	glasses = /obj/item/clothing/glasses/hud/health
	suit = /obj/item/clothing/suit/armor/hardened/amber/medic
	belt = /obj/item/storage/belt/military/webbing/nt/amber_medical
	back = /obj/item/defibrillator/loaded
	mask = /obj/item/clothing/mask/breath/tactical
	uniform = /obj/item/clothing/under/rank/centcom/officer/ert/med/amber
	r_pocket = /obj/item/storage/pouch/surgery/advanced
	suit_store = /obj/item/gun/energy/e_gun/advtaser/secure
	head = /obj/item/clothing/head/helmet/swat/nanotrasen/med
	
/datum/outfit/amber/engineer
	name = "Amber Technician"
	assi = "Tech Specialist"
	glasses = /obj/item/clothing/glasses/hud/diagnostic
	suit = /obj/item/clothing/suit/armor/hardened/amber/engineer
	belt = /obj/item/storage/belt/utility/full
	mask = /obj/item/clothing/mask/breath/tactical
	back = /obj/item/storage/backpack/ert/engineer
	r_pocket = /obj/item/storage/pouch/tools
	suit_store = /obj/item/gun/energy/e_gun/advtaser/secure
	head = /obj/item/clothing/head/beret/sec/amber_engineer
