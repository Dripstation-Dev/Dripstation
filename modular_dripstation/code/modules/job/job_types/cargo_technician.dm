/datum/job/cargo_tech
	department_head = list("Quartermaster")
	supervisor_corporation = /datum/corporation/nanotrasen/kompac
	alt_supervisor_corporations = list(/datum/corporation/hephaestus/cargo)
	supervisors = "the quartermaster"
	lightup_areas = list(/area/quartermaster/office)
	added_access = list(ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION)

/datum/outfit/job/cargo_tech
	backpack_contents = list(/obj/item/boxcutter = 1)
	backpack = /obj/item/storage/backpack/cargo
	satchel = /obj/item/storage/backpack/satchel/cargo
	duffelbag = /obj/item/storage/backpack/duffelbag/cargo

/datum/outfit/job/plasmaman/cargo_tech
	backpack_contents = list(/obj/item/boxcutter = 1)
	backpack = /obj/item/storage/backpack/cargo
	satchel = /obj/item/storage/backpack/satchel/cargo
	duffelbag = /obj/item/storage/backpack/duffelbag/cargo

	pda_type = /obj/item/modular_computer/tablet/pda/preset/cargo
