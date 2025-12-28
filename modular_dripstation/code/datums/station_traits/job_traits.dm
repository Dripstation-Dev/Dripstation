#define CAN_ROLL_ALWAYS 1 //always can roll for antag
#define CAN_ROLL_PROTECTED 2 //can roll if config lets protected roles roll
#define CAN_ROLL_NEVER 3 //never roll antag

/**
 * A station trait which enables a temporary job
 * Generally speaking these should always all be mutually exclusive, don't have too many at once
 */
/datum/station_trait/job
	//sign_up_button = TRUE
	abstract_type = /datum/station_trait/job
	/// What tooltip to show on the button
	//var/button_desc = "Sign up to gain some kind of unusual job, not available in most rounds."
	/// Can this job roll antag?
	var/can_roll_antag = CAN_ROLL_ALWAYS
	/// How many positions to spawn?
	var/position_amount = 1
	/// Type of job to enable
	var/datum/job/job_to_add = /datum/job/clown
	/// Who signed up to this in the lobby
	var/list/lobby_candidates

/datum/station_trait/job/New()
	. = ..()
	switch(can_roll_antag)
		if(CAN_ROLL_PROTECTED)
			SSstation.antag_protected_roles += job_to_add::title
		if(CAN_ROLL_NEVER)
			SSstation.antag_restricted_roles += job_to_add::title
	blacklist += subtypesof(/datum/station_trait/job) - type // All but ourselves
	RegisterSignal(SSdcs, COMSIG_GLOB_PRE_JOBS_ASSIGNED, PROC_REF(pre_jobs_assigned))


/*
////////////////////////////////
//////STATION TRAITS BLOCK//////
//////////////////////////////// 
/// Return TRUE if we want to show a lobby button, by default we assume we don't want it after the round begins
/datum/station_trait/proc/can_display_lobby_button(client/player)
	return sign_up_button && !SSticker.HasRoundStarted()

/// Apply any additional handling we need to our lobby button
/datum/station_trait/proc/setup_lobby_button(atom/movable/screen/lobby/button/sign_up/lobby_button)
	SHOULD_CALL_PARENT(TRUE)
	lobby_button.name = name
	lobby_buttons |= lobby_button
	RegisterSignal(lobby_button, COMSIG_ATOM_UPDATE_ICON, PROC_REF(on_lobby_button_update_icon))
	RegisterSignal(lobby_button, COMSIG_SCREEN_ELEMENT_CLICK, PROC_REF(on_lobby_button_click))
	RegisterSignal(lobby_button, COMSIG_QDELETING, PROC_REF(on_lobby_button_destroyed))
	lobby_button.update_appearance(UPDATE_ICON)

/// Called when our lobby button is clicked on
/datum/station_trait/proc/on_lobby_button_click(atom/movable/screen/lobby/button/sign_up/lobby_button, location, control, params, mob/dead/new_player/user)
	SIGNAL_HANDLER
	return

/// Called when our lobby button tries to update its appearance
/datum/station_trait/proc/on_lobby_button_update_icon(atom/movable/screen/lobby/button/sign_up/lobby_button, updates)
	SIGNAL_HANDLER
	return

/// Don't hold references to deleted buttons
/datum/station_trait/proc/on_lobby_button_destroyed(atom/movable/screen/lobby/button/sign_up/lobby_button)
	SIGNAL_HANDLER
	lobby_buttons -= lobby_button

////////////////////////////////////
//////STATION TRAITS BLOCK END//////
//////////////////////////////////// 

/datum/station_trait/job/setup_lobby_button(atom/movable/screen/lobby/button/sign_up/lobby_button)
	RegisterSignal(lobby_button, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(on_lobby_button_update_overlays))
	lobby_button.desc = button_desc
	return ..()

/datum/station_trait/job/on_lobby_button_click(atom/movable/screen/lobby/button/sign_up/lobby_button, location, control, params, mob/dead/new_player/user)
	if (LAZYFIND(lobby_candidates, user))
		LAZYREMOVE(lobby_candidates, user)
	else
		LAZYADD(lobby_candidates, user)

/datum/station_trait/job/on_lobby_button_destroyed(atom/movable/screen/lobby/button/sign_up/lobby_button)
	. = ..()
	LAZYREMOVE(lobby_candidates, lobby_button.get_mob())

/datum/station_trait/job/on_lobby_button_update_icon(atom/movable/screen/lobby/button/sign_up/lobby_button, updates)
	if (LAZYFIND(lobby_candidates, lobby_button.get_mob()))
		lobby_button.base_icon_state = "signup_on"
	else
		lobby_button.base_icon_state = "signup"

/// Add an overlay based on whether you are actively signed up for this role
/datum/station_trait/job/proc/on_lobby_button_update_overlays(atom/movable/screen/lobby/button/sign_up/lobby_button, list/overlays)
	SIGNAL_HANDLER
	overlays += LAZYFIND(lobby_candidates, lobby_button.get_mob()) ? "tick" : "cross"
*/

/// Setter for the assigned_role job datum.
/datum/mind/proc/set_assigned_role(datum/job/new_role)
	if(assigned_role == new_role)
		return
	if(!is_job(new_role))
		CRASH("set_assigned_role called with invalid role: [isnull(new_role) ? "null" : new_role]")
	. = assigned_role
	assigned_role = new_role

