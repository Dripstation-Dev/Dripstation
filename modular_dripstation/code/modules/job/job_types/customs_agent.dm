/datum/job/customs
	title = "Customs Agent"
	description = "Controll incoming purchases. Perform random searches on shaft miners and explorers. Help Quarteermaster. Defend Cargo."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Quartermaster")
	orbit_icon = "id-badge"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the quartermaster"
	minimal_player_age = 14
	exp_requirements = 120
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SUPPLY
	alt_titles = list("Customs Officer", "Customs Specialist")

	outfit = /datum/outfit/job/customs

	added_access = list(ACCESS_SEC_DOORS, ACCESS_SECURITY, ACCESS_BAR)
	base_access = list(ACCESS_WEAPONS, ACCESS_GATEWAY,
						ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, 
						ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_MEDIUM	//He is just a guy that is more valuable then tech, but less than normal officer
	paycheck_department = ACCOUNT_CAR
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_CUSTOMS
	minimal_character_age = 18 //We love manual labor and exploiting the young for our corporate purposes

	departments_list = list(
		/datum/job_department/cargo,
	)

	mail_goodies = list(
		/obj/item/reagent_containers/food/snacks/donut = 10,
		/obj/item/reagent_containers/food/drinks/beer = 5,
		/obj/item/reagent_containers/food/drinks/beer/light = 4,
		/obj/item/clothing/suit/armor/vest/alt = 3,
		/obj/item/gun/ballistic/rifle/boltaction = 1
	)

	smells_like = "customs controll"

	minimal_lightup_areas = list(/area/quartermaster/sorting)
	supervisor_corporation = /datum/corporation/nanotrasen/kompac

/datum/outfit/job/customs
	name = "Customs Agent"
	jobtype = /datum/job/customs

	pda_type = /obj/item/modular_computer/tablet/pda/preset/cargo
	pda_slot = ITEM_SLOT_LPOCKET

	glasses = /obj/item/clothing/glasses/hud/permit
	ears = /obj/item/radio/headset/headset_cargo
	uniform = /obj/item/clothing/under/rank/cargo/tech/customs
	uniform_skirt = /obj/item/clothing/under/rank/cargo/tech/customs/skirt
	suit = /obj/item/clothing/suit/customs
	suit_store = /obj/item/melee/baton/loaded/departmental/cargo
	gloves = /obj/item/clothing/gloves/fingerless/tactifool
	shoes = /obj/item/clothing/shoes/jackboots
	digitigrade_shoes = /obj/item/clothing/shoes/xeno_wraps/jackboots
	belt = null
	backpack = /obj/item/storage/backpack/cargo
	satchel = /obj/item/storage/backpack/satchel/cargo
	duffelbag = /obj/item/storage/backpack/duffelbag/cargo
	backpack_contents = list(/obj/item/reagent_containers/spray/pepper = 1, /obj/item/melee/shocker = 1)
	r_pocket = /obj/item/assembly/flash/handheld
	implants = list(/obj/item/implant/mindshield)