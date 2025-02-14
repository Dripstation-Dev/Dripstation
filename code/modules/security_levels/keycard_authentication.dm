GLOBAL_DATUM_INIT(keycard_events, /datum/events, new)

#define KEYCARD_RED_ALERT "Red Alert"
#define KEYCARD_EMERGENCY_MAINTENANCE_ACCESS "Emergency Maintenance Access"
#define KEYCARD_BSA_UNLOCK "Bluespace Artillery Unlock"
#define KEYCARD_ERT_ASKED "Emergency Response Team"			//Dripstation edit 

/obj/machinery/keycard_auth
	name = "Keycard Authentication Device"
	desc = "This device is used to trigger station functions, which require more than one ID card to authenticate."
	icon = 'icons/obj/monitors.dmi'
	icon_state = "auth_off"
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 6
	power_channel = AREA_USAGE_ENVIRON
	req_access = list(ACCESS_KEYCARD_AUTH)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	light_on = FALSE
	light_range = MINIMUM_USEFUL_LIGHT_RANGE
	light_color = LIGHT_COLOR_DARK_BLUE
	light_power = 2
	var/datum/callback/ev
	var/event = ""
	var/obj/machinery/keycard_auth/event_source
	var/mob/triggerer = null
	var/waiting = 0
	var/triggerer_id = null
	var/list/ert_chosen = list()	//Dripstation edit
	var/ert_reason					//Dripstation edit

/obj/machinery/keycard_auth/Initialize(mapload)
	. = ..()
	ev = GLOB.keycard_events.addEvent("triggerEvent", CALLBACK(src, PROC_REF(triggerEvent)))

/obj/machinery/keycard_auth/Destroy()
	GLOB.keycard_events.clearEvent("triggerEvent", ev)
	QDEL_NULL(ev)
	return ..()

/obj/machinery/keycard_auth/ui_state(mob/user)
	return GLOB.physical_state

/obj/machinery/keycard_auth/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "KeycardAuth", name)
		ui.open()

/obj/machinery/keycard_auth/ui_data()
	var/list/data = list()
	data["waiting"] = waiting
	data["auth_required"] = event_source ? event_source.event : 0
	data["red_alert"] = (SSsecurity_level.get_current_level_as_number() >= SEC_LEVEL_RED) ? 1 : 0
	data["ertreason"] = event_source && event_source.ert_reason ? event_source.ert_reason : ert_reason		//Dripstation edit
	data["emergency_maint"] = GLOB.emergency_access
	data["bsa_unlock"] = GLOB.bsa_unlock
	return data

/obj/machinery/keycard_auth/ui_status(mob/user)
	if(isanimal(user))
		var/mob/living/simple_animal/A = user
		if(!A.dextrous)
			to_chat(user, span_warning("You are too primitive to use this device!"))
			return UI_CLOSE
	if(isdrone(user))
		to_chat(user, span_warning("You are unable to interface with this device!"))
		return UI_CLOSE
	return ..()

/obj/machinery/keycard_auth/ui_act(action, params)
	if(..() || waiting || !allowed(usr))
		return
	if(!check_access(usr.get_active_held_item()))
		to_chat(usr, span_warning("You need to swipe your ID!"))
		return
	switch(action)
		if("red_alert")
			if(!event_source)
				sendEvent(KEYCARD_RED_ALERT)
				. = TRUE
		if("emergency_maint")
			if(!event_source)
				sendEvent(KEYCARD_EMERGENCY_MAINTENANCE_ACCESS)
				. = TRUE
		if("ertreason")			//Dripstation edit start
			if(!event_source)
				ert_reason = stripped_input(usr, "Reason for ERT Call:", "", "")
				sendEvent(KEYCARD_ERT_ASKED)
				. = TRUE		//Dripstation edit end
		if("auth_swipe")
			if(event_source)
				event_source.triggeR_FUN(usr)
				event_source = null
				. = TRUE
		if("bsa_unlock")
			if(!event_source)
				sendEvent(KEYCARD_BSA_UNLOCK)
				. = TRUE

/obj/machinery/keycard_auth/update_overlays()
	. = ..()
	if(light_on == TRUE)
		. += emissive_appearance(icon, "auth_lightmask", src)

/obj/machinery/keycard_auth/proc/sendEvent(event_type)
	triggerer_id = usr.get_active_held_item()
	triggerer = usr
	event = event_type
	waiting = 1
	GLOB.keycard_events.fireEvent("triggerEvent", src)
	addtimer(CALLBACK(src, PROC_REF(eventSent)), 20)

