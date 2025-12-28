//////Dual-mode hardsuits//////
//Starting with original sindi one
/obj/item/clothing/head/helmet/space/hardsuit/dualmode
	name = "scarlet RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Manufactured by Donk Co."
	icon_state = "scarlet_helm"
	//item_state = "scarlet_helm"
	hardsuit_type = "scarlet"
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 25, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 50)
	var/sealed = FALSE
	flash_protect = FLASH_PROTECTION_NONE
	light_color = LIGHT_COLOR_GREEN
	var/light_status = FALSE
	var/obj/item/clothing/suit/space/hardsuit/dualmode/linkedsuit = null
	actions_types = list(/datum/action/item_action/rig/helmet/seal, /datum/action/item_action/rig/helmet/light)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags_cover = HEADCOVERSEYES|HEADCOVERSMOUTH
	visor_flags = STOPSPRESSUREDAMAGE
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	var/toggled_for_heat_protecting = TRUE	//tipically all that nonlightweight
	var/winter_mod = FALSE	//protects from cold when toggled in combat mode


/obj/item/clothing/head/helmet/space/hardsuit/dualmode/Initialize()
	. = ..()
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/dualmode))
		linkedsuit = loc
	icon_state = "[hardsuit_type]_helm"
	ADD_TRAIT(src, TRAIT_NODROP, LOCKED_HELMET_TRAIT)
	on_unseal()

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/proc/spaceready(mob/user)
	sealed = TRUE
	on_seal(user)
	linkedsuit.toggle_seal_mode(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/attack_hand(mob/user)
	to_chat(user, span_warning("You cannot strip your helmet manually!") )
	return

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/proc/toggle_helmet_seal(mob/user) //Toggle hardsuit mode
	if(!isturf(user.loc))
		to_chat(user, span_warning("You cannot toggle your helmet while in this [user.loc]!") )
		return
	if(linkedsuit.processing)
		user.balloon_alert(user, "still processing!")
		return
	if(!linkedsuit.active)
		user.balloon_alert(user, "turn RIG on!")
		return
	linkedsuit.processing = TRUE
	if(linkedsuit.seal_time >= 1 SECONDS)
		playsound(src.loc, 'modular_dripstation/sound/servo_motor.ogg', 50, 1)
	else
		playsound(src, 'sound/mecha/mechmove03.ogg', 25, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	if(!do_after(user, linkedsuit.seal_time, user, timed_action_flags = (linkedsuit.mobility ? IGNORE_ALL : IGNORE_HELD_ITEM), extra_checks = CALLBACK(src, PROC_REF(CheckCanToggle), user)))
		user.balloon_alert(user, "interrupted!")
		linkedsuit.processing = FALSE
		return
	linkedsuit.processing = FALSE
	sealed = !sealed
	if(sealed)
		on_seal(user)
	else
		on_unseal(user)
	to_chat(linkedsuit.wearer, span_notice("\The [src.name] hisses [sealed ? "closed" : "open"]."))
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, 1)
	linkedsuit.toggle_seal_mode(user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	regenerate_button_icons()
	linkedsuit.regenerate_button_icons()

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/proc/on_seal(mob/user = null)
	name += " (sealed)"
	desc = initial(desc) + " It is in EVA mode"
	icon_state = "[hardsuit_type]_helm_sealed"
	clothing_flags |= visor_flags
	flags_cover |= visor_flags_cover
	flags_inv |= visor_flags_inv
	if(!winter_mod)
		cold_protection |= HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	if(toggled_for_heat_protecting)
		heat_protection |= HEAD
	if(user)
		to_chat(user, span_notice("You switch your hardsuit to EVA mode, sacrificing speed for space protection."))
		user.update_inv_head()

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/proc/on_unseal(mob/user = null)
	name = initial(name)
	desc = initial(desc) + " It is in combat mode"
	light_status = FALSE
	set_light_on(light_status)
	icon_state = "[hardsuit_type]_helm"
	clothing_flags &= ~visor_flags
	flags_cover &= ~visor_flags_cover
	flags_inv &= ~visor_flags_inv
	if(!winter_mod)
		cold_protection &= ~HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	if(toggled_for_heat_protecting)
		heat_protection &= ~HEAD
	if(user)
		to_chat(user, span_notice("You switch your hardsuit to atmospheric mode and can now run at full possible speed."))
		user.update_inv_head()

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/proc/regenerate_button_icons()
	for(var/datum/action/A in actions)
		A.build_all_button_icons()

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/proc/CheckCanToggle(mob/user)
	var/obj/item/H = user.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!H || !istype(H, linkedsuit.helmettype))
		to_chat(user, span_warning("You need your helmet be on!"))
		return FALSE
	if(!linkedsuit.active)
		user.balloon_alert(user, "turn RIG on!")
		return FALSE
	return TRUE

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/AltClick(mob/user)
	on_light_toggle(user)
	user.update_inv_head()

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/proc/on_light_toggle(user)
	if(!sealed)
		return FALSE
	light_status = !light_status
	icon_state = "[hardsuit_type]_helm_sealed[light_status ? "_light":""]"
	set_light_on(light_status)

/obj/item/clothing/suit/space/hardsuit/dualmode
	name = "scarlet RIG"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Manufactured by Donk Co."
	icon_state = "scarlet_rig"
	//item_state = "scarlet_rig"
	hardsuit_type = "scarlet"
	w_class = WEIGHT_CLASS_BULKY
	var/sealed = FALSE				//Tracking current sealed mode on suit, handles by helmet sealed
	armor = list(MELEE = 35, BULLET = 25, LASER = 30, ENERGY = 25, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 50)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/emergency_forcing_tool, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode
	jetpack = null
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	var/toggled_for_heat_protecting = TRUE
	var/combat_slowdown = 0.5 //slowdown when in combat mode
	var/eva_slowdown = 1 //slowdown when in eva mode
	var/lightweight = TRUE //used for flags when toggling
	var/winter_mod = FALSE	//protects from cold when toggled in combat mode
	var/charge_drain = DEFAULT_CHARGE_DRAIN
	var/obj/item/core/core
	var/current_complexity = 0	//how many modules can be attached
	var/max_complexity = DEFAULT_MAX_COMPLEXITY
	var/list/inserted_modules = list()
	var/list/starting_modules = list()
	var/starting_core = /obj/item/core/standard
	var/starting_cell = /obj/item/stock_parts/cell/high
	var/list/starting_pins = list()
	var/mobility = TRUE
	var/seal_time = 2.4 SECONDS
	var/processing = FALSE
	var/preview = FALSE
	var/locked = FALSE
	var/open = FALSE
	var/active = FALSE
	var/activating = FALSE
	/// Currently used module.
	var/obj/item/module/selected_module
	var/malfunctioning = FALSE
	var/auto_unmalf_time = 60 SECONDS
	var/mob/living/carbon/human/wearer
	actions_types = list(
		/datum/action/item_action/rig/toggle_helmet,
		/datum/action/item_action/rig/activate,
		/datum/action/item_action/rig/module,
		/datum/action/item_action/rig/module_pin,
	)

/obj/item/clothing/suit/space/hardsuit/dualmode/Initialize(mapload, obj/item/core/new_core = null)
	..()
	icon_state = "[hardsuit_type]_rig"
	if(length(req_access))
		locked = TRUE
	new_core?.install(src)
	SuitRestartHandle()
	if(!preview && !new_core)	//new core basicly new crafted rig
		insert_on_init()
		return INITIALIZE_HINT_LATELOAD

/obj/item/clothing/suit/space/hardsuit/dualmode/LateInitialize()
	if(wearer)
		ToggleHelmet(TRUE)
		var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/DH = helmet
		DH.spaceready(src.loc)

/obj/item/clothing/suit/space/hardsuit/dualmode/Destroy()
	. = ..()
	if(active)
		STOP_PROCESSING(SSobj, src)

/obj/item/clothing/suit/space/hardsuit/dualmode/ToggleHelmet()
	. = ..()
	regenerate_button_icons()

/obj/item/clothing/suit/space/hardsuit/dualmode/examine(mob/user)
	. = ..()
	. += "It has [current_complexity]/[max_complexity] complexity."
	if(get_charge())
		. += get_charge() ? "It has [get_charge_percent()]% charge." : "<span class='warning'>Charge tracker is dead.</span>"
	if(open)
		. += "<span class='warning'>It has it`s protection panel unscrewed.</span>"
		. += core ? "It has \a [core.name] incerted into it." : "It has no core incerted into it."
		if(winter_mod)
			. += "It has advanced heating system."
		if(toggled_for_heat_protecting)
			. += "It has advanced cooling system."
		for(var/obj/item/module/M in inserted_modules)
			. += "It has \a [M.name] incerted into it."
	else
		. += "Unscrew protection panel to see modules."
	if(locked)
		. += "Protection panel is locked.</span>"
		. += "<span class='notice'>CTRL-Click to unlock it.</span>"
	else
		. += "<span class='notice'>CTRL-Click to lock suit by access.</span>"
	if(malfunctioning)
		. += "<span class='warning'>Red dot signals two times.</span>"

/obj/item/clothing/suit/space/hardsuit/dualmode/attackby(obj/item/attacking_item, mob/living/user, params)
	. = ..()
	if(attacking_item.GetID())
		return update_access(user, attacking_item.GetID())
	if(istype(attacking_item, /obj/item/card/emag))
		return TRUE
	if(!open)
		return FALSE
	if(istype(attacking_item, /obj/item/core))
		if(core)
			balloon_alert(user, "core already installed!")
			return FALSE
		var/obj/item/core/C = attacking_item
		C.install(src)
		return TRUE
	if(istype(attacking_item, /obj/item/module))
		var/obj/item/module/M = attacking_item
		M.try_to_insert_module(src, user)
		return TRUE
	return FALSE

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/update_access(mob/user, obj/item/card/id/card)
	if(!allowed(user))
		balloon_alert(user, "insufficient access!")
		playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	req_access = card.access.Copy()
	balloon_alert(user, "access updated")
	return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/IsReflect(def_zone)
	if(SEND_SIGNAL(src, COMSIG_RIG_REFLECT, def_zone) & RIG_REFLECT)
		return TRUE
	return ..()

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/get_charge_source()
	return core?.charge_source()

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/get_charge()
	return core?.charge_amount() || 0

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/get_max_charge()
	return core?.max_charge_amount() || 1 //avoid dividing by 0

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/get_charge_percent()
	return ROUND_UP((get_charge() / get_max_charge()) * 100)

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/add_charge(amount)
	return core?.add_charge(amount) || FALSE

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/subtract_charge(amount)
	return core?.subtract_charge(amount) || FALSE

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/check_charge(amount)
	return core?.check_charge(amount) || FALSE

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/update_charge_alert()
	if(!wearer)
		return
	if(!core)
		wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/nocore)
		return
	core.update_charge_alert()

