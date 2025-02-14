/datum/ert
	var/mobtype = /mob/living/carbon/human
	var/team = /datum/team/ert
	var/opendoors = TRUE
	var/openmech = FALSE
	var/leader_role = /datum/antagonist/ert/commander
	var/enforce_human = TRUE
	var/roles = list(/datum/antagonist/ert/trooper, /datum/antagonist/ert/security, /datum/antagonist/ert/medic, /datum/antagonist/ert/engineer) //List of possible roles to be assigned to ERT members.
	var/rename_team
	var/code
	var/mission = "Assist the station."
	var/teamsize = 5
	var/polldesc
	var/dusting = FALSE

	// this can be safely set as default because it doesnt do anything unless specifically making uplinked ERT
	var/obj/item/uplinktype = /obj/item/ntuplink/official

/datum/ert/New()
	if (!polldesc)
		polldesc = "a Code [code] Nanotrasen Emergency Response Team"

/datum/ert/blue
	opendoors = FALSE
	code = "Blue"
	rename_team = "Blue Code Task Force"
	polldesc = "the Blue Task Force"

/datum/ert/amber
	opendoors = FALSE
	code = "Amber"
	rename_team = "Amber Task Force"
	mission = "Eliminate the threat to the station."
	polldesc = "the Amber Task Force"
	teamsize = 7	//Boys, just run onto them and die in glorious death
	leader_role = /datum/antagonist/ert/amber/commander
	roles = list(/datum/antagonist/ert/amber, /datum/antagonist/ert/amber, /datum/antagonist/ert/amber/medic, /datum/antagonist/ert/amber/melee, /datum/antagonist/ert/amber/heavy, /datum/antagonist/ert/amber/paranormal, /datum/antagonist/ert/amber/engineer, /datum/antagonist/ert/amber/security) // entered duplicate here to increase change of soldiers

/datum/ert/peacekeeper
	opendoors = FALSE
	code = "Blue"
	rename_team = "Peacekeeping Force"
	mission = "Enforce space law. Occupy the station. Minimize crew casualties."
	polldesc = "the Peacekeeping Force"
	teamsize = 5 // redundant but keeping this here for clarity
	leader_role = /datum/antagonist/ert/occupying/commander
	roles = list(/datum/antagonist/ert/occupying,/datum/antagonist/ert/occupying/heavy,/datum/antagonist/ert/occupying,/datum/antagonist/ert/occupying)

/datum/ert/shield
	opendoors = FALSE
	code = "Amber"
	rename_team = "Close Protection Unit"
	mission = "Defend VIP-personas at all costs."
	polldesc = "the Close Protection Unit"
	teamsize = 3	//they meant to be profy, there is no need to have like more of them
	leader_role = /datum/antagonist/ert/shield/officer
	roles = list(/datum/antagonist/ert/shield)

/datum/ert/assaultcod
	opendoors = FALSE
	code = "Amber"
	rename_team = "NanoTrasen Assault Unit"
	mission = "Eliminate the threat to the Nanotrasen."
	polldesc = "the NanoTrasen fighting force."
	teamsize = 5 // redundant but keeping this here for clarity
	leader_role = /datum/antagonist/ert/nanotrasen_defence/leader
	roles = list(/datum/antagonist/ert/nanotrasen_defence)

/datum/ert/red
	leader_role = /datum/antagonist/ert/commander/red
	roles = list(/datum/antagonist/ert/trooper/red, /datum/antagonist/ert/security/red, /datum/antagonist/ert/medic/red, /datum/antagonist/ert/engineer/red)
	code = "Red"
	rename_team = "Red Code Task Force"
	polldesc = "the Red Task Force"

/datum/ert/gamma
	leader_role = /datum/antagonist/ert/commander/gamma
	roles = list(/datum/antagonist/ert/trooper/gamma, /datum/antagonist/ert/security/gamma, /datum/antagonist/ert/medic/gamma, /datum/antagonist/ert/engineer/gamma)
	code = "Gamma"
	rename_team = "Gamma Code Task Force"
	mission = "Eliminate the threat to the station."
	polldesc = "the Gamma Task Force"
	openmech = TRUE

/datum/ert/deathsquad
	roles = list(/datum/antagonist/ert/deathsquad)
	leader_role = /datum/antagonist/ert/deathsquad/leader
	rename_team = "Deathsquad"
	openmech = TRUE
	code = "Epsilon"
	mission = "Leave no witnesses."
	polldesc = "an elite Nanotrasen Strike Team"

