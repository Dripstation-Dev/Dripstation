///////Unsorted///////
//////Move later//////
/obj/item/organ/cyberimp/arm/syndie_hammer
	name = "Thunder Hammer implant"
	desc = "A folded Thunder Hammer designed to be incorporated into humans body."
	contents = newlist(/obj/item/melee/vxtvulhammer)

/obj/item/organ/cyberimp/arm/syndie_hammer/nt
	syndicate_implant = FALSE
	contents = newlist(/obj/item/melee/vxtvulhammer/nt)

/obj/item/organ/cyberimp/arm/combat/nt
	name = "NT specops cybernetics implant"
	desc = "An extremely powerful cybernetic implant that contains combat and utility modules used by NT special forces."
	icon = 'icons/obj/guns/energy.dmi'
	icon_state = "m1911"
	contents = newlist(/obj/item/gun/energy/pulse/pistol/m1911, /obj/item/melee/transforming/energy/blade/hardlight, /obj/item/reagent_containers/autoinjector/combat/nanites, /obj/item/gun/medbeam, /obj/item/borg/stun)

/obj/item/organ/cyberimp/arm/combat/nt/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, "innate_empproof")

///////Outfits///////
/datum/outfit/centcom
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert)
	box = /obj/item/storage/box/ert
	var/randomise_uni = FALSE
	var/list/random_uni = list()
	var/pdaequip = FALSE


/datum/outfit/centcom/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(randomise_uni)
		uniform = pick(random_uni)

/datum/outfit/centcom/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return
	H.faction |= "nanotrasenprivate"
	var/obj/item/organ/cyberimp/chest/nutriment/plus/NP = new(H)
	NP.Insert(H, special = TRUE, drop_if_replaced = FALSE)

/datum/outfit/centcom/intern
	name = "CentCom Intern"

	id = /obj/item/card/id/nanotrasen
	uniform = /obj/item/clothing/under/rank/centcom
	back = /obj/item/storage/backpack/satchel
	belt = /obj/item/melee/classic_baton/blc
	ears = /obj/item/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	shoes = /obj/item/clothing/shoes/sneakers/black
	l_pocket = /obj/item/ammo_box/a762
	r_pocket = /obj/item/ammo_box/a762
	l_hand = /obj/item/gun/ballistic/rifle/boltaction/brand_new
	implants = list(/obj/item/implant/mindshield/centcom)

/datum/outfit/centcom/intern/unarmed
	name = "CentCom Intern (Unarmed)"

	belt = null
	l_pocket = null
	r_pocket = null
	l_hand = null

/datum/outfit/centcom/intern/leader
	name = "CentCom Head Intern"
	pdaequip = TRUE

	uniform = /obj/item/clothing/under/rank/centcom/internalt
	suit = /obj/item/clothing/suit/armor/vest/alt
	r_pocket = /obj/item/modular_computer/tablet/pda/preset/bureaucrat
	suit_store = /obj/item/gun/ballistic/rifle/boltaction/brand_new
	belt = /obj/item/melee/baton/loaded
	head = /obj/item/clothing/head/beret/sec/centcom
	l_hand = /obj/item/megaphone

/datum/outfit/centcom/intern/leader/unarmed // i'll be nice and let the leader keep their baton and vest
	name = "CentCom Head Intern (Unarmed)"

	suit_store = null
	l_pocket = null

/datum/outfit/centcom/intern/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(pdaequip)
		var/obj/item/pda/heads/centcom/pda = H.r_store
		pda.owner = H.real_name
		pda.ownjob = "CentCom Intern"
		pda.update_label()

	var/obj/item/card/id/W = H.wear_id
	W.access = get_centcom_access("VIP Guest")
	W.access += ACCESS_MAINT_TUNNELS
	W.access += ACCESS_WEAPONS
	W.access += ACCESS_HEADS
	W.access += ACCESS_BRIG
	W.assignment = "CentCom Intern"
	W.registered_name = H.real_name
	W.update_label()

	//H.ignores_capitalism = TRUE 	//Ugh, sorry mate

