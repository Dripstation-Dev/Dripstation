///////Unsorted///////
////With complex cybernetic pr this should be moved to normal file
/obj/item/organ/cyberimp/brain/anti_stun/gamma
	name = "\improper nanotrasen brand CNS Rebooter implant"

/obj/item/organ/cyberimp/brain/anti_stun/gamma/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, "innate_empproof")

/obj/item/organ/cyberimp/chest/reviver/gamma
	name = "\improper nanotrasen brand Reviver implant"

/obj/item/organ/cyberimp/chest/reviver/gamma/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, "innate_empproof")

/obj/item/organ/cyberimp/chest/spinalspeed/gamma
	name = "\improper nanotrasen brand neural overclocker implant"
	//syndicate_implant = FALSE //Fix it later

/obj/item/organ/cyberimp/chest/spinalspeed/gamma/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, "innate_empproof")

/obj/item/organ/cyberimp/arm/toolset/surgery/l
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/baton/l
	zone = BODY_ZONE_L_ARM

/obj/item/implant/ntrelin
	name = "nanotrasen chemical implant"
	desc = "Removes all stuns."
	icon_state = "adrenal"
	uses = 2

/obj/item/implant/ntrelin/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Nanotrasen SpecOps Adrenaline Implant<BR>
				<b>Life:</b> Five days.<BR>
				<HR>
				<b>Implant Details:</b> Subjects injected with implant can activate an injection of medical cocktails.<BR>
				<b>Function:</b> Removes stuns and has a mild healing effect.<BR>
				<b>Integrity:</b> Implant can only be used two times before reserves are depleted."}
	return dat

/obj/item/implant/ntrelin/activate()
	. = ..()
	uses--
	to_chat(imp_in, span_notice("You feel a sudden surge of energy!"))
	imp_in.SetStun(0)
	imp_in.SetKnockdown(0)
	imp_in.SetUnconscious(0)
	imp_in.SetParalyzed(0)
	imp_in.SetImmobilized(0)
	imp_in.adjustStaminaLoss(-75)
	imp_in.clear_stamina_regen() // We already cleared our stamina, don't continue healing
	imp_in.set_resting(FALSE)
	imp_in.update_mobility()

	imp_in.reagents.add_reagent(/datum/reagent/medicine/synaptizine, 10)
	imp_in.reagents.add_reagent(/datum/reagent/medicine/omnizine, 10)
	imp_in.reagents.add_reagent(/datum/reagent/medicine/leporazine, 8)
	imp_in.reagents.add_reagent(/datum/reagent/medicine/coagulant, 2)
	if(!uses)
		qdel(src)

/obj/item/implanter/ntrelin
	name = "implanter"
	imp_type = /obj/item/implant/ntrelin
////

/obj/item/defibrillator/compact/loaded/ert
	name = "emergency defibrillator"
	desc = "A belt-equipped white defibrillator that can be rapidly deployed. Modified for usage in emergency and combat situations. Does not have the restrictions or safeties of conventional defibrillators and can revive through space suits."
	combat = TRUE
	safety = FALSE

/obj/item/clothing/shoes/combat/swat/vib_blade/Initialize(mapload)
	. = ..()
	new /obj/item/melee/transforming/vib_blade(src)

/datum/outfit/ert
	name = "ERT Common"

	id = /obj/item/card/id/ert
	back = /obj/item/storage/backpack/unknown
	uniform = /obj/item/clothing/under/rank/centcom/officer/ert
	shoes = /obj/item/clothing/shoes/combat/swat/combat_knife
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/headset_cent/alt
	box = /obj/item/storage/box/ert
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert)
	backpack_contents = list(
		/obj/item/tank/internals/oxygen/tactical=1,
		)

