/datum/traitor_faction
	var/datum/corporation/corporation_allighment
	var/allies = "None"

/datum/traitor_faction/independent
	description = "Maybe you are a solo merk or survived agent of the decommissioned Syndicate cell. \n\
	Maybe you are a radical member of ACLF, GEC or other group with left-wing politics. \n\
	You are a person who holds grudges, and has been hurt greatly by Nanotrasen. Remember that for the Syndicate you are expendable.\n\
	You probably have nothing left to lose. Don`t expect any backup. You will have no allies."
	faction_theme = PDA_THEME_INDEPENDENT
	corporation_allighment = /datum/corporation/traitor/independent
	allies = "If the anyone learns of your plan, they're going to kill you and take your uplink. Take no chances."

/datum/traitor_faction/donk_co
	corporation_allighment = /datum/corporation/traitor/donkco
	give_codewords = TRUE
	allies = "Members of Waffle Corp. are to be killed on sight; they are not allowed to be on the station while we're around."

/datum/traitor_faction/waffle_co
	corporation_allighment = /datum/corporation/traitor/waffleco
	give_codewords = TRUE
	allies = "Members of Donk Co. are to be killed on sight; they are not allowed to be on the station while we're around. Do not trust fellow members of the Waffle.co (but try not to rat them out), as they might have been assigned opposing objectives."

/datum/traitor_faction/cybersun
	corporation_allighment = /datum/corporation/traitor/cybersun
	give_codewords = TRUE
	allies = "Fellow Cybersun operatives are to be trusted. Members of the Gorlex Marauders can be trusted. All other syndicate operatives are not to be trusted."

/datum/traitor_faction/vahlen
	corporation_allighment = /datum/corporation/traitor/vahlen
	give_codewords = TRUE
	allies = "You may cooperate with other syndicate operatives if they support your scientific testing. Don't forget to clean up your mess!"
	
/datum/traitor_faction/gorlex
	corporation_allighment = /datum/corporation/gorlex
	give_codewords = TRUE
	allies = "You may collaborate with any friends of the Syndicate coalition, but keep an eye on any of those Vostok punks if they do show up."

/datum/traitor_faction/self
	faction_theme = PDA_THEME_SELF
	corporation_allighment = /datum/corporation/self
	give_codewords = TRUE
	allies = "You may cooperate with other syndicate operatives if they support our cause."

/datum/traitor_faction/vostok
	name = "Vostok"
	employer_name = "Mr. Komarov"
	description = "You're employed by a company with brave ideas and experimental technology. \n\
	Probably it also represents interests of USSP. You answer directly to retired major. \n\
	Ruin the Terragov economy using their own capitalistic tools.  Make sure to remember: Actions speak louder than words."
	corporation_allighment = /datum/corporation/vostok
	key = TRAITOR_FACTION_VOSTOK
	faction_theme = PDA_THEME_BOSYN
	allies = "You are the only operative we are sending, any others are fake. All other syndicate operatives are not to be trusted."