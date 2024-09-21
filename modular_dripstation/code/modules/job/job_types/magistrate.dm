/datum/job/magistrate
	title = "Magistrate"
	description = "Judge the guilty, exploit the holes in Corporate Law, \
		ensure Security is following their contract protocols. \
		Call the wrath of Central Command via fax finding out that HOS is lynching everyone."
	orbit_icon = "pencil-alt"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("CentCom")
	head_announce = null
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Terragov Fleet Court and Nanotrasen Internal Affairs Department Headquarters"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 360 //6 hours on command jobs
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_COMMAND
	alt_titles = list("TerraGov Judge",	"Nanotrasen Internal Affairs Representative")

	outfit = /datum/outfit/job/magistrate

	added_access = list(ACCESS_CAPTAIN, ACCESS_HOP)
	base_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_FORENSICS_LOCKERS,
			            ACCESS_MEDICAL, ACCESS_ENGINE, ACCESS_EVA, ACCESS_HEADS,
			            ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
			            ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_MAILSORTING, ACCESS_HYDROPONICS, ACCESS_LAWYER,
			            ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_MINING, ACCESS_MINING_STATION,
			            ACCESS_RC_ANNOUNCE, ACCESS_GATEWAY, ACCESS_MAGISTRATE)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CAR
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_MAGISTRATE
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

	minimal_lightup_areas = list(/area/crew_quarters/heads/magistrate)

// Special handling to avoid lighting up the entirety of supply whenever there's a HoP.
/datum/job/magistrate/areas_to_light_up(minimal_access = TRUE)
	return minimal_lightup_areas | GLOB.command_lightup_areas

/datum/outfit/job/magistrate
	name = "Magistrate"
	jobtype = /datum/job/magistrate

	id_type = /obj/item/card/id/nanotrasen
	pda_type = /obj/item/modular_computer/tablet/phone/preset/advanced/command/magistrate

	glasses = /obj/item/clothing/glasses/hud/personnel
	ears = /obj/item/radio/headset/heads/magistrate
	uniform = /obj/item/clothing/under/rank/centcom_officer/magistrate
	uniform_skirt = /obj/item/clothing/under/rank/centcom_officer/magistrate/skirt
	suit = /obj/item/clothing/suit/toggle/NTjacket_black
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/command
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic/cane=1)
	implants = list(/obj/item/implant/mindshield/centcom)