/obj/item/clothing/suit/space/hardsuit/dualmode/process(seconds_per_tick)
	// if(seconds_electrified > MACHINE_NOT_ELECTRIFIED)
	// 	seconds_electrified--
	if(!get_charge() && active && !activating)
		toggle_activate(null, TRUE)
		return PROCESS_KILL
	var/malfunctioning_charge_drain = 0
	if(malfunctioning)
		malfunctioning_charge_drain = rand(1,20)
	subtract_charge((charge_drain + malfunctioning_charge_drain)*seconds_per_tick)
	update_charge_alert()
	for(var/obj/item/module/module as anything in inserted_modules)
		if(malfunctioning && module.active && DT_PROB(5, seconds_per_tick))
			module.on_module_deactivate(display_message = TRUE)
		module.on_process(seconds_per_tick)

/obj/item/clothing/suit/space/hardsuit/dualmode/get_cell()
	if(!open)
		return
	var/obj/item/stock_parts/cell/cell = get_charge_source()
	if(!istype(cell))
		return
	return cell

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/quick_module(mob/user, istrigger = TRUE)
	if(!length(inserted_modules))
		return
	var/list/display_names = list()
	var/list/items = list()
	for(var/obj/item/module/module as anything in inserted_modules)
		if(module.module_type == MODULE_PASSIVE)
			continue
		display_names[module.name] = REF(module)
		var/image/module_image = image(icon = module.icon, icon_state = module.icon_state)
		if(module == selected_module)
			module_image.underlays += image(icon = 'modular_dripstation/icons/hud/actions.dmi', icon_state = "module_selected")
		else if(module.active)
			module_image.underlays += image(icon = 'modular_dripstation/icons/hud/actions.dmi', icon_state = "module_active")
		if(!COOLDOWN_FINISHED(module, cooldown_timer))
			module_image.add_overlay(image(icon = 'modular_dripstation/icons/hud/actions.dmi', icon_state = "module_cooldown"))
		items += list(module.name = module_image)
	if(!length(items))
		return
	var/radial_anchor = src
	if(istype(user.loc, /obj/effect/dummy/phased_mob))
		radial_anchor = get_turf(user.loc) //they're phased out via some module, anchor the radial on the turf so it may still display
	var/pick = show_radial_menu(user, radial_anchor, items, custom_check = FALSE, require_near = TRUE, tooltips = TRUE)
	if(!pick)
		return
	var/module_reference = display_names[pick]
	var/obj/item/module/picked_module = locate(module_reference) in inserted_modules
	if(!istype(picked_module))
		return
	if(istrigger)
		picked_module.on_trigger_module()
	else
		picked_module.pin(user)

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/insert_on_init()
	var/obj/item/core/C = new starting_core(src)
	C.install(src)
	if(starting_cell && istype(C, /obj/item/core/standard))
		var/obj/item/core/standard/standard = C
		var/obj/item/stock_parts/cell/CE = new starting_cell(src)
		standard.install_cell(CE)
	if(starting_modules.len > 0)
		for(var/mod in starting_modules)
			var/obj/item/module/_mod = new mod(src)
			_mod.insert_module(src)

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/set_wearer(mob/living/carbon/human/user)
	if (wearer == user)
		// This should also not happen.
		// This path is hit when equipping an outfit with visualsOnly, but only sometimes, and this eventually gets called twice.
		// I'm not sure this proc should ever be being called by visualsOnly, but it is,
		// and this was an emergency patch.
		return
	else if (!isnull(wearer))
		stack_trace("set_wearer() was called with a new wearer without unset_wearer() being called")

	wearer = user
	ADD_TRAIT(user, NO_BACKPACK_TRAIT, RIG_TRAIT)
	regenerate_button_icons()
	SEND_SIGNAL(src, COMSIG_RIG_WEARER_SET, wearer)
	//RegisterSignal(wearer, COMSIG_ATOM_EXITED, PROC_REF(on_exit))
	RegisterSignal(wearer, COMSIG_SPECIES_GAIN, PROC_REF(on_species_gain))
	update_charge_alert()
	for(var/obj/item/module/module as anything in inserted_modules)
		module.on_equip()
		if(!starting_pins[module.type]) //this module isnt meant to be pinned by default
			continue
		if(REF(wearer) in starting_pins[module.type]) //if we already had pinned once to this user, don care anymore
			continue
		starting_pins[module.type] += REF(wearer)
		module.pin(wearer)

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/unset_wearer()
	for(var/obj/item/module/module as anything in inserted_modules)
		module.on_unequip()
	//UnregisterSignal(wearer, COMSIG_ATOM_EXITED)
	UnregisterSignal(wearer, COMSIG_SPECIES_GAIN)
	wearer.clear_alert(ALERT_RIG_CHARGE)
	SEND_SIGNAL(src, COMSIG_RIG_WEARER_UNSET, wearer)
	regenerate_button_icons()
	REMOVE_TRAIT(wearer, NO_BACKPACK_TRAIT, RIG_TRAIT)
	wearer = null

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/regenerate_button_icons()
	for(var/datum/action/A in actions)
		A.build_all_button_icons()

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/on_species_gain(datum/source, datum/species/new_species, datum/species/old_species)
	SIGNAL_HANDLER

	if(!mob_can_equip(wearer, ITEM_SLOT_OCLOTHING))
		forceMove(drop_location())
	return

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/SuitRestartHandle()
	active = FALSE
	on_unseal()
	recalculate_slowdown()
	icon_state = "[hardsuit_type]_rig[sealed ? "_sealed":""]"

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/toggle_seal_mode(mob/user) //Suit seal Mode
	var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/DM = helmet
	sealed = DM.sealed
	if(sealed)
		on_seal()
		ADD_TRAIT(src, TRAIT_NODROP, RIG_TRAIT)
	else
		on_unseal()
		REMOVE_TRAIT(src, TRAIT_NODROP, RIG_TRAIT)

	recalculate_slowdown()
	icon_state = "[hardsuit_type]_rig[sealed ? "_sealed":""]"
	update_appearance(UPDATE_ICON)
	user.update_inv_wear_suit()
	user.update_inv_w_uniform()

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/on_seal()
	name += " (sealed)"
	desc = "[initial(desc)] It is in EVA mode."
	clothing_flags |= STOPSPRESSUREDAMAGE
	if(!winter_mod)
		cold_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	if(toggled_for_heat_protecting)
		heat_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	if(lightweight)
		flags_inv |= (HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)
	strip_delay += 50

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/on_unseal()
	name = initial(name)
	desc = "[initial(desc)] It is in combat mode."
	clothing_flags &= ~STOPSPRESSUREDAMAGE
	if(!winter_mod)
		cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	if(toggled_for_heat_protecting)
		heat_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
	strip_delay = initial(strip_delay)
	if(lightweight)
		flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)

