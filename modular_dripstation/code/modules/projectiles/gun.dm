/obj/item/gun	//Some tasty skyrat code
	var/dual_wield_spread = 24 //additional spread when autofiring

	var/safety = FALSE /// Internal variable for keeping track whether the safety is on or off
	var/has_gun_safety = FALSE /// Whether the gun actually has a gun safety
	var/datum/action/item_action/toggle_safety/toggle_safety_action

	var/datum/action/item_action/toggle_firemode/firemode_action
	/// Current fire selection, can choose between burst, single, and full auto.
	var/fire_select = SELECT_SEMI_AUTOMATIC
	var/fire_select_index = 1
	/// What modes does this weapon have? Put SELECT_FULLY_AUTOMATIC in here to enable fully automatic behaviours.
	var/list/fire_select_modes = list(SELECT_SEMI_AUTOMATIC)
	/// if i`1t has an icon for a selector switch indicating current firemode.
	var/selector_switch_icon = FALSE
	var/auto_fire_delay = 0.3 SECONDS

	var/damage_mult = 1
	var/shell_speed_mod = 1
	var/iff_having = FALSE		//gun has IFF
	var/has_magnetic_harness = FALSE		//gun has magnetic harness

	var/zooming_fire_delay = 20
	var/zooming_time = 2 SECONDS
	var/zooming_speed = 1

	var/list/initial_attachments = list()

/obj/item/gun/equipped(mob/user, slot)
	mouse_opacity = MOUSE_OPACITY_OPAQUE //so it's easier to click when it`s in inventory
	..()

/obj/item/gun/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	harness_check(user)
	..()

/obj/item/gun/throw_at(atom/target, range, speed, thrower)
	if(harness_check(thrower))
		visible_message(span_warning("\The [src] clanks on the ground."))
	else
		return ..()

/datum/action/item_action/toggle_safety
	name = "Toggle Safety"
	button_icon = 'modular_dripstation/icons/effects/gunsafety.dmi'
	button_icon_state = "safety_on"

/datum/action/item_action/toggle_firemode
	name = "Toggle Firemode"
	button_icon_state = "fireselect_no"
	button_icon = 'modular_dripstation/icons/effects/firemode.dmi'

/datum/action/item_action/toggle_safety/IsAvailable(feedback = FALSE)
	var/obj/item/gun/G = target
	if(!owner.is_holding(G))
		return FALSE
	return ..()

/datum/action/item_action/toggle_firemode/IsAvailable(feedback = FALSE)
	var/obj/item/gun/G = target
	if(!owner.is_holding(G))
		return FALSE
	if(G.zoomed)
		return FALSE
	return ..()

/obj/item/gun/ui_action_click(mob/user, actiontype)
	if(!user.is_holding(src))
		to_chat(user, span_notice("You should be able to press the toggle button to change safety or firemode on [src]."))
		return
	if(istype(actiontype, /datum/action/item_action/toggle_firemode))
		fire_select()
	else if(istype(actiontype, toggle_safety_action))
		toggle_safety(user)
	else
		..()

/obj/item/gun/proc/toggle_safety(mob/user, override)
	if(!has_gun_safety)
		return
	if(override)
		if(override == "off")
			safety = FALSE
		else
			safety = TRUE
	else
		safety = !safety
	toggle_safety_action.button_icon_state = "safety_[safety ? "on" : "off"]"
	toggle_safety_action.build_all_button_icons()
	playsound(src, 'sound/weapons/empty.ogg', 100, TRUE)
	user.visible_message(
		span_notice("[user] toggles [src]'s safety [safety ? "<font color='#00ff15'>ON</font>" : "<font color='#ff0000'>OFF</font>"]."),
		span_notice("You toggle [src]'s safety [safety ? "<font color='#00ff15'>ON</font>" : "<font color='#ff0000'>OFF</font>"].")
	)

/obj/item/gun/proc/fire_select(force)
	var/mob/living/carbon/human/user = usr

	var/max_mode = fire_select_modes.len

	if(max_mode <= 1)
		balloon_alert(user, "only one firemode!")
		return

	if(force)
		fire_select = force
	else
		fire_select_index = 1 + fire_select_index % max_mode // Magic math to cycle through this shit!
		fire_select = fire_select_modes[fire_select_index]

	switch(fire_select)
		if(SELECT_SEMI_AUTOMATIC)
			spread = initial(spread) - semi_auto_spread
			burst_size = 1
			fire_delay = 0
			SEND_SIGNAL(src, COMSIG_GUN_AUTOFIRE_DESELECTED, user)
			balloon_alert(user, "semi-automatic")
		if(SELECT_BURST_SHOT)
			spread = initial(spread)
			burst_size = initial(burst_size)
			fire_delay = initial(fire_delay)
			SEND_SIGNAL(src, COMSIG_GUN_AUTOFIRE_DESELECTED, user)
			balloon_alert(user, "[burst_size]-round burst")
		if(SELECT_FULLY_AUTOMATIC)
			fire_delay = initial(fire_delay)
			spread = initial(spread)
			burst_size = 1
			SEND_SIGNAL(src, COMSIG_GUN_AUTOFIRE_SELECTED, user)
			balloon_alert(user, "automatic")

	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_appearance()
	firemode_action.button_icon_state = "fireselect_[fire_select]"
	firemode_action.build_all_button_icons()
	return TRUE


