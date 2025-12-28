/datum/team/merc
	name = "Freelancer Mercenary Group"
	var/datum/objective/mission //main mission
	//var/obj/item/market_uplink/uplink_type

/datum/team/merc/roundend_report()
	if(!show_roundend_report)
		return

	var/list/report = list()

	report += span_header("[name]:")
	report += "The [member_name]s were:"
	report += printplayerlist(members)

	var/win = FALSE
	if(objectives.len)
		report += span_header("Mercenaries had following objectives:")
		win = TRUE
		var/objective_count = 1
		for(var/datum/objective/objective in objectives)
			if(objective.check_completion())
				report += "<B>Objective #[objective_count]</B>: [objective.explanation_text] [span_greentext("Success!")]"
			else
				report += "<B>Objective #[objective_count]</B>: [objective.explanation_text] [span_redtext("Fail.")]"
				win = FALSE
			objective_count++
		if(win)
			report += span_greentext("The [name] was successful!")
		else
			report += span_redtext("The [name] have failed!")

	/*if(uplink_type)
		var/purchases = ""
		var/TC_uses = 0
		LAZYINITLIST(GLOB.uplink_purchase_logs_by_key)
		for(var/I in members)
			var/datum/mind/mercmember = I
			var/datum/uplink_purchase_log/H = GLOB.uplink_purchase_logs_by_key[mercmember.key]
			if(H)
				TC_uses += H.total_spent
				purchases += H.generate_render(show_key = FALSE, currency = "WC")
		report += "<br>"
		report += "(merc was equipped with [initial(uplink_type.name)]s and used [TC_uses] WC) [purchases]"
		if(TC_uses == 0 && win)
			report += "<BIG>[icon2html('icons/badass.dmi', world, "badass")]</BIG>"
	*/
	return "<div class='panel redborder'>[report.Join("<br>")]</div>"

/datum/antagonist/merc
	name = "Private Military"
	var/datum/team/merc/merc_team
	var/leader = FALSE
	var/datum/outfit/outfit = /datum/outfit/merc/operative
	var/role = "Operative"
	var/list/name_source
	show_in_antagpanel = FALSE
	show_to_ghosts = TRUE
	antag_moodlet = /datum/mood_event/focused
	can_hijack = HIJACK_HIJACKER
	hijack_speed = 0.5

/datum/antagonist/merc/on_gain()
	update_name()
	equipmerc()
	. = ..()

/datum/antagonist/merc/get_team()
	return merc_team

/datum/antagonist/merc/New()
	. = ..()
	name_source = GLOB.last_names

/datum/antagonist/merc/proc/update_name()
	owner.current.fully_replace_character_name(owner.current.real_name,"[role] [pick(name_source)]")

///datum/antagonist/merc/apply_innate_effects(mob/living/mob_override)
//	mob_override.grant_language(/datum/language/encrypted, TRUE, TRUE, LANGUAGE_MIND)

///datum/antagonist/merc/remove_innate_effects(mob/living/mob_override)
//	mob_override.remove_language(/datum/language/encrypted, TRUE, TRUE, LANGUAGE_MIND)

/datum/antagonist/merc/operative
	role = "Operative"
	outfit = /datum/outfit/merc/operative

/datum/antagonist/merc/engineer
	role = "Engineer"
	//outfit = /datum/outfit/merc/engineer

/datum/antagonist/merc/medic
	role = "Medic"
	//outfit = /datum/outfit/merc/medic

/datum/antagonist/merc/commander
	role = "Squad Officer"
	outfit = /datum/outfit/merc/officer

/datum/antagonist/merc/commander/apply_innate_effects(mob/living/mob_override)
	. = ..()
	ADD_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/merc/commander/remove_innate_effects(mob/living/mob_override)
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

//////////////////////
//////SHELLGUARD//////
//////////////////////
/datum/antagonist/merc/operative/shellguard
	role = "Guard"
	outfit = /datum/outfit/shellguard/guard

/datum/antagonist/merc/engineer/shellguard
	role = "Tech Specialist"
	outfit = /datum/outfit/shellguard/tech