/datum/outfit/ert/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return
	H.faction |= "nanotrasenprivate"
	var/obj/item/card/id/W = H.wear_id
	W.access += get_centcom_access("CentCom Official")
	W.access += ACCESS_CENT_SPECOPS
	W.access += ACCESS_MAINT_TUNNELS
	W.access += ACCESS_WEAPONS
	W.access += ACCESS_HEADS
	W.access += ACCESS_BRIG
	W.assignment = "[name]"
	W.registered_name = W.assignment
	W.update_label(W.registered_name, W.assignment)

	var/obj/item/organ/cyberimp/chest/nutriment/plus/NP = new(H)
	NP.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/leg/magboot/RMAG = new
	RMAG.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	var/obj/item/organ/cyberimp/leg/magboot/l/LMAG = new
	LMAG.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	H.hair_style = "Buzzcut"
	H.hair_color = "#1C1C1C"
	H.facial_hair_style = "None"

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)

	H.ignores_capitalism = TRUE // Yogs -- Lets ERTs buy a damned smoke for christ's sake

/datum/outfit/ert/trooper
	name = "ERT Operative - Blue Alert"
	glasses = /obj/item/clothing/glasses/sunglasses
	mask = /obj/item/clothing/mask/gas/sechailer/task_force
	suit = /obj/item/clothing/suit/space/hardsuit/ert
	suit_store = /obj/item/gun/ballistic/automatic/proto
	gloves = /obj/item/clothing/gloves/fingerless/bigboss/combat
	belt = /obj/item/storage/belt/military/assault/consultant
	shoes = /obj/item/clothing/shoes/combat/swat/vib_blade
	l_pocket = /obj/item/storage/pouch/pistol/ancile
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		)

/datum/outfit/ert/trooper/red
	name = "ERT Operative - Red Alert"
	suit = /obj/item/clothing/suit/space/hardsuit/ert/plated
	mask = /obj/item/clothing/mask/gas/sechailer/task_force/swat
	glasses = /obj/item/clothing/glasses/thermal
	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_blue
	belt = /obj/item/storage/belt/military/webbing/nt/amber
	l_pocket = /obj/item/storage/pouch/pistol/centcom_laser
	suit_store = /obj/item/gun/ballistic/automatic/laser
	back = /obj/item/katana/monomolecular

/datum/outfit/ert/trooper/red/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.wear_id
	W.originalassignment = "Red Task Force"

	var/obj/item/organ/cyberimp/chest/reviver/gamma/REV = new(H)
	REV.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/brain/anti_stun/gamma/AST = new(H)
	AST.Insert(H)

/datum/outfit/ert/trooper/gamma
	name = "ERT Operative - Gamma Alert"
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert
	mask = /obj/item/clothing/mask/gas/sechailer/task_force/swat
	glasses = /obj/item/clothing/glasses/thermal
	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_combat
	belt = /obj/item/storage/belt/military/webbing/nt/gamma
	l_pocket = /obj/item/storage/pouch/pistol/pulse
	suit_store = /obj/item/gun/ballistic/automatic/ar
	id = /obj/item/card/id/ert/gamma
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/ntrelin)
	backpack_contents = list(
		/obj/item/grenade/plastic/x4=1,
		)

/datum/outfit/ert/trooper/gamma/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/organ/cyberimp/brain/anti_stun/gamma/AST = new(H)
	AST.Insert(H)

	var/obj/item/organ/cyberimp/chest/reviver/gamma/REV = new(H)
	REV.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	
	var/obj/item/organ/cyberimp/chest/spinalspeed/gamma/SANDI = new
	SANDI.Insert(H)
	to_chat(H, "You body has been implanted with standart nanotrasen spec ops cybernetic complect which will help survive in combat.")

	var/obj/item/organ/cyberimp/arm/nt_mantis/ntmantis_r = new
	ntmantis_r.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/arm/nt_mantis/left/ntmantis_l = new
	ntmantis_l.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	to_chat(H, "Your arms has been implanted with a cybernetic combat implants which will help you slice some people.")


/datum/outfit/ert/commonleader
	head = /obj/item/clothing/head/beret/sec
	backpack_contents = list(
		/obj/item/clothing/mask/gas/sechailer/task_force/swat=1,
		/obj/item/tank/internals/oxygen/tactical=1,
		/obj/item/tank/internals/emergency_oxygen/double=1,
		/obj/item/stack/ore/bluespace_crystal/refined/nt/five=1
		)

