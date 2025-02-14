/datum/job/hos
	supervisor_corporation = /datum/corporation/spearhead

/datum/outfit/job/hos
	id_type = /obj/item/card/id/head
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/aviators
	belt = null
	gloves = /obj/item/clothing/gloves/color/black/tactifool
	backpack_contents = list(/obj/item/storage/box/sec_ids = 1, /obj/item/storage/lockbox/amnestic = 1)

/datum/outfit/job/hos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return
		
	var/obj/item/card/id/W = H.wear_id
	W.iff_signal = SPEARHEAD_IFF

/datum/outfit/job/plasmaman/hos
	id_type = /obj/item/card/id/head
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/aviators
	belt = null
	gloves = /obj/item/clothing/gloves/color/black/tactifool
