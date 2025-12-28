/obj/item/dualmode_construction
	desc = "A part used in RIG construction."
	icon = 'modular_dripstation/icons/obj/dualmode_construction.dmi'
	item_state = "rack_parts"

/obj/item/dualmode_construction/helmet
	name = "RIG helmet"
	icon_state = "helmet"

/obj/item/dualmode_construction/helmet/examine(mob/user)
	. = ..()
	. += span_notice("You could insert it into a <b>RIG shell</b>...")

/obj/item/dualmode_construction/chestplate
	name = "RIG chestplate"
	icon_state = "chestplate"

/obj/item/dualmode_construction/chestplate/examine(mob/user)
	. = ..()
	. += span_notice("You could insert it into a <b>RIG shell</b>...")

/obj/item/dualmode_construction/gauntlets
	name = "RIG gauntlets"
	icon_state = "gauntlets"

/obj/item/dualmode_construction/gauntlets/examine(mob/user)
	. = ..()
	. += span_notice("You could insert these into a <b>RIG shell</b>...")

/obj/item/dualmode_construction/boots
	name = "RIG boots"
	icon_state = "boots"

/obj/item/dualmode_construction/boots/examine(mob/user)
	. = ..()
	. += span_notice("You could insert these into a <b>RIG shell</b>...")

/obj/item/dualmode_construction/lavalandcore
	name = "plasma flower"
	icon_state = "plasma-flower"
	desc = "A strange flower from the desolate wastes of lavaland. It pulses with a bright purple glow.  \
		Its shape is remarkably similar to that of a RIG core."
	light_system = MOVABLE_LIGHT
	light_color = "#cc00cc"
	light_range = 2

/obj/item/dualmode_construction/lavalandcore/examine(mob/user)
	. = ..()
	. += span_notice("You could probably attach some <b>wires</b> to it...")

/obj/item/dualmode_construction/lavalandcore/attackby(obj/item/weapon, mob/user, params)
	if(!istype(weapon, /obj/item/stack/cable_coil))
		return

	if(!weapon.tool_start_check(user, amount=2))
		return

	to_chat(user, span_notice("You start pushing the wires into the core..."))
	if(!weapon.use_tool(src, user, 5 SECONDS, amount = 2, volume = 30))
		return

	to_chat(user, span_notice("You add the wires to the core."))
	new /obj/item/core/plasma/lavaland(drop_location())
	qdel(src)


/obj/item/dualmode_construction/plating
	name = "RIG basic external plating"
	desc = "External plating used to finish a RIG unit."
	icon_state = "standard-plating"
	//var/datum/mod_theme/theme = /datum/mod_theme
	var/obj/item/clothing/suit/space/hardsuit/dualmode/plating_type = /obj/item/clothing/suit/space/hardsuit/dualmode/basic

/obj/item/dualmode_construction/plating/Initialize(mapload)
	. = ..()
	//desc = "[desc] [used_theme.desc]"
	icon_state = "[plating_type.hardsuit_type]-plating"

/obj/item/dualmode_construction/plating/engineering
	name = "RIG engineering external plating"
	plating_type = /obj/item/clothing/suit/space/hardsuit/dualmode/engineering

/obj/item/dualmode_construction/plating/atmospheric
	name = "RIG atmospheric external plating"
	plating_type = /obj/item/clothing/suit/space/hardsuit/dualmode/engineering/atmospheric

/obj/item/dualmode_construction/plating/medical
	name = "RIG medical external plating"
	plating_type = /obj/item/clothing/suit/space/hardsuit/dualmode/medical

/obj/item/dualmode_construction/plating/security
	name = "RIG security external plating"
	plating_type = /obj/item/clothing/suit/space/hardsuit/dualmode/security

#define START_STEP "start"
#define CORE_STEP "core"
#define SCREWED_CORE_STEP "screwed_core"
#define HELMET_STEP "helmet"
#define CHESTPLATE_STEP "chestplate"
#define GAUNTLETS_STEP "gauntlets"
#define BOOTS_STEP "boots"
#define WRENCHED_ASSEMBLY_STEP "wrenched_assembly"
#define SCREWED_ASSEMBLY_STEP "screwed_assembly"

