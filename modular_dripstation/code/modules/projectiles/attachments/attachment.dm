/obj/item/attachment
	var/can_be_attached = TRUE
	var/can_be_removed = TRUE

/obj/item/attachment/proc/can_detach(obj/item/gun/G, mob/living/user = null)
	if(can_be_removed)
		return on_detach(G, user)
	else
		return FALSE

/obj/item/attachment/proc/can_attach(obj/item/gun/G, mob/living/user = null)
	if(can_be_removed)
		return on_attach(G, user)
	else
		return FALSE