/// Called before we start assigning roles, assign ours first
/datum/station_trait/job/proc/pre_jobs_assigned()
	SIGNAL_HANDLER
	//sign_up_button = FALSE
	//destroy_lobby_buttons()
	for (var/mob/dead/new_player/signee as anything in lobby_candidates)
		if (isnull(signee) || !signee.client || !signee.mind || signee.ready != PLAYER_READY_TO_PLAY)
			LAZYREMOVE(lobby_candidates, signee)

	var/datum/job/our_job = SSjob.GetJobType(job_to_add)
	our_job.total_positions = position_amount
	our_job.spawn_positions = position_amount
	while(length(lobby_candidates) && position_amount > 0)
		var/mob/dead/new_player/picked_player = pick_n_take(lobby_candidates)
		picked_player.mind.set_assigned_role(our_job)
		our_job.current_positions++
		position_amount--

	lobby_candidates = null

/*
/datum/station_trait/job/can_display_lobby_button(client/player)
	var/datum/job/our_job = SSjob.GetJobType(job_to_add)
	return our_job.player_old_enough(player) && ..()
*/

/datum/station_trait/job/bridge_assistant
	name = "Bridge Assistant"
	//button_desc = "Sign up to become the Bridge Assistant and watch over the Bridge."
	weight = 2
	report_message = "We have installed a Bridge Assistant on your station."
	show_in_report = TRUE
	can_roll_antag = CAN_ROLL_PROTECTED
	job_to_add = /datum/job/bridge_assistant

/datum/station_trait/job/bridge_assistant/New()
	. = ..()
	RegisterSignal(SSatoms, COMSIG_SUBSYSTEM_POST_INITIALIZE, PROC_REF(add_coffeemaker))

/*
/datum/station_trait/job/bridge_assistant/on_lobby_button_update_overlays(atom/movable/screen/lobby/button/sign_up/lobby_button, list/overlays)
	. = ..()
	overlays += "bridge_assistant"
*/

/// Creates a coffeemaker in the bridge, if we don't have one yet.
/datum/station_trait/job/bridge_assistant/proc/add_coffeemaker(datum/source)
	SIGNAL_HANDLER
	var/area/bridge = GLOB.areas_by_type[/area/bridge]
	if(isnull(bridge)) //no bridge, what will he assist?
		return
	var/list/possible_coffeemaker_positions = list(/area/bridge, /area/bridge/meeting_room)
	var/list/coffeemakers = SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/coffeemaker)
	for(var/obj/machinery/coffeemaker as anything in coffeemakers) //don't spawn a coffeemaker if there is already one on the bridge
		if(is_type_in_list(get_area(coffeemaker), possible_coffeemaker_positions))
			return
	var/list/tables = list()
	for(var/turf/area_turf as anything in bridge.get_turfs_from_all_zlevels())
		var/obj/structure/table/table = locate() in area_turf
		if(isnull(table))
			continue
		if(area_turf.is_blocked_turf(ignore_atoms = list(table))) //don't spawn a coffeemaker on a fax machine or smth
			continue
		tables += table
	if(!length(tables))
		return
	var/picked_table = pick_n_take(tables)
	var/picked_turf = get_turf(picked_table)
	if(length(tables))
		var/another_table = pick(tables)
		for(var/obj/thing_on_table in picked_turf) //if there's paper bins or other shit on the table, get that off
			if(thing_on_table == picked_table)
				continue
			if(HAS_TRAIT(thing_on_table, TRAIT_WALLMOUNTED) || (thing_on_table.flags_1 & ON_BORDER_1) || thing_on_table.layer < TABLE_LAYER)
				continue
			if(thing_on_table.invisibility || !thing_on_table.alpha || !thing_on_table.mouse_opacity)
				continue
			thing_on_table.forceMove(get_turf(another_table))
	new /obj/machinery/coffeemaker/impressa(picked_turf)
	new /obj/item/reagent_containers/food/drinks/bottle/coffeepot(picked_turf)
	new /obj/item/storage/box/coffeepack(picked_turf)

/datum/station_trait/job/security_consultant
	name = "Security Consultant"
	//button_desc = "Sign up to become a hard boiled Security Consultant of Nanotrasen Defense Team. Advise HoS and Captain, train Officers, all while fighting your PTSD."
	weight = 2
	report_message = "Security Consultant has been assigned to your station to help with Security matters."
	show_in_report = TRUE
	can_roll_antag = CAN_ROLL_PROTECTED
	job_to_add = /datum/job/security_consultant

/*
/datum/station_trait/job/security_consultant/on_lobby_button_update_overlays(atom/movable/screen/lobby/button/sign_up/lobby_button, list/overlays)
	. = ..()
	overlays += "security_consultant"
*/

/datum/station_trait/job/corrections_officer
	name = "Corrections Officer"
	//button_desc = ""
	weight = 2
	report_message = "Corrections Officer has been assigned to your station to help with Prisoners."
	show_in_report = TRUE
	can_roll_antag = CAN_ROLL_PROTECTED
	job_to_add = /datum/job/corrections_officer

/*
/datum/station_trait/job/corrections_officer/on_lobby_button_update_overlays(atom/movable/screen/lobby/button/sign_up/lobby_button, list/overlays)
	. = ..()
	overlays += "corrections_officer"
*/

#undef CAN_ROLL_ALWAYS
#undef CAN_ROLL_PROTECTED
#undef CAN_ROLL_NEVER