/obj/item/dualmode_construction/shell
	name = "RIG shell"
	icon_state = "mod-construction_start"
	desc = "A RIG shell."
	var/obj/item/core
	var/obj/item/helmet
	var/obj/item/chestplate
	var/obj/item/gauntlets
	var/obj/item/boots
	var/step = START_STEP

/obj/item/dualmode_construction/shell/examine(mob/user)
	. = ..()
	var/display_text
	switch(step)
		if(START_STEP)
			display_text = "It looks like it's missing a <b>RIG core</b>..."
		if(CORE_STEP)
			display_text = "The core seems <b>loose</b>..."
		if(SCREWED_CORE_STEP)
			display_text = "It looks like it's missing a <b>helmet</b>..."
		if(HELMET_STEP)
			display_text = "It looks like it's missing a <b>chestplate</b>..."
		if(CHESTPLATE_STEP)
			display_text = "It looks like it's missing <b>gauntlets</b>..."
		if(GAUNTLETS_STEP)
			display_text = "It looks like it's missing <b>boots</b>..."
		if(BOOTS_STEP)
			display_text = "The assembly seems <b>unsecured</b>..."
		if(WRENCHED_ASSEMBLY_STEP)
			display_text = "The assembly seems <b>loose</b>..."
		if(SCREWED_ASSEMBLY_STEP)
			display_text = "All it's missing is <b>external plating</b>..."
	. += span_notice(display_text)

/obj/item/dualmode_construction/shell/attackby(obj/item/part, mob/user, params)
	. = ..()
	switch(step)
		if(START_STEP)
			if(!istype(part, /obj/item/core))
				return
			if(!user.transferItemToLoc(part, src))
				balloon_alert(user, "core stuck to your hand!")
				return
			playsound(src, 'sound/machines/click.ogg', 30, TRUE)
			balloon_alert(user, "core inserted")
			core = part
			step = CORE_STEP
		if(CORE_STEP)
			if(part.tool_behaviour == TOOL_SCREWDRIVER) //Construct
				if(part.use_tool(src, user, 0, volume=30))
					balloon_alert(user, "core screwed")
				step = SCREWED_CORE_STEP
			else if(part.tool_behaviour == TOOL_CROWBAR) //Deconstruct
				if(part.use_tool(src, user, 0, volume=30))
					core.forceMove(drop_location())
					balloon_alert(user, "core taken out")
				step = START_STEP
		if(SCREWED_CORE_STEP)
			if(istype(part, /obj/item/dualmode_construction/helmet)) //Construct
				if(!user.transferItemToLoc(part, src))
					balloon_alert(user, "helmet stuck to your hand!")
					return
				playsound(src, 'sound/machines/click.ogg', 30, TRUE)
				balloon_alert(user, "helmet added")
				helmet = part
				step = HELMET_STEP
			else if(part.tool_behaviour == TOOL_SCREWDRIVER) //Deconstruct
				if(part.use_tool(src, user, 0, volume=30))
					balloon_alert(user, "core unscrewed")
					step = CORE_STEP
		if(HELMET_STEP)
			if(istype(part, /obj/item/dualmode_construction/chestplate)) //Construct
				if(!user.transferItemToLoc(part, src))
					balloon_alert(user, "chestplate stuck to your hand!")
					return
				playsound(src, 'sound/machines/click.ogg', 30, TRUE)
				balloon_alert(user, "chestplate added")
				chestplate = part
				step = CHESTPLATE_STEP
			else if(part.tool_behaviour == TOOL_CROWBAR) //Deconstruct
				if(part.use_tool(src, user, 0, volume=30))
					helmet.forceMove(drop_location())
					balloon_alert(user, "helmet removed")
					helmet = null
					step = SCREWED_CORE_STEP
		if(CHESTPLATE_STEP)
			if(istype(part, /obj/item/dualmode_construction/gauntlets)) //Construct
				if(!user.transferItemToLoc(part, src))
					balloon_alert(user, "gauntlets stuck to your hand!")
					return
				playsound(src, 'sound/machines/click.ogg', 30, TRUE)
				balloon_alert(user, "gauntlets added")
				gauntlets = part
				step = GAUNTLETS_STEP
			else if(part.tool_behaviour == TOOL_CROWBAR) //Deconstruct
				if(part.use_tool(src, user, 0, volume=30))
					chestplate.forceMove(drop_location())
					balloon_alert(user, "chestplate removed")
					chestplate = null
					step = HELMET_STEP
		if(GAUNTLETS_STEP)
			if(istype(part, /obj/item/dualmode_construction/boots)) //Construct
				if(!user.transferItemToLoc(part, src))
					balloon_alert(user, "boots added")
					return
				playsound(src, 'sound/machines/click.ogg', 30, TRUE)
				balloon_alert(user, "fit [part.name]")
				boots = part
				step = BOOTS_STEP
			else if(part.tool_behaviour == TOOL_CROWBAR) //Deconstruct
				if(part.use_tool(src, user, 0, volume=30))
					gauntlets.forceMove(drop_location())
					balloon_alert(user, "gauntlets removed")
					gauntlets = null
					step = CHESTPLATE_STEP
		if(BOOTS_STEP)
			if(part.tool_behaviour == TOOL_WRENCH) //Construct
				if(part.use_tool(src, user, 0, volume=30))
					balloon_alert(user, "assembly secured")
					step = WRENCHED_ASSEMBLY_STEP
			else if(part.tool_behaviour == TOOL_CROWBAR) //Deconstruct
				if(part.use_tool(src, user, 0, volume=30))
					boots.forceMove(drop_location())
					balloon_alert(user, "boots removed")
					boots = null
					step = GAUNTLETS_STEP
		if(WRENCHED_ASSEMBLY_STEP)
			if(part.tool_behaviour == TOOL_SCREWDRIVER) //Construct
				if(part.use_tool(src, user, 0, volume=30))
					balloon_alert(user, "assembly screwed")
					step = SCREWED_ASSEMBLY_STEP
			else if(part.tool_behaviour == TOOL_WRENCH) //Deconstruct
				if(part.use_tool(src, user, 0, volume=30))
					balloon_alert(user, "assembly unsecured")
					step = BOOTS_STEP
		if(SCREWED_ASSEMBLY_STEP)
			if(istype(part, /obj/item/dualmode_construction/plating)) //Construct
				var/obj/item/dualmode_construction/plating/external_plating = part
				if(!user.transferItemToLoc(part, src))
					return
				playsound(src, 'sound/machines/click.ogg', 30, TRUE)
				var/obj/item/dualmode = new external_plating.plating_type(drop_location(), core)
				core = null
				user.put_in_hands(dualmode)
				dualmode.balloon_alert(user, "suit finished")
				qdel(src)
				return
			else if(part.tool_behaviour == TOOL_SCREWDRIVER) //Construct
				if(part.use_tool(src, user, 0, volume=30))
					balloon_alert(user, "assembly unscrewed")
					step = SCREWED_ASSEMBLY_STEP
	update_icon_state()

