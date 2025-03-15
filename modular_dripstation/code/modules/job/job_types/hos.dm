/datum/job/hos
	supervisor_corporation = /datum/corporation/spearhead
	loyalties = LOYALTY_SPEARHEAD_HEAD_OF_SECURITY


/datum/job/hos/GetIngameDesc(corp, stationname)
	return "You are the commander of the local regiment of the [corp] company, contracted to protect and serve aboard the [stationname]. [corp] serves as both an internal security force, and as a guard for expeditions outwith the station.<br>\
	<br>\
	Your goal is to keep everyone aboard the station as safe as possible, and to eliminate any threats to safety.<br>\
	The Warden is your second in command, and any of your duties can be delegated to him at your discretion.<br>\
	<br>\
	Coordinate officers in the field, assigning them to threats and distress calls as needed.<br>\
	Allocate department funds for necessary supplies, equipment, armor, weapons, upgrades, etc. Spend your money as required to ensure your troops are at peak combat performance<br>\
	Plan assaults on entrenched threats, ensure each officer knows their roles and carries them out precisely.<br>\
	Oversee performance of the officers under your command, and punish any that are insubordinate or incompetent<br>\
	Advise the captain on threats to station security, and counsel him towards choices that will minimise exposure to threats."

/datum/outfit/job/hos
	id_type = /obj/item/card/id/head/hos
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/aviators
	belt = null
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	backpack_contents = list(/obj/item/storage/box/sec_ids = 1, /obj/item/melee/classic_baton/telescopic=1, /obj/item/storage/lockbox/amnestic = 1)

/datum/outfit/job/plasmaman/hos
	id_type = /obj/item/card/id/head/hos
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/aviators
	belt = null
	gloves = /obj/item/clothing/gloves/color/black/tactifool