/obj/item/clothing/suit/space/hardsuit/dualmode/CtrlClick(mob/user)
	if(locked && !allowed(user))
		balloon_alert(user, "access insufficient!")
		playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	locked = !locked
	balloon_alert(user, "suit access [locked ? "locked" : "unlocked"]")
	return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/dropped(mob/living/carbon/human/user)
	if (user.wear_suit == src)
		unset_wearer()
		toggle_activate(user, TRUE)
	return ..()

/obj/item/clothing/suit/space/hardsuit/dualmode/equipped(mob/user, slot, initial = FALSE)
	if (slot == ITEM_SLOT_OCLOTHING)
		set_wearer(user)
	else if(wearer)
		unset_wearer()
	return ..()

/obj/item/clothing/suit/space/hardsuit/dualmode/mob_can_equip(M as mob, slot)

	//if we can't equip the item anyway, don't bother (also cuts down on spam)
	if(!..())
		return FALSE

	// Skip checks on non-equipment slots
	if(slot in list(ITEM_SLOT_LPOCKET, ITEM_SLOT_RPOCKET, ITEM_SLOT_BACKPACK, ITEM_SLOT_SUITSTORE))
		return TRUE

	var/mob/living/carbon/human/H = M
	
	if(istype(H) && H.back && istype(H.back, /obj/item/storage/backpack))
		to_chat(M, "<span class='warning'>You can`t wear [src] while wearing [H.back.name].</span>")
		return FALSE

	return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/recalculate_slowdown()
	if(sealed)
		slowdown = eva_slowdown
	else
		slowdown = combat_slowdown

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/toggle_activate(mob/user, force_deactivate = FALSE)
	if(!wearer)
		if(!force_deactivate)
			balloon_alert(user, "equip suit first!")
			playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
			return FALSE
	if(!force_deactivate && (SEND_SIGNAL(src, COMSIG_RIG_ACTIVATE, user) & RIG_CANCEL_ACTIVATE))
		playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	if(!force_deactivate && locked && !allowed(user))
		balloon_alert(user, "access insufficient!")
		playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	//if(!get_charge() && !force_deactivate)
		//balloon_alert(user, "suit not powered!")
		//playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		//return FALSE
	if(activating)
		if(!force_deactivate)
			balloon_alert(user, "suit already [active ? "shutting down" : "starting up"]!")
			playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	// for(var/obj/item/module/module as anything in inserted_modules)
	// 	if(!module.active || (module.allow_flags & MODULE_ALLOW_INACTIVE))
	// 		continue
	// 	module.on_module_unpowered//(display_message = FALSE)
	activating = TRUE
	to_chat(wearer, span_notice("RIG [active ? "shutting down" : "starting up"]."))
	if(force_deactivate || do_after(wearer, active ? 0.5 SECONDS : 2 SECONDS, wearer, timed_action_flags = IGNORE_ALL, extra_checks = CALLBACK(src, PROC_REF(has_wearer))))
		to_chat(wearer, span_notice("Systems [active ? "shut down. Goodbye" : "started up. Welcome"], [wearer]."))

		if(force_deactivate)
			active = FALSE
		else
			active = !active
		
		if(active)
			//playsound(src, 'sound/machines/synth_yes.ogg', 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE, frequency = 6000)
			playsound(src, 'modular_dripstation/sound/effects/rig_start.ogg', 50, FALSE, SHORT_RANGE_SOUND_EXTRARANGE)
			if(!malfunctioning)
				wearer.playsound_local(get_turf(src), 'sound/mecha/nominal.ogg', 50)
			START_PROCESSING(SSobj, src)
		else
			//playsound(src, 'sound/machines/synth_no.ogg', 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE, frequency = 6000)
			playsound(src, 'modular_dripstation/sound/effects/rig_off.ogg', 50, FALSE, SHORT_RANGE_SOUND_EXTRARANGE)
			STOP_PROCESSING(SSobj, src)
		SEND_SIGNAL(src, COMSIG_RIG_TRIGGER_POWER)
	activating = FALSE		
	regenerate_button_icons()
	var/obj/item/clothing/head/helmet/space/hardsuit/dualmode/DM = helmet
	if(istype(DM))
		DM.regenerate_button_icons()
	return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/has_wearer()
	return wearer

/obj/item/clothing/suit/space/hardsuit/dualmode/emp_act(severity)
	. = ..()
	if (!(. & EMP_PROTECT_CONTENTS))
		if(active && wearer)
			toggle_activate(force_deactivate = TRUE)
		malfunctioning = TRUE
		addtimer(CALLBACK(src, PROC_REF(unmalfunction)), auto_unmalf_time, TIMER_OVERRIDE | TIMER_UNIQUE)
	if(inserted_modules.len && !(. & EMP_PROTECT_CONTENTS))
		for(var/obj/item/module/M in inserted_modules)
			M.emp_act(severity)

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/unmalfunction()
	if(malfunctioning)
		malfunctioning = FALSE
		if(wearer)
			to_chat(wearer, span_announce("RIG internal system fixes itself."))

/obj/item/clothing/suit/space/hardsuit/dualmode/emag_act(mob/user, obj/item/card/emag/emag_card)
	locked = !locked
	balloon_alert(user, "suit access [locked ? "locked" : "unlocked"]")
	return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/wirecutter_act(mob/living/user, obj/item/I)
	. = ..()

	if(!open)
		to_chat(user, span_announce("Unscrew protecting plating first!"))
		return FALSE
	if(!malfunctioning)
		to_chat(user, span_announce("There is nothing to fix."))
		return FALSE
	to_chat(user, span_announce("You fix RIG electronics."))
	I.play_tool_sound(src)
	malfunctioning = FALSE
	return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/crowbar_act(mob/living/user, obj/item/I)
	. = ..()

	if(!open)
		to_chat(user, span_announce("Unscrew protecting plating first!"))
		return FALSE
	var/list/options = list()
	var/list/radial_display = list()
	if(core)
		options[initial(core.name)] = core
		var/datum/radial_menu_choice/option = new
		option.image = image(icon = initial(core.icon), icon_state = initial(core.icon_state))
		option.info = "[initial(core.name)] - [span_boldnotice(initial(core.desc))]"
		radial_display[initial(core.name)] = option
	for(var/obj/item/module/mod as anything in inserted_modules)
		if(!initial(mod.removable))
			continue
		options[initial(mod.name)] = mod
		var/datum/radial_menu_choice/option = new
		option.image = image(icon = initial(mod.icon), icon_state = initial(mod.icon_state))
		option.info = "[initial(mod.name)] - [span_boldnotice(initial(mod.desc))]"
		radial_display[initial(mod.name)] = option

	if(!LAZYLEN(options))
		to_chat(user, span_announce("There is nothing to remove."))
		return FALSE
	else if(LAZYLEN(options) == 1)
		return remove_rig_mod(user, I, inserted_modules[1], "remove")
	
	var/choice = show_radial_menu(user, user, radial_display)
	var/obj/item/chosen_mod = options[choice]
	if(QDELETED(src) || QDELETED(user))
		return FALSE
	if(!chosen_mod)
		to_chat(user, span_announce("You choose not to choose."))
		return FALSE
	if(src && chosen_mod && !user.incapacitated() && in_range(user,src))
		remove_rig_mod(user, I, chosen_mod)
		regenerate_button_icons()
		//to_chat(user, span_notice("You remove [chosen_mod.name] from your [name]!"))
		return TRUE
	return FALSE

/obj/item/clothing/suit/space/hardsuit/dualmode/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	if(active)
		balloon_alert(user, "deactivate rig!")
		to_chat(user, span_announce("Some kind of magnet lock preventing you from unscrewing panel. Try deactivate rig first."))
		return FALSE
	if(locked)
		balloon_alert(user, "unlock rig!")
		to_chat(user, span_announce("Some kind of mechanical lock preventing you from unscrewing panel. Try to unlock rig first."))
		return FALSE

	open = !open
	to_chat(user, span_announce("You [open? "unscrew" : "secure"] protecting panel."))
	I.play_tool_sound(src)
	return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/proc/remove_rig_mod(mob/living/user, obj/item/tool_item, obj/item/chosen_mod, removal_verb)
	if(!allowed(user))
		balloon_alert(user, "insufficient access!")
		playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
	if(SEND_SIGNAL(src, COMSIG_RIG_MODULE_REMOVAL, user) & RIG_CANCEL_REMOVAL)
		balloon_alert(user, "removal blocked!")
		playsound(src, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	if(tool_item)
		tool_item.play_tool_sound(src)
	to_chat(user, span_notice("You [removal_verb ? removal_verb : "remove"] [chosen_mod.name] from [src]."))
	chosen_mod.forceMove(drop_location())

	if(Adjacent(user) && !issilicon(user))
		user.put_in_hands(chosen_mod)

	if(istype(chosen_mod, /obj/item/module))
		var/obj/item/module/M = chosen_mod
		return M.remove_module(src)
	if(istype(chosen_mod, /obj/item/core))
		var/obj/item/core/C = chosen_mod
		return C.uninstall(src)

/obj/item/clothing/suit/space/hardsuit/dualmode/prefilled
	starting_modules = list(/obj/item/module/self_injector/omnizine)

////////////////////////////////
/////////NORMAL DUAL-MODS///////
////////////////////////////////
////////////////////////////////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/basic
	name = "basic RIG helmet"
	hardsuit_type = "basic"

/obj/item/clothing/suit/space/hardsuit/dualmode/basic
	name = "basic RIG"
	//preview = TRUE
	hardsuit_type = "basic"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/basic

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering
	name = "engineering RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Has radiation shielding."
	icon_state = "engineering_helm"
	//item_state = "engineering_helm"
	hardsuit_type = "engineering"
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 80)
	resistance_flags = FIRE_PROOF
	visor_flags_inv = HIDEEYES|HIDEFACE
	light_color = LIGHT_COLOR_DEFAULT