/obj/item/dualmode_construction/shell/update_icon_state()
	. = ..()
	icon_state = "mod-construction_[step]"

/obj/item/dualmode_construction/shell/Destroy()
	QDEL_NULL(core)
	QDEL_NULL(helmet)
	QDEL_NULL(chestplate)
	QDEL_NULL(gauntlets)
	QDEL_NULL(boots)
	return ..()

/obj/item/dualmode_construction/shell/handle_atom_del(atom/deleted_atom)
	if(deleted_atom == core)
		core = null
	if(deleted_atom == helmet)
		helmet = null
	if(deleted_atom == chestplate)
		chestplate = null
	if(deleted_atom == gauntlets)
		gauntlets = null
	if(deleted_atom == boots)
		boots = null
	return ..()

#undef START_STEP
#undef CORE_STEP
#undef SCREWED_CORE_STEP
#undef HELMET_STEP
#undef CHESTPLATE_STEP
#undef GAUNTLETS_STEP
#undef BOOTS_STEP
#undef WRENCHED_ASSEMBLY_STEP
#undef SCREWED_ASSEMBLY_STEP




/obj/item/core
	name = "RIG core"
	desc = "A non-functional RIG core. Inform the admins if you see this."
	icon = 'modular_dripstation/icons/obj/dualmode_construction.dmi'
	icon_state = "rig-core"
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	/// RIG unit we are powering.
	var/obj/item/clothing/suit/space/hardsuit/dualmode/rig

/obj/item/core/Destroy()
	if(rig)
		uninstall()
	return ..()

/obj/item/core/proc/install(obj/item/clothing/suit/space/hardsuit/dualmode/rig_suit)
	rig = rig_suit
	rig.core = src
	forceMove(rig)