/datum/outfit/centcom/official
	name = "CentCom Official"
	pdaequip = TRUE
	randomise_uni = TRUE

	uniform = /obj/item/clothing/under/rank/centcom/officer/official
	random_uni = list(/obj/item/clothing/under/rank/centcom/officer/official, /obj/item/clothing/under/rank/centcom/officer/official/alt)
	suit = null
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/captain/centcom/official
	ears = /obj/item/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	head = /obj/item/clothing/head/beret/sec/centcom
	belt = /obj/item/storage/belt/holster/centcom_laser
	l_pocket = /obj/item/melee/classic_baton/telescopic
	back = /obj/item/storage/backpack/satchel/centcom
	r_pocket = /obj/item/modular_computer/tablet/pda/preset/bureaucrat
	l_hand = /obj/item/clipboard/yog/paperwork/admin
	id = /obj/item/card/id/centcom
	backpack_contents = list(/obj/item/restraints/handcuffs/cable/zipties=1, /obj/item/stamp/cent = 1, /obj/item/reagent_containers/spray/pepper = 1, /obj/item/lighter/nt = 1)

/obj/item/pda/heads/centcom
	insert_type = /obj/item/pen/red/edagger/nt

/datum/outfit/centcom/official/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(pdaequip)
		var/obj/item/pda/heads/centcom/pda = H.r_store
		pda.owner = H.real_name
		pda.ownjob = "CentCom Official"
		pda.update_label()

	var/obj/item/card/id/W = H.wear_id
	W.access = get_centcom_access("CentCom Official")
	W.access += ACCESS_MAINT_TUNNELS
	W.access += ACCESS_WEAPONS
	W.access += ACCESS_HEADS
	W.access += ACCESS_BRIG
	W.assignment = "CentCom Official"
	W.registered_name = H.real_name
	W.update_label()

	H.ignores_capitalism = TRUE 

/datum/outfit/centcom/official/nopda
	pdaequip = FALSE

/datum/outfit/centcom/officer //CentCom heads of stuff.
	name = "CentCom Officer"

	uniform = /obj/item/clothing/under/rank/centcom/officer
	suit = null //obj/item/clothing/suit/toggle/capformal/centcom
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/captain/centcom
	ears = /obj/item/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	head = /obj/item/clothing/head/beret/sec/centcom/officer
	belt = /obj/item/storage/belt/holster/centcom_laser
	r_pocket = /obj/item/lighter/nt
	l_pocket = /obj/item/melee/classic_baton/telescopic
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id/centcom/silver
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/dusting)
	backpack_contents = list(/obj/item/restraints/handcuffs/cable/zipties=1)


/datum/outfit/centcom/officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	var/obj/item/card/id/centcom/silver/W = H.wear_id
	W.access = get_all_accesses()
	W.access += get_all_centcom_access()
	W.assignment = "CentCom Officer"
	W.registered_name = H.real_name
	W.update_label()

	H.ignores_capitalism = TRUE // Yogs -- Lets Centcom guys buy a damned smoke for christ's sake

/datum/outfit/centcom/shield //CentCom shield
	name = "Nanotrasen Close Protection Unit"
	randomise_uni = TRUE

	uniform = /obj/item/clothing/under/rank/centcom/officer/centcom_shield
	random_uni = list(/obj/item/clothing/under/rank/centcom/officer/centcom_shield, /obj/item/clothing/under/rank/centcom/officer/centcom_shield/turtle)
	suit = /obj/item/clothing/suit/armor/centcom_shield
	suit_store = /obj/item/gun/energy/laser/tactical
	shoes = /obj/item/clothing/shoes/combat/swat/vib_blade
	gloves = /obj/item/clothing/gloves/tackler/combat/nt_elite
	ears = /obj/item/radio/headset/headset_cent/bowman
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	head = /obj/item/clothing/head/beret/sec/centcom/officer/centcom_shield
	mask = /obj/item/clothing/mask/breath/tactical
	belt = /obj/item/storage/belt/military/assault/blueshield
	r_pocket = /obj/item/storage/pouch/pistol/pdw
	l_pocket = /obj/item/melee/classic_baton/telescopic
	back = /obj/item/storage/backpack/satchel/blueshield
	id = /obj/item/card/id/centcom
	backpack_contents = list(/obj/item/shield/riot/tele = 1)

	var/randomise_suit = TRUE
	var/list/random_suit = list(/obj/item/clothing/suit/armor/centcom_shield, /obj/item/clothing/suit/armor/riot/centcom_shield)
	var/randomise_head = TRUE
	var/list/random_head = list(/obj/item/clothing/head/helmet/alt/centcom_shield, /obj/item/clothing/head/beret/sec/centcom/officer/centcom_shield, /obj/item/clothing/head/helmet/alt/centcom_shield/alt)

