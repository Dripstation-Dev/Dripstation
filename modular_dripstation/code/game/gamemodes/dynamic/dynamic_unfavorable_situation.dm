/// An easy interface to make...*waves hands* bad things happen.
/// This is used for impactful events like traitors hacking and creating more threat, or a revolutions victory.
/// It tries to spawn a heavy midround if possible, otherwise it will trigger a "bad" random event after a short period.
/// Calling this function will not use up any threat.
/datum/game_mode/dynamic/proc/unfavorable_situation()
	SHOULD_NOT_SLEEP(TRUE)

	INVOKE_ASYNC(src, PROC_REF(_unfavorable_situation))

/datum/game_mode/dynamic/proc/_unfavorable_situation()
	var/static/list/unfavorable_random_events = list()
	if (!length(unfavorable_random_events))
		unfavorable_random_events = generate_unfavourable_events()
	var/list/possible_heavies = generate_unfavourable_heavy_rulesets()
	if (!length(possible_heavies))
		var/datum/round_event_control/round_event_control_type = pick(unfavorable_random_events)
		var/delay = rand(20 SECONDS, 1 MINUTES)

		log_game("An unfavorable situation was requested, but no heavy rulesets could be drafted. Spawning [initial(round_event_control_type.name)] in [DisplayTimeText(delay)] instead.")
		force_event_after(round_event_control_type, "an unfavorable situation", delay)
	else
		var/datum/dynamic_ruleset/midround/heavy_ruleset = pick_weight(possible_heavies)
		log_game("An unfavorable situation was requested, spawning [initial(heavy_ruleset.name)]")
		picking_specific_rule(heavy_ruleset, forced = TRUE, ignore_cost = TRUE)

/// Return a valid heavy dynamic ruleset, or an empty list if there's no time to run any rulesets
/datum/game_mode/dynamic/proc/generate_unfavourable_heavy_rulesets()
	if (EMERGENCY_PAST_POINT_OF_NO_RETURN)
		return list()

	var/list/possible_heavies = list()
	for (var/datum/dynamic_ruleset/midround/ruleset as anything in midround_rules)
		if (!ruleset.heavy_midround_ruleset_style)
			continue

		if (ruleset.weight == 0)
			continue

		if (ruleset.cost > 100)
			continue

		if (!ruleset.acceptable(current_players[CURRENT_LIVING_PLAYERS].len, threat_level))
			continue

		if (ruleset.minimum_round_time > world.time - SSticker.round_start_time)
			continue

		if(istype(ruleset, /datum/dynamic_ruleset/midround/from_ghosts) && !(GLOB.ghost_role_flags & GHOSTROLE_MIDROUND_EVENT))
			continue

		ruleset.trim_candidates()

		ruleset.load_templates()
		if (!ruleset.ready())
			continue

		possible_heavies[ruleset] = ruleset.get_weight()
	return possible_heavies

/// Filter the below list by which events can actually run on this map
/datum/game_mode/dynamic/proc/generate_unfavourable_events()
	var/static/list/unfavorable_random_events = list(
		/datum/round_event_control/earthquake,
		/datum/round_event_control/immovable_rod,
		/datum/round_event_control/meteor_wave,
		/datum/round_event_control/portal_storm_syndicate,
	)
	var/list/picked_events = list()
	for(var/type in unfavorable_random_events)
		var/datum/round_event_control/event = new type()
		if(!event.valid_for_map())
			continue
		picked_events += type
	return picked_events

/proc/force_event_after(event_typepath, cause, duration)
	var/datum/round_event_control/our_event = locate(event_typepath) in SSevents.control
	if(!our_event)
		CRASH("Attempted to force event [event_typepath], but the event path could not be found!")
	addtimer(CALLBACK(our_event, TYPE_PROC_REF(/datum/round_event_control, runEvent), FALSE, null, FALSE, cause), duration)


/datum/dynamic_ruleset/midround
	var/heavy_midround_ruleset_style = FALSE
	var/minimum_round_time = 0

/datum/dynamic_ruleset/midround/malf
	heavy_midround_ruleset_style = TRUE

/datum/dynamic_ruleset/midround/from_ghosts/wizard
	heavy_midround_ruleset_style = TRUE

/datum/dynamic_ruleset/midround/from_ghosts/nuclear
	heavy_midround_ruleset_style = TRUE
	minimum_round_time = 70 MINUTES

/datum/dynamic_ruleset/midround/from_ghosts/infiltration
	heavy_midround_ruleset_style = TRUE

/datum/dynamic_ruleset/midround/from_ghosts/blob
	heavy_midround_ruleset_style = TRUE
	minimum_round_time = 35 MINUTES

/datum/dynamic_ruleset/midround/from_ghosts/xenomorph
	heavy_midround_ruleset_style = TRUE
	minimum_round_time = 40 MINUTES

/datum/dynamic_ruleset/midround/from_ghosts/space_dragon
	heavy_midround_ruleset_style = TRUE

/datum/dynamic_ruleset/midround/from_ghosts/zombie
	heavy_midround_ruleset_style = TRUE
