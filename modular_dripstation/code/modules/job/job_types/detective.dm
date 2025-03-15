/datum/job/detective
	supervisor_corporation = /datum/corporation/spearhead
	loyalties = LOYALTY_SPEARHEAD_DETECTIVE


/datum/job/officer/GetIngameDesc(corp, stationname)
	description = "You are the station's detective, here to take care of the cases that aren't always what they seem, and suspects that aren't always caught red handed or ready to confess.<br>\
	The detective's job is to interrogate suspects, gather witness statements, harvest evidence and reach a conclusion about the nature and culprit of a crime.<br>\
	<br>\
	You are a higher ranking [corp] officer, and you can give commands to other officers.But this doesn't mean you should be commanding assaults. You're not any kind of tactical commander<br>\
	<br>\
	When there are no outstanding cases, your job is to go look for them. Mingle with civilians, interact and converse, sniff out leads about potential criminal activity. The [corp] budget can often include stipends to pay informers for any useful info.<br>\
	1. Interview suspects and witnesses after a crime. Record important details of their statements, and look for inconsistencies.<br>\
	2. Gather evidence and bring it back for processing.<br>\
	3. Send out operatives to bring suspects in for questioning.<br>\
	4. Interact with civilians and be on the lookout for criminal activity."

/datum/outfit/job/detective
	id_type = /obj/item/card/id/spearhead
	uniform = /obj/item/clothing/under/rank/security/detective
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/headset_sec

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec/detective
	duffelbag = /obj/item/storage/backpack/duffelbag/sec

	backpack_contents = list(/obj/item/storage/box/evidence=1)

/datum/outfit/job/plasmaman/detective
	id_type = /obj/item/card/id/spearhead
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/headset_sec

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec/detective
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