/datum/outfit/centcom/shield/officer //CentCom shield officer
	name = "Nanotrasen Close Protection Officer"

	head = /obj/item/clothing/head/beret/sec/centcom/officer
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/alt/centcom/black/alt
	randomise_suit = FALSE
	randomise_head = FALSE

/datum/outfit/centcom/shield/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(randomise_suit)
		suit = pick(random_suit)
	if(randomise_head)
		head = pick(random_head)

/datum/outfit/centcom/shield/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/centcom/W = H.wear_id
	W.access = get_all_accesses()
	W.access += get_centcom_access("CentCom Official")
	W.assignment = "CentCom Close Protection Unit"
	W.originalassignment = "CentCom Shield"
	W.registered_name = H.real_name
	W.update_label()

	H.ignores_capitalism = TRUE // Yogs -- Lets Centcom guys buy a damned smoke for christ's sake

	var/obj/item/radio/headset/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/organ/cyberimp/eyes/hud/security/Seyes = new(H)
	Seyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)
	to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted.")

	var/obj/item/organ/cyberimp/arm/nt_mantis/ntmantis_r = new
	ntmantis_r.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/arm/nt_mantis/left/ntmantis_l = new
	ntmantis_l.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	to_chat(H, "Your arms has been implanted with a cybernetic combat implants which will help you slice some people.")

	var/datum/martial_art/cqc/justanop = new
	justanop.teach(H)

/datum/outfit/centcom/sod_officer //CentCom Special Operations Department Head
	name = "CentCom Special Operations Department Officer"

	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_combat
	suit = /obj/item/clothing/suit/toggle/capformal/centcom/soo
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat/odst/deathsquad
	ears = /obj/item/radio/headset/headset_cent/commander
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	mask = /obj/item/clothing/mask/cigarette/cigar/havana
	head = /obj/item/clothing/head/beret/sec/centcom/officer/soo
	belt = /obj/item/storage/belt/holster/mateba
	r_pocket = /obj/item/storage/pouch/general/large/command
	l_pocket = /obj/item/storage/pouch/magazine/pistol/mateba
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id/centcom/silver
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/dusting)
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1, /obj/item/lighter/nt = 1)

/datum/outfit/centcom/sod_officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/centcom/silver/W = H.wear_id
	W.access = get_all_accesses()
	W.access += get_all_centcom_access()
	W.assignment = "CentCom Special Operations Department Officer"
	W.registered_name = H.real_name
	W.update_label()

	H.ignores_capitalism = TRUE // Yogs -- Lets Centcom guys buy a damned smoke for christ's sake

	var/obj/item/organ/cyberimp/eyes/hud/security/Seyes = new(H)
	Seyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)
	to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted.")

	var/obj/item/organ/cyberimp/arm/combat/nt/CARM = new			//THE TIME FOR NEGOTIATIONS HAVE COME TO AN END.
	CARM.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	to_chat(H, "Your arm has been implanted with a cybernetic pulse gun which will help you put some holes in people.")

