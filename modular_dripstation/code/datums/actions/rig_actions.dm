//////Dual-mode actions//////
/datum/action/item_action/rig
	background_icon_state = "bg_rig"
	overlay_icon_state = "bg_rig_border"
	background_icon = 'modular_dripstation/icons/hud/actions.dmi'
	overlay_icon = 'modular_dripstation/icons/hud/actions.dmi'
	button_icon = 'modular_dripstation/icons/hud/actions.dmi'
	check_flags = AB_CHECK_CONSCIOUS
	var/action_target = /obj/item/clothing/suit/space/hardsuit/dualmode

/datum/action/item_action/rig/New(Target)
	..()
	if(!istype(Target, action_target))
		qdel(src)
		return

/datum/action/item_action/rig/Trigger(trigger_flags)
	if(!IsAvailable(feedback = TRUE))
		return FALSE
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
	if(!rig.allowed(usr))
		rig.balloon_alert(usr, "insufficient access!")
		playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	if(rig.malfunctioning && prob(75))
		rig.balloon_alert(usr, "rig ui malfunctions!")
		return FALSE
	return TRUE

/datum/action/item_action/rig/toggle_helmet
	name = "Toggle Helmet"
	desc = "Toggle a RIG helmet."
	button_icon_state = "helmet_on_button"

/datum/action/item_action/rig/toggle_helmet/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
	rig.ToggleHelmet()
	//build_all_button_icons()

/datum/action/item_action/rig/toggle_helmet/build_all_button_icons()
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
	var/obj/item/H = rig.wearer?.get_item_by_slot(ITEM_SLOT_HEAD)
	if(istype(H, rig.helmettype))
		button_icon_state = "helmet_off_button"
	else
		button_icon_state = "helmet_on_button"
	return ..()

/datum/action/item_action/rig/module
	name = "Toggle Module"
	desc = "Toggle a RIG module."
	button_icon_state = "module_button"

/datum/action/item_action/rig/module/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
	rig.quick_module(usr, TRUE)
	//build_all_button_icons()

/datum/action/item_action/rig/module_pin
	name = "Pin Module"
	desc = "Pin a RIG module."
	button_icon_state = "pin_button"

/datum/action/item_action/rig/module_pin/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
	rig.quick_module(usr, FALSE)
	//build_all_button_icons()

/datum/action/item_action/rig/activate
	name = "Activate DUALMODE"
	desc = "Activate/Deactivate suit with prompt."
	button_icon_state = "activate_button"

/datum/action/item_action/rig/activate/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
	rig.toggle_activate(usr)
	//build_all_button_icons()

/datum/action/item_action/rig/activate/build_all_button_icons()
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
	if(rig.active)
		button_icon_state = "deactivate_button"
	else
		button_icon_state = "activate_button"
	return ..()

/datum/action/item_action/rig/helmet
	action_target = /obj/item/clothing/head/helmet/space/hardsuit/dualmode

/datum/action/item_action/rig/helmet/Trigger(trigger_flags)
	if(!IsAvailable(feedback = TRUE))
		return FALSE
	var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/righelm = target
	if(righelm.linkedsuit?.malfunctioning && prob(75))
		righelm.balloon_alert(usr, "helmet ui malfunctions!")
		return FALSE
	return TRUE

/datum/action/item_action/rig/helmet/seal
	name = "Toggle Seal Mode"
	desc = "Toggle RIG seal mode."
	button_icon_state = "seal_button"

/datum/action/item_action/rig/helmet/seal/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/righelm = target
	righelm.toggle_helmet_seal(usr)
	//build_all_button_icons()

/datum/action/item_action/rig/helmet/seal/build_all_button_icons()
	var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/righelm = target
	if(righelm.sealed)
		button_icon_state = "unseal_button"
	else
		button_icon_state = "seal_button"
	return ..()

/datum/action/item_action/rig/helmet/seal/IsAvailable(feedback = FALSE)
	var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/righelm = target
	if(!righelm.linkedsuit.active)
		return FALSE
	return ..()

/datum/action/item_action/rig/helmet/light
	name = "Toggle Helmet Light"
	button_icon_state = "light_button"

/datum/action/item_action/rig/helmet/light/Trigger()
	var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/righelm = target
	if(istype(righelm))
		righelm.on_light_toggle(owner)
		//rig.update_appearance(UPDATE_ICON)
		owner.update_inv_head()

/datum/action/item_action/rig/helmet/light/IsAvailable(feedback = FALSE)
	var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/righelm = target
	if(!istype(righelm) || !righelm.sealed)
		return FALSE
	return ..()

/datum/action/item_action/rig/pinned_module
	desc = "Activate the module."
	/// Overrides the icon applications.
	var/override = FALSE
	/// Module we are linked to.
	var/obj/item/module/module
	/// A ref to the mob we are pinned to.
	var/pinner_ref

/datum/action/item_action/rig/pinned_module/New(Target, obj/item/module/linked_module, mob/user)
	//if(isAI(user))
		//ai_action = TRUE
	button_icon = linked_module.icon
	button_icon_state = linked_module.icon_state
	..()
	module = linked_module
	if(linked_module.allow_flags & MODULE_ALLOW_INCAPACITATED)
		// clears check hands and check conscious
		check_flags = NONE
	name = "Activate [capitalize(linked_module.name)]"
	desc = "Quickly activate [linked_module]."
	RegisterSignals(linked_module, list(COMSIG_MODULE_ACTIVATED, COMSIG_MODULE_DEACTIVATED, COMSIG_MODULE_USED), PROC_REF(module_interacted_with))

/datum/action/item_action/rig/pinned_module/Destroy()
	UnregisterSignal(module, list(COMSIG_MODULE_ACTIVATED, COMSIG_MODULE_DEACTIVATED, COMSIG_MODULE_USED))
	module.pinned_to -= pinner_ref
	module = null
	return ..()

/datum/action/item_action/rig/pinned_module/Grant(mob/user)
	var/user_ref = REF(user)
	if(!pinner_ref)
		pinner_ref = user_ref
		module.pinned_to[pinner_ref] = src
	else if(pinner_ref != user_ref)
		return
	return ..()

/datum/action/item_action/rig/pinned_module/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	module.on_trigger_module()

/datum/action/item_action/rig/pinned_module/apply_button_overlay(atom/movable/screen/movable/action_button/current_button, force)
	current_button.cut_overlays()
	if(override)
		return ..()

	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig = target
	if(module == rig.selected_module)
		current_button.add_overlay(image(icon = 'modular_dripstation/icons/hud/actions.dmi', icon_state = "module_selected", layer = FLOAT_LAYER-0.1))
	else if(module.active)
		current_button.add_overlay(image(icon = 'modular_dripstation/icons/hud/actions.dmi', icon_state = "module_active", layer = FLOAT_LAYER-0.1))
	if(!COOLDOWN_FINISHED(module, cooldown_timer))
		var/image/cooldown_image = image(icon = 'modular_dripstation/icons/hud/actions.dmi', icon_state = "module_cooldown")
		current_button.add_overlay(cooldown_image)
		addtimer(CALLBACK(current_button, TYPE_PROC_REF(/image, cut_overlay), cooldown_image), COOLDOWN_TIMELEFT(module, cooldown_timer))
	return ..()

/datum/action/item_action/rig/pinned_module/proc/module_interacted_with(datum/source)
	SIGNAL_HANDLER

	build_all_button_icons(UPDATE_BUTTON_OVERLAY|UPDATE_BUTTON_STATUS)