/obj/item/core/proc/uninstall()
	rig.core = null
	rig = null

/obj/item/core/proc/charge_source()
	return

/obj/item/core/proc/charge_amount()
	return 0

/obj/item/core/proc/max_charge_amount()
	return 1

/obj/item/core/proc/add_charge(amount)
	return FALSE

/obj/item/core/proc/subtract_charge(amount)
	return FALSE

/obj/item/core/proc/check_charge(amount)
	return FALSE

/obj/item/core/proc/update_charge_alert()
	rig.wearer.clear_alert(ALERT_RIG_CHARGE)

/obj/item/core/broken
	name = "broken RIG core"
	desc = "An internal power source for a Resource Integration Gear. You don't seem to be able to source any power from this one, though."

/obj/item/core/broken/examine(mob/user)
	. = ..()
	. += span_notice("You could repair it with a <b>screwdriver</b>...")

/obj/item/core/broken/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	if(!tool.use_tool(src, user, 5 SECONDS, volume = 30))
		return
	new /obj/item/core/standard(drop_location())
	qdel(src)

/obj/item/core/coldfusion
	name = "RIG cold fusion core"
	icon_state = "rig-core-infinite"
	desc = "A cold fusion core sustaining enough energy for the lifetime of the RIG's user."

/obj/item/core/coldfusion/charge_source()
	return src

/obj/item/core/coldfusion/charge_amount()
	return INFINITY

/obj/item/core/coldfusion/max_charge_amount()
	return INFINITY

/obj/item/core/coldfusion/add_charge(amount)
	return TRUE

/obj/item/core/coldfusion/subtract_charge(amount)
	return TRUE

/obj/item/core/coldfusion/check_charge(amount)
	return TRUE

/obj/item/core/standard
	name = "RIG standard core"
	icon_state = "rig-core-standard"
	desc = "Elerium is a rare piezoelectric crystals alien in nature found or mined on some distant rimworlds.\
		Their origin is unknown, but some rumors says that they are often scrapped from some kind of ruins.\
		This one has been repurposed to be an internal power source for a Resource Integration Gear."
	/// Installed cell.
	var/obj/item/stock_parts/cell/cell

/obj/item/core/standard/Destroy()
	if(cell)
		QDEL_NULL(cell)
	return ..()

/obj/item/core/standard/install(obj/item/clothing/suit/space/hardsuit/dualmode/rig_suit)
	. = ..()
	if(cell)
		install_cell(cell)
	RegisterSignal(rig, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(rig, COMSIG_ATOM_ATTACK_HAND, PROC_REF(on_attack_hand))
	RegisterSignal(rig, COMSIG_ATOM_ATTACKBY, PROC_REF(on_attackby))
	RegisterSignal(rig, COMSIG_RIG_WEARER_SET, PROC_REF(on_wearer_set))
	if(rig.wearer)
		on_wearer_set(rig, rig.wearer)

/obj/item/core/standard/uninstall()
	if(!QDELETED(cell))
		cell.forceMove(drop_location())
	UnregisterSignal(rig, list(COMSIG_ATOM_EXAMINE, COMSIG_ATOM_ATTACK_HAND, COMSIG_ATOM_ATTACKBY, COMSIG_RIG_WEARER_SET))
	if(rig.wearer)
		on_wearer_unset(rig, rig.wearer)
	return ..()

/obj/item/core/standard/charge_source()
	return cell

/obj/item/core/standard/charge_amount()
	var/obj/item/stock_parts/cell/charge_source = charge_source()
	return charge_source?.charge || 0

/obj/item/core/standard/max_charge_amount(amount)
	var/obj/item/stock_parts/cell/charge_source = charge_source()
	return charge_source?.maxcharge || 1

/obj/item/core/standard/add_charge(amount)
	var/obj/item/stock_parts/cell/charge_source = charge_source()
	if(!charge_source)
		return FALSE
	return charge_source.give(amount)

/obj/item/core/standard/subtract_charge(amount)
	var/obj/item/stock_parts/cell/charge_source = charge_source()
	if(!charge_source)
		return FALSE
	return charge_source.use(amount, TRUE)

/obj/item/core/standard/check_charge(amount)
	return charge_amount() >= amount

/obj/item/core/standard/update_charge_alert()
	var/obj/item/stock_parts/cell/charge_source = charge_source()
	if(!charge_source)
		rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/nocell)
		return
	var/remaining_cell = charge_amount() / max_charge_amount()
	switch(remaining_cell)
		if(0.75 to INFINITY)
			rig.wearer.clear_alert(ALERT_RIG_CHARGE)
		if(0.5 to 0.75)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell, 1)
		if(0.25 to 0.5)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell, 2)
		if(0.01 to 0.25)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell, 3)
		else
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/emptycell)

