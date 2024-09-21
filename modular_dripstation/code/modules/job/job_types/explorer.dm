/datum/job/explorer
	title = "Explorer"
	description = "Travel to strange lands. Find stuff. \
		Meet strange creatures. Kill them for their belongings."
	department_head = list("Quartermaster")
	orbit_icon = "binoculars"
	faction = "Station"
	total_positions = 0
	spawn_positions = 1
	supervisors = "the quartermaster"
	minimal_player_age = 14
	exp_requirements = 120
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SUPPLY
	alt_titles = list("Space Scout", "Junior Explorer", "Major Explorer", "Surveyor")

	outfit = /datum/outfit/job/explorer

	added_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_RESEARCH, ACCESS_RND)
	base_access = list(ACCESS_EXPLORER, ACCESS_GATEWAY, ACCESS_EVA, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_MEDIUM	//He is just a guy that is more valuable then tech, but less than normal shaft miner
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_EXPLORER
	minimal_character_age = 18 //Young and fresh bodies for a high mortality job, what more could you ask for

	departments_list = list(
		/datum/job_department/cargo,
	)

	mail_goodies = list(
		/obj/item/reagent_containers/autoinjector/medipen/survival = 10,
		/obj/item/grenade/plastic/miningcharge/lesser = 10,
		//obj/item/card/mining_point_card = 10,
		/obj/item/grenade/plastic/miningcharge = 5,
		//obj/item/card/mining_point_card/thousand = 5,
		/obj/item/grenade/plastic/miningcharge/mega = 1,
		//obj/item/card/mining_point_card/fivethousand = 1
	)

	smells_like = "adventures"

	minimal_lightup_areas = list(/area/quartermaster/miningoffice)

/datum/outfit/job/explorer
	name = "Explorer"
	jobtype = /datum/job/explorer

	pda_type = /obj/item/modular_computer/tablet/pda/preset/shaft_miner

	ears = /obj/item/radio/headset/headset_cargo/explorer
	uniform = /obj/item/clothing/under/rank/miner/explorer
	uniform_skirt = /obj/item/clothing/under/rank/miner/explorer/fem
	suit = /obj/item/clothing/suit/toggle/bomber/explorer
	head = /obj/item/clothing/head/soft/explorer
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/workboots/mining
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/cargo
	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag/explorer
	backpack_contents = list()