/obj/machinery/keycard_auth/proc/eventSent()
	triggerer = null
	event = ""
	waiting = 0
	triggerer_id = null

/obj/machinery/keycard_auth/proc/triggerEvent(source)
	icon_state = "auth_on"
	set_light_on(TRUE)
	event_source = source
	addtimer(CALLBACK(src, PROC_REF(eventTriggered)), 20)
	update_appearance(UPDATE_OVERLAYS)

/obj/machinery/keycard_auth/proc/eventTriggered()
	icon_state = "auth_off"
	set_light_on(FALSE)
	event_source = null
	update_appearance(UPDATE_OVERLAYS)

/obj/machinery/keycard_auth/proc/triggeR_FUN(mob/confirmer)
	var/confirmer_id = confirmer.get_active_held_item() //we already know this has access to complete the action, so we don't bother checking if it's got required access
	if(confirmer_id == triggerer_id)
		return
	else if(confirmer == triggerer) //good luck juggling two IDs while doing this lmao
		SSachievements.unlock_achievement(/datum/achievement/keycard_auth, confirmer.client)

	log_game("[key_name(triggerer)] triggered and [key_name(confirmer)] confirmed event [event]")
	message_admins("[ADMIN_LOOKUPFLW(triggerer)] triggered and [ADMIN_LOOKUPFLW(confirmer)] confirmed event [event]")

	var/area/A1 = get_area(triggerer)
	deadchat_broadcast(" triggered [event] at [span_name("[A1.name]")].", span_name("[triggerer]"), triggerer)

	var/area/A2 = get_area(confirmer)
	deadchat_broadcast(" confirmed [event] at [span_name("[A2.name]")].", span_name("[confirmer]"), confirmer)
	switch(event)
		if(KEYCARD_RED_ALERT)
			SSsecurity_level.set_level(SEC_LEVEL_RED)
		if(KEYCARD_EMERGENCY_MAINTENANCE_ACCESS)
			make_maint_all_access()
		if(KEYCARD_BSA_UNLOCK)
			toggle_bluespace_artillery()
		if(KEYCARD_ERT_ASKED)	//dripstation edit start
			pray_for_ert(triggerer)

/obj/machinery/keycard_auth/proc/is_ert_blocked()
	return SSticker.mode && SSticker.mode.ert_disabled

/obj/machinery/keycard_auth/proc/pray_for_ert(triggerer)
	if(is_ert_blocked())
		addtimer(CALLBACK(src, /atom/movable/proc/say, "All Emergency Response Teams are dispatched and can not be called at this time."), 10)
		return
	addtimer(CALLBACK(src, /atom/movable/proc/say, "ERT request transmitted!"), 10)
	priority_announce("ERT request transmitted. Reason: [ert_reason]", triggerer, 'sound/misc/airraid.ogg')
	
	var/fullmin_count = 0
	for(var/client/C in GLOB.clients)
		if(check_rights(R_FUN, 0, C.mob))
			fullmin_count++
	if(fullmin_count)
		ERT_Announce(ert_reason, triggerer, 0)
		ert_reason = null
		SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("ert", "called"))
	else
		if (istype(SSticker.mode, /datum/game_mode/dynamic))
			for(var/datum/dynamic_ruleset/dynamic_ruleset as anything in subtypesof(/datum/dynamic_ruleset))
				var/antag_flag = initial(dynamic_ruleset.antag_flag)
				if(antag_flag == ROLE_OPERATIVE)
					return
		else
			var/list/excludemodes = list(/datum/game_mode/nuclear)
			if(SSticker.mode.type in excludemodes)
				return
		var/list/excludeevents = list(/datum/round_event/ghost_role/blob, /datum/round_event/disease_outbreak)
		for(var/datum/round_event/E in SSevents.running)
			if(E in excludeevents)
				return
		trigger_armed_response_team(/datum/ert/blue) // No admins? No problem. Automatically send a code blue ERT. 	//dripstation edit end