/datum/antagonist/merc/medic/shellguard
	role = "Feldsher"
	outfit = /datum/outfit/shellguard/feldsher

/datum/antagonist/merc/commander/shellguard
	role = "Squad Officer"
	outfit = /datum/outfit/shellguard/officer


//////////////////////
//////MILITECH//////
//////////////////////
/datum/antagonist/merc/operative/militech
	role = "Rifle Specialist"
	outfit = /datum/outfit/hephaestus/operative/ar

/datum/antagonist/merc/operative/militech_grenadier
	role = "Grenadier Specialist"
	outfit = /datum/outfit/hephaestus/operative/grenadier

/datum/antagonist/merc/operative/militech_sniper
	role = "Sniper"
	outfit = /datum/outfit/hephaestus/operative/sniper

/datum/antagonist/merc/operative/militech_machinegunner
	role = "Machinegunner"
	outfit = /datum/outfit/hephaestus/operative/machinegun

/datum/antagonist/merc/operative/militech_mantis
	role = "Close Combat Specialist"
	outfit = /datum/outfit/hephaestus/operative/mantis

/datum/antagonist/merc/commander/militech
	role = "Squad Officer"
	outfit = /datum/outfit/hephaestus/operative/lieutenant


//////////////////////
//////GORLEX//////
//////////////////////
/datum/antagonist/merc/operative/gorlex
	role = "Rifle Specialist"
	outfit = /datum/outfit/syndicate/private_security/ar

/datum/antagonist/merc/operative/gorlex_sniper
	role = "Sniper"
	outfit = /datum/outfit/syndicate/private_security/sniper

/datum/antagonist/merc/operative/gorlex_machinegunner
	role = "Machinegunner"
	outfit = /datum/outfit/syndicate/private_security/machinegun

/datum/antagonist/merc/operative/gorlex_mantis
	role = "Close Combat Specialist"
	outfit = /datum/outfit/syndicate/private_security/mantis

/datum/antagonist/merc/commander/gorlex
	role = "Squad Officer"
	outfit = /datum/outfit/syndicate/private_security/officer




/datum/antagonist/merc/create_team(datum/team/merc/new_team)
	if(istype(new_team))
		merc_team = new_team

/datum/antagonist/merc/proc/equipmerc()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	H.equipOutfit(outfit)

/datum/antagonist/merc/greet()
	if(!merc_team)
		return

	to_chat(owner, "<B><font size=3 color=red>You are the [name].</font></B>")

	var/missiondesc = "Your squad is being sent on a mission to [station_name()] by your current employer."
	if(leader) //If Squad Leader
		missiondesc += " Lead your squad to ensure the completion of the mission."
	else
		missiondesc += " Follow orders given to you by your squad leader."

	missiondesc += " Feel free to make profit. Do not disgrace your squad and company."

	missiondesc += "<BR><B>Your Mission</B>: [merc_team.mission.explanation_text]"
	to_chat(owner,missiondesc)


/datum/merc
	var/name = "Mercs"
	var/description = "Mercs"
	var/teamsize = 5
	var/credit_cost = 10
	var/emag_only = FALSE
	var/prerequisites = "Money"
	var/extra_desc
	var/mobtype = /mob/living/carbon/human
	var/team = /datum/team/merc
	var/leader_role = /datum/antagonist/merc/commander
	var/enforce_human = TRUE
	var/roles = list(/datum/antagonist/merc/operative, /datum/antagonist/merc/medic) //List of possible roles to be assigned to merc members.
	var/rename_team = FALSE
	var/mission = "Assist the station."
	//var/list/who_can_purchase = list(ACCESS_CAPTAIN)	// i swear I still don`t know why it don`t work here
	var/polldesc

	// this can be safely set as default because it doesnt do anything 
	var/obj/item/uplinktype = /obj/item/market_uplink

/datum/merc/New()
	if (!polldesc)
		polldesc = "a Mercenary Team"

/datum/merc/free
	name = "Freelancer Mercenary Group"
	description = "A group of 3 freelancers."
	polldesc = "the Freelancer Group"
	credit_cost = 20000