/datum/outfit/centcom/death_commando
	name = "Death Commando"

	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_combat
	suit = /obj/item/clothing/suit/space/hardsuit/deathsquad/mk5
	shoes = /obj/item/clothing/shoes/magboots/security/advanced
	gloves = /obj/item/clothing/gloves/combat/odst/deathsquad
	mask = /obj/item/clothing/mask/gas/sechailer/swat/encrypted
	glasses = /obj/item/clothing/glasses/hud/toggle/thermal
	back = /obj/item/storage/backpack/satchel/unknown
	l_pocket = /obj/item/pinpointer/nuke
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double 
	suit_store = /obj/item/gun/energy/pulse/loyalpin
	belt = /obj/item/storage/belt/holster/mateba
	id = /obj/item/card/id/deathsquad
	ears = /obj/item/radio/headset/headset_cent/alt
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/ntrelin)

	backpack_contents = list(/obj/item/storage/firstaid/tactical/centcom=1,\
		/obj/item/shield/energy/advanced=1,\
		/obj/item/melee/transforming/energy/sword/nt=1,\
		/obj/item/reagent_containers/autoinjector/medipen/resurrector=1,\
		/obj/item/grenade/flashbang=1,\
		/obj/item/grenade/syndieminibomb/nt=1,\
		/obj/item/grenade/plastic/x4=1)

/datum/outfit/centcom/death_commando/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()//They get full station access.
	W.access += get_centcom_access("Death Commando")//Let's add their alloted CentCom access.
	W.assignment = "Death Commando"
	W.originalassignment = "Death Squad"
	W.registered_name = splittext(H.tag, "_")[2] // 412's ID Card (Death Commando); deathsquad are so edgy they are just numbers
	W.update_label()

	var/obj/item/organ/cyberimp/brain/anti_stun/gamma/AST = new(H)
	AST.Insert(H)
	var/obj/item/organ/cyberimp/chest/reviver/gamma/REV = new(H)
	REV.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	var/obj/item/organ/cyberimp/chest/spinalspeed/gamma/SANDI = new
	SANDI.Insert(H)
	to_chat(H, "You body has been implanted with standart nanotrasen spec ops cybernetic complect which will help survive in combat.")

/datum/outfit/centcom/death_commando/officer
	name = "Death Commando Officer"
	ears = /obj/item/radio/headset/headset_cent/commander

/datum/outfit/centcom/death_commando/officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id	
	W.assignment = "Death Commando Officer"

	var/obj/item/organ/cyberimp/leg/jumpboots/jb = new
	jb.Insert(H, special = TRUE, drop_if_replaced = FALSE)	//grant him ability to like FLY
	var/obj/item/organ/cyberimp/leg/jumpboots/l/jbl = new
	jbl.Insert(H, special = TRUE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/arm/syndie_hammer/nt/hammer = new			//SM2 expirience be like
	hammer.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	to_chat(H, "Your arm has been implanted with a cybernetic hammer which will help you put some holes in people.")

/datum/outfit/centcom/death_commando/striker	//funny quicker people with deathsquad loadout
	name = "Black Ops Strike Operative"

	suit = /obj/item/clothing/suit/space/hardsuit/syndi/military/ert/deathsquad

/datum/outfit/centcom/death_commando/striker/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id	
	W.assignment = "Black Ops Strike Team"

	var/obj/item/organ/cyberimp/arm/combat/nt/CARM = new			//THE TIME FOR NEGOTIATIONS HAVE COME TO AN END.
	CARM.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	to_chat(H, "Your arm has been implanted with a cybernetic pulse gun which will help you put some holes in people.")

/datum/outfit/centcom/death_commando/striker/shield	//when you really need some shields for this guys
	name = "Black Ops Strike Operative with shielded suit"
	r_hand = /obj/item/module/shield/nt

/datum/outfit/centcom/death_commando/striker/shield/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	to_chat(H, "Your have been additionally equiped with rig module, that grants you shielding.")

/datum/outfit/centcom/sod_agent
	name = "Internal Affairs Agent"

	uniform = /obj/item/clothing/under/syndicate/sniper
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/syndicate
	glasses = /obj/item/clothing/glasses/sunglasses
	l_pocket = /obj/item/modular_computer/tablet/phone/preset/advanced/command
	r_pocket = /obj/item/gun/energy/e_gun/mini/specops
	l_hand = /obj/item/storage/secure/briefcase
	r_hand = /obj/item/storage/belt/sabre/cane
	id = /obj/item/card/id/syndicate
	implants = list(/obj/item/implant/mindshield/centcom/iaa, /obj/item/implant/biosig_ert, /obj/item/implant/dusting)

/datum/outfit/centcom/sod_agent/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(H.has_dna() && !HAS_TRAIT(H, TRAIT_GENELESS) && !HAS_TRAIT(H, TRAIT_BADDNA))
		H.dna.add_mutation(THERMAL, MUT_EXTRA)

	
	var/obj/item/organ/cyberimp/eyes/hud/security/syndicate/Seyes = new(H)
	Seyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)
	to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted.")

	var/datum/martial_art/cqc/justanop = new
	justanop.teach(H)

	//Could use a type
	var/obj/item/storage/secure/briefcase/sec_briefcase = H.get_item_for_held_index(1)
	for(var/obj/item/briefcase_item in sec_briefcase)
		qdel(briefcase_item)
	for(var/i = 3 to 0 step -1)
		SEND_SIGNAL(sec_briefcase, COMSIG_TRY_STORAGE_INSERT, new /obj/item/stack/spacecash/c1000, null, TRUE, TRUE)
	SEND_SIGNAL(sec_briefcase, COMSIG_TRY_STORAGE_INSERT, new /obj/item/gun/ballistic/rifle/sniper_rifle/syndicate/nt, null, TRUE, TRUE)
	SEND_SIGNAL(sec_briefcase, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/sniper_rounds/penetrator, null, TRUE, TRUE)
	SEND_SIGNAL(sec_briefcase, COMSIG_TRY_STORAGE_INSERT, new /obj/item/grenade/plastic/x4, null, TRUE, TRUE)

	//var/obj/item/pda/heads/pda = H.belt
	//pda.owner = H.real_name
	//pda.ownjob = "Reaper"
	//pda.update_label()

	var/obj/item/card/id/syndicate/W = H.wear_id
	W.access = get_all_accesses()
	W.assignment = "Assistant"
	W.assignment = "Assistant"
	W.registered_name = H.real_name
	W.update_label()