/datum/outfit/ert/commander
	name = "ERT Officer - Blue Alert"

	id = /obj/item/card/id/ert/leader
	suit = /obj/item/clothing/suit/space/hardsuit/ert/command
	uniform = /obj/item/clothing/under/rank/centcom/officer/ert_cmd
	suit_store = /obj/item/gun/energy/e_gun/secure
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	ears = /obj/item/radio/headset/headset_cent/commander
	back = /obj/item/storage/backpack/ert
	belt = /obj/item/storage/belt/holster/pdw
	mask = /obj/item/clothing/mask/gas/sechailer/task_force
	l_pocket = /obj/item/storage/pouch/general/large/command/ert
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(/obj/item/melee/baton/loaded=1)

/datum/outfit/ert/commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return
	var/datum/martial_art/cqc/justanop = new
	justanop.teach(H)

	
	var/obj/item/card/id/W = H.wear_id
	W.access += ACCESS_CENT_MEDICAL
	W.access += ACCESS_CENT_STORAGE

/datum/outfit/ert/commander/red
	name = "ERT Officer - Red Alert"

	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_blue
	suit = /obj/item/clothing/suit/space/hardsuit/ert/plated/command
	glasses = /obj/item/clothing/glasses/thermal
	belt = /obj/item/storage/belt/holster/pdw
	mask = /obj/item/clothing/mask/gas/sechailer/task_force/swat
	suit_store = /obj/item/gun/energy/e_gun/stun
	l_pocket = /obj/item/storage/pouch/general/large/command/elite_ert

/datum/outfit/ert/commander/red/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.wear_id
	W.originalassignment = "Red Task Force"

	var/obj/item/organ/cyberimp/eyes/hud/security/Seyes = new(H)
	Seyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)
	to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted.")

/datum/outfit/ert/commander/gamma
	name = "ERT Officer - Gamma Alert"

	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_combat
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/com
	glasses = /obj/item/clothing/glasses/thermal
	mask = /obj/item/clothing/mask/gas/sechailer/task_force/swat
	belt = /obj/item/storage/belt/military/webbing/nt/gamma_com
	back = /obj/item/storage/backpack/unknown
	suit_store = /obj/item/gun/ballistic/automatic/ar
	l_pocket = /obj/item/storage/pouch/general/large/command/ert
	id = /obj/item/card/id/ert/gamma
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/ntrelin)

	backpack_contents = list(
		/obj/item/melee/baton/loaded=1,
		/obj/item/shield/energy/advanced=1,
		)

/datum/outfit/ert/commander/gamma/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/organ/cyberimp/chest/spinalspeed/gamma/SANDI = new
	SANDI.Insert(H)

	var/obj/item/organ/cyberimp/chest/reviver/gamma/REV = new(H)
	REV.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/brain/anti_stun/gamma/AST = new(H)
	AST.Insert(H)
	to_chat(H, "You body has been implanted with standart nanotrasen spec ops cybernetic complect which will help survive in combat.")

	var/obj/item/organ/cyberimp/arm/esword/ntesword = new
	ntesword.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	to_chat(H, "Your arm have been implanted with a cybernetic combat esword implant which will help you kill eny threat you face. Probably.")


/datum/outfit/ert/security
	name = "ERT Detaining Specialist - Blue Alert"

	id = /obj/item/card/id/ert/Security
	suit = /obj/item/clothing/suit/space/hardsuit/ert/sec
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	gloves = /obj/item/clothing/gloves/tackler/combat/nt_elite
	back = /obj/item/storage/backpack/ert/security
	belt = /obj/item/storage/belt/military/webbing/nt/full
	suit_store = /obj/item/gun/energy/e_gun/secure
	l_pocket = /obj/item/shield/riot/tele
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	mask = /obj/item/clothing/mask/gas/sechailer/task_force
	backpack_contents = list(
		/obj/item/storage/box/zipties=1,
		/obj/item/melee/baton/loaded=1,
		)