/obj/item/clothing/suit/space/hardsuit/dualmode/engineering
	name = "engineering RIG"
	desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Has radiation shielding."
	icon_state = "engineering_rig"
	//item_state = "engineering_rig"
	hardsuit_type = "engineering"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/t_scanner, /obj/item/construction/rcd, /obj/item/pipe_dispenser)
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 80)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering
	starting_modules = list(/obj/item/module/welding, /obj/item/module/storage)
	resistance_flags = FIRE_PROOF

/*
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/unathi
	name = "engineering unathi RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Has radiation shielding."
	icon_state = "engineering_unathi_helm"
	//item_state = "engineering_helm"
	hardsuit_type = "engineering_unathi"
*/

/obj/item/clothing/suit/space/hardsuit/dualmode/engineering/unathi
	//name = "engineering RIG"
	//desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Has radiation shielding."	//Moded for users with digitigrade legs.
	//icon_state = "engineering_rig"
	//item_state = "engineering_rig"
	//item_state = "eng_hardsuit"
	//hardsuit_type = "engineering"
	//helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/unathi
	//mutantrace_variation = DIGITIGRADE_VARIATION
	//species_restricted = list("lizard", "polysmorph")
	starting_modules = list(/obj/item/module/welding, /obj/item/module/storage, /obj/item/module/digitagrade)

//mechanic
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/mechanic
	name = "mechanic RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Has radiation shielding and improved bulletproof covering."
	icon_state = "mechanic_helm"
	//item_state = "mechanic_helm"
	hardsuit_type = "mechanic"
	armor = list(MELEE = 30, BULLET = 15, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 50, ACID = 75, WOUND = 10, ELECTRIC = 80)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/mechanic/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/mechanic/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/dualmode/engineering/mechanic
	name = "mechanic RIG"
	desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Has radiation shielding and improved bulletproof covering."
	icon_state = "engineering_rig"
	//item_state = "engineering_rig"
	hardsuit_type = "engineering"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/t_scanner, /obj/item/construction/rcd, /obj/item/pipe_dispenser)
	armor = list(MELEE = 30, BULLET = 15, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 100, FIRE = 50, ACID = 75, WOUND = 10, ELECTRIC = 80)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/mechanic

//Atmospherics
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/atmospheric
	name = "atmospheric RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Has thermal shielding."
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 25, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 80)
	icon_state = "atmospheric_helm"
	//item_state = "atmospheric_helm"
	hardsuit_type = "atmospheric"
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEEARS
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	light_color = LIGHT_COLOR_ELECTRIC_CYAN

/obj/item/clothing/suit/space/hardsuit/dualmode/engineering/atmospheric
	name = "atmospheric RIG"
	desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Has thermal shielding."
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 25, FIRE = 100, ACID = 75, WOUND = 10, ELECTRIC = 80)
	icon_state = "atmospheric_rig"
	//item_state = "atmospheric_rig"
	item_state = "atmo_hardsuit"
	hardsuit_type = "atmospheric"
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/atmospheric

//Atmospherics black
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/atmospheric/alt
	icon_state = "atmosphericalt_helm"
	//item_state = "atmosphericalt_helm"
	hardsuit_type = "atmosphericalt"

/obj/item/clothing/suit/space/hardsuit/dualmode/engineering/atmospheric/alt
	icon_state = "atmosphericalt_rig"
	//item_state = "atmosphericalt_rig"
	hardsuit_type = "atmosphericalt"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/atmospheric/alt

//CE
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/elite
	name = "elite utility RIG helmet"
	desc = "An advanced helmet designed for work in a hazardous, low pressure environment. Shines with a high polish."
	icon_state = "ce_helm"
	//item_state = "ce_helm"
	hardsuit_type = "ce"
	armor = list(MELEE = 40, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 90, WOUND = 10, ELECTRIC = 80)
	visor_flags_inv = null
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/dualmode/engineering/elite
	name = "elite utility RIG"
	desc = "An advanced rig that protects against hazardous, low pressure environments. Shines with a high polish."
	icon_state = "ce_rig"
	//item_state = "ce_rig"
	item_state = "ce_hardsuit"
	hardsuit_type = "ce"
	armor = list(MELEE = 40, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 90, WOUND = 10, ELECTRIC = 80)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	jetpack = /obj/item/tank/jetpack/suit
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/elite

/////syndicate engineer 
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/syndicate
	name = "GEC RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Global Engineering Consortium production."
	icon_state = "sindengi_helm"
	//item_state = "sindengi_helm"
	hardsuit_type = "sindengi"
	light_range = 6
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 15, ELECTRIC = 80)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/syndicate/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/syndicate/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_BASIC]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/dualmode/engineering/syndicate
	name = "GEC RIG"
	desc = "A modern rig designed for isolation from the hazardous, low pressure environments. Global Engineering Consortium production. Unite for best working conditions."
	icon_state = "sindengi_rig"
	//item_state = "sindengi_rig"
	hardsuit_type = "sindengi"
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 15, ELECTRIC = 80)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/syndicate
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	combat_slowdown = 0.3
	starting_modules = list(/obj/item/module/welding, /obj/item/module/speed_booster, /obj/item/module/storage/syndicate)
	max_complexity = PLUS_TWO_MAX_COMPLEXITY
	starting_core = /obj/item/core/fusion


/obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/syndicate/winter
	name = "winter GEC RIG helmet"
	desc = "A modern helmet designed for isolation from the hazardous, low-pressure environment. Global Engineering Consortium production."
	icon_state = "sindengiwinter_helm"
	//item_state = "sindengiwinter_helm"
	hardsuit_type = "sindengiwinter"
	winter_mod = TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/engineering/syndicate/winter
	name = "winter GEC RIG"
	icon_state = "sindengiwinter_rig"
	//item_state = "sindengiwinter_rig"
	hardsuit_type = "sindengiwinter"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/engineering/syndicate/winter
	winter_mod = TRUE

///////Medical dual-mods///////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/medical
	name = "medical RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for medical extractions in hasard areas."
	icon_state = "medical_helm"
	//item_state = "medical_helm"
	hardsuit_type = "medical"
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 60, FIRE = 60, ACID = 75, WOUND = 10, ELECTRIC = 50)
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SCAN_REAGENTS | HEADINTERNALS
	light_color = LIGHT_COLOR_BLUEGREEN

/obj/item/clothing/suit/space/hardsuit/dualmode/medical
	name = "medical RIG"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. For general medical use."
	icon_state = "medical_rig"
	//item_state = "medical_rig"
	item_state = "medical_hardsuit"
	hardsuit_type = "medical"
	charge_drain = DEFAULT_CHARGE_DRAIN * 1.5
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/storage/firstaid, /obj/item/healthanalyzer, /obj/item/stack/medical)
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, BIO = 100, RAD = 60, FIRE = 60, ACID = 75, WOUND = 10, ELECTRIC = 50)
	//starting_modules = list(/obj/item/module/storage)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/medical

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/medical/rescue
	name = "rescue RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for rescue attempts in hasard areas."
	icon_state = "rescue_helm"
	//item_state = "rescue_helm"
	hardsuit_type = "rescue"

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/medical/rescue/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_BASIC]
		MHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/medical/rescue/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_BASIC]
		MHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/dualmode/medical/rescue
	name = "rescue RIG"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Built with lightweight materials for easier movement. Expensive in production and maintaining."
	icon_state = "rescue_rig"
	//item_state = "rescue_rig"
	hardsuit_type = "rescue"
	slowdown = 0.4
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/medical/rescue
	starting_modules = list(/obj/item/module/speed_booster/civilian)

