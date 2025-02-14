/obj/item/attachment/trigger/iff_module
	name = "SMART module"
	desc = "Converting your gun into SMARTgun - giving your gun through chips in this module ability to ignore friendly iff signatures when firing, greatly decreaces frendly fire incidents. Also increases accuracy with reducing spread."
	icon_state = "iff_module"
	icon = 'modular_dripstation/icons/obj/weapons/attachment.dmi'
	attachment_type = TYPE_TRIGGER
	actions_list = list(/datum/action/item_action/toggle_iff_module)

/obj/item/attachment/trigger/iff_module/on_detach(obj/item/gun/G, mob/living/user = null)
	. = ..()
	if(is_on)
		G.spread += 4
		G.iff_having = FALSE

/obj/item/attachment/trigger/iff_module/attack_self(mob/user)
	. = ..()
	toggle_on()

/obj/item/attachment/trigger/iff_module/proc/toggle_on()
	is_on = !is_on
	playsound(get_turf(loc), is_on ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, 1)
	if(attached_gun)
		if(is_on)
			balloon_alert(usr, "iff on")
			attached_gun.spread -= 4
			attached_gun.iff_having = TRUE
		else
			balloon_alert(usr, "iff off")
			attached_gun.spread += 4
			attached_gun.iff_having = FALSE
	update_appearance(UPDATE_ICON)

/datum/action/item_action/toggle_iff_module
	name = "Toggle SMART module"
	button_icon = 'modular_dripstation/icons/obj/weapons/attachment.dmi'
	button_icon_state = "iff_module"
	var/obj/item/attachment/trigger/iff_module/att

/datum/action/item_action/toggle_iff_module/Trigger()
	if(!att)
		if(istype(target, /obj/item/gun))
			var/obj/item/gun/parent_gun = target
			for(var/obj/item/attachment/A in parent_gun.current_attachments)
				if(istype(A, /obj/item/attachment/trigger/iff_module))
					att = A
					break
	att?.toggle_on()
	build_all_button_icons()

/datum/action/item_action/toggle_iff_module/apply_button_icon(atom/movable/screen/movable/action_button/button, force)
	var/obj/item/attachment/trigger/iffthing = target
	if(istype(iffthing))
		button_icon_state = "iff_module[att?.is_on ? "_on" : ""]"

	return ..()