/obj/item/gun/Initialize()
	. = ..()
	if(toggle_safety_action)
		QDEL_NULL(toggle_safety_action)
	if(firemode_action)
		QDEL_NULL(firemode_action)

	if(has_gun_safety)
		safety = TRUE
		toggle_safety_action = new(src)
		add_item_action(toggle_safety_action)

	if(burst_size > 1 && !(SELECT_BURST_SHOT in fire_select_modes))
		fire_select_modes.Add(SELECT_BURST_SHOT)
	else if(burst_size <= 1 && (SELECT_BURST_SHOT in fire_select_modes))
		fire_select_modes.Remove(SELECT_BURST_SHOT)

	burst_size = 1

	sort_list(fire_select_modes, /proc/cmp_numeric_asc)

	if(fire_select_modes.len > 1)
		firemode_action = new(src)
		firemode_action.button_icon_state = "fireselect_[fire_select]"
		firemode_action.build_all_button_icons()
		add_item_action(firemode_action)

	if(SELECT_FULLY_AUTOMATIC in fire_select_modes)
		AddComponent(/datum/component/automatic_fire, auto_fire_delay)

	if(initial_attachments.len > 0)
		for(var/att in initial_attachments)
			var/obj/item/attachment/_att = new att(src)
			_att.on_attach(src)

/obj/item/gun/Destroy()
	if(toggle_safety_action)
		QDEL_NULL(toggle_safety_action)
	if(firemode_action)
		QDEL_NULL(firemode_action)
	. = ..()		//Tasty skyrat code end

/obj/item/gun/can_trigger_gun(mob/living/user)
	. = ..()
	if(has_gun_safety && safety)
		balloon_alert(user, "safety on!")
		return FALSE

/obj/item/gun/CtrlClick(mob/living/user)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(pin && pin.jammed)
		user.visible_message(span_notice("[user] starting unjamming [user.p_their()] [pin.name] in \the [src]."), \
								 span_notice("You start fixing the [pin.name] in [src]."))
		pin_fix(user, 3 SECONDS)

/obj/item/gun/proc/pin_fix(mob/living/user, time = 1 SECONDS)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)) || !pin || !pin?.jammed)
		return
	if (do_after(user, time, src, extra_checks = CALLBACK(src, PROC_REF(pin_still_exists))))
		var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread
		spark_system.start()
		playsound(loc, "sparks", 50, 1)
		pin.jammed = FALSE
		to_chat(user, span_notice("The [pin] fixed."))

/obj/item/gun/proc/pin_still_exists()
	return (!QDELETED(pin) && src.loc == pin)


/obj/item/gun/proc/apply_gun_modifiers(obj/projectile/projectile_to_fire, atom/target, firer)
	projectile_to_fire.damage *= damage_mult
	//projectile_to_fire.damage_falloff *= damage_falloff_mult
	projectile_to_fire.speed += shell_speed_mod
	if(iff_having || projectile_to_fire.iff_having)
		var/iff_signal
		if(ishuman(firer))
			var/mob/living/carbon/human/_firer = firer
			var/obj/item/card/id/id = _firer.get_idcard()
			iff_signal = id?.iff_signal
		//else if(istype(firer, /obj/machinery/porta_turret))
		//	var/obj/machinery/porta_turret/sentry = firer
		//	iff_signal = sentry.iff_signal
		//else if(istype(firer, /obj/machinery/manned_turret))
		//	var/obj/machinery/manned_turret/sentry = firer
		//	iff_signal = sentry.iff_signal
		projectile_to_fire.iff_signal = iff_signal
	if(ishuman(firer) && zoomed)
		var/mob/living/carbon/human/_firer = firer
		if(_firer.a_intent != INTENT_HARM)
			projectile_to_fire.precise = TRUE

/obj/item/gun/proc/harness_check(mob/user)
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/owner = user
	if(!has_magnetic_harness)
		return FALSE
	var/obj/item/I = owner.wear_suit	//ITEM_SLOT_OCLOTHING
	if(!is_type_in_list(I, list(/obj/item/clothing/suit/armor, /obj/item/clothing/suit/space)))
		return FALSE
	addtimer(CALLBACK(src, .proc/harness_return, user), 0.3 SECONDS, TIMER_UNIQUE)
	return TRUE

/obj/item/gun/proc/harness_return(mob/living/carbon/human/user)
	if(!isturf(loc) || QDELETED(user) || !isnull(user.s_store) && !isnull(user.back))
		return

	user.equip_to_slot_if_possible(src, ITEM_SLOT_SUITSTORE)
	if(user.s_store == src)
		var/obj/item/I = user.wear_suit
		user.visible_message(span_warning("[src] snaps into place on [I]."))
		user.update_inv_s_store()
		return

	user.equip_to_slot_if_possible(src, ITEM_SLOT_BACK)
	if(user.back == src)
		user.visible_message(span_warning("[src] snaps into place on your back."))
	user.update_inv_back()
