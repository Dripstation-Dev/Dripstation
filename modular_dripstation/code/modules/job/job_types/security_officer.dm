/datum/job/officer
	supervisors = "the head of security and warden"
	supervisor_corporation = /datum/corporation/spearhead
	loyalties = LOYALTY_SPEARHEAD_OFFICER

/datum/job/officer/GetIngameDesc(corp, stationname)
	return "You are the boots on the ground, the rifle in the window, the long arm of the law. You are the hand of [corp], and the frontline against criminals, terrorists, and dangerous xenos.<br>\
	<br>\
	You are a professional soldier and a hardened mercenary, no stranger to violence. You are required to employ your talents in order to bring an end to threats and conflict situations. As a consummate professional, you're often expected to put your pride aside, and work with others. Tactics and teamwork are vital.<br>\
	<br>\
	You are paid to act, not to think. When in doubt, follow orders, and leave the hard choices to someone else. Trust in your chain of command. Remember that you are the lowest rank in [corp], and you report to everyone else in your organisation. Detective, brig physician, warden and commander, are all your superior officers, their orders should be obeyed.<br>\
	<br>\
	When there are no standing orders, your ongoing task is to patrol the station and be on the lookout for threats. Check in at departments, ask if there are any concerns, break up fights and do your best to prevent trouble before it spirals out of control. Wipe out roaches and other dangerous creatures wherever you encounter them.<br>\
	<br>\
	You have or can have almost-total access to the station in order to carry out your duties and reach threats quickly. Do not abuse this. It does not mean you can walk into anywhere you like, many areas are full of sensitive machinery and entering unnanounced can be harmful to your health. Do not steal from departments either. If it's not in the [corp] wing, it doesn't belong to you. Stealing from the Cargo is a good way to get shot in the back."


/datum/outfit/job/security
	id_type = /obj/item/card/id/spearhead
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	suit = /obj/item/clothing/suit/armor/vest
	ears = /obj/item/radio/headset/headset_sec
	glasses = /obj/item/clothing/glasses/hud/security/ballistic/up
	backpack_contents = list(/obj/item/reagent_containers/spray/pepper=1)
	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)

/datum/outfit/job/plasmaman/security
	id_type = /obj/item/card/id/spearhead
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	suit = /obj/item/clothing/suit/armor/vest
	ears = /obj/item/radio/headset/headset_sec
	glasses = /obj/item/clothing/glasses/hud/security/ballistic/up
	backpack_contents = list(/obj/item/reagent_containers/spray/pepper=1)
