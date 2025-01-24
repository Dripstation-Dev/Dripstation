/datum/job/bridge_assistant
	title = "Bridge Assistant"
	description = "Be assistant. The Bridge one. Assist the Captain himself, help Heads with their jobs, fetch coffee, protect the Bridge."
	orbit_icon = "user-check"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Captain")
	head_announce = null
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Captain, and in non-Bridge related situations the other heads"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 120 //2 hour shift on command jobs
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_COMMAND
	alt_titles = list("Captain`s Secretary")

	outfit = /datum/outfit/job/bridge_assistant

	added_access = list(ACCESS_CHANGE_IDS, ACCESS_CARGO, ACCESS_TCOMSAT, ACCESS_RESEARCH, ACCESS_MEDICAL)
	base_access = list(ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
						ACCESS_EVA, ACCESS_HEADS, ACCESS_RC_ANNOUNCE, ACCESS_GATEWAY,
			    		ACCESS_BAR, ACCESS_JANITOR, ACCESS_KITCHEN, ACCESS_HYDROPONICS,
			    		ACCESS_SERVHALL, ACCESS_CONSTRUCTION, ACCESS_MAINT_TUNNELS,
			    		ACCESS_MAILSORTING)
	paycheck = PAYCHECK_MEDIUM	//u are assistant after all
	paycheck_department = ACCOUNT_CAR
	mind_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM) //beat the intruders, drink secy shit

	display_order = JOB_DISPLAY_ORDER_BRIDGE_ASSISTANT
	minimal_character_age = 21 //Assistant with some skill

	department_for_prefs = /datum/job_department/assistant
	departments_list = list(
		/datum/job_department/command
	)

	mail_goodies = list(
		/obj/item/clothing/mask/cigarette/cigar/havana = 10,
		/obj/item/reagent_containers/food/drinks/bottle/champagne = 5,
		/obj/item/pen/fountain = 1,
	)

	smells_like = "grey pants"

	//minimal_lightup_areas = list(/area/crew_quarters/heads)

// Special handling to avoid lighting up the entirety of supply whenever there's a HoP.
///datum/job/bridge_assistant/areas_to_light_up(minimal_access = TRUE)
//	return minimal_lightup_areas | GLOB.command_lightup_areas

/datum/job/bridge_assistant/get_default_roundstart_spawn_point()
	var/list/chair_turfs = list()
	var/list/possible_turfs = list()
	var/area/bridge = GLOB.areas_by_type[/area/bridge]
	if(isnull(bridge))
		return ..() //if no bridge, spawn on the arrivals shuttle (but also what the fuck)
	for (var/list/zlevel_turfs as anything in bridge.get_zlevel_turf_lists())
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
		return pick(possible_turfs) //if none, just pick a random turf in the bridge
	return ..() //if the bridge has no turfs, spawn on the arrivals shuttle

/datum/outfit/job/bridge_assistant
	name = "Bridge Assistant"
	jobtype = /datum/job/bridge_assistant

	id_type = /obj/item/card/id/head
	pda_type = /obj/item/modular_computer/tablet/phone/preset/advanced

	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/bridge_assistant
	uniform_skirt = /obj/item/clothing/under/rank/bridge_assistant/skirt
	r_pocket = /obj/item/assembly/flash/handheld
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	shoes = /obj/item/clothing/shoes/sneakers/black
	suit = /obj/item/clothing/suit/armor/vest/alt
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/command
	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/gun/energy/e_gun/mini/secure)
	implants = list(/obj/item/implant/mindshield)