/datum/merc/militech
	name = "Militech Corp&Gov Asset Security"
	description = "A group of 3 operatives."
	credit_cost = 20000
	polldesc = "the Militech Group"
	leader_role = /datum/antagonist/merc/commander/militech
	roles = list(/datum/antagonist/merc/operative/militech, /datum/antagonist/merc/operative/militech_grenadier, /datum/antagonist/merc/operative/militech_sniper, /datum/antagonist/merc/operative/militech_machinegunner, /datum/antagonist/merc/operative/militech_mantis) //List of possible roles to be assigned to merc members.

/datum/merc/shellguard
	name = "Shellguard Incorporated"
	description = "A group of 5 operatives."
	teamsize = 5
	credit_cost = 20000
	polldesc = "the Shellguard Group"
	leader_role = /datum/antagonist/merc/commander/shellguard
	roles = list(/datum/antagonist/merc/operative/shellguard, /datum/antagonist/merc/medic/shellguard, /datum/antagonist/merc/engineer/shellguard) //List of possible roles to be assigned to merc members.


/datum/merc/gorlex
	name = "Gorlex Private Security LLC"
	description = "A group of 3 operatives."
	teamsize = 3
	credit_cost = 40000
	polldesc = "the Gorlex Group"
	leader_role = /datum/antagonist/merc/commander/gorlex
	roles = list(/datum/antagonist/merc/operative/gorlex, /datum/antagonist/merc/operative/gorlex_sniper, /datum/antagonist/merc/operative/gorlex_machinegunner, /datum/antagonist/merc/operative/gorlex_mantis) //List of possible roles to be assigned to merc members.
	emag_only = TRUE

///Admin stuff///
/datum/admins/proc/makemercPreviewIcon(list/settings)
	// Set up the dummy for its photoshoot
	var/mob/living/carbon/human/dummy/mannequin = generate_or_wait_for_human_dummy(DUMMY_HUMAN_SLOT_ADMIN)

	var/prefs = settings["mainsettings"]
	var/datum/merc/template = prefs["template"]["value"]
	if (isnull(template))
		return null
	if (!ispath(template))
		template = text2path(prefs["template"]["value"]) // new text2path ... doesn't compile in 511

	template = new template
	var/datum/antagonist/merc/merc = template.leader_role

	equipAntagOnDummy(mannequin, merc)

	CHECK_TICK
	var/icon/preview_icon = icon('icons/effects/effects.dmi', "nothing")
	preview_icon.Scale(48+32, 16+32)
	CHECK_TICK
	mannequin.setDir(NORTH)
	var/icon/stamp = getFlatIcon(mannequin)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, 25, 17)
	CHECK_TICK
	mannequin.setDir(WEST)
	stamp = getFlatIcon(mannequin)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, 1, 9)
	CHECK_TICK
	mannequin.setDir(SOUTH)
	stamp = getFlatIcon(mannequin)
	CHECK_TICK
	preview_icon.Blend(stamp, ICON_OVERLAY, 49, 1)
	CHECK_TICK
	preview_icon.Scale(preview_icon.Width() * 2, preview_icon.Height() * 2) // Scaling here to prevent blurring in the browser.
	CHECK_TICK
	unset_busy_human_dummy(DUMMY_HUMAN_SLOT_ADMIN)
	return preview_icon


/datum/admins/proc/makemercTemplateModified(list/settings)
	. = settings
	var/datum/merc/newtemplate = settings["mainsettings"]["template"]["value"]
	if (isnull(newtemplate))
		return
	if (!ispath(newtemplate))
		newtemplate = text2path(newtemplate)
	newtemplate = new newtemplate
	.["mainsettings"]["teamsize"]["value"] = newtemplate.teamsize
	.["mainsettings"]["mission"]["value"] = newtemplate.mission
	.["mainsettings"]["polldesc"]["value"] = newtemplate.polldesc

