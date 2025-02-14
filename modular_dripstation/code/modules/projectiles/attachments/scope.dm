/obj/item/attachment/scope
	var/zooming_speed = 1		//normal speed while zooming
	var/zooming_time_mod = 1		//normal zooming time mod
	var/zoom_amt = 3
	var/zoom_out_amt = 0
	var/zooming_fire_delay_mod = 1	//normal firedelay mod

/obj/item/attachment/scope/on_attach(obj/item/gun/G, mob/user = null)
	. = ..()
	G.zoom_amt = zoom_amt
	G.zoom_out_amt = zoom_out_amt
	G.zooming_speed = zooming_speed
	G.zooming_time *= zooming_time_mod
	G.zooming_fire_delay *= zooming_fire_delay_mod

/obj/item/attachment/scope/on_detach(obj/item/gun/G, mob/living/user = null)
	. = ..()
	G.zoom_amt = initial(G.zoom_amt)
	G.zoom_out_amt = initial(G.zoom_out_amt)
	G.zooming_speed = initial(G.zooming_speed)
	G.zooming_time /= initial(G.zooming_time)
	G.zooming_fire_delay = initial(G.zooming_fire_delay)

/obj/item/attachment/scope/simple
	zooming_speed = 0.6			//lesser zooming punish modifier
	zooming_fire_delay_mod = 0.8
	zooming_time_mod = 0.8

/obj/item/attachment/scope/holo
	zooming_speed = 0.3			//lesser zooming punish modifier
	zooming_fire_delay_mod = 0.5
	zooming_time_mod = 0.5

/obj/item/attachment/scope/sniper
	name = "rail scope"
	icon_state = "scope"
	icon = 'modular_dripstation/icons/obj/weapons/attachment.dmi'
	zoom_amt = 10
	zoom_out_amt = 5
	zooming_speed = 1			//bigger zooming speed modifier
	zooming_fire_delay_mod = 1.4
	zooming_time_mod = 0.5

/obj/item/attachment/scope/sniper_slav
	name = "rail scope"
	icon_state = "slavicscope"
	icon = 'modular_dripstation/icons/obj/weapons/attachment.dmi'
	zoom_amt = 7
	zoom_out_amt = 2
	zooming_speed = 1			//bigger zooming speed modifier
	zooming_fire_delay_mod = 1.4
	zooming_time_mod = 0.8

/obj/item/attachment/scope/sniper/nvg
	name = "nvg scope"
	desc = "Night vision military grade sniper scope. It lowers accuracy a bit, but grants you nightvision when scoping."
	icon_state = "nvg_scope"
	accuracy = -1
	actions_list = list(/datum/action/item_action/toggle_nvg_sight)

/obj/item/attachment/scope/sniper/nvg/attack_self(mob/user)
	. = ..()
	toggle_on()

/obj/item/attachment/scope/sniper/nvg/proc/toggle_on()
	is_on = !is_on
	playsound(get_turf(loc), is_on ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, 1)
	if(attached_gun)
		if(is_on)
			attached_gun.spread -= accuracy
			if(current_user?.is_holding(attached_gun))
				pickup_user(current_user)
		else
			attached_gun.spread += accuracy
			drop_user(current_user)
	update_appearance(UPDATE_ICON)

/obj/item/attachment/scope/sniper/nvg/pickup_user(mob/user)
	. = ..()
	if(user && is_on)
		ADD_TRAIT(user, TRAIT_TRUE_NIGHT_VISION, ATTACHMENT_TRAIT)
		user.update_sight()

/obj/item/attachment/scope/sniper/nvg/equip_user(mob/user)
	. = ..()
	if(user)
		REMOVE_TRAIT(user, TRAIT_TRUE_NIGHT_VISION, ATTACHMENT_TRAIT)
		user.update_sight()

/obj/item/attachment/scope/sniper/nvg/drop_user(mob/user)
	. = ..()
	if(user)
		REMOVE_TRAIT(user, TRAIT_TRUE_NIGHT_VISION, ATTACHMENT_TRAIT)
		user.update_sight()

/datum/action/item_action/toggle_nvg_sight
	name = "Toggle nvg"
	button_icon = 'modular_dripstation/icons/obj/weapons/attachment.dmi'
	button_icon_state = "nvg_scope"
	var/obj/item/attachment/scope/sniper/nvg/att

/datum/action/item_action/toggle_nvg_sight/Trigger()
	if(!att)
		if(istype(target, /obj/item/gun))
			var/obj/item/gun/parent_gun = target
			for(var/obj/item/attachment/A in parent_gun.current_attachments)
				if(istype(A, /obj/item/attachment/scope/sniper/nvg))
					att = A
					break
	att?.toggle_on()
	build_all_button_icons(UPDATE_BUTTON_ICON)

/datum/action/item_action/toggle_nvg_sight/apply_button_icon(atom/movable/screen/movable/action_button/current_button, status_only = FALSE, force)
	var/obj/item/attachment/scope/sniper/nvg/nvgsight = target
	if(istype(nvgsight))
		button_icon_state = "nvg_scope[att?.is_on ? "_on" : ""]"

	return ..()