/datum/outfit/centcom/nanotrasen_defence //Nanotrasen`s regular fighter force
	name = "Nanotrasen Defence Unit"
	
	suit = /obj/item/clothing/suit/armor/hardened
	suit_store = /obj/item/gun/ballistic/automatic/c20r/aegis
	uniform = /obj/item/clothing/under/rank/centcom/officer/specops_blue
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/tackler/combat/nt_elite
	ears = /obj/item/radio/headset/headset_cent/bowman
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	head = /obj/item/clothing/head/helmet/hardened
	mask = /obj/item/clothing/mask/breath/tactical
	belt = /obj/item/storage/belt/military/assault/defence
	r_pocket = /obj/item/storage/pouch/magazine/smgfull
	l_pocket = /obj/item/melee/classic_baton/telescopic
	r_hand = /obj/item/shield/riot/tele
	back = /obj/item/storage/backpack/satchel/blueshield
	id = /obj/item/card/id/centcom
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1)
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/ntrelin)

/datum/outfit/centcom/nanotrasen_defence/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	var/obj/item/card/id/centcom/W = H.wear_id
	W.access = get_all_accesses()
	W.access += get_centcom_access("Death Commando")
	W.assignment = "CentCom Assault Unit"
	W.registered_name = H.real_name
	W.update_label()

	H.ignores_capitalism = TRUE // Yogs -- Lets Centcom guys buy a damned smoke for christ's sake

	var/obj/item/radio/headset/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/organ/eyes/robotic/thermals/Teyes = new(H)
	Teyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)

	var/obj/item/organ/cyberimp/eyes/hud/security/Seyes = new(H)
	Seyes.Insert(H, special = FALSE, drop_if_replaced = FALSE)
	to_chat(H, "Your eyes have been implanted with a cybernetic security HUD which will help you keep track of who is mindshield-implanted.")

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

/datum/outfit/centcom/nanotrasen_defence/leader
	name = "Nanotrasen Defence Commander"

	head = /obj/item/clothing/head/helmet/hardened/cmd
	suit = /obj/item/clothing/suit/armor/hardened/cmd
	ears = /obj/item/radio/headset/headset_cent/commander

