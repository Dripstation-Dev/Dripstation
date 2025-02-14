//Both ERT and DS are handled by the same datums since they mostly differ in equipment in objective.
/datum/team/ert
	name = "Emergency Response Team"
	var/datum/objective/mission //main mission
	var/obj/item/ntuplink/uplink_type

/datum/team/ert/roundend_report()
	if(!show_roundend_report)
		return

	var/list/report = list()

	report += span_header("[name]:")
	report += "The [member_name]s were:"
	report += printplayerlist(members)

	var/win = FALSE
	if(objectives.len)
		report += span_header("ERT had following objectives:")
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

	if(uplink_type)
		var/purchases = ""
		var/TC_uses = 0
		LAZYINITLIST(GLOB.uplink_purchase_logs_by_key)
		for(var/I in members)
			var/datum/mind/ertmember = I
			var/datum/uplink_purchase_log/H = GLOB.uplink_purchase_logs_by_key[ertmember.key]
			if(H)
				TC_uses += H.total_spent
				purchases += H.generate_render(show_key = FALSE, currency = "WC")
		report += "<br>"
		report += "(ERT was equipped with [initial(uplink_type.name)]s and used [TC_uses] WC) [purchases]"
		if(TC_uses == 0 && win)
			report += "<BIG>[icon2html('icons/badass.dmi', world, "badass")]</BIG>"

	return "<div class='panel redborder'>[report.Join("<br>")]</div>"

/datum/antagonist/ert
	name = "Emergency Response Officer"
	var/datum/team/ert/ert_team
	var/leader = FALSE
	var/datum/outfit/outfit = /datum/outfit/ert/security
	var/role = "Security Officer"
	var/list/name_source
	show_in_antagpanel = FALSE
	show_to_ghosts = TRUE
	antag_moodlet = /datum/mood_event/focused
	can_hijack = HIJACK_PREVENT

/datum/antagonist/ert/on_gain()
	update_name()
	equipERT()
	. = ..()

/datum/antagonist/ert/get_team()
	return ert_team

/datum/antagonist/ert/New()
	. = ..()
	name_source = GLOB.last_names

/datum/antagonist/ert/proc/update_name()
	owner.current.fully_replace_character_name(owner.current.real_name,"[role] [pick(name_source)]")

/datum/antagonist/ert/deathsquad/New()
	. = ..()
	name_source = GLOB.commando_names

/datum/antagonist/ert/clown/New()
	. = ..()
	name_source = GLOB.clown_names

/datum/antagonist/ert/deathsquad/apply_innate_effects(mob/living/mob_override)
	ADD_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/deathsquad/remove_innate_effects(mob/living/mob_override)
	REMOVE_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/trooper
	outfit = /datum/outfit/ert/trooper

/datum/antagonist/ert/trooper/red
	outfit = /datum/outfit/ert/trooper/red

/datum/antagonist/ert/trooper/gamma
	outfit = /datum/outfit/ert/trooper/gamma

/datum/antagonist/ert/security
	outfit = /datum/outfit/ert/security

/datum/antagonist/ert/security/red
	outfit = /datum/outfit/ert/security/red

/datum/antagonist/ert/security/gamma
	outfit = /datum/outfit/ert/security/gamma

/datum/antagonist/ert/engineer
	role = "Engineer"
	outfit = /datum/outfit/ert/engineer

/datum/antagonist/ert/engineer/red
	outfit = /datum/outfit/ert/engineer/red

/datum/antagonist/ert/engineer/gamma
	outfit = /datum/outfit/ert/engineer/gamma

/datum/antagonist/ert/medic
	role = "Medical Officer"
	outfit = /datum/outfit/ert/medic

/datum/antagonist/ert/medic/red
	outfit = /datum/outfit/ert/medic/red

/datum/antagonist/ert/medic/gamma
	outfit = /datum/outfit/ert/medic/gamma

/datum/antagonist/ert/common
	outfit = /datum/outfit/ert

/datum/antagonist/ert/common/trooper
	outfit = /datum/outfit/ert

/datum/antagonist/ert/common/medic
	outfit = /datum/outfit/ert
	name = "Emergency Response Medic"

/datum/antagonist/ert/common/engineer
	name = "Emergency Response Engineer"

/datum/antagonist/ert/common/leader
	name = "Emergency Response Commander"
	role = "Commander"
	outfit = /datum/outfit/ert/commonleader

/datum/antagonist/ert/common/leader/apply_innate_effects(mob/living/mob_override)
	ADD_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/common/leader/remove_innate_effects(mob/living/mob_override)
	REMOVE_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/commander
	role = "Commander"
	outfit = /datum/outfit/ert/commander

/datum/antagonist/ert/commander/apply_innate_effects(mob/living/mob_override)
	ADD_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/commander/remove_innate_effects(mob/living/mob_override)
	REMOVE_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/commander/red
	outfit = /datum/outfit/ert/commander/red

