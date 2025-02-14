/datum/job/security_consultant
	title = "Security Consultant"
	description = "Remember old good days. Consult officers and enforce corporate laws on security department if Magistrate seems reasonoble. Tell Captain and HoS if any of their ideas are stupid. Command security staff when HOS and warden are downed. Remember your allighment, NanoTrasen interests above all."
	orbit_icon = "user-tag"
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Captain", "Magistrate")
	head_announce = null
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Captain and Magistrate"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 6000 //100 hours on security jobs
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY
	alt_titles = list("Nanotrasen Defense Team Member", "Nanotrasen Fighting Force Veteran")

	outfit = /datum/outfit/job/security_consultant

	added_access = list(ACCESS_MORGUE, ACCESS_FORENSICS_LOCKERS, ACCESS_BRIG_PHYS)
	base_access = list(ACCESS_SECURITY, ACCESS_MAINT_TUNNELS, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT,
						ACCESS_WEAPONS, ACCESS_MECH_SECURITY, ACCESS_MINERAL_STOREROOM, ACCESS_EVA, ACCESS_HEADS,
						ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAILSORTING, ACCESS_RESEARCH, ACCESS_ENGINE, ACCESS_MEDICAL)
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_CAR
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SECURITY_CONSULTANT
	minimal_character_age = 30 //You have seen some shit

	department_for_prefs = /datum/job_department/security
	departments_list = list(
		/datum/job_department/security,
		/datum/job_department/command
	)

	mail_goodies = list(
		/obj/item/clothing/accessory/medal/conduct = 1,
		/obj/item/clothing/under/rank/security/consultant/tactical = 5,
		/obj/item/clothing/under/rank/security/consultant/skirt/tactical = 5,
		/obj/item/instrument/trumpet = 5,
		/obj/item/storage/fancy/cigarettes/cigars = 10
	)

	smells_like = "Job that you never asked for"

	minimal_lightup_areas = list(/area/security)

// Special handling to avoid lighting up the entirety of supply whenever there's a HoP.
///datum/job/security_consultant/areas_to_light_up(minimal_access = TRUE)
//	return minimal_lightup_areas | GLOB.security_lightup_areas

/datum/job/security_consultant/get_default_roundstart_spawn_point()
	for(var/obj/effect/landmark/start/spawn_point as anything in GLOB.start_landmarks_list)
		if(spawn_point.name != "Security Officer")
			continue
		. = spawn_point
		if(spawn_point.used) //so we can revert to spawning them on top of eachother if something goes wrong
			continue
		spawn_point.used = TRUE
		break
	if(!.) // Try to fall back to "our" landmark
		. = ..()
	if(!.)
		log_mapping("Job [title] ([type]) couldn't find a round start spawn point.")


/datum/job/security_consultant/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	var/mob/living/carbon/veteran = spawned
	if(veteran)
		veteran.gain_trauma(/datum/brain_trauma/special/ptsd) //War, war never changes...

/datum/outfit/job/security_consultant
	name = "Security Consultant"
	jobtype = /datum/job/security_consultant

	id_type = /obj/item/card/id/nanotrasen
	pda_type = /obj/item/modular_computer/tablet/phone/preset/advanced

	glasses = /obj/item/clothing/glasses/hud/security/military
	ears = /obj/item/radio/headset/headset_com/alt/security_consultant
	uniform = /obj/item/clothing/under/rank/security/consultant
	uniform_skirt = /obj/item/clothing/under/rank/security/consultant/skirt
	gloves = /obj/item/clothing/gloves/tackler/combat/nt_elite
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/armor/hardened/cmd
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/command
	head = /obj/item/clothing/head/helmet/hardened/cmd
	mask = /obj/item/clothing/mask/breath/tactical
	suit_store = /obj/item/gun/ballistic/automatic/proto
	belt = /obj/item/storage/belt/military/assault/consultant
	backpack = /obj/item/storage/backpack/unknown
	satchel = /obj/item/storage/backpack/satchel/unknown
	duffelbag = /obj/item/storage/backpack/duffelbag/unknown
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1)
	implants = list(/obj/item/implant/mindshield/centcom)
