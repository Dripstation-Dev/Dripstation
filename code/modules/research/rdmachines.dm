
//All devices that link into the R&D console fall into thise type for easy identification and some shared procs.


/obj/machinery/rnd
	name = "R&D Device"
	icon = 'icons/obj/machines/research.dmi'
	density = TRUE
	use_power = IDLE_POWER_USE
	var/busy = FALSE
	var/hacked = FALSE
	var/console_link = TRUE		//allow console link.
	var/requires_console = TRUE
	var/disabled = FALSE
	var/obj/machinery/computer/rdconsole/linked_console
	var/obj/item/loaded_item = null //the item loaded inside the machine (currently only used by experimentor and destructive analyzer)

/obj/machinery/rnd/proc/reset_busy()
	busy = FALSE

/obj/machinery/rnd/Initialize(mapload)
	. = ..()
	wires = new /datum/wires/rnd(src)

/obj/machinery/rnd/Destroy()
	QDEL_NULL(wires)
	return ..()

/obj/machinery/rnd/proc/shock(mob/user, prb)
	if(stat & (BROKEN|NOPOWER))		// unpowered, no shock
		return FALSE
	if(!prob(prb))
		return FALSE
	do_sparks(5, TRUE, src)
	if (electrocute_mob(user, get_area(src), src, 0.7, TRUE))
		return TRUE
	else
		return FALSE

/obj/machinery/rnd/attackby(obj/item/O, mob/user, params)
	if (default_deconstruction_screwdriver(user, "[initial(icon_state)]_t", initial(icon_state), O))
		
		return
	if(default_deconstruction_crowbar(O))
		return
	if(is_refillable() && O.is_drainable())
		return FALSE //inserting reagents into the machine
	if(istype(O, /obj/item/stack/sheet))
		var/datum/material/M = O
		var/image/material_animation = image(icon, src, "[material_insertion_animation][M.name]")
		flick_overlay_global(material_animation, GLOB.clients, 20)
	if(Insert_Item(O, user))
		return TRUE
	else
		return ..()

/obj/machinery/rnd/crowbar_act(mob/living/user, obj/item/tool)
	return default_deconstruction_crowbar(tool)

/obj/machinery/rnd/screwdriver_act(mob/living/user, obj/item/tool)
	var/success = default_deconstruction_screwdriver(user, "[initial(icon_state)]_t", initial(icon_state), tool)
	if(success && linked_console)
		disconnect_console()
	return success

/obj/machinery/rnd/multitool_act(mob/living/user, obj/item/tool)
	if(panel_open)
		wires.interact(user)
		return TRUE

/obj/machinery/rnd/wirecutter_act(mob/living/user, obj/item/tool)
	if(panel_open)
		wires.interact(user)
		return TRUE

//to disconnect the machine from the r&d console it's linked to
/obj/machinery/rnd/proc/disconnect_console()
	linked_console = null

//proc used to handle inserting items or reagents into rnd machines
/obj/machinery/rnd/proc/Insert_Item(obj/item/I, mob/user)
	return

//whether the machine can have an item inserted in its current state.
/obj/machinery/rnd/proc/is_insertion_ready(mob/user)
	if(panel_open)
		to_chat(user, span_warning("You can't load [src] while it's opened!"))
		return FALSE
	if(disabled)
		return FALSE
	if(requires_console && !linked_console)
		to_chat(user, span_warning("[src] must be linked to an R&D console first!"))
		return FALSE
	if(busy)
		to_chat(user, span_warning("[src] is busy right now."))
		return FALSE
	if(stat & BROKEN)
		to_chat(user, span_warning("[src] is broken."))
		return FALSE
	if(stat & NOPOWER)
		to_chat(user, span_warning("[src] has no power."))
		return FALSE
	if(loaded_item)
		to_chat(user, span_warning("[src] is already loaded."))
		return FALSE
	return TRUE

//we eject the loaded item when deconstructing the machine
/obj/machinery/rnd/on_deconstruction()
	if(loaded_item)
		loaded_item.forceMove(loc)
	..()

/obj/machinery/rnd/proc/AfterMaterialInsert(type_inserted, id_inserted, amount_inserted)
	var/stack_name
	if(ispath(type_inserted, /obj/item/stack/ore/bluespace_crystal))
		stack_name = "bluespace"
		use_power(MINERAL_MATERIAL_AMOUNT / 10)
	else
		var/obj/item/stack/S = type_inserted
		stack_name = initial(S.name)
		use_power(min(1000, (amount_inserted / 100)))
	add_overlay("protolathe_[stack_name]")
	addtimer(CALLBACK(src, /atom/proc/cut_overlay, "protolathe_[stack_name]"), 10)