/datum/outfit/ert/security/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hos
	R.recalculateChannels()

/datum/outfit/ert/security/red
	name = "ERT Detaining Specialist - Red Alert"

	suit = /obj/item/clothing/suit/space/hardsuit/ert/plated/sec
	glasses = /obj/item/clothing/glasses/night/security
	mask = /obj/item/clothing/mask/gas/sechailer/task_force/swat
	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_blue
	suit_store = /obj/item/gun/energy/e_gun/stun

/datum/outfit/ert/security/red/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.wear_id
	W.originalassignment = "Red Task Force"

	var/obj/item/organ/cyberimp/arm/flash/FA = new
	FA.Insert(H, special = TRUE, drop_if_replaced = FALSE)

/datum/outfit/ert/security/gamma
	name = "ERT Detaining Specialist - Gamma Alert"

	suit = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/sec
	glasses = /obj/item/clothing/glasses/thermal
	mask = /obj/item/clothing/mask/gas/sechailer/task_force/swat
	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_combat
	back = /obj/item/storage/backpack/unknown
	l_pocket = /obj/item/shield/energy/advanced
	suit_store = /obj/item/gun/energy/pulse/carbine
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/ntrelin)
	id = /obj/item/card/id/ert/gamma

	backpack_contents = list(
		/obj/item/storage/box/zipties=1,
		)

/datum/outfit/ert/security/gamma/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return
	var/obj/item/organ/cyberimp/arm/flash/FA = new
	FA.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/arm/baton/l/BAT = new
	BAT.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	to_chat(H, "Your arms have been implanted with a cybernetic security flash and baton implants which will help you keep down criminals.")

	var/obj/item/organ/cyberimp/brain/anti_stun/gamma/AST = new(H)
	AST.Insert(H)

	var/obj/item/organ/cyberimp/chest/reviver/gamma/REV = new(H)
	REV.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	
	var/obj/item/organ/cyberimp/chest/spinalspeed/gamma/SANDI = new
	SANDI.Insert(H)
	to_chat(H, "You body has been implanted with standart nanotrasen spec ops cybernetic complect which will help survive in combat.")

	var/datum/martial_art/cqc/justanop = new
	justanop.teach(H)

/datum/outfit/ert/medic
	name = "ERT Medic - Blue Alert"

	id = /obj/item/card/id/ert/Medical
	suit = /obj/item/clothing/suit/space/hardsuit/ert/med
	uniform = /obj/item/clothing/under/rank/centcom/officer/ert_medic
	suit_store = /obj/item/gun/medbeam
	glasses = /obj/item/clothing/glasses/hud/health
	back = /obj/item/storage/backpack/ert/medical
	belt = /obj/item/defibrillator/compact/loaded/ert
	l_pocket = /obj/item/storage/pouch/surgery/advanced/blue_ert
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/storage/pouch/pistol/ancile=1,
		/obj/item/ammo_box/magazine/pistolm9mm=1,
		/obj/item/storage/firstaid/toxin=1,
		/obj/item/storage/firstaid/tactical/centcom=1,
		/obj/item/melee/classic_baton/telescopic=1,
		)

/datum/outfit/ert/medic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return
	

	var/obj/item/card/id/W = H.wear_id
	W.access += ACCESS_CENT_MEDICAL

	var/obj/item/organ/cyberimp/arm/medibeam/MB = new
	MB.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/cmo
	R.recalculateChannels()

/datum/outfit/ert/medic/red
	name = "ERT Medic - Red Alert"

	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_blue
	glasses = /obj/item/clothing/glasses/night/health
	suit = /obj/item/clothing/suit/space/hardsuit/ert/plated/med
	l_pocket = /obj/item/storage/pouch/surgery/advanced/red_ert

	backpack_contents = list(
		/obj/item/storage/box/bodybags=1,
		/obj/item/storage/firstaid/toxin=1,
		/obj/item/storage/firstaid/tactical/centcom=1,
		/obj/item/storage/firstaid/o2=1,
		/obj/item/storage/firstaid/advanced=1,
		/obj/item/reagent_containers/autoinjector/medipen/resurrector=1,
		/obj/item/melee/classic_baton/telescopic = 1,
		)

