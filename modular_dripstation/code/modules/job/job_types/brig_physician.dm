/datum/job/brigphysician
	department_head = list("Chief Medical Officer", "Head of Security")
	supervisor_corporation = /datum/corporation/spearhead
	loyalties = LOYALTY_CORP_SLAVE
	base_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_BRIG, ACCESS_SEC_DOORS, ACCESS_WEAPONS, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MECH_MEDICAL, ACCESS_BRIG_PHYS)	//ACCESS_WEAPONS giving brigphys the ability to be armed

/datum/job/brigphysician/GetIngameDesc(corp, stationname)
	return "You are a highly trained specialist within [corp]. You were probably a medical student or inexperienced doctor when you joined [corp], and you thusly have a combination of medical and military training. You are not quite as knowledgeable as a civilian career doctor, not quite as much of a fighter as a dedicated operative, but strike a balance inbetween. Balance is the nature of your existence.<br>\
	<br>\
	Within [corp], you have three roles to undertake. All of your roles can be delegated to others when needed - station medical stuff for roles 1 and 2, the [corp] detective for role 3. But you are often the best positioned to carry out these tasks, especially when time is short.<br>\
	<br>\
	1. Field Medic. <br>\
	You may be expected to serve on the backlines in a combat situation, treating and stabilising the wounded, making the call as to whether they can return to combat or leave by medivac. You may need to perform emergency trauma surgery in undesireable conditions. <br>\
	You are allowed to be armed, but remember that saving lives, not taking them, is your first duty. Don't be afraid to send patients to station medical stuff for proper specialist care.<br>\
	<br>\
	2. Prison Doctor.<br>\
	During quiet times, when inmates are serving in the brig, you will often be required to treat prisoners, criminal suspects, and the condemned. Suicide attempts are common in prison, and you will often be treating a patient against their will, who is attempting to escape. When serving in this role, stay on guard, work closely with the warden, and keep control of the situation.<br>\
	<br>\
	3. Forensic Specialist.<br>\
	Solving crimes often requires scientific analysis, and expert rulings from a trusted source within [corp]. You will often be expected to analyze blood, chemicals and fingerprints, conduct autopsies, and submit your findings to help track down elusive culprits. In this task, you will work closely with the detective, and if necessary, he often has the talents to perform these tasks. But his time is better spent questioning and interrogating people."


/datum/outfit/job/brigphysician
	id_type = /obj/item/card/id/spearhead
	uniform = /obj/item/clothing/under/yogs/rank/physician/white
	gloves = /obj/item/clothing/gloves/color/latex/black
	backpack = /obj/item/storage/backpack/bmed
	satchel = /obj/item/storage/backpack/satchel/bmed
	duffelbag = /obj/item/storage/backpack/duffelbag/bmed
	glasses = /obj/item/clothing/glasses/sunglasses

	pda_type = /obj/item/modular_computer/tablet/pda/preset/medical/phys

/datum/outfit/job/plasmaman/brigphysician
	id_type = /obj/item/card/id/spearhead
	gloves = /obj/item/clothing/gloves/color/latex/black
	backpack = /obj/item/storage/backpack/bmed
	satchel = /obj/item/storage/backpack/satchel/bmed
	duffelbag = /obj/item/storage/backpack/duffelbag/bmed

	pda_type = /obj/item/modular_computer/tablet/pda/preset/medical/phys
	pda_slot = ITEM_SLOT_LPOCKET
