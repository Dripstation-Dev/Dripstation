/datum/job/blueshield
	title = "Blueshield"
	description = "Protect heads of staff, get your fancy gun stolen, cry as all heads of staff die in some shitty places."
	orbit_icon = "shield-alt"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("CentCom")
	head_announce = null
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Central Command officers"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 360 //6 hours on command jobs
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_COMMAND
	alt_titles = list("Blueshield Lieutenant", "Close Protection Specialist", "Executive Protection Agent")

	outfit = /datum/outfit/job/blueshield

	added_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS, ACCESS_CARGO, ACCESS_QM, ACCESS_NTREP, ACCESS_RD, ACCESS_CE, ACCESS_CMO, ACCESS_TCOMSAT, ACCESS_SECURITY)
	base_access = list(ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
			            ACCESS_KEYCARD_AUTH, ACCESS_EVA, ACCESS_HEADS, ACCESS_TELEPORTER, ACCESS_BLUESHIELD, ACCESS_RC_ANNOUNCE, ACCESS_GATEWAY,
			            ACCESS_MEDICAL, ACCESS_SURGERY, ACCESS_MORGUE, ACCESS_CREMATORIUM,
			            ACCESS_BAR, ACCESS_JANITOR, ACCESS_KITCHEN, ACCESS_HYDROPONICS, ACCESS_LAWYER,
			            ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_SERVHALL,
			            ACCESS_CONSTRUCTION, ACCESS_ENGINE, ACCESS_MAINT_TUNNELS,
			            ACCESS_RESEARCH, ACCESS_ROBO_CONTROL, ACCESS_ROBOTICS, ACCESS_TOX,
			            ACCESS_MAILSORTING, ACCESS_MINING, ACCESS_MINING_STATION)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_BLUESHIELD
	minimal_character_age = 26 //Baseline age requirement and competency, as well as ability to assume leadership in shite situations

	department_for_prefs = /datum/job_department/central_command
	departments_list = list(
		/datum/job_department/command
	)

	mail_goodies = list(
		/obj/item/clothing/mask/gas/sechailer/swat/blueshield = 5,
		/obj/item/clothing/suit/armor/bulletproof/blueshield = 5
	)

	smells_like = "MR blue sky"

	minimal_lightup_areas = list(/area/crew_quarters/heads/blueshield)

// Special handling to avoid lighting up the entirety of supply whenever there's a HoP.
/datum/job/blueshield/areas_to_light_up(minimal_access = TRUE)
	return minimal_lightup_areas | GLOB.command_lightup_areas

/datum/outfit/job/blueshield
	name = "Blueshield"
	jobtype = /datum/job/blueshield

	id_type = /obj/item/card/id/nanotrasen
	pda_type = /obj/item/modular_computer/tablet/phone/preset/advanced/blueshield

	glasses = /obj/item/clothing/glasses/hud/health/military
	ears = /obj/item/radio/headset/blueshield/alt
	uniform = /obj/item/clothing/under/rank/blueshield
	uniform_skirt = /obj/item/clothing/under/rank/blueshield/skirt
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/vest/blueshield
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/command
	head = /obj/item/clothing/head/beret/blueshield
	mask = /obj/item/clothing/mask/breath/tactical
	suit_store = /obj/item/gun/energy/e_gun
	backpack = /obj/item/storage/backpack/blueshield
	satchel = /obj/item/storage/backpack/satchel/blueshield
	duffelbag = /obj/item/storage/backpack/duffelbag/blueshield
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/storage/box/security/biosig_nt)
	implants = list(/obj/item/implant/mindshield/centcom)