/proc/trigger_armed_response_team(datum/ert/ertemplate = null)
	if (ertemplate)
		ertemplate = new ertemplate
	else
		ertemplate = new /datum/ert/official

		var/list/mob/dead/observer/candidates = pollGhostCandidates("Do you wish to be considered for [ertemplate.polldesc] ?", "deathsquad", null)
		var/teamSpawned = FALSE

		if(candidates.len > 0)
			//Pick the (un)lucky players
			var/numagents = min(ertemplate.teamsize,candidates.len)

			//Create team
			var/datum/team/ert/ert_team = new ertemplate.team
			if(ertemplate.rename_team)
				ert_team.name = ertemplate.rename_team

			//Asign team objective
			var/datum/objective/missionobj = new
			missionobj.team = ert_team
			missionobj.explanation_text = ertemplate.mission
			missionobj.completed = TRUE
			ert_team.objectives += missionobj
			ert_team.mission = missionobj

			var/list/spawnpoints = GLOB.emergencyresponseteamspawn
			while(numagents && candidates.len)
				if (numagents > spawnpoints.len)
					numagents--
					continue // This guy's unlucky, not enough spawn points, we skip him.
				var/spawnloc = spawnpoints[numagents]
				var/mob/dead/observer/chosen_candidate = pick(candidates)
				candidates -= chosen_candidate
				if(!chosen_candidate.key)
					continue

				//Spawn the body
				var/mob/living/carbon/human/ERTOperative = new ertemplate.mobtype(spawnloc)
				chosen_candidate.client.prefs.apply_prefs_to(ERTOperative)
				ERTOperative.key = chosen_candidate.key

				if(ertemplate.enforce_human || !(ERTOperative.dna.species.changesource_flags & ERT_SPAWN)) // Don't want any exploding plasmemes
					ERTOperative.set_species(/datum/species/human)

				//Give antag datum
				var/datum/antagonist/ert/ert_antag

				if(numagents == 1)
					ert_antag = new ertemplate.leader_role
				else
					ert_antag = ertemplate.roles[WRAP(numagents,1,length(ertemplate.roles) + 1)]
					ert_antag = new ert_antag

				ERTOperative.mind.add_antag_datum(ert_antag,ert_team)
				ERTOperative.mind.assigned_role = ert_antag.name

				if(ertemplate.dusting)
					var/obj/item/implant/dusting/dustimplant = new(ERTOperative)
					dustimplant.implant(ERTOperative)

				//Logging and cleanup
				//log_game("[key_name(ERTOperative)] has been selected as an [ert_antag.name]") | yogs - redundant
				numagents--
				teamSpawned++

			if (teamSpawned)
				message_admins("[ertemplate.polldesc] has spawned with the mission: [ertemplate.mission]")

			//Open the Armory doors
			if(ertemplate.opendoors)
				for(var/obj/machinery/door/poddoor/ert/door in GLOB.airlocks)
					INVOKE_ASYNC(door, TYPE_PROC_REF(/obj/machinery/door/poddoor, open))

			//Open the Mech Bay
			if(ertemplate.openmech)
				for(var/obj/machinery/door/poddoor/deathsquad/door in GLOB.airlocks)
					INVOKE_ASYNC(door, TYPE_PROC_REF(/obj/machinery/door/poddoor, open))
			return TRUE
		else
			return FALSE

	return


GLOBAL_VAR_INIT(emergency_access, FALSE)
/proc/make_maint_all_access()
	for(var/area/maintenance/area in GLOB.areas)
		for (var/list/zlevel_turfs as anything in area.get_zlevel_turf_lists())
			for(var/turf/area_turf as anything in zlevel_turfs)
				for(var/obj/machinery/door/airlock/airlock in area_turf)
					airlock.emergency = TRUE
					airlock.update_icon(ALL, 0)
	minor_announce("Access restrictions on maintenance and external airlocks have been lifted.", "Attention! Station-wide emergency declared!",1)
	GLOB.emergency_access = TRUE
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("emergency maintenance access", "enabled"))

/proc/revoke_maint_all_access()
	for(var/area/maintenance/area in GLOB.areas)
		for (var/list/zlevel_turfs as anything in area.get_zlevel_turf_lists())
			for(var/turf/area_turf as anything in zlevel_turfs)
				for(var/obj/machinery/door/airlock/airlock in area_turf)
					airlock.emergency = FALSE
					airlock.update_icon(ALL, 0)
	minor_announce("Access restrictions in maintenance areas have been restored.", "Attention! Station-wide emergency rescinded:")
	GLOB.emergency_access = FALSE
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("emergency maintenance access", "disabled"))

/proc/toggle_bluespace_artillery()
	GLOB.bsa_unlock = !GLOB.bsa_unlock
	minor_announce("Bluespace Artillery firing protocols have been [GLOB.bsa_unlock? "unlocked" : "locked"]", "Weapons Systems Update:")
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("bluespace artillery", GLOB.bsa_unlock? "unlocked" : "locked"))

#undef KEYCARD_RED_ALERT
#undef KEYCARD_EMERGENCY_MAINTENANCE_ACCESS
#undef KEYCARD_BSA_UNLOCK
