GLOBAL_LIST_INIT(synthetic_base_access, list(
	ACCESS_MAINT_TUNNELS, ACCESS_KITCHEN,
	ACCESS_JANITOR, ACCESS_BAR, ACCESS_CHAPEL_OFFICE,
	ACCESS_LIBRARY, ACCESS_NETWORK, ACCESS_MINISAT,
	ACCESS_TCOMSAT, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_EVA,
	ACCESS_CREMATORIUM, ACCESS_HYDROPONICS, ACCESS_MANUFACTURING,
	ACCESS_THEATRE, ACCESS_TCOM_ADMIN, ACCESS_SERVHALL,
	ACCESS_AI_UPLOAD, ACCESS_WEAPONS, ACCESS_HEADS))

GLOBAL_LIST_EMPTY(synthetic_added_access)

#define SECURITY "sec"
#define ENGINEERING "eng"

/datum/job/replica
	title = "Repair Worker Replika"
	description = "Watch over the crew, carry out mundane tasks that nobody else want to. Do no harm."
	orbit_icon = "microchip"
	auto_deadmin_role_flags = DEADMIN_POSITION_SILICON|DEADMIN_POSITION_CRITICAL
	department_head = list("Captain")
	faction = "Station"
	total_positions = 0
	spawn_positions = 1
	supervisors = "the Captain and the Command Staff"
	minimal_player_age = 30
	exp_requirements = 900
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_COMMAND

	outfit = /datum/outfit/job/replica

	alt_titles = list("Security Technician Replika")

	added_access = list()
	base_access = list()
	paycheck = 0
	paycheck_department = ACCOUNT_SCI
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SYNTHETIC

	departments_list = list(
		/datum/job_department/silicon,
	)


	mail_goodies = list()

	smells_like = "calculated machinery"

	forced_species = /datum/species/replica

/datum/job/replica/after_spawn(mob/living/H, mob/M, latejoin = FALSE)
	. = ..()
	//H.apply_pref_name(/datum/preference/name/synthetic, M.client)
	H.remove_all_quirks()

/datum/job/replica/get_access()
	return GLOB.synthetic_base_access

/datum/outfit/job/replica
	name = "Replika"
	jobtype = /datum/job/replica

	id_type = /obj/item/card/id/head/synthetic
	ears = null
	suit = null
	shoes = null
	uniform = null
	pda_type = null
	backpack = null
	implants = list()

/datum/outfit/job/replica/post_equip(mob/living/carbon/human/H, visualsOnly)
	..()
	var/obj/item/organ/cyberimp/eyes/hud/security/Y = new
	Y.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	var/obj/item/organ/cyberimp/brain/replica_controller/RCI = new
	RCI.Insert(H, special = TRUE, drop_if_replaced = FALSE)

/datum/outfit/job/replica/engineer
	name = "Engineer Replika"
	ears = /obj/item/radio/headset/headset_synthetic
	belt = /obj/item/storage/belt/utility/replica

/obj/item/storage/belt/utility/replica
	name = "synthetic utility belt"
	desc = "An integrated belt that allows synthetic units store tools."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	item_flags = DROPDEL
	
/obj/item/storage/belt/utility/replica/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, SYNTHETIC_TRAIT)

/obj/item/storage/belt/utility/replica/PopulateContents()
	SSwardrobe.provide_type(/obj/item/screwdriver, src)
	SSwardrobe.provide_type(/obj/item/wrench, src)
	SSwardrobe.provide_type(/obj/item/weldingtool/largetank, src)
	SSwardrobe.provide_type(/obj/item/crowbar, src)
	SSwardrobe.provide_type(/obj/item/wirecutters, src)
	SSwardrobe.provide_type(/obj/item/multitool, src)
	SSwardrobe.provide_type(/obj/item/stack/cable_coil, src)
	SSwardrobe.provide_type(/obj/item/barrier_taperoll/engineering, src)
	update_appearance(UPDATE_ICON)

/datum/outfit/job/replica/engineer/post_equip(mob/living/carbon/human/H, visualsOnly)
	..()
	var/obj/item/organ/cyberimp/chest/replica/T = new
	T.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	if(!visualsOnly)
		if(!GLOB.granted_synthetic_access[ENGINEERING])
			binary_talk("Synthetic assistance required in the Engineering department for the following reason: All-Purpose Repair Replika arrived.", "Synthetic Access Requester")
			GLOB.granted_synthetic_access[ENGINEERING] = TRUE
			GLOB.synthetic_added_access |= list(ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_ATMOSPHERICS, ACCESS_CONSTRUCTION, ACCESS_SECURE_TECH_STORAGE)

/datum/outfit/job/replica/sec
	name = "Security Replika"
	ears = /obj/item/radio/headset/headset_synthetic/alt
	belt = /obj/item/storage/belt/military/assault/replica

/obj/item/storage/belt/military/assault/replica
	name = "synthetic military belt"
	desc = "An integrated belt that allows synthetic units store tools."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	item_flags = DROPDEL
	
/obj/item/storage/belt/military/assault/replica/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, SYNTHETIC_TRAIT)

/obj/item/storage/belt/military/assault/replica/PopulateContents()
	SSwardrobe.provide_type(/obj/item/reagent_containers/spray/pepper, src)
	SSwardrobe.provide_type(/obj/item/restraints/handcuffs, src)
	SSwardrobe.provide_type(/obj/item/grenade/flashbang, src)
	SSwardrobe.provide_type(/obj/item/assembly/flash/handheld, src)
	SSwardrobe.provide_type(/obj/item/melee/classic_baton/telescopic, src)
	SSwardrobe.provide_type(/obj/item/barrier_taperoll/police, src)
	update_appearance(UPDATE_ICON)

/obj/item/radio/headset/headset_synthetic/alt
	icon_state = "hos_headset_alt"

/obj/item/radio/headset/headset_synthetic/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/datum/outfit/job/replica/sec/post_equip(mob/living/carbon/human/H, visualsOnly)
	..()
	var/obj/item/organ/cyberimp/chest/replica/plating/T = new
	T.Insert(H, special = TRUE, drop_if_replaced = FALSE)
	if(!visualsOnly)
		if(!GLOB.granted_synthetic_access[SECURITY])
			binary_talk("Synthetic assistance required in the Security department for the following reason: Security Technician Replica arrived.", "Synthetic Access Requester")
			GLOB.granted_synthetic_access[SECURITY] = TRUE
			GLOB.synthetic_added_access |= list(ACCESS_SECURITY, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_FORENSICS_LOCKERS, ACCESS_LAWYER, ACCESS_COURT, ACCESS_SEC_DOORS, ACCESS_BRIG_PHYS)

/datum/outfit/job/replica/naked
	name = "Synthetic (Naked)"

	uniform = null
	ears = null
	back = null
	shoes = null
	box = null

	preload = FALSE // These are used by the prefs ui, and also just kinda could use the extra help at roundstart

	backpack = null
	satchel  = null
	duffelbag = null

/datum/outfit/job/replica/naked/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	return

#undef SECURITY
#undef ENGINEERING