/datum/ert/deathsquad/striker
	roles = list(/datum/antagonist/ert/deathsquad/striker, /datum/antagonist/ert/deathsquad/striker/shield)
	leader_role = /datum/antagonist/ert/deathsquad/striker/shield

/datum/ert/mining
	leader_role = /datum/antagonist/ert/mining
	roles = list(/datum/antagonist/ert/mining)
	rename_team = "Megafauna Kill Team"
	code = "Rock and STONE"
	mission = "Eliminate hostile fauna while minimizing casualties."
	polldesc = "A merry band of Megafauna-hunting dwarves"

/datum/ert/intern
	roles = list(/datum/antagonist/ert/intern)
	leader_role = /datum/antagonist/ert/intern/leader
	teamsize = 7
	opendoors = FALSE
	code = "Green"
	rename_team = "Horde of Interns"
	mission = "Assist in conflict resolution."
	polldesc = "an unpaid internship opportunity with Nanotrasen"
	//random_names = FALSE

/datum/ert/intern/unarmed
	roles = list(/datum/antagonist/ert/intern/unarmed)
	leader_role = /datum/antagonist/ert/intern/leader/unarmed
	rename_team = "Unarmed Horde of Interns"

/datum/ert/official
	code = "Green"
	teamsize = 1
	opendoors = FALSE
	leader_role = /datum/antagonist/centcom
	roles = list(/datum/antagonist/centcom)
	rename_team = "CentCom Officials"
	polldesc = "a CentCom Official"

/datum/ert/official/New()
	mission = "Conduct a routine performance review of [station_name()] and its Captain."


/datum/ert/official/captain
	leader_role = /datum/antagonist/centcom/captain
	roles = list(/datum/antagonist/centcom/captain)
	rename_team = "CentCom Captains"
	polldesc = "a CentCom Captain"

/datum/ert/official/admiral
	leader_role = /datum/antagonist/centcom/admiral
	roles = list(/datum/antagonist/centcom/admiral)
	rename_team = "CentCom Admirals"
	polldesc = "a CentCom Admiral"

/datum/ert/official/executive
	leader_role = /datum/antagonist/centcom/executive
	roles = list(/datum/antagonist/centcom/executive)
	rename_team = "CentCom Executives"
	polldesc = "a CentCom Executive"

/datum/ert/uplinked
	leader_role = /datum/antagonist/ert/common/leader
	roles = list(/datum/antagonist/ert/common/trooper,/datum/antagonist/ert/common/medic,/datum/antagonist/ert/common/engineer)
	rename_team = "Uplinked Emergency Response Team"
	polldesc = "an Uplink-Equipped ERT"

/datum/ert/inquisition
	roles = list(/datum/antagonist/ert/chaplain/inquisitor, /datum/antagonist/ert/security/inquisitor, /datum/antagonist/ert/medic/inquisitor)
	leader_role = /datum/antagonist/ert/commander/inquisitor
	rename_team = "Inquisition"
	mission = "Destroy any traces of paranormal activity aboard the station."
	polldesc = "a Nanotrasen paranormal response team"

/datum/ert/janitor
	roles = list(/datum/antagonist/ert/janitor, /datum/antagonist/ert/janitor/heavy)
	leader_role = /datum/antagonist/ert/janitor/heavy
	teamsize = 4
	opendoors = FALSE
	rename_team = "Janitor"
	mission = "Clean up EVERYTHING."
	polldesc = "a Nanotrasen Janitorial Response Team"

/datum/ert/clown
	roles = list(/datum/antagonist/ert/clown)
	leader_role = /datum/antagonist/ert/clown
	teamsize = 7
	opendoors = FALSE
	rename_team = "The Circus"
	mission = "Provide vital moral support to the station in this time of crisis"
	code = "Banana"

/datum/ert/honk
	roles = list(/datum/antagonist/ert/clown/honk)
	leader_role = /datum/antagonist/ert/clown/honk
	teamsize = 5
	opendoors = TRUE
	rename_team = "HONK Squad"
	mission = "HONK them into submission."
	polldesc = "an elite Nanotrasen tactical pranking squad"
	code = "HOOOOOOOOOONK"

/datum/ert/imperial
	roles = list(/datum/antagonist/ert/imperial, /datum/antagonist/ert/imperial, /datum/antagonist/ert/imperial/hotshot, /datum/antagonist/ert/imperial/sniper, /datum/antagonist/ert/imperial, /datum/antagonist/ert/imperial/plasma)
	leader_role = /datum/antagonist/ert/imperial/sergeant
	teamsize = 7
	rename_team = "Imperial Guard"
	mission = "Eliminate the threat to the station."
	polldesc = "the Imperial Guard Task Force"
