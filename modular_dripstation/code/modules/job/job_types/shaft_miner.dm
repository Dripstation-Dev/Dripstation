/datum/job/mining
	department_head = list("Quartermaster")
	supervisor_corporation = /datum/corporation/nanotrasen/kompac
	alt_supervisor_corporations = list(/datum/corporation/hephaestus/cargo)
	supervisors = "the quartermaster"
	alt_titles = list("Lavaland Scout", "Prospector", "Junior Miner", "Major Miner")
	added_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_RESEARCH)

/datum/outfit/job/miner
	duffelbag = /obj/item/storage/backpack/duffelbag/explorer
	uniform = /obj/item/clothing/under/rank/cargo/miner
	uniform_skirt = /obj/item/clothing/under/rank/cargo/miner/skirt

/datum/outfit/job/plasmaman/miner
	duffelbag = /obj/item/storage/backpack/duffelbag/explorer