/datum/outfit/ert/medic/red/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.originalassignment = "Red Task Force"

/datum/outfit/ert/medic/gamma
	name = "ERT Medic - Gamma Alert"

	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_combat
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/med
	suit_store = /obj/item/gun/energy/laser/centcom
	glasses = /obj/item/clothing/glasses/thermal
	back = /obj/item/storage/backpack/unknown
	l_pocket = /obj/item/storage/pouch/surgery/advanced/gamma_ert
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/ntrelin)
	id = /obj/item/card/id/ert/gamma

	backpack_contents = list(
		/obj/item/storage/box/bodybags=1,
		/obj/item/storage/firstaid/toxin=1,
		/obj/item/storage/firstaid/tactical/centcom=1,
		/obj/item/storage/firstaid/o2=1,
		/obj/item/storage/firstaid/advanced=1,
		/obj/item/reagent_containers/autoinjector/medipen/resurrector=1,
		/obj/item/melee/classic_baton/telescopic = 1,
		)
	
/datum/outfit/ert/medic/gamma/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/organ/cyberimp/brain/anti_stun/gamma/AST = new(H)
	AST.Insert(H)

	var/obj/item/organ/cyberimp/chest/reviver/gamma/REV = new(H)
	REV.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	
	var/obj/item/organ/cyberimp/chest/spinalspeed/gamma/SANDI = new
	SANDI.Insert(H)
	to_chat(H, "You body has been implanted with standart nanotrasen spec ops cybernetic complect which will help survive in combat.")

/datum/outfit/ert/engineer
	name = "ERT Engineer - Blue Alert"

	id = /obj/item/card/id/ert/Engineer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/engi
	suit_store = /obj/item/storage/pouch/pistol/ancile
	glasses =  /obj/item/clothing/glasses/meson/engine
	back = /obj/item/storage/backpack/ert/engineer
	belt = /obj/item/storage/belt/utility/full
	l_pocket = null
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/rcd_ammo=2,
		/obj/item/melee/classic_baton/telescopic=1,
		/obj/item/construction/rcd/loaded=1,
		/obj/item/storage/pouch/pistol/ancile=1,
		/obj/item/ammo_box/magazine/pistolm9mm=1,
		)

/datum/outfit/ert/engineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.access += ACCESS_CENT_STORAGE

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/ce
	R.recalculateChannels()

/datum/outfit/ert/engineer/red
	name = "ERT Engineer - Red Alert"

	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_blue
	suit = /obj/item/clothing/suit/space/hardsuit/ert/plated/engi
	glasses = /obj/item/clothing/glasses/night/diagnostic
	belt = /obj/item/storage/belt/utility/full/engi

	backpack_contents = list(
		/obj/item/rcd_ammo=2,
		/obj/item/melee/classic_baton/telescopic=1,
		/obj/item/storage/box/smart_metal_foam=1,
		/obj/item/construction/rcd/combat=1,
		)

/datum/outfit/ert/engineer/red/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.originalassignment = "Red Task Force"

/datum/outfit/ert/engineer/gamma
	name = "ERT Engineer - Gamma Alert"
	
	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_combat
	suit = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/engi
	suit_store = /obj/item/gun/energy/laser/centcom
	back = /obj/item/storage/backpack/unknown
	id = /obj/item/card/id/ert/gamma
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/ntrelin)
	belt = /obj/item/storage/belt/utility/full/engi

	backpack_contents = list(
		/obj/item/rcd_ammo=2,
		/obj/item/grenade/plastic/x4=1,
		/obj/item/melee/classic_baton/telescopic=1,
		/obj/item/storage/box/smart_metal_foam=1,
		/obj/item/construction/rcd/combat=1,
		)
	
