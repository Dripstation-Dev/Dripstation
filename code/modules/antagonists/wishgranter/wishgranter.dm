/datum/antagonist/wishgranter
	name = "Wishgranter Avatar"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	can_hijack = HIJACK_HIJACKER
	hijack_speed = 0.5

/datum/antagonist/wishgranter/proc/forge_objectives()
	var/datum/objective/hijack/hijack = new
	hijack.owner = owner
	objectives += hijack

/datum/antagonist/wishgranter/on_gain()
	owner.special_role = "Avatar of the Wish Granter"
	forge_objectives()
	. = ..()
	give_powers()

/datum/antagonist/wishgranter/greet()
	to_chat(owner, "<B>Your inhibitions are swept away, the bonds of loyalty broken, you are free to murder as you please!</B>")
	owner.announce_objectives()

/datum/antagonist/wishgranter/proc/give_powers()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	H.dna.add_mutation(HULK)
	H.dna.add_mutation(XRAY)
	H.dna.add_mutation(COLDMUT)
	H.dna.add_mutation(TK)
	ADD_TRAIT(H, TRAIT_RESISTLOWPRESSURE, "wishgranter")
	ADD_TRAIT(H, TRAIT_RESISTHIGHPRESSURE, "wishgranter")
