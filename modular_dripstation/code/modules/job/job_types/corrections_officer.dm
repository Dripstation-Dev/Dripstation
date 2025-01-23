/datum/job/corrections_officer
	title = "Corrections Officer"
	description = "Beat all shit out of the prison scumbags."
	orbit_icon = "user-lock"
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Head of Security")
	head_announce = null
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Head of Security"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180 //3 hours on security jobs
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY
	alt_titles = list("Brig Enforcer")

	outfit = /datum/outfit/job/corrections_officer

	added_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_FORENSICS_LOCKERS, ACCESS_BRIG_PHYS)
	base_access = list(ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MECH_SECURITY, ACCESS_COURT, ACCESS_WEAPONS)
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_CORRECTIONS_OFFICER
	minimal_character_age = 21 // Skilled sec officer. Somewhat.

	department_for_prefs = /datum/job_department/security
	departments_list = list(
		/datum/job_department/security
	)

	mail_goodies = list(
		/obj/item/clothing/under/rank/security/corrections_officer/tactical = 5,
		/obj/item/clothing/under/rank/security/corrections_officer/skirt/tactical = 5
	)

	smells_like = "Locked people"

	minimal_lightup_areas = list(/area/security)

// Special handling to avoid lighting up the entirety of supply whenever there's a HoP.
///datum/job/corrections_officer/areas_to_light_up(minimal_access = TRUE)
//	return minimal_lightup_areas | GLOB.security_lightup_areas

/datum/job/corrections_officer/get_default_roundstart_spawn_point()
	var/list/chair_turfs = list()
	var/list/possible_turfs = list()
	var/area/brig = GLOB.areas_by_type[/area/security/brig]
	if(isnull(brig))
		return ..() //if no brig, spawn on the arrivals shuttle (but also what the fuck)
	for (var/list/zlevel_turfs as anything in brig.get_zlevel_turf_lists())
		for (var/turf/possible_turf as anything in zlevel_turfs)
			if(possible_turf.is_blocked_turf())
				continue
			if(locate(/obj/structure/chair) in possible_turf)
				chair_turfs += possible_turf
				continue
			possible_turfs += possible_turf
	if(length(chair_turfs))
		return pick(chair_turfs) //prioritize turfs with a chair
	if(length(possible_turfs))
		return pick(possible_turfs) //if none, just pick a random turf in the brig
	return ..() //if the brig has no turfs, spawn on the arrivals shuttle

/datum/outfit/job/corrections_officer
	name = "Corrections Officer"
	jobtype = /datum/job/corrections_officer

	id_type = /obj/item/card/id
	pda_type = /obj/item/modular_computer/tablet/pda/preset/security/warden
	pda_slot = ITEM_SLOT_LPOCKET

	uniform = /obj/item/clothing/under/rank/security/corrections_officer
	uniform_skirt = /obj/item/clothing/under/rank/security/corrections_officer/skirt
	head = /obj/item/clothing/head/brigoff
	shoes = /obj/item/clothing/shoes/jackboots
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/jackboots
	r_pocket = null
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	suit = /obj/item/clothing/suit/armor/vest/alt
	ears = /obj/item/radio/headset/headset_sec
	belt = /obj/item/storage/belt/security/corrections
	glasses = /obj/item/clothing/glasses/hud/security
	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/survival/security
	backpack_contents = list()
	chameleon_extras = list()

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/plasmaman/corrections_officer
	name = "Corrections Officer"
	jobtype = /datum/job/corrections_officer

	id_type = /obj/item/card/id
	pda_type = /obj/item/modular_computer/tablet/pda/preset/security/warden
	pda_slot = ITEM_SLOT_LPOCKET

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	r_hand= /obj/item/tank/internals/plasmaman/belt/full
	mask = /obj/item/clothing/mask/gas/sechailer
	uniform = /obj/item/clothing/under/plasmaman/security
	ears = /obj/item/radio/headset/headset_sec
	belt = /obj/item/storage/belt/security/corrections
	glasses = /obj/item/clothing/glasses/hud/security
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	suit = /obj/item/clothing/suit/armor/vest/alt
	shoes = /obj/item/clothing/shoes/jackboots
	r_pocket = null
	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/survival/security
	backpack_contents = list()
	chameleon_extras = list()

	implants = list(/obj/item/implant/mindshield)