/datum/outfit/ert/engineer/gamma/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/organ/cyberimp/brain/anti_stun/gamma/AST = new(H)
	AST.Insert(H)

	var/obj/item/organ/cyberimp/chest/reviver/gamma/REV = new(H)
	REV.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	
	var/obj/item/organ/cyberimp/chest/spinalspeed/gamma/SANDI = new
	SANDI.Insert(H)
	to_chat(H, "You body has been implanted with standart nanotrasen spec ops cybernetic complect which will help survive in combat.")

/datum/outfit/ert/commander/inquisitor
	name = "Inquisition Commander"

	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal
	belt = /obj/item/nullrod/talking/chainsword
	suit_store = /obj/item/gun/energy/e_gun
	back = /obj/item/storage/backpack/unknown
	mask = /obj/item/clothing/mask/gas/sechailer
	backpack_contents = list(
		/obj/item/assembly/flash/handheld=1,
		/obj/item/grenade/flashbang=1,
		/obj/item/reagent_containers/spray/pepper=1
		)

/datum/outfit/ert/security/inquisitor
	name = "Inquisition Security"

	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	mask = /obj/item/clothing/mask/gas/sechailer
	suit_store = /obj/item/gun/energy/e_gun/stun
	back = /obj/item/storage/backpack/unknown
	backpack_contents = list(/obj/item/storage/box/handcuffs=1,\
		/obj/item/melee/baton/loaded=1,
		/obj/item/construction/rcd/loaded=1)

/datum/outfit/ert/medic/inquisitor
	name = "Inquisition Medic"

	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	belt = /obj/item/gun/energy/e_gun
	back = /obj/item/storage/backpack/unknown
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/reagent_containers/autoinjector/combat
	r_pocket = /obj/item/reagent_containers/autoinjector/combat/heresypurge
	suit_store = /obj/item/gun/medbeam
	backpack_contents = list(
		/obj/item/melee/baton/loaded=1,
		/obj/item/storage/firstaid/toxin=1,
		/obj/item/storage/firstaid/fire=1,
		/obj/item/storage/firstaid/brute=1
		)

/datum/outfit/ert/chaplain/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hop
	R.recalculateChannels()

/datum/outfit/ert/chaplain
	name = "ERT Chaplain"

	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor // Chap role always gets this suit
	id = /obj/item/card/id/ert/chaplain
	glasses = /obj/item/clothing/glasses/hud/health
	mask = /obj/item/clothing/mask/gas/sechailer
	back = /obj/item/storage/backpack/cultpack
	belt = /obj/item/storage/belt/soulstone
	suit_store = /obj/item/gun/energy/e_gun
	l_pocket = /obj/item/nullrod
	backpack_contents = null

/datum/outfit/ert/chaplain/inquisitor
	name = "Inquisition Chaplain"

	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	r_pocket = /obj/item/grenade/chem_grenade/holy
	belt = /obj/item/storage/belt/soulstone/full/chappy

/datum/outfit/ert/janitor
	name = "ERT Janitor"

	id = /obj/item/card/id/ert/Janitor
	suit = /obj/item/clothing/suit/space/hardsuit/ert/jani
	suit_store = /obj/item/storage/bag/trash/bluespace
	glasses = /obj/item/clothing/glasses/night
	back = /obj/item/storage/backpack
	belt = /obj/item/storage/belt/janitor/full
	r_pocket = /obj/item/grenade/chem_grenade/cleaner
	l_pocket = /obj/item/grenade/chem_grenade/cleaner
	mask = /obj/item/clothing/mask/gas/sechailer
	backpack_contents = list(/obj/item/storage/box/lights/mixed=1,\
		/obj/item/mop/advanced=1,\
		/obj/item/reagent_containers/glass/bucket=1,\
		/obj/item/grenade/clusterbuster/cleaner=1)

/datum/outfit/ert/janitor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/headset_service
	R.recalculateChannels()