////////////////////////////
//////Mining Dual-mod//////
////////////////////////////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/mining
	name = "mining RIG helmet"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for mining operations in hasard areas."
	icon_state = "mining_helm"
	//item_state = "mining_helm"
	light_range = 7
	hardsuit_type = "mining"
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 50, FIRE = 50, ACID = 75, WOUND = 15, ELECTRIC = 50)
	visor_flags_inv = HIDEEYES|HIDEFACE
	light_color = LIGHT_COLOR_YELLOW
	winter_mod = TRUE

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/mining/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/space/hardsuit/dualmode/mining
	name = "mining RIG"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Used by Nanotrasen mining groups across human space. Expensive in production and maintaining."
	icon_state = "mining_rig"
	//item_state = "mining_rig"
	item_state = "mining_hardsuit"
	hardsuit_type = "mining"
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 50, BIO = 100, RAD = 50, FIRE = 50, ACID = 75, WOUND = 15, ELECTRIC = 50)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/storage/bag/ore, /obj/item/pickaxe)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/mining
	charge_drain = DEFAULT_CHARGE_DRAIN * 2
	starting_modules = list(/obj/item/module/ash_accretion, 
	/*/obj/item/mod/module/sphere_transform*/
	)
	starting_core = /obj/item/core/plasma
	winter_mod = TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/mining/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)


//////////////////////////////
//////Security Dual-mods//////
//////////////////////////////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/security
	name = "security RIG helmet"
	icon_state = "sec_helm"
	//item_state = "sec_helm"
	hardsuit_type = "sec"
	light_range = 5
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for security operations in hasard AO`s."
	armor = list(MELEE = 30, BULLET = 25, LASER = 30, ENERGY = 10, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 50)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	visor_flags_cover = NONE
	light_color = LIGHT_COLOR_DEFAULT
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)

/obj/item/clothing/suit/space/hardsuit/dualmode/security
	name = "security RIG"
	icon_state = "sec_rig"
	//item_state = "sec_rig"
	item_state = "sec_hardsuit"
	hardsuit_type = "sec"
	combat_slowdown = 0.4	//we need some extra speed here
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Used by paramilitary groups and PMC alike affiliated with or contracted by Nanotrasen across human space. Expensive in production and maintaining. Has NT logo on it`s back."
	armor = list(MELEE = 30, BULLET = 25, LASER = 30, ENERGY = 10, BOMB = 40, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 50)
	starting_modules = list(/obj/item/module/pepper_shoulders, 
							/obj/item/module/holster, 
							/obj/item/module/megaphone, 
							/obj/item/module/active_sonar, 
							/obj/item/module/projectile_dampener)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/security
	req_access = list(ACCESS_SECURITY)

/obj/item/clothing/suit/space/hardsuit/dualmode/security/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_hardsuit_allowed

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/security/brigmed
	name = "security brigmed RIG helmet"
	icon_state = "brigmed_helm"
	//item_state = "brigmed_helm"
	hardsuit_type = "brigmed"
	desc = "A standardized dual-mode helmet derived from more advanced special operations helmets. Designed for medical extractions from combat zones."
	armor = list(MELEE = 25, BULLET = 15, LASER = 20, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 50)

/obj/item/clothing/suit/space/hardsuit/dualmode/security/brigmed
	name = "security brigmed RIG"
	icon_state = "brigmed_rig"
	//item_state = "brigmed_rig"
	hardsuit_type = "brigmed"
	desc = "A standardized dual-mode RIG derived from more advanced special operations hardsuits. Used by paramedics of paramilitary groups and PMC alike across human space. Expensive in production and maintaining."
	armor = list(MELEE = 25, BULLET = 15, LASER = 20, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 50)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/security/brigmed
	//combat_slowdown = 0.35
	charge_drain = DEFAULT_CHARGE_DRAIN * 1.5
	max_complexity = PLUS_ONE_MAX_COMPLEXITY
	starting_modules = list(/obj/item/module/pepper_shoulders, 
							/obj/item/module/holster, 
							/obj/item/module/storage,
							/obj/item/module/active_sonar, 
							/obj/item/module/speed_booster/civilian)
	req_access = list(ACCESS_SECURITY)



//////Gorlex Sec suit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/security/gorlex
	name = "\improper Gorlex security RIG helmet"
	icon_state = "secsyndi_helm"
	//item_state = "secsyndi_helm"
	hardsuit_type = "secsyndi"
	desc = "Bulletproof dual-mode helmet derived from more advanced special operations helmets. Designed for private military operations in hasard AO`s. Gorlex Security brunch property."
	armor = list(MELEE = 35, BULLET = 45, LASER = 15, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 50)
	light_color = LIGHT_COLOR_GREEN

/obj/item/clothing/suit/space/hardsuit/dualmode/security/gorlex
	name = "\improper Gorlex security RIG"
	icon_state = "secsyndi_rig"
	//item_state = "secsyndi_rig"
	hardsuit_type = "secsyndi"
	desc = "Bulletproof dual-mode RIG derived from more advanced special operations hardsuits. Used by Gorlex Security groups across human space. Lacks laser protection. Expensive in production and maintaining."
	armor = list(MELEE = 30, BULLET = 40, LASER = 15, ENERGY = 10, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 75, WOUND = 15, ELECTRIC = 50)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/security/gorlex
	combat_slowdown = 0.3
	max_complexity = PLUS_ONE_MAX_COMPLEXITY
	starting_modules = list(/obj/item/module/pepper_shoulders, 
							/obj/item/module/holster, 
							/obj/item/module/megaphone, 
							/obj/item/module/storage/syndicate,
							/obj/item/module/active_sonar, 
							/obj/item/module/projectile_dampener)

//////Vahlen Sec suit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/security/vahlen
	name = "vahlen corpsman RIG helmet"
	desc = "A dual-mode advanced helmet designed for medical extractions. Original design by Vahlen Pharmaceuticals."
	icon_state = "vahlencorpsman_helm"
	//item_state = "vahlencorpsman_helm"
	hardsuit_type = "vahlencorpsman"
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEEARS
	toggled_for_heat_protecting = FALSE
	armor = list(MELEE = 30, BULLET = 40, LASER = 40, ENERGY = 30, BOMB = 40, BIO = 100, RAD = 90, FIRE = 75, ACID = 90, WOUND = 20, ELECTRIC = 50)
	light_color = LIGHT_COLOR_DEFAULT

/obj/item/clothing/suit/space/hardsuit/dualmode/security/vahlen
	name = "vahlen corpsman RIG"
	desc = "A dual-mode advanced RIG designed for medical extractions. Original design by Vahlen Pharmaceuticals."
	icon_state = "vahlencorpsman_rig"
	//item_state = "vahlencorpsman_rig"
	hardsuit_type = "vahlencorpsman"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/security/vahlen
	jetpack = /obj/item/tank/jetpack/suit
	armor = list(MELEE = 30, BULLET = 40, LASER = 40, ENERGY = 30, BOMB = 40, BIO = 100, RAD = 90, FIRE = 75, ACID = 90, WOUND = 20, ELECTRIC = 50)
	combat_slowdown = 0.3
	lightweight = FALSE
	toggled_for_heat_protecting = FALSE
	starting_modules = list(/obj/item/module/pepper_shoulders, 
							/obj/item/module/holster, 
							/obj/item/module/megaphone, 
							/obj/item/module/storage/syndicate,
							/obj/item/module/active_sonar, 
							/obj/item/module/speed_booster/civilian,
							/obj/item/module/projectile_dampener)



/////////////////////////////////////////
//////Special Operations Dual-mods//////
/////////////////////////////////////////
/////////////////////////////////////////

//////Bloodred Syndie suit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred
	name = "blood-red RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Gorlex Marauders."
	icon_state = "bloodred_helm"
	//item_state = "bloodred_helm"
	hardsuit_type = "bloodred"
	light_range = 6
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 50)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	toggled_for_heat_protecting = FALSE

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred
	name = "blood-red RIG"
	desc = "A dual-mode advanced RIG designed for special operations. Has inbuilt advanced combat leg servomotors and jetpack. Original design by Gorlex Marauders."
	icon_state = "bloodred_rig"
	//item_state = "bloodred_rig"
	hardsuit_type = "bloodred"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS //finally, some normal armoring
	body_parts_partial_covered = 0
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred
	jetpack = /obj/item/tank/jetpack/suit/bloodred
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals, /obj/item/tank/jetpack/oxygen/harness)
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 50)
	starting_modules = list(/obj/item/module/speed_booster, /obj/item/module/plate_compression, /obj/item/module/storage/syndicate, /obj/item/module/dna_lock, /obj/item/module/demoralizer)
	max_complexity = PLUS_ONE_MAX_COMPLEXITY
	starting_core = /obj/item/core/fusion
	auto_unmalf_time = 40 SECONDS
	combat_slowdown = 0.3
	lightweight = FALSE
	toggled_for_heat_protecting = FALSE