/datum/antagonist/ert/commander/gamma
	outfit = /datum/outfit/ert/commander/gamma

/datum/antagonist/ert/deathsquad
	name = "Deathsquad Trooper"
	outfit = /datum/outfit/centcom/death_commando
	role = "Trooper"

/datum/antagonist/ert/deathsquad/leader
	name = "Deathsquad Officer"
	outfit = /datum/outfit/centcom/death_commando
	role = "Officer"

/datum/antagonist/ert/mining
	name = "Dwarven Miner"
	outfit = /datum/outfit/ert/mining

/datum/antagonist/ert/medic/inquisitor
	outfit = /datum/outfit/ert/medic/inquisitor

/datum/antagonist/ert/medic/inquisitor/on_gain()
	. = ..()
	owner.holy_role = HOLY_ROLE_PRIEST

/datum/antagonist/ert/security/inquisitor
	outfit = /datum/outfit/ert/security/inquisitor

/datum/antagonist/ert/security/inquisitor/on_gain()
	. = ..()
	owner.holy_role = HOLY_ROLE_PRIEST

/datum/antagonist/ert/chaplain
	role = "Chaplain"
	outfit = /datum/outfit/ert/chaplain

/datum/antagonist/ert/chaplain/inquisitor
	outfit = /datum/outfit/ert/chaplain/inquisitor

/datum/antagonist/ert/chaplain/on_gain()
	. = ..()
	owner.holy_role = HOLY_ROLE_PRIEST

/datum/antagonist/ert/commander/inquisitor
	outfit = /datum/outfit/ert/commander/inquisitor

/datum/antagonist/ert/commander/inquisitor/on_gain()
	. = ..()
	owner.holy_role = HOLY_ROLE_PRIEST

/datum/antagonist/ert/janitor
	role = "Janitor"
	outfit = /datum/outfit/ert/janitor

/datum/antagonist/ert/janitor/heavy
	role = "Heavy Duty Janitor"
	outfit = /datum/outfit/ert/janitor/heavy

/datum/antagonist/ert/amber
	name = "Amber Trooper"
	outfit = /datum/outfit/amber
	role = "Operative"

/datum/antagonist/ert/amber/security
	name = "Amber Detaining Specialist"
	outfit = /datum/outfit/amber/security
	role = "Detaining Specialist"

/datum/antagonist/ert/amber/melee
	name = "Amber Melee Specialist"
	outfit = /datum/outfit/amber/melee
	role = "Melee Specialist"

/datum/antagonist/ert/amber/heavy
	name = "Amber Heavyweapon Specialist"
	outfit = /datum/outfit/amber/heavy
	role = "Heavy Weapon Specialist"

/datum/antagonist/ert/amber/paranormal
	name = "Amber Paradimentional Specialist"
	outfit = /datum/outfit/amber/paranormal
	role = "Paradimentional Specialist"

/datum/antagonist/ert/amber/engineer
	name = "Amber Technical Specialist"
	outfit = /datum/outfit/amber/engineer
	role = "Tech Specialist"

/datum/antagonist/ert/amber/medic
	name = "Amber Medic"
	outfit = /datum/outfit/amber/medic
	role = "Field Medic"

/datum/antagonist/ert/amber/commander
	name = "Amber Officer"
	outfit = /datum/outfit/amber/commander
	role = "Lieutenant"

/datum/antagonist/ert/amber/commander/apply_innate_effects(mob/living/mob_override)
	ADD_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/amber/commander/remove_innate_effects(mob/living/mob_override)
	REMOVE_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/occupying
	name = "Occupying Officer"
	outfit = /datum/outfit/occupying
	role = "Officer"

/datum/antagonist/ert/occupying/heavy
	name = "Occupying Riot Officer"
	outfit = /datum/outfit/occupying/heavy
	role = "Riot Officer"

/datum/antagonist/ert/occupying/commander
	name = "Occupying Officer"
	outfit = /datum/outfit/occupying/commander
	role = "Officer"

/datum/antagonist/ert/clown
	name = "Comedy Response Officer"
	outfit = /datum/outfit/centcom_clown
	role = "Prankster"

/datum/antagonist/ert/clown/honk
	name = "HONK Squad Trooper"
	outfit = /datum/outfit/centcom_clown/honk_squad
	role = "HONKER"

/datum/antagonist/ert/imperial
	name = "Imperial Guardsman"
	outfit = /datum/outfit/imperial
	role = "Guardsman"

/datum/antagonist/ert/imperial/hotshot
	name = "Imperial Guardsman Veteran"
	outfit = /datum/outfit/imperial/veteran
	role = "Guard Veteran"

