
/datum/keybinding/human/equip_lpouch
	hotkey_keys = list("ShiftV")
	name = "equip_lpouch"
	full_name = "Left pouch equip"
	description = "Put held thing in left pouch or take out most recent thing from left pouch"

/datum/keybinding/human/equip_lpouch/down(client/user)
	var/mob/living/carbon/human/H = user.mob
	H.smart_equiplpouch()
	return TRUE

/datum/keybinding/human/equip_rpouch
	hotkey_keys = list("V")
	name = "equip_rpouch"
	full_name = "Right pouch equip"
	description = "Put held thing in right pouch or take out most recent thing from right pouch"

/datum/keybinding/human/equip_rpouch/down(client/user)
	var/mob/living/carbon/human/H = user.mob
	H.smart_equiprpouch()
	return TRUE