/obj/item/tank/jetpack/suit/bloodred
	full_speed = TRUE
	icon_state = "jetpack-mini"
	classic = FALSE

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/preview
	icon_state = "bloodred_helm_sealed_light"
	//item_state = "bloodred_helm_sealed_light"

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/preview
	icon_state = "bloodred_rig_sealed"
	//item_state = "bloodred_rig_sealed"
	preview = TRUE


//////Winter bloodred Syndie suit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/winter
	name = "winter Gorlex RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Gorlex Marauders."
	icon_state = "bloodwinter_helm"
	//item_state = "bloodwinter_helm"
	hardsuit_type = "bloodwinter"
	winter_mod = TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/winter
	name = "winter Gorlex RIG"
	desc = "A dual-mode advanced RIG designed for special operations. Has inbuilt advanced combat leg servomotors and improved cold resistant. Original design by Gorlex Marauders."
	icon_state = "bloodwinter_rig"
	//item_state = "bloodwinter_rig"
	hardsuit_type = "bloodwinter"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/winter
	toggled_for_heat_protecting = FALSE
	winter_mod = TRUE

//////Bloodred Unathi suit//////
/*
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/unathi
	name = "blood-red unathi RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Moded for users with elongated skull proportions. Property of Gorlex Marauders."
	icon_state = "bloodred_unathi_helm"
	//item_state = "bloodred_unathi_helm"
	hardsuit_type = "bloodred_unathi"
*/

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/unathi
	// name = "blood-red unathi RIG"
	// desc = "A dual-mode advanced RIG designed for special operations. Moded for users with digitigrade legs. Original design by Gorlex Marauders."
	// icon_state = "bloodred_unathi_rig"
	// item_state = "bloodred_unathi_rig"
	// hardsuit_type = "bloodred_unathi"
	// helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/unathi
	// mutantrace_variation = DIGITIGRADE_VARIATION
	// species_restricted = list("lizard", "polysmorph")
	starting_modules = list(/obj/item/module/speed_booster, /obj/item/module/plate_compression, /obj/item/module/dna_lock, /obj/item/module/demoralizer, /obj/item/module/digitagrade)

//////Bloodred Waffle Co suit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/waffle
	name = "waffle specops RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Property of Waffle Co."
	icon_state = "wafflebloodred_helm"
	//item_state = "wafflebloodred_helm"
	hardsuit_type = "wafflebloodred"
	armor = list(MELEE = 30, BULLET = 50, LASER = 40, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 50)

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/waffle
	name = "waffle specops RIG"
	desc = "A dual-mode advanced RIG designed for special operations with integrated track pulse system. Original design by Waffle Co."
	icon_state = "wafflebloodred_rig"
	//item_state = "wafflebloodred_rig"
	hardsuit_type = "wafflebloodred"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS //finally, some normal armoring
	body_parts_partial_covered = 0
	armor = list(MELEE = 30, BULLET = 50, LASER = 40, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 50)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/waffle
	combat_slowdown = 0.3
	starting_modules = list()
	eva_slowdown = 0.8
	var/slowdown_magactive = 1
	var/magpulse = 0

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/waffle/toggle_seal_mode(mob/user) //Suit Mode
	. = ..()
	if(sealed)
		slowdown = eva_slowdown + (magpulse * slowdown_magactive)
	else
		slowdown = combat_slowdown + (magpulse * slowdown_magactive)
	icon_state = "[hardsuit_type]_rig[sealed ? "_sealed" : ""][magpulse ? "_active" : ""]"
	//update_appearance(UPDATE_ICON)
	user.update_inv_wear_suit()

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/waffle/verb/toggle()
	set name = "Toggle Magboots"
	set category = "Object"
	set src in usr
	if(!can_use(usr))
		return
	AltClick(usr)

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/waffle/AltClick(mob/user)
	if(magpulse)
		clothing_flags &= ~NOSLIP
		slowdown -= slowdown_magactive
	else
		clothing_flags |= NOSLIP
		slowdown += slowdown_magactive
	magpulse = !magpulse
	icon_state = "[hardsuit_type]_rig[sealed ? "_sealed" : ""][magpulse ? "_active" : ""]"
	//update_appearance(UPDATE_ICON)
	user.update_inv_wear_suit()
	to_chat(user, span_notice("You [magpulse ? "enable" : "disable"] the mag-pulse traction system."))
	user.update_gravity(user.has_gravity())
	regenerate_button_icons()

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/waffle/negates_gravity()
	return clothing_flags & NOSLIP

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/waffle/examine(mob/user)
	. = ..()
	. += "Its mag-pulse traction system appears to be [magpulse ? "enabled" : "disabled"]."
	if(in_range(user, src) || isobserver(user))
		. += "<span class='notice'>Alt-click on suit to toggle magpulse system.<span>"


//////Bloodred Waffle Co Unathi suit//////
/*
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/waffle/unathi
	name = "blood-red unathi RIG helmet"
	desc = "A dual-mode advanced helmet designed for special operations. Moded for users with elongated skull proportions. Property of Waffle Co."
	icon_state = "wafflebloodred_unathi_helm"
	//item_state = "wafflebloodred_unathi_helm"
	hardsuit_type = "wafflebloodred_unathi"
*/

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/waffle/unathi
	// name = "blood-red unathi RIG"
	// desc = "A dual-mode advanced RIG designed for special operations with integrated track pulse system. Moded for users with digitigrade legs. Original design by Waffle Co."
	// icon_state = "wafflebloodred_unathi_rig"
	// //item_state = "wafflebloodred_unathi_rig"
	// hardsuit_type = "wafflebloodred_unathi"
	// helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/waffle/unathi
	// mutantrace_variation = DIGITIGRADE_VARIATION
	// species_restricted = list("lizard", "polysmorph")
	starting_modules = list(/obj/item/module/digitagrade)

//////Bloodred Waffle Co Unathi Breach suit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/waffle/breach
	name = "blood-red Breach RIG helmet"
	desc = "A dual-mode advanced helmet designed for breach squads. Property of Waffle Co."	// Moded for users with elongated skull proportions.
	icon_state = "wafflebloodred_breacher_helm"
	// //item_state = "wafflebloodred_unathi_breacher_helm"
	hardsuit_type = "wafflebloodred_breacher"
	armor = list(MELEE = 80, BULLET = 70, LASER = 50, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 50)

/obj/item/clothing/suit/space/hardsuit/dualmode/bloodred/waffle/breach
	name = "blood-red Breach RIG"
	desc = "A dual-mode advanced RIG designed for breach squads with integrated track pulse system. Provides ability to breach through walls. Original design by Waffle Co."	//Moded for users with digitigrade legs.
	icon_state = "wafflebloodred_breacher_rig"
	//item_state = "wafflebloodred_unathi_breacher_rig"
	hardsuit_type = "wafflebloodred_breacher"
	starting_modules = list(/obj/item/module/breacher, /obj/item/module/digitagrade)
	armor = list(MELEE = 80, BULLET = 70, LASER = 50, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 50)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/bloodred/waffle/breach

//////Elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite
	name = "elite syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armor and fireproofing."
	icon_state = "relite_helm"
	//item_state = "relite_helm"
	hardsuit_type = "relite"
	light_range = 6
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 35, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 80)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	toggled_for_heat_protecting = FALSE
	light_color = LIGHT_COLOR_DEFAULT
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)

/obj/item/clothing/suit/space/hardsuit/dualmode/elite
	name = "elite syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armor and fireproofing."
	icon_state = "relite_rig"
	//item_state = "relite_rig"
	hardsuit_type = "relite"
	jetpack = /obj/item/tank/jetpack/suit
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS //finally, some normal armoring
	body_parts_partial_covered = 0
	armor = list(MELEE = 55, BULLET = 55, LASER = 50, ENERGY = 30, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 80)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)
	starting_modules = list(/obj/item/module/armor_booster, /obj/item/module/holster, /obj/item/module/storage/syndicate, /obj/item/module/dna_lock, /obj/item/module/demoralizer)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	lightweight = FALSE
	toggled_for_heat_protecting = FALSE
	combat_slowdown = 0.1
	max_complexity = PLUS_ONE_MAX_COMPLEXITY
	starting_core = /obj/item/core/fusion
	req_access = list(ACCESS_SYNDICATE)
	auto_unmalf_time = 30 SECONDS

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/preview
	icon_state = "relite_helm_sealed"
	//item_state = "relite_helm_sealed"

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/preview
	icon_state = "relite_rig_sealed"
	//item_state = "relite_rig_sealed"
	preview = TRUE

////Vahlen elite
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/vahlen
	name = "elite Vahlen operative RIG helmet"
	icon_state = "vahlenop_helm"
	//item_state = "vahlenop_helm"
	hardsuit_type = "vahlenop"
	light_color = LIGHT_COLOR_GREEN

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/vahlen
	name = "elite Vahlen operative RIG"
	icon_state = "vahlenop_rig"
	//item_state = "vahlenop_rig"
	hardsuit_type = "vahlenop"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/vahlen

