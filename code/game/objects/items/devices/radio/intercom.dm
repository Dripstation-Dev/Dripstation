/obj/item/radio/intercom
	name = "station intercom"
	desc = "Talk through this."
	icon_state = "intercom"
	anchored = TRUE
	w_class = WEIGHT_CLASS_BULKY
	canhear_range = 2
	light_color = LIGHT_COLOR_CYAN
	var/mob/living/silicon/ai/ai = list()
	var/last_tick //used to delay the powercheck
	dog_fashion = null

/obj/item/radio/intercom/unscrewed
	unscrewed = TRUE

/obj/item/radio/intercom/ratvar
	name = "hierophant intercom"
	desc = "A modified intercom that uses the Hierophant network instead of subspace tech. Can listen to and broadcast on any frequency."
	icon_state = "intercom_ratvar"
	freerange = TRUE

/obj/item/radio/intercom/ratvar/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		to_chat(user, span_danger("[src] is fastened to the wall with [is_servant_of_ratvar(user) ? "replicant alloy" : "some material you've never seen"], and can't be removed."))
		return //no unfastening!
	. = ..()

/obj/item/radio/intercom/ratvar/process()
	if(!istype(SSticker.mode, /datum/game_mode/clockwork_cult))
		invisibility = INVISIBILITY_OBSERVER
		alpha = 125
		emped = TRUE
	else
		invisibility = initial(invisibility)
		alpha = initial(alpha)
		emped = FALSE
	..()

/obj/item/radio/intercom/Initialize(mapload, ndir, building)
	. = ..()
	if(building)
		setDir(ndir)
	var/area/current_area = get_area(src)
	if(!current_area)
		return
	RegisterSignal(current_area, COMSIG_AREA_POWER_CHANGE, PROC_REF(AreaPowerCheck))
	update_appearance()

/obj/item/radio/intercom/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/radio/intercom/examine(mob/user)
	. = ..()
	if(!unscrewed)
		. += span_notice("It's <b>screwed</b> and secured to the wall.")
	else
		. += span_notice("It's <i>unscrewed</i> from the wall, and can be <b>detached</b>.")

/obj/item/radio/intercom/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if(unscrewed)
			user.visible_message(span_notice("[user] starts tightening [src]'s screws..."), span_notice("You start screwing in [src]..."))
			if(I.use_tool(src, user, 30, volume=50))
				user.visible_message(span_notice("[user] tightens [src]'s screws!"), span_notice("You tighten [src]'s screws."))
				unscrewed = FALSE
		else
			user.visible_message(span_notice("[user] starts loosening [src]'s screws..."), span_notice("You start unscrewing [src]..."))
			if(I.use_tool(src, user, 40, volume=50))
				user.visible_message(span_notice("[user] loosens [src]'s screws!"), span_notice("You unscrew [src], loosening it from the wall."))
				unscrewed = TRUE
		return
	else if(I.tool_behaviour == TOOL_WRENCH)
		if(!unscrewed)
			to_chat(user, span_warning("You need to unscrew [src] from the wall first!"))
			return
		user.visible_message(span_notice("[user] starts unsecuring [src]..."), span_notice("You start unsecuring [src]..."))
		I.play_tool_sound(src)
		if(I.use_tool(src, user, 80))
			user.visible_message(span_notice("[user] unsecures [src]!"), span_notice("You detach [src] from the wall."))
			playsound(src, 'sound/items/deconstruct.ogg', 50, 1)
			new/obj/item/wallframe/intercom(get_turf(src))
			qdel(src)
		return
	return ..()

/obj/item/radio/intercom/attack_ai(mob/user)
	interact(user)

/obj/item/radio/intercom/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	interact(user)

/obj/item/radio/intercom/ui_state(mob/user)
	return GLOB.default_state

/obj/item/radio/intercom/can_receive(freq, level)
	if(!on)
		return FALSE
	if(wires.is_cut(WIRE_RX))
		return FALSE
	if(!(0 in level))
		var/turf/position = get_turf(src)
		if(isnull(position) || !(position.z in level))
			return FALSE
	if(!listening)
		return FALSE
	if(freq == FREQ_SYNDICATE)
		if(!(syndie))
			return FALSE//Prevents broadcast of messages over devices lacking the encryption

	return TRUE


/obj/item/radio/intercom/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, list/spans, list/message_mods = list())
	if(message_mods[RADIO_EXTENSION] == MODE_INTERCOM)
		return  // Avoid hearing the same thing twice
	return ..()

/obj/item/radio/intercom/proc/AreaPowerCheck(datum/source)
	SIGNAL_HANDLER
	var/area/current_area = get_area(src)
	if(!current_area)
		on = FALSE
	else
		on = current_area.powered(AREA_USAGE_EQUIP) // set "on" to the equipment power status of our area.
	update_appearance()

/obj/item/radio/intercom/update_overlays()
	. = ..()
	if(on)
		. += emissive_appearance(icon, "intercom_lightmask", src)

/obj/item/radio/intercom/update_appearance(updates)
	. = ..()
	if(!on)
		set_light(0)
		return

	set_light(1.5, 1, light_color)

/obj/item/radio/intercom/update_icon_state()
	. = ..()
	if(on)
		icon_state = initial(icon_state)
	else
		icon_state = "intercom-p"

/obj/item/radio/intercom/add_blood_DNA(list/blood_dna)
	return FALSE

/obj/item/radio/intercom/emp_act(severity)
	. = ..() // Parent call here will set `on` to FALSE.
	update_appearance()

/obj/item/radio/intercom/end_emp_effect(curremp)
	. = ..()
	AreaPowerCheck() // Make sure the area/local APC is powered first before we actually turn back on.

//Created through the autolathe or through deconstructing intercoms. Can be applied to wall to make a new intercom on it!
/obj/item/wallframe/intercom
	name = "intercom frame"
	desc = "A ready-to-go intercom. Just slap it on a wall and screw it in!"
	icon_state = "intercom"
	result_path = /obj/item/radio/intercom/unscrewed
	pixel_shift = 29
	inverse = TRUE
	materials = list(/datum/material/iron = 75, /datum/material/glass = 25)