/datum/antagonist/ert/imperial/plasma
	name = "Imperial Guardsman Plasma Gunner"
	outfit = /datum/outfit/imperial/plasma
	role = "Plasma Gunner"

/datum/antagonist/ert/imperial/sniper
	name = "Imperial Guardsman Marksman"
	outfit = /datum/outfit/imperial/marksman
	role = "Marksman"

/datum/antagonist/ert/imperial/sergeant
	name = "Imperial Sergeant"
	outfit = /datum/outfit/imperial/commander
	role = "Sergeant"

/datum/antagonist/ert/shield
	name = "Close Protection Team Member"
	outfit = /datum/outfit/centcom/shield
	role = "Trooper"

/datum/antagonist/ert/shield/officer
	name = "Close Protection Team officer"
	outfit = /datum/outfit/centcom/shield/officer
	role = "Leader"

/datum/antagonist/ert/nanotrasen_defence
	name = "Defence Team Member"
	outfit = /datum/outfit/centcom/nanotrasen_defence
	role = "Trooper"

/datum/antagonist/ert/nanotrasen_defence/leader
	name = "Defence Team Leader"
	outfit = /datum/outfit/centcom/nanotrasen_defence/leader
	role = "Leader"

/datum/antagonist/ert/deathsquad/striker
	name = "Black Ops Strike Team"
	outfit = /datum/outfit/centcom/death_commando/striker
	role = "Trooper"

/datum/antagonist/ert/deathsquad/striker/shield
	name = "Black Ops Strike Team"
	outfit = /datum/outfit/centcom/death_commando/striker/shield
	role = "Trooper"

/datum/antagonist/ert/intern
	name = "CentCom Intern"
	outfit = /datum/outfit/centcom/intern
	//random_names = FALSE
	role = "Intern"
	//suicide_cry = "FOR MY INTERNSHIP!!"

/datum/antagonist/ert/intern/leader
	name = "CentCom Head Intern"
	outfit = /datum/outfit/centcom/intern/leader
	//random_names = FALSE
	role = "Head Intern"

/datum/antagonist/ert/intern/unarmed
	outfit = /datum/outfit/centcom/intern/unarmed

/datum/antagonist/ert/intern/leader/unarmed
	outfit = /datum/outfit/centcom/intern/leader/unarmed

/datum/antagonist/ert/create_team(datum/team/ert/new_team)
	if(istype(new_team))
		ert_team = new_team

/datum/antagonist/ert/proc/equipERT()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	H.equipOutfit(outfit)

/datum/antagonist/ert/amber/equipERT()
	. = ..()
	var/mob/living/carbon/human/H = owner.current
	H.set_species(/datum/species/corporate)
	H.gender = MALE
	H.hair_color = "000"
	H.hair_style = "Bald"

/datum/antagonist/ert/greet()
	if(!ert_team)
		return

	to_chat(owner, "<B><font size=3 color=red>You are the [name].</font></B>")

	var/missiondesc = "Your squad is being sent on a mission to [station_name()] by Nanotrasen's Special Operations Division."
	if(leader) //If Squad Leader
		missiondesc += " Lead your squad to ensure the completion of the mission. Board the shuttle when your team is ready."
	else
		missiondesc += " Follow orders given to you by your squad leader."

	missiondesc += " Avoid civilian casualties when possible."

	missiondesc += "<BR><B>Your Mission</B>: [ert_team.mission.explanation_text]"
	to_chat(owner,missiondesc)

/datum/antagonist/ert/amber/greet()
	. = ..()
	to_chat(owner,"You also have a combat knife inside your boots.")

/datum/antagonist/ert/deathsquad/greet()
	if(!ert_team)
		return

	to_chat(owner, "<B><font size=3 color=red>You are the [name].</font></B>")

	var/missiondesc = "Your squad is being sent on a mission to [station_name()] by Nanotrasen's Special Operations Division."
	if(leader) //If Squad Leader
		missiondesc += " Lead your squad to ensure the completion of the mission. Board the shuttle when your team is ready."
	else
		missiondesc += " Follow orders given to you by your squad leader."

	missiondesc += "<BR><B>Your Mission</B> : [ert_team.mission.explanation_text]"
	to_chat(owner,missiondesc)

/datum/antagonist/ert/clown/greet()
	if(!ert_team)
		return

	to_chat(owner, "<B><font size=3 color=red>You are the [name].</font></B>")

	var/missiondesc = "Your squad is being sent on a mission to [station_name()] by Nanotrasen's Comedy Division."
	if(leader) //If Squad Leader
		missiondesc += " You are the worst clown here. As such, you were able to stop slipping the admiral for long enough to be given command. Good luck, honk!"
	else
		missiondesc += " Follow orders given to you by your squad leader in order to ensure maximum laughs."

		missiondesc += " Be the funniest Prankster possible!"
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/hornin.ogg', 100, FALSE, pressure_affected = FALSE)
