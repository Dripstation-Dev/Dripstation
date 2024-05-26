/datum/outfit/job/doctor
	gloves = null
	belt = null
	pda_slot = ITEM_SLOT_LPOCKET
	chameleon_extras = list(/obj/item/gun/syringe, /obj/item/clothing/gloves/color/latex)

/datum/outfit/job/plasmaman/doctor
	gloves = /obj/item/clothing/gloves/color/latex
	belt = null
	pda_slot = ITEM_SLOT_LPOCKET

/datum/outfit/job/doctor/dead
	name = "Medical Doctor (Dead)"
	gloves = /obj/item/clothing/gloves/color/latex
	suit =  /obj/item/clothing/suit/toggle/labcoat
	belt = /obj/item/storage/belt/medical/full
	l_hand = null
	pda_type = /obj/item/modular_computer/tablet/pda/preset/medical
	pda_slot = ITEM_SLOT_LPOCKET