/datum/admins/proc/makemercteam(datum/merc/merctemplate = null)
	if (merctemplate)
		merctemplate = new merctemplate
	else
		merctemplate = new /datum/merc/free

	var/list/settings = list(
		"preview_callback" = CALLBACK(src, PROC_REF(makemercPreviewIcon)),
		"mainsettings" = list(
		"template" = list("desc" = "Template", "callback" = CALLBACK(src, PROC_REF(makemercTemplateModified)), "type" = "datum", "path" = "/datum/merc", "subtypesonly" = TRUE, "value" = merctemplate.type),
		"teamsize" = list("desc" = "Team Size", "type" = "number", "value" = merctemplate.teamsize),
		"mission" = list("desc" = "Mission", "type" = "string", "value" = merctemplate.mission),
		"polldesc" = list("desc" = "Ghost poll description", "type" = "string", "value" = merctemplate.polldesc),
		"enforce_human" = list("desc" = "Enforce human authority", "type" = "boolean", "value" = "[(CONFIG_GET(flag/enforce_human_authority) ? "Yes" : "No")]")
		)
	)

	var/list/prefreturn = presentpreflikepicker(usr,"Customize Merc", "Customize Merc", Button1="Ok", width = 600, StealFocus = 1,Timeout = 0, settings=settings)

	if (isnull(prefreturn))
		return FALSE

	if (prefreturn["button"] == 1)
		var/list/prefs = settings["mainsettings"]

		var/templtype = prefs["template"]["value"]
		if (!ispath(prefs["template"]["value"]))
			templtype = text2path(prefs["template"]["value"]) // new text2path ... doesn't compile in 511

		if (merctemplate.type != templtype)
			merctemplate = new templtype

		merctemplate.teamsize = prefs["teamsize"]["value"]
		merctemplate.mission = prefs["mission"]["value"]
		merctemplate.polldesc = prefs["polldesc"]["value"]
		merctemplate.enforce_human = prefs["enforce_human"]["value"] == "Yes" ? TRUE : FALSE

		var/list/mob/dead/observer/candidates = pollGhostCandidates("Do you wish to be considered for [merctemplate.polldesc] ?", "deathsquad", null)
		var/teamSpawned = FALSE

		if(candidates.len > 0)
			//Pick the (un)lucky players
			var/numagents = min(merctemplate.teamsize,candidates.len)

			//Create team
			var/datum/team/merc/merc_team = new merctemplate.team
			if(merctemplate.rename_team)
				merc_team.name = merctemplate.name

			//Asign team objective
			var/datum/objective/missionobj = new
			missionobj.team = merc_team
			missionobj.explanation_text = merctemplate.mission
			missionobj.completed = TRUE
			merc_team.objectives += missionobj
			merc_team.mission = missionobj

			var/list/spawnpoints = GLOB.mercteamspawn
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
				var/mob/living/carbon/human/mercOperative = new merctemplate.mobtype(spawnloc)
				chosen_candidate.client.prefs.apply_prefs_to(mercOperative)
				mercOperative.key = chosen_candidate.key

				if(merctemplate.enforce_human || !(mercOperative.dna.species.changesource_flags & ERT_SPAWN)) // Don't want any exploding plasmemes
					mercOperative.set_species(/datum/species/human)

				//Give antag datum
				var/datum/antagonist/merc/merc_antag

				if(numagents == 1)
					merc_antag = new merctemplate.leader_role
				else
					merc_antag = merctemplate.roles[WRAP(numagents,1,length(merctemplate.roles) + 1)]
					merc_antag = new merc_antag

				mercOperative.mind.add_antag_datum(merc_antag,merc_team)
				mercOperative.mind.assigned_role = merc_antag.name

				//Logging and cleanup
				//log_game("[key_name(mercOperative)] has been selected as an [merc_antag.name]") | yogs - redundant
				numagents--
				teamSpawned++

			if (teamSpawned)
				message_admins("[merctemplate.polldesc] has spawned with the mission: [merctemplate.mission]")
			return TRUE
		else
			return FALSE

	return


/obj/effect/landmark/merc_spawn
	name = "Emergencyresponseteam"
	icon_state = "merc_spawn"

/obj/effect/landmark/mercspawn/Initialize(mapload)
	..()
	GLOB.mercteamspawn += loc
	return INITIALIZE_HINT_QDEL
