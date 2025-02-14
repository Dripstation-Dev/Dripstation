/mob/living/carbon/human/proc/smart_equiplpouch() // put held thing in pouch or take most recent item out of pouch
	if(incapacitated())
		return
	var/obj/item/thing = get_active_held_item()
	var/obj/item/equipped_pouch = get_item_by_slot(ITEM_SLOT_LPOCKET)
	if(!equipped_pouch) // We also let you equip a pouch like this
		if(!thing)
			to_chat(src, "<span class='warning'>You have no pouch to take something out of!</span>")
			return
		if(equip_to_slot_if_possible(thing, ITEM_SLOT_LPOCKET))
			update_inv_hands()
		return
	if(!SEND_SIGNAL(equipped_pouch, COMSIG_CONTAINS_STORAGE)) // not a storage item
		if(!thing)
			equipped_pouch.attack_hand(src)
		else
			to_chat(src, "<span class='warning'>You can't fit anything in!</span>")
		return
	if(thing) // put thing in pouch
		if(!SEND_SIGNAL(equipped_pouch, COMSIG_TRY_STORAGE_INSERT, thing, src))
			to_chat(src, "<span class='warning'>You can't fit anything in!</span>")
		return
	if(!equipped_pouch.contents.len) // nothing to take out
		to_chat(src, "<span class='warning'>There's nothing in your pouch to take out!</span>")
		return
	var/obj/item/stored = equipped_pouch.contents[equipped_pouch.contents.len]
	if(!stored || stored.on_found(src))
		return
	stored.attack_hand(src) // take out thing from pouch
	return

/mob/living/carbon/human/proc/smart_equiprpouch() // put held thing in pouch or take most recent item out of pouch
	if(incapacitated())
		return
	var/obj/item/thing = get_active_held_item()
	var/obj/item/equipped_pouch = get_item_by_slot(ITEM_SLOT_RPOCKET)
	if(!equipped_pouch) // We also let you equip a pouch like this
		if(!thing)
			to_chat(src, "<span class='warning'>You have no pouch to take something out of!</span>")
			return
		if(equip_to_slot_if_possible(thing, ITEM_SLOT_RPOCKET))
			update_inv_hands()
		return
	if(!SEND_SIGNAL(equipped_pouch, COMSIG_CONTAINS_STORAGE)) // not a storage item
		if(!thing)
			equipped_pouch.attack_hand(src)
		else
			to_chat(src, "<span class='warning'>You can't fit anything in!</span>")
		return
	if(thing) // put thing in pouch
		if(!SEND_SIGNAL(equipped_pouch, COMSIG_TRY_STORAGE_INSERT, thing, src))
			to_chat(src, "<span class='warning'>You can't fit anything in!</span>")
		return
	if(!equipped_pouch.contents.len) // nothing to take out
		to_chat(src, "<span class='warning'>There's nothing in your pouch to take out!</span>")
		return
	var/obj/item/stored = equipped_pouch.contents[equipped_pouch.contents.len]
	if(!stored || stored.on_found(src))
		return
	stored.attack_hand(src) // take out thing from pouch
	return