/obj/item/core/standard/proc/install_cell(new_cell)
	cell = new_cell
	cell.forceMove(src)
	RegisterSignal(src, COMSIG_ATOM_EXITED, PROC_REF(on_exit))

/obj/item/core/standard/proc/uninstall_cell()
	if(!cell)
		return
	cell = null
	UnregisterSignal(src, COMSIG_ATOM_EXITED)

/obj/item/core/standard/proc/on_exit(datum/source, obj/item/stock_parts/cell, direction)
	SIGNAL_HANDLER

	if(!istype(cell) || cell.loc == src)
		return
	uninstall_cell()

/obj/item/core/standard/proc/on_examine(datum/source, mob/examiner, list/examine_text)
	SIGNAL_HANDLER

	if(!rig.open)
		return
	examine_text += cell ? "You could remove the cell with an empty hand." : "You could use a cell on it to install one."

/obj/item/core/standard/proc/on_attack_hand(datum/source, mob/living/user)
	SIGNAL_HANDLER

	//if(rig.seconds_electrified && charge_amount() && rig.shock(user))
	//	return COMPONENT_CANCEL_ATTACK_CHAIN
	if(rig.open && rig.loc == user)
		INVOKE_ASYNC(src, PROC_REF(rig_uninstall_cell), user)
		return COMPONENT_CANCEL_ATTACK_CHAIN
	return NONE

/obj/item/core/standard/proc/rig_uninstall_cell(mob/living/user)
	if(!cell)
		rig.balloon_alert(user, "no cell!")
		return
	rig.balloon_alert(user, "removing cell...")
	if(!do_after(user, 1.5 SECONDS, target = rig))
		rig.balloon_alert(user, "interrupted!")
		return
	rig.balloon_alert(user, "cell removed")
	playsound(rig, 'sound/machines/click.ogg', 50, TRUE, SILENCED_SOUND_EXTRARANGE)
	var/obj/item/cell_to_move = cell
	cell_to_move.forceMove(drop_location())
	user.put_in_hands(cell_to_move)
	rig.update_charge_alert()