// Optical military
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical
	name = "experimental elite helmet"
	icon_state = "optical_helm"
	//item_state = "optical_helm"
	hardsuit_type = "optical"
	desc = "Strange looking, smoothly contoured helmet. It looks a bit blurry."
	armor = list(MELEE = 35, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 80)
	var/hit_reflect_chance = 50

/*
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE
D*/

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/optical
	name = "experimental elite rig"
	icon_state = "optical_rig"
	//item_state = "optical_rig"
	hardsuit_type = "optical"
	desc = "Strange black hardsuit, with some devices attached to it. It looks a bit blurry. Property of Cybersun Industries."
	armor = list(MELEE = 35, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 90, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 80)
	//actions_types = list(/datum/action/item_action/toggle_helmet, /datum/action/item_action/toggle_optical)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical
	starting_modules = list(/obj/item/module/armor_booster, /obj/item/module/holster, /obj/item/module/storage/syndicate, /obj/item/module/dna_lock, /obj/item/module/stealth/disruptor)
	//var/cloak = FALSE
	var/hit_reflect_chance = 50

/*
/datum/action/item_action/toggle_optical
	name = "Toggle Optical Disruptor"

/datum/action/item_action/toggle_optical/Trigger(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical))
		to_chat(H, "<span class='notice'Cloak need helmet.</span>")
		return
	var/obj/item/clothing/suit/space/hardsuit/dualmode/elite/optical/O = target
	O.cloak(H)

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/optical/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_PRECISE_R_HAND, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, BODY_ZONE_PRECISE_R_FOOT, BODY_ZONE_PRECISE_L_FOOT))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/optical/AltClick(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
	if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical))
		to_chat(H, "<span class='notice'Cloak need helmet.</span>")
		return
	cloak(H)

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/optical/proc/cloak(mob/living/carbon/human/H, sl)
	if(cloak)
		cloak = FALSE
		return 1

	to_chat(H, "<span class='notice'>Optical disruptor activated.</span>")
	cloak = TRUE
	animate(H,alpha = 255, alpha = 85, time = 10)

	var/remain_cloaked = TRUE
	while(remain_cloaked)
		sleep(1 SECONDS)
		if(!cloak)
			remain_cloaked = 0
		if(H.stat)
			remain_cloaked = 0
		var/obj/item/OH = H.get_item_by_slot(ITEM_SLOT_HEAD)
		if(!OH || !istype(OH, /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical))
			remain_cloaked = 0
	H.invisibility = initial(H.invisibility)
	H.visible_message("<span class='warning'>[H] suddenly fades in.</span>",
	"<span class='notice'>Optical disruptor deactivated.</span>")
	cloak = FALSE

	animate(H,alpha = 85, alpha = 255, time = 10)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		. += "<span class='notice'>Alt-click on suit to toggle optical cloaking system.<span>"
*/

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical/cs
	name = "elite Cybersun Industries RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing."
	icon_state = "cselite_helm"
	//item_state = "cselite_helm"
	hardsuit_type = "cselite"

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/optical/cs
	name = "elite Cybersun Industries RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding."
	icon_state = "cselite_rig"
	//item_state = "cselite_rig"
	hardsuit_type = "cselite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/optical/cs


//////Medical Elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/med
	name = "elite medical syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one has medical paint pattern."
	icon_state = "smedelite_helm"
	//item_state = "smedelite_helm"
	hardsuit_type = "smedelite"

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/med
	name = "elite medical syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one has medical paint pattern."
	icon_state = "smedelite_rig"
	//item_state = "smedelite_rig"
	hardsuit_type = "smedelite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/med


/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/med/cs
	name = "elite medical Cybersun Industries RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing."
	icon_state = "cselite_med_helm"
	//item_state = "cselite_med_helm"
	hardsuit_type = "cselite_med"

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/med/cs
	name = "elite medical Cybersun Industries RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding."
	icon_state = "cselite_rig"
	//item_state = "cselite_rig"
	hardsuit_type = "cselite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/med/cs


//////Bloody elite hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/bloodred
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one reminds deathsquad style."
	icon_state = "elite_bloodred_helm"
	//item_state = "elite_bloodred_helm"
	hardsuit_type = "elite_bloodred"

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/bloodred
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one reminds deathsquad style."
	icon_state = "elite_bloodred_helm"
	//item_state = "elite_bloodred_helm"
	hardsuit_type = "elite_bloodred"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/bloodred


//////Strike team hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/sbo
	name = "\improper Syndicate Black Ops RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. Classic black."
	armor = list(MELEE = 70, BULLET = 70, LASER = 50, ENERGY = 40, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 80)
	icon_state = "sbo_helm"
	//item_state = "sbo_helm"
	hardsuit_type = "sbo"
	light_range = 7

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/sbo
	name = "\improper Syndicate Black Ops syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. Classic black."
	armor = list(MELEE = 70, BULLET = 70, LASER = 50, ENERGY = 40, BOMB = 100, BIO = 100, RAD = 70, FIRE = 100, ACID = 100, WOUND = 30, ELECTRIC = 80)
	icon_state = "sbo_rig"
	//item_state = "sbo_rig"
	hardsuit_type = "sbo"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/sbo

//////ComsOff hardsuit//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/sbo/commsoff
	name = "\improper Comms Officer elite syndicate RIG helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. This one has contractor style."
	icon_state = "commsoff_helm"
	//item_state = "commsoff_helm"
	hardsuit_type = "commsoff"

/obj/item/clothing/suit/space/hardsuit/dualmode/elite/sbo/commsoff
	name = "\improper Comms Officer elite syndicate RIG"
	desc = "An elite version of the syndicate RIG, with improved armour and fire shielding. This one has contractor style."
	icon_state = "commsoff_rig"
	//item_state = "commsoff_rig"
	hardsuit_type = "commsoff"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/elite/sbo/commsoff


//////Merk suit designes//////
//////Standart merk rig//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/merk
	name = "grey merc RIG helmet"
	desc = "An austere tactical helmet used by paramilitary groups across human space."
	icon_state = "freemerk_helm"
	hardsuit_type = "freemerk"
	light_range = 6
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS //finally, some normal armoring
	body_parts_partial_covered = 0
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 50)
	heat_protection = HEAD
	toggled_for_heat_protecting = FALSE
	light_color = LIGHT_COLOR_DEFAULT

/obj/item/clothing/suit/space/hardsuit/dualmode/merk
	name = "grey merc RIG"
	desc = "An austere RIG used by paramilitary groups across human space."
	icon_state = "freemerk_rig"
	hardsuit_type = "freemerk"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/merk
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals, /obj/item/tank/jetpack/oxygen/harness)
	armor = list(MELEE = 40, BULLET = 50, LASER = 30, ENERGY = 25, BOMB = 50, BIO = 100, RAD = 50, FIRE = 75, ACID = 90, WOUND = 25, ELECTRIC = 50)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	lightweight = FALSE
	toggled_for_heat_protecting = FALSE
	combat_slowdown = 0
	starting_modules = list(/obj/item/module/armor_booster, /obj/item/module/holster, /obj/item/module/storage/large_capacity, /obj/item/module/dna_lock)
	starting_cell = /obj/item/stock_parts/cell/high/plus

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/merk/blue
	name = "blue mercenary RIG helmet"
	icon_state = "bfreemerk_helm"

/obj/item/clothing/suit/space/hardsuit/dualmode/merk/blue
	name = "blue mercenary RIG"
	icon_state = "bfreemerk_rig"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/merk/blue

//////Military suit designes//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military
	name = "military RIG helmet"
	desc = "An austere tactical helmet used by paramilitary groups and real soldiers alike across human space."
	icon_state = "military_helm"
	//item_state = "military_helm"
	hardsuit_type = "military"
	armor = list(MELEE = 45, BULLET = 60, LASER = 40, ENERGY = 35, BOMB = 60, BIO = 100, RAD = 70, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 50)
	light_range = 7
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE


/obj/item/clothing/suit/space/hardsuit/dualmode/military
	name = "military RIG"
	desc = "An austere RIG used by paramilitary groups and real soldiers alike across human space."
	icon_state = "military_rig"
	//item_state = "military_rig"
	hardsuit_type = "military"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS //finally, some normal armoring
	body_parts_partial_covered = 0
	armor = list(MELEE = 45, BULLET = 60, LASER = 40, ENERGY = 25, BOMB = 60, BIO = 100, RAD = 70, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 50)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	combat_slowdown = 0.3
	lightweight = TRUE
	starting_modules = list(/obj/item/module/holster, /obj/item/module/storage/large_capacity, /obj/item/module/dna_lock)
	max_complexity = PLUS_ONE_MAX_COMPLEXITY
	starting_cell = /obj/item/stock_parts/cell/high/plus