/datum/outfit/centcom/captain //CentCom captain, Nanotrasen Naval Captain
	name = "Nanotrasen Naval Captain"

	uniform = /obj/item/clothing/under/rank/centcom/commander
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/centcom
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/captain/centcom
	ears = /obj/item/radio/headset/headset_cent/commander
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	head = /obj/item/clothing/head/centhat
	belt = /obj/item/storage/belt/sabre/mono
	r_pocket = /obj/item/lighter/nt
	l_pocket = /obj/item/melee/classic_baton/telescopic
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id/centcom/silver
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/dusting)
	backpack_contents = list(/obj/item/restraints/handcuffs/cable/zipties=1)


/datum/outfit/centcom/captain/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	var/obj/item/card/id/centcom/silver/W = H.wear_id
	W.access = get_all_accesses()
	W.access += get_centcom_access("CentCom Commander")
	W.assignment = "Nanotrasen Naval Captain"
	W.registered_name = H.real_name
	W.update_label()

	H.ignores_capitalism = TRUE // Yogs -- Lets Centcom guys buy a damned smoke for christ's sake

/obj/item/storage/pouch/pistol/pulse_m1911
	fill_type = /obj/item/gun/energy/pulse/pistol/m1911
	fill_number = 1

/datum/outfit/centcom/admiral //CentCom Admiral.
	name = "Nanotrasen Admiral"

	uniform = /obj/item/clothing/under/rank/centcom/admiral
	suit = /obj/item/clothing/suit/captunic/admiral
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/captain/centcom
	ears = /obj/item/radio/headset/headset_cent/commander
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	mask = /obj/item/clothing/mask/cigarette/cigar/havana
	head = /obj/item/clothing/head/centhat/admiral/executive
	belt = /obj/item/storage/belt/sabre/mono
	r_pocket = /obj/item/melee/transforming/energy/sword/nt
	l_pocket = /obj/item/storage/pouch/pistol/pulse_m1911	//THE TIME FOR NEGOTIATIONS HAVE COME TO AN END.
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id/centcom/gold
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/dusting)
	backpack_contents = list(/obj/item/restraints/handcuffs/cable/zipties=1, /obj/item/lighter/nt = 1)

/datum/outfit/centcom/admiral/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	var/obj/item/card/id/centcom/gold/W = H.wear_id
	W.access = get_all_accesses()
	W.access += get_centcom_access("CentCom Commander")
	W.assignment = "Nanotrasen Admiral"
	W.registered_name = H.real_name
	W.update_label()

	H.ignores_capitalism = TRUE // Yogs -- Lets Centcom guys buy a damned smoke for christ's sake

/datum/outfit/centcom/executive //CentCom Executive. The final boss.
	name = "CentCom Executive"

	uniform = /obj/item/clothing/under/rank/centcom/admiral/executive
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/centcom/gold
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/color/captain/centcom/gold
	ears = /obj/item/radio/headset/headset_cent/commander
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	mask = /obj/item/clothing/mask/cigarette/cigar/havana
	head = /obj/item/clothing/head/beret/sec/centcom/officer/executive
	neck = /obj/item/clothing/neck/cape/executive
	belt = /obj/item/storage/belt/sabre/mono
	r_pocket = /obj/item/melee/transforming/energy/sword/nt
	l_pocket = /obj/item/storage/pouch/pistol/pulse_m1911	//THE TIME FOR NEGOTIATIONS HAVE COME TO AN END.
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id/centcom/gold
	implants = list(/obj/item/implant/mindshield/centcom, /obj/item/implant/biosig_ert, /obj/item/implant/dusting)
	backpack_contents = list(/obj/item/restraints/handcuffs/cable/zipties=1, /obj/item/lighter/nt = 1)

/datum/outfit/centcom/executive/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	var/obj/item/card/id/centcom/gold/W = H.wear_id
	W.access = get_all_accesses()
	W.access += get_centcom_access("CentCom Commander")
	W.assignment = "CentCom Executive"
	W.registered_name = H.real_name
	W.update_label()

	H.ignores_capitalism = TRUE // Yogs -- Lets Centcom guys buy a damned smoke for christ's sake