/obj/item/core/standard/proc/on_attackby(datum/source, obj/item/attacking_item, mob/user, params)
	SIGNAL_HANDLER

	if(istype(attacking_item, /obj/item/stock_parts/cell))
		if(!rig.open)
			rig.balloon_alert(user, "open the cover first!")
			playsound(rig, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
			return NONE
		if(cell)
			rig.balloon_alert(user, "cell already installed!")
			playsound(rig, 'sound/machines/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
			return COMPONENT_NO_AFTERATTACK
		install_cell(attacking_item)
		rig.balloon_alert(user, "cell installed")
		playsound(rig, 'sound/machines/click.ogg', 50, TRUE, SILENCED_SOUND_EXTRARANGE)
		rig.update_charge_alert()
		return COMPONENT_NO_AFTERATTACK
	return NONE

/obj/item/core/standard/proc/on_wearer_set(datum/source, mob/user)
	SIGNAL_HANDLER

	RegisterSignal(rig.wearer, COMSIG_PROCESS_BORGCHARGER_OCCUPANT, PROC_REF(on_borg_charge))
	RegisterSignal(rig, COMSIG_RIG_WEARER_UNSET, PROC_REF(on_wearer_unset))

/obj/item/core/standard/proc/on_wearer_unset(datum/source, mob/user)
	SIGNAL_HANDLER

	UnregisterSignal(rig.wearer, COMSIG_PROCESS_BORGCHARGER_OCCUPANT)
	UnregisterSignal(rig, COMSIG_RIG_WEARER_UNSET)

/obj/item/core/standard/proc/on_borg_charge(datum/source, amount)
	SIGNAL_HANDLER

	add_charge(amount)
	rig.update_charge_alert()

/obj/item/core/internal_charge
	name = "RIG internal charge core"
	icon_state = "rig-core-internal"
	desc = "A reverse engineered core of a Resource Integration Gear. Using internal cell of the operator, \
		prevents the need to use external sources to convert electric charge."
	/// A modifier to all charge we use, we need to spend more energy than normal suits.
	var/charge_modifier = 1.2

/obj/item/core/internal_charge/charge_source()
	var/obj/item/organ/stomach/cell/charge_source = rig.wearer.getorganslot(ORGAN_SLOT_STOMACH)
	if(!istype(charge_source))
		return
	return charge_source

/obj/item/core/internal_charge/charge_amount()
	var/obj/item/organ/stomach/cell/charge_source = charge_source()
	return charge_source?.stored_charge || NONE

/obj/item/core/internal_charge/max_charge_amount()
	return NUTRITION_LEVEL_FAT

/obj/item/core/internal_charge/add_charge(amount)
	var/obj/item/organ/stomach/cell/charge_source = charge_source()
	if(!charge_source)
		return FALSE
	charge_source.adjust_charge(amount*charge_modifier)
	return TRUE

/obj/item/core/internal_charge/subtract_charge(amount)
	var/obj/item/organ/stomach/cell/charge_source = charge_source()
	if(!charge_source)
		return FALSE
	charge_source.adjust_charge(-amount*charge_modifier)
	return TRUE

/obj/item/organ/stomach/cell/proc/adjust_charge(datum/source, amount, repairs)
	SIGNAL_HANDLER
	stored_charge = clamp(stored_charge + amount, NONE, NUTRITION_LEVEL_FAT)

/obj/item/core/internal_charge/check_charge(amount)
	return charge_amount() >= amount*charge_modifier

/obj/item/core/internal_charge/update_charge_alert()
	var/obj/item/organ/stomach/cell/charge_source = charge_source()
	if(charge_source)
		rig.wearer.clear_alert(ALERT_RIG_CHARGE)
		return
	rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/nocell)

/obj/item/core/fusion
	name = "RIG fusion core"
	icon_state = "rig-core-fusion"
	desc = "Cybersun Virtual Solutions technological answer on RIG energy question. \
			These fusion cores are expendable as it`s users. Simply remove it when it`s usefulness exhausted."
	/// How much charge we can store.
	var/maxcharge = 100000
	/// How much charge we are currently storing.
	var/charge = 100000

/obj/item/core/fusion/charge_source()
	return src

/obj/item/core/fusion/charge_amount()
	return charge

/obj/item/core/fusion/max_charge_amount()
	return maxcharge

/obj/item/core/fusion/add_charge(amount)
	charge = min(maxcharge, charge + amount)
	return TRUE

/obj/item/core/fusion/subtract_charge(amount)
	charge = max(0, charge - amount)
	return TRUE

/obj/item/core/fusion/check_charge(amount)
	return charge_amount() >= amount

/obj/item/core/fusion/update_charge_alert()
	var/remaining_charge = charge_amount() / max_charge_amount()
	switch(remaining_charge)
		if(0.75 to INFINITY)
			rig.wearer.clear_alert(ALERT_RIG_CHARGE)
		if(0.5 to 0.75)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell, 1)
		if(0.25 to 0.5)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell, 2)
		if(0.01 to 0.25)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell, 3)
		else
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/emptycell)

#define PLASMA_CORE_ORE_CHARGE 1500
#define PLASMA_CORE_SHEET_CHARGE 2000

/obj/item/core/plasma
	name = "RIG plasma core"
	icon_state = "rig-core-plasma"
	desc = "Nanotrasen's attempt at capitalizing on their plasma research. These plasma cores are refueled \
		through plasma fuel, allowing for easy continued use by their mining squads."
	/// How much charge we can store.
	var/maxcharge = 10000
	/// How much charge we are currently storing.
	var/charge = 10000
	/// Associated list of charge sources and how much they charge, only stacks allowed.
	var/list/charger_list = list(/obj/item/stack/ore/plasma = PLASMA_CORE_ORE_CHARGE, /obj/item/stack/sheet/mineral/plasma = PLASMA_CORE_SHEET_CHARGE)

/obj/item/core/plasma/install(obj/item/clothing/suit/space/hardsuit/dualmode/rig_suit)
	. = ..()
	RegisterSignal(rig, COMSIG_ATOM_ATTACKBY, PROC_REF(on_attackby))

