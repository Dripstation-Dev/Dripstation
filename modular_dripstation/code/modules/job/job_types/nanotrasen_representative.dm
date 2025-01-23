/datum/job/ntrep
	title = "Nanotrasen Representative"
	description = "Represent The Best Corporation and Central Command on the station, argue with the HoS about why he can't just field execute people for petty theft, get drunk in your office, die unnoticed."
	orbit_icon = "fax"
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
	alt_titles = list("Nanotrasen Consultant", "Central Command Representative")

	outfit = /datum/outfit/job/ntrep

	added_access = list(ACCESS_CAPTAIN, ACCESS_HOP)
	base_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
			            ACCESS_MEDICAL, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS, ACCESS_TELEPORTER,
			            ACCESS_SURGERY, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
			            ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_HYDROPONICS, ACCESS_LAWYER,
			            ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_VAULT, ACCESS_MINING_STATION,
			            ACCESS_NTREP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_MANUFACTURING, ACCESS_SERVHALL)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_NTREP
	minimal_character_age = 30 //Baseline age requirement and competency, as well as ability to assume leadership in shite situations

	department_for_prefs = /datum/job_department/central_command
	departments_list = list(
		/datum/job_department/command
	)

	mail_goodies = list(
		/obj/item/toner = 15,
		/obj/item/pen/fourcolor = 10,
		/obj/item/stamp = 5,
		/obj/item/stamp/denied = 5,
		/obj/item/stamp/syndi = 3,
		/obj/item/stamp/cent = 1 //the holy grail of stamps
	)

	smells_like = "bureaucracy"

	minimal_lightup_areas = list(/area/crew_quarters/heads/ntrep)

// Special handling to avoid lighting up the entirety of supply whenever there's a HoP.
/datum/job/ntrep/areas_to_light_up(minimal_access = TRUE)
	return minimal_lightup_areas | GLOB.command_lightup_areas

/datum/outfit/job/ntrep
	name = "Nanotrasen Representative"
	jobtype = /datum/job/ntrep

	id_type = /obj/item/card/id/nanotrasen
	pda_type = /obj/item/modular_computer/tablet/phone/preset/advanced/command/ntrep

	glasses = /obj/item/clothing/glasses/hud/personnel
	ears = /obj/item/radio/headset/heads/ntrep
	uniform = /obj/item/clothing/under/rank/centcom_officer/ntrep
	uniform_skirt = /obj/item/clothing/under/rank/centcom_officer/ntrep/skirt
	suit = /obj/item/clothing/suit/toggle/ntrep
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/command
	head = /obj/item/clothing/head/ntrep
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1)
	implants = list(/obj/item/implant/mindshield/centcom)