/datum/outfit/ert/janitor/heavy
	name = "ERT Janitor - Heavy Duty"
	
	suit = /obj/item/clothing/suit/space/hardsuit/ert/plated/jani
	backpack_contents = list(/obj/item/reagent_containers/spray/chemsprayer/janitor=1,\
		/obj/item/storage/box/lights/mixed=1,\
		/obj/item/melee/classic_baton/telescopic=1,\
		/obj/item/grenade/clusterbuster/cleaner=3)

/datum/outfit/ert/mining
	name = "A Dwarven Miner"

	id = /obj/item/card/id/ert
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/beserker
	suit_store = /obj/item/tank/internals/oxygen/tactical
	r_hand = /obj/item/kinetic_crusher/mega
	glasses = /obj/item/clothing/glasses/hud/health/meson
	gloves = /obj/item/clothing/gloves/gauntlets
	back = /obj/item/storage/backpack/explorer
	belt = /obj/item/storage/belt/mining
	mask = /obj/item/clothing/mask/gas/explorer
	shoes = /obj/item/clothing/shoes/bhop
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	box = /obj/item/storage/box/survival/mining
	backpack_contents = list(
		/obj/item/crusher_trophy/demon_claws=1,
		/obj/item/crusher_trophy/watcher_wing=1,
		/obj/item/reagent_containers/autoinjector/medipen/survival=3,
		/obj/item/kinetic_javelin=1,
		/obj/item/kinetic_javelin_core/green=1
		)
	l_pocket = /obj/item/reagent_containers/glass/beaker/bluespace/dorf

/datum/outfit/ert/mining/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/cmo
	R.recalculateChannels()
	H.dna.add_mutation(DWARFISM)

/datum/outfit/centcom_clown
	name = "Code Banana ERT"
	id = /obj/item/card/id/centcom
	belt = /obj/item/modular_computer/tablet/pda/preset/clown
	ears = /obj/item/radio/headset/headset_cent
	uniform = /obj/item/clothing/under/rank/civilian/clown
	back = /obj/item/storage/backpack/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_pocket = /obj/item/bikehorn
	backpack_contents = list(
		/obj/item/stamp/clown = 1,
		/obj/item/reagent_containers/spray/waterflower/lube = 1,
		/obj/item/reagent_containers/food/snacks/grown/banana = 1,
		/obj/item/instrument/bikehorn = 1,
		/obj/item/megaphone/clown = 1,
		)

	implants = list(/obj/item/implant/sad_trombone)


/datum/outfit/centcom_clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/implant/mindshield/centcom/L = new/obj/item/implant/mindshield/centcom(H)
	L.implant(H, null, 1)
	var/obj/item/implant/biosig_ert/B = new/obj/item/implant/biosig_ert(H)
	B.implant(H, null, 1)

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/card/id/W = H.wear_id
	W.registered_name = H.real_name
	W.access += ACCESS_THEATRE
	W.update_label(W.registered_name, W.assignment)
	H.dna.add_mutation(CLOWNMUT)

/datum/outfit/centcom_clown/honk_squad
	name = "HONK Squad Trooper"
	back = /obj/item/storage/backpack/holding/clown
	shoes = /obj/item/clothing/shoes/clown_shoes/combat
	suit = /obj/item/clothing/suit/space/hardsuit/shielded/swat/honk
	suit_store = /obj/item/tank/internals/emergency_oxygen/double
	l_pocket = /obj/item/bikehorn/golden
	r_pocket = /obj/item/shield/energy/bananium
	l_hand = /obj/item/pneumatic_cannon/pie/selfcharge
	backpack_contents = list(
		/obj/item/stamp/clown = 1,
		/obj/item/reagent_containers/spray/waterflower/lube = 1,
		/obj/item/reagent_containers/food/snacks/grown/banana = 1,
		/obj/item/instrument/bikehorn = 1,
		/obj/item/megaphone/clown = 1,
		/obj/item/reagent_containers/spray/chemsprayer/janitor/clown = 1,
		)

