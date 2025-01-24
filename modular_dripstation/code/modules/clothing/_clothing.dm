/obj/item/clothing
	var/list/species_restricted = null //Only these species can wear this kit.


//BS12: Species-restricted clothing ID check. ID!!!
/obj/item/clothing/mob_can_equip(M as mob, slot)

	//if we can't equip the item anyway, don't bother with species_restricted (also cuts down on spam)
	if(!..())
		return FALSE

	// Skip species restriction checks on non-equipment slots
	if(slot in list(ITEM_SLOT_LPOCKET, ITEM_SLOT_RPOCKET, ITEM_SLOT_BACKPACK, ITEM_SLOT_SUITSTORE))
		return TRUE

	if(species_restricted && istype(M,/mob/living/carbon/human))

		var/wearable = FALSE
		var/exclusive = FALSE
		var/mob/living/carbon/human/H = M

		if("exclude" in species_restricted)
			exclusive = TRUE

		if(H.dna.species)
			if(exclusive)
				if(!(H.dna.species.id in species_restricted))
					wearable = TRUE
			else
				if(H.dna.species.id in species_restricted)
					wearable = TRUE

			if(!wearable)
				to_chat(M, "<span class='warning'>Your species cannot wear [src].</span>")
				return FALSE

	return TRUE