//////Emergency Response Team suits//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert
	name = "elite emergency response team RIG helmet (operative)"
	desc = "Advanced helmet issued to operative of emergency response team Gamma."
	icon_state = "nt_combat_helm"
	//item_state = "nt_combat_helm"
	hardsuit_type = "nt_combat"
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 50)
	strip_delay = 130
	light_range = 7
	light_color = LIGHT_COLOR_DEFAULT
	toggled_for_heat_protecting = FALSE
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert
	name = "elite emergency response team RIG (operative)"
	desc = "Advanced RIG issued to operative of emergency response team Gamma."
	icon_state = "nt_combat_rig"
	//item_state = "nt_combat_rig"
	hardsuit_type = "nt_combat"
	armor = list(MELEE = 50, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 75, WOUND = 25, ELECTRIC = 50)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert
	jetpack = /obj/item/tank/jetpack/suit
	lightweight = FALSE
	toggled_for_heat_protecting = FALSE
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)
	req_access = list(ACCESS_CENT_GENERAL)
	starting_modules = list(/obj/item/module/holster, /obj/item/module/storage/large_capacity, /obj/item/module/dna_lock, /obj/item/module/self_injector/combat)

//////Security//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/sec
	name = "elite emergency response team hardsuit helmet (security)"
	icon_state = "ert_security_helm"
	//item_state = "ert_security_helm"
	hardsuit_type = "ert_security"
	desc = "Advanced helmet issued to security specialist of emergency response team Gamma."

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/sec/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/sec/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_BASIC]
		SHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/sec
	name = "elite emergency response team RIG (security)"
	icon_state = "ert_security_rig"
	//item_state = "ert_security_rig"
	hardsuit_type = "ert_security"
	desc = "Advanced RIG issued to security specialist of emergency response team Gamma."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/sec

//////Commander//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/com
	name = "elite emergency response team RIG helmet (squad leader)"
	icon_state = "ert_commander_helm"
	//item_state = "ert_commander_helm"
	hardsuit_type = "ert_commander"
	desc = "Advanced helmet issued to officer of emergency response team Gamma."
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 70, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	//var/hit_reflect_chance = 40

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/com/examine(mob/user)
	. = ..()
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/ert))
		. += "Engraved on the back: \
			In this particular shitshow you have to be armed to enforce your authority. \
			But you're not required to use your weapon under any circumstances."

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/com/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.show_to(user)
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/com/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.hide_from(user)
		DHUD.hide_from(user)

/*
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/com/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE
*/

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/com
	name = "elite emergency response team RIG (squad leader)"
	desc = "Advanced RIG issued to officer of emergency response team Gamma. Made from superior materials, one of the latest in the modern combat rigs line."
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	icon_state = "ert_commander_rig"
	//item_state = "ert_commander_rig"
	hardsuit_type = "ert_commander"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/com
	//var/hit_reflect_chance = 40
	eva_slowdown = 0.7
	starting_modules = list(/obj/item/module/holster, /obj/item/module/storage/large_capacity, /obj/item/module/dna_lock, /obj/item/module/self_injector/combat, /obj/item/module/anti_magic, /obj/item/module/ablative_armor)

/*
/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/com/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE
*/


//////Deathsquad//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/deathsquad
	name = "elite emergency response team RIG helmet (blackops)"
	desc = "Advanced helmet issued to black ops team operator."
	icon_state = "apocryphal_helm"
	//item_state = "nt_deathsquad_helm"
	hardsuit_type = "apocryphal"
	//var/hit_reflect_chance = 50
	light_color = LIGHT_COLOR_LIGHT_CYAN
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 80)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/deathsquad/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE_MIND, inventory_flags = ITEM_SLOT_HEAD)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/deathsquad/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.show_to(user)
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/deathsquad/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/SHUD = GLOB.huds[DATA_HUD_SECURITY_MEDICAL]
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		SHUD.hide_from(user)
		DHUD.hide_from(user)

// /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/deathsquad/IsReflect(def_zone)
// 	if(!(def_zone in list(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_EYES))) //If not shot where ablative is covering you, you don't get the reflection bonus!
// 		return FALSE
// 	if (prob(hit_reflect_chance))
// 		return TRUE

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/deathsquad
	name = "elite emergency response team RIG (blackops)"
	desc = "Advanced RIG issued to black ops team operator. Made from superior materials, one of the latest in the modern combat rigs line."
	icon_state = "apocryphal_rig"
	//item_state = "nt_deathsquad_rig"
	hardsuit_type = "apocryphal"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/deathsquad
	//var/hit_reflect_chance = 50
	lightweight = TRUE
	combat_slowdown = 0.2
	starting_core = /obj/item/core/coldfusion
	starting_modules = list(/obj/item/module/holster, /obj/item/module/storage/bluespace, /obj/item/module/dna_lock, /obj/item/module/self_injector/combat/quantum_liquid, /obj/item/module/anti_magic, /obj/item/module/ablative_armor)
	armor = list(MELEE = 65, BULLET = 65, LASER = 70, ENERGY = 60, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 80)

// /obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/deathsquad/IsReflect(def_zone)
// 	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN))) //If not shot where ablative is covering you, you don't get the reflection bonus!
// 		return FALSE
// 	if (prob(hit_reflect_chance))
// 		return TRUE


//////Engineer//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/engi
	name = "elite emergency response team RIG helmet (field engineer)"
	icon_state = "ert_engineer_helm"
	//item_state = "ert_engineer_helm"
	hardsuit_type = "ert_engineer"
	armor = list(MELEE = 55, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 25, ELECTRIC = 80)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/engi/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/engi/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		DHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/engi
	name = "elite emergency response team RIG (field engineer)"
	icon_state = "ert_engineer_rig"
	//item_state = "ert_engineer_rig"
	hardsuit_type = "ert_engineer"
	armor = list(MELEE = 55, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 75, WOUND = 25, ELECTRIC = 80)
	resistance_flags = FIRE_PROOF
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/engi


//////Medic//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/med
	name = "elite emergency response team RIG helmet (field medic)"
	icon_state = "ert_medical_helm"
	//item_state = "ert_medical_helm"
	hardsuit_type = "ert_medical"
	armor = list(MELEE = 45, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 100, WOUND = 25, ELECTRIC = 50)
	resistance_flags = ACID_PROOF
	clothing_flags = THICKMATERIAL | SCAN_REAGENTS | HEADINTERNALS

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/med/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		DHUD.show_to(user)
		MHUD.show_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/med/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		var/datum/atom_hud/MHUD = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		DHUD.hide_from(user)
		MHUD.hide_from(user)

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/med
	name = "elite emergency response team RIG (field medic)"
	icon_state = "ert_medical_rig"
	//item_state = "ert_medical_rig"
	hardsuit_type = "ert_medical"
	armor = list(MELEE = 45, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 60, BIO = 100, RAD = 100, FIRE = 75, ACID = 100, WOUND = 25, ELECTRIC = 50)
	resistance_flags = ACID_PROOF
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/med


//////Paradimentional//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/paradimentional
	name = "elite emergency response team RIG helmet (paradimentional specialist)"
	icon_state = "ert_paradimentional_helm"
	//item_state = "ert_paradimentional_helm"
	hardsuit_type = "ert_paradimentional"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 50, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/paradimentional/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, antimagic_flags = MAGIC_RESISTANCE_MIND, inventory_flags = ITEM_SLOT_OCLOTHING)

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/paradimentional
	name = "elite emergency response team RIG (paradimentional specialist)"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 40, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25, ELECTRIC = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	icon_state = "ert_paradimentional_rig"
	//item_state = "ert_paradimentional_rig"
	hardsuit_type = "ert_paradimentional"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/paradimentional
	starting_modules = list(/obj/item/module/holster, /obj/item/module/storage/large_capacity, /obj/item/module/dna_lock, /obj/item/module/self_injector/combat, /obj/item/module/anti_magic)


//////Specialists//////
/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/jani
	name = "elite emergency response team RIG helmet (field janitor)"
	icon_state = "ert_janitor_helm"
	//item_state = "ert_janitor_helm"
	hardsuit_type = "ert_janitor"

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/jani
	name = "elite emergency response team RIG (field janitor)"
	icon_state = "ert_janitor_rig"
	//item_state = "ert_janitor_rig"
	hardsuit_type = "ert_janitor"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/jani

/obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/clown
	name = "elite emergency response team RIG helmet (honksquad operative)"
	icon_state = "ert_clown_helm"
	//item_state = "ert_clown_helm"
	hardsuit_type = "ert_clown"

/obj/item/clothing/suit/space/hardsuit/dualmode/military/ert/clown
	name = "elite emergency response team RIG (honksquad operative)"
	icon_state = "ert_clown_rig"
	//item_state = "ert_clown_rig"
	hardsuit_type = "ert_clown"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/dualmode/military/ert/clown
