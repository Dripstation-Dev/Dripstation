/obj/item/melee/baton
	var/item_state_updating = TRUE
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/melee/baton/update_icon_state()
	if(item_state_updating)
		if(status)
			item_state = "[initial(item_state)]_active"
		else
			item_state = "[initial(item_state)]"
	..()

/obj/item/melee/baton/cattleprod
	item_state_updating = FALSE

/obj/item/melee/baton/cattleprod/tactical
	item_state_updating = FALSE