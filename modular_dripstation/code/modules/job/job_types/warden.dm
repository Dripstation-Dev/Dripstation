/datum/job/warden
	supervisor_corporation = /datum/corporation/spearhead
	added_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_FORENSICS_LOCKERS, ACCESS_BRIG_PHYS)
	base_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_MECH_SECURITY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM)
	loyalties = LOYALTY_SPEARHEAD_WARDEN


/datum/job/warden/GetIngameDesc(corp, stationname)
	return "You are the Second-in-Command of the local [corp] regiment, and the defacto leader if the commander isn't around. <br>\
	Within [corp] you largely hold a desk job, your duties will rarely take you outside of the [corp] wing, and you are not expected to interact with civilians. You have enough to deal with as is, and are probably the hardest working member of [corp].<br>\
	<br>\
	You have several core duties:<br>\
		1. As second in command, any of the commander's duties may be delegated to you, if they decide to do so. This means that at any time, you may be expected to handle funding, paperwork, disciplinary matters, planning combat tactics, or even carrying out executions. If there's no commander, these duties fall naturally to you. If there is a commander on site though, you shouldn't make these kind of decisions without consulting them.<br>\
		<br>\
		2. You serve as the [corp] quartermaster. And as such, it is your job to maintain the armoury, and stocks of other equipment. You should keep track of its contents, and who has what. Make sure weapons and equipment are returned at the end of a shift, and procure new armaments from the Cargo as necessary to keep supplies up and respond to new threats.<br>\
		<br>\
		3. You are the defacto warden, and if there are any prisoners being kept in the [corp] brig, it is your responsibility to ensure they are fed, treated appropriately with regard to their legal rights, and ensure they have access to medical care. If necessary you may need to suppress riots or escape attempts within the brig too.<br>\
		<br>\
		4. In times of peace, prepare for war. To this end, you are also the onsite military instructor. If the station is in a lull and there are no outstanding threats, you should take the initiative to order training drills. Allow junior officers to train and learn with less conventional weapons and tactics, give lessons on aiming, trigger discipline, hand to hand combat. Conduct drills on threat response, squad tactics, and EVA manoeuvres.<br>\ "


/datum/outfit/job/warden
	id_type = /obj/item/card/id/spearhead
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	uniform = /obj/item/clothing/under/rank/security/warden
	uniform_skirt = /obj/item/clothing/under/rank/security/warden/skirt

/datum/outfit/job/plasmaman/warden
	id_type = /obj/item/card/id/spearhead
	//pda_type = /obj/item/modular_computer/tablet/pda/preset/warden