/obj/item/core/plasma/uninstall()
	UnregisterSignal(rig, COMSIG_ATOM_ATTACKBY)
	return ..()

/obj/item/core/plasma/attackby(obj/item/attacking_item, mob/user, params)
	if(charge_plasma(attacking_item, user))
		return TRUE
	return ..()

/obj/item/core/plasma/charge_source()
	return src

/obj/item/core/plasma/charge_amount()
	return charge

/obj/item/core/plasma/max_charge_amount()
	return maxcharge

/obj/item/core/plasma/add_charge(amount)
	charge = min(maxcharge, charge + amount)
	return TRUE

/obj/item/core/plasma/subtract_charge(amount)
	charge = max(0, charge - amount)
	return TRUE

/obj/item/core/plasma/check_charge(amount)
	return charge_amount() >= amount

/obj/item/core/plasma/update_charge_alert()
	var/remaining_plasma = charge_amount() / max_charge_amount()
	switch(remaining_plasma)
		if(0.75 to INFINITY)
			rig.wearer.clear_alert(ALERT_RIG_CHARGE)
		if(0.5 to 0.75)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell/plasma, 1)
		if(0.25 to 0.5)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell/plasma, 2)
		if(0.01 to 0.25)
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/lowcell/plasma, 3)
		else
			rig.wearer.throw_alert(ALERT_RIG_CHARGE, /atom/movable/screen/alert/emptycell/plasma)

/obj/item/core/plasma/proc/on_attackby(datum/source, obj/item/attacking_item, mob/user)
	SIGNAL_HANDLER

	if(charge_plasma(attacking_item, user))
		return COMPONENT_NO_AFTERATTACK
	return NONE

/obj/item/core/plasma/proc/charge_plasma(obj/item/stack/plasma, mob/user)
	var/charge_given = is_type_in_list(plasma, charger_list, zebra = TRUE)
	if(!charge_given)
		return FALSE
	var/uses_needed = min(plasma.amount, ROUND_UP((max_charge_amount() - charge_amount()) / charge_given))
	if(!plasma.use(uses_needed))
		return FALSE
	add_charge(uses_needed * charge_given)
	balloon_alert(user, "core refueled")
	return TRUE

#undef PLASMA_CORE_ORE_CHARGE
#undef PLASMA_CORE_SHEET_CHARGE

/obj/item/core/plasma/lavaland
	name = "RIG plasma flower core"
	icon_state = "rig-core-plasma-flower"
	desc = "A strange flower from the desolate wastes of lavaland. It pulses with a strange purple glow.  \
		The wires coming out of it could be hooked into a RIG."
	light_system = MOVABLE_LIGHT
	light_color = "#cc00cc"
	light_range = 2

	// Slightly better than the normal plasma core.
	// Not super sure if this should just be the same, but will see.
	maxcharge = 15000
	charge = 15000

	/// The mob to be spawned by the core
	var/mob/living/spawned_mob_type = /mob/living/simple_animal/butterfly/lavaland/temporary
	/// Max number of mobs it can spawn
	var/max_spawns = 3

	/// Mob spawner for the core
	var/datum/component/spawner/mob_spawner


/obj/item/core/plasma/lavaland/Destroy()
	if(rig?.wearer)
		rig.wearer.particles = null
	return ..()

// /obj/item/core/plasma/lavaland/proc/new_mob(spawner, mob/living/simple_animal/butterfly/spawned)
// 	SIGNAL_HANDLER
// 	if(spawned)
// 		spawned.source = src

/obj/item/core/plasma/lavaland/proc/on_toggle()
	SIGNAL_HANDLER
	if(rig.active)
		START_PROCESSING(SSprocessing, src)
		rig.wearer.particles = new /particles/pollen()
		mob_spawner = rig.wearer.AddComponent(/datum/component/spawner, spawn_types=list(spawned_mob_type), spawn_time=5 SECONDS, max_spawned=max_spawns)
		//RegisterSignal(mob_spawner, COMSIG_SPAWNER_SPAWNED, PROC_REF(new_mob))
		RegisterSignal(rig.wearer, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(flowas))

	else
		STOP_PROCESSING(SSprocessing, src)
		rig.wearer.particles = null
		//UnregisterSignal(mob_spawner, COMSIG_SPAWNER_SPAWNED)
		UnregisterSignal(rig.wearer, COMSIG_MOVABLE_PRE_MOVE)
		for(var/datum/mob in mob_spawner.spawned_things)
			qdel(mob)
		qdel(mob_spawner)

/obj/item/core/plasma/lavaland/install(obj/item/clothing/suit/space/hardsuit/dualmode/rig)
	. = ..()
	RegisterSignal(rig, COMSIG_RIG_TRIGGER_POWER, PROC_REF(on_toggle))

/obj/item/core/plasma/lavaland/uninstall(obj/item/clothing/suit/space/hardsuit/dualmode/rig)
	. = ..()
	UnregisterSignal(rig, COMSIG_RIG_TRIGGER_POWER)

/obj/item/core/plasma/lavaland/proc/flowas(mob/living/wearer)
	SIGNAL_HANDLER
	var/static/list/possible_flower_types = list(
		/obj/structure/flora/bush/lavendergrass/style_random,
		/obj/structure/flora/bush/flowers_yw/style_random,
		/obj/structure/flora/bush/flowers_br/style_random,
		/obj/structure/flora/bush/flowers_pp/style_random,
	)
	var/chosen_type = pick(possible_flower_types)
	var/flower_boots = new chosen_type(get_turf(wearer))
	animate(flower_boots, alpha = 0, 1 SECONDS)
	QDEL_IN(flower_boots, 1 SECONDS)

/obj/structure/flora/bush/lavendergrass
	icon_state = "lavendergrass_1"
	icon = 'modular_dripstation/icons/obj/flora.dmi'

/obj/structure/flora/bush/lavendergrass/style_2
	icon_state = "lavendergrass_2"

/obj/structure/flora/bush/lavendergrass/style_3
	icon_state = "lavendergrass_3"

/obj/structure/flora/bush/lavendergrass/style_4
	icon_state = "lavendergrass_4"

/obj/structure/flora/bush/lavendergrass/style_random/Initialize(mapload)
	. = ..()
	icon_state = "lavendergrass_[rand(1, 4)]"

/obj/structure/flora/bush/flowers_yw
	icon_state = "ywflowers_1"
	icon = 'modular_dripstation/icons/obj/flora.dmi'

/obj/structure/flora/bush/flowers_yw/style_2
	icon_state = "ywflowers_2"

/obj/structure/flora/bush/flowers_yw/style_3
	icon_state = "ywflowers_3"

/obj/structure/flora/bush/flowers_yw/style_random/Initialize(mapload)
	. = ..()
	icon_state = "ywflowers_[rand(1, 3)]"

/obj/structure/flora/bush/flowers_br
	icon_state = "brflowers_1"
	icon = 'modular_dripstation/icons/obj/flora.dmi'

/obj/structure/flora/bush/flowers_br/style_2
	icon_state = "brflowers_2"

/obj/structure/flora/bush/flowers_br/style_3
	icon_state = "brflowers_3"

/obj/structure/flora/bush/flowers_br/style_random/Initialize(mapload)
	. = ..()
	icon_state = "brflowers_[rand(1, 3)]"

/obj/structure/flora/bush/flowers_pp
	icon_state = "ppflowers_1"
	icon = 'modular_dripstation/icons/obj/flora.dmi'

/obj/structure/flora/bush/flowers_pp/style_2
	icon_state = "ppflowers_2"

/obj/structure/flora/bush/flowers_pp/style_3
	icon_state = "ppflowers_3"

/obj/structure/flora/bush/flowers_pp/style_random/Initialize(mapload)
	. = ..()
	icon_state = "ppflowers_[rand(1, 3)]"

// General or un-matched particles, make a new file if a few can be sorted together.
/particles/pollen
	icon = 'modular_dripstation/icons/effects/particles/pollen.dmi'
	icon_state = "pollen"
	width = 100
	height = 100
	count = 1000
	spawning = 4
	lifespan = 0.7 SECONDS
	fade = 1 SECONDS
	grow = -0.01
	velocity = list(0, 0)
	position = generator("circle", 0, 16, NORMAL_RAND)
	drift = generator("vector", list(0, -0.2), list(0, 0.2))
	gravity = list(0, 0.95)
	scale = generator("vector", list(0.3, 0.3), list(1,1), NORMAL_RAND)
	rotation = 30
	spin = generator("num", -20, 20)
