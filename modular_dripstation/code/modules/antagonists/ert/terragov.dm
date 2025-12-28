#define TERRAGOV_AMT "amount"
#define TERRAGOV_VOTES "votes"
#define TERRAGOV_DECLARED "declared"
#define TERRAGOV_FINE_AMOUNT -20000


GLOBAL_LIST_INIT(pizza_names, list(
	"Dixon Buttes",
	"I. C. Weiner",
	"Seymour Butz",
	"I. P. Freely",
	"Pat Myaz",
	"Vye Agra",
	"Harry Balsack",
	"Lee Nover",
	"Maya Buttreeks",
	"Amanda Hugginkiss",
	"Bwight K. Brute", // Github Copilot suggested dwight from the office like 10 times
	"John Nanotrasen",
	"Mike Rotch",
	"Hugh Jass",
	"Oliver Closeoff",
	"Hugh G. Recktion",
	"Phil McCrevis",
	"Willie Lickerbush",
	"Ben Dover",
	"Steve", // REST IN PEACE MAN
	"Avery Goodlay",
	"Anne Fetamine",
	"Amanda Peon",
	"Tara Newhole",
	"Penny Tration",
	"Joe Mama"
))

GLOBAL_VAR(caller_of_911)
GLOBAL_VAR(call_911_msg)
GLOBAL_VAR(pizza_order)
GLOBAL_LIST_INIT(emergency_responders, list())
GLOBAL_LIST_INIT(terragov_responder_info, list(
	"911_responders" = list(
		TERRAGOV_AMT = 0,
		TERRAGOV_VOTES = 0,
		TERRAGOV_DECLARED = FALSE
	),
	"swat" = list(
		TERRAGOV_AMT = 0,
		TERRAGOV_VOTES = 0,
		TERRAGOV_DECLARED = FALSE
	),
	"military" = list(
		TERRAGOV_AMT = 0,
		TERRAGOV_VOTES = 0,
		TERRAGOV_DECLARED = FALSE
	),
	"dogginos" = list(
		TERRAGOV_AMT = 0,
		TERRAGOV_VOTES = 0,
		TERRAGOV_DECLARED = FALSE
	),
	"dogginos_manager" = list(
		TERRAGOV_AMT = 0,
		TERRAGOV_VOTES = 0,
		TERRAGOV_DECLARED = FALSE
	)
))
GLOBAL_LIST_INIT(call911_do_and_do_not, list(
	EMERGENCY_RESPONSE_EMT = "You SHOULD call EMTs for:\n\
		Large or excessive amounts of dead bodies, emergency medical situations that the station can't handle, etc.\n\
		You SHOULD NOT call EMTs for:\n\
		The Captain stubbing their toe, one or two dead bodies, minor viral outbreaks, etc.\n\
		Are you sure you want to call EMTs?",
	EMERGENCY_RESPONSE_POLICE = "You SHOULD call Marshals for:\n\
		Security ignoring Command, Security violating civil rights, Security engaging in Mutiny, \
		General Violation of Terra Government Citizen Rights by Command/Security, etc.\n\
		You SHOULD NOT call Marshals for:\n\
		Corporate affairs, manhunts, settling arguments, etc.\n\
		Are you sure you want to call Marshals?",
	EMERGENCY_RESPONSE_ATMOS = "You SHOULD call Breach Control for:\n\
		Stationwide atmospherics loss, unending fires filling the hallways, or department-sized breaches with Engineering and Atmospherics unable to handle it, etc. \n\
		You SHOULD NOT call Breach Control for:\n\
		A trashcan on fire in the library, a single breached room, heating issues, etc. - especially with capable Engineers/Atmos Techs.\n\
		Are you sure you want to call Breach Control?"
))

/// Internal. Polls ghosts and sends in a team of space cops according to the alert level, accompanied by an announcement.
/obj/machinery/computer/communications/proc/call_911(ordered_team)
	var/team_size
	var/cops_to_send
	var/announcement_message = "Hi hellow."
	var/announcer = "Terra Government Marshal Department"
	var/poll_question = "fuck you leatherman"
	var/list_to_use = "911_responders"
	switch(ordered_team)
		if(EMERGENCY_RESPONSE_POLICE)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/request_911/police
			announcement_message = "Crewmembers of [station_name()]. This is the Terra Government Marshal Department. We've recieved a request for immediate marshal support, and we are \
				sending our best marshals to support your station.\n\n\
				If the first responders request that they need SWAT support to do their job, or to report a faulty 911 call, we will send them in at additional cost to your station to the \
				tune of 20,000 cr.\n\n\
				The transcript of the call is as follows:\n\
				[GLOB.call_911_msg]"
			announcer = "Terra Government Marshal Department"
			poll_question = "The station has called for the Marshals. Will you respond?"
		if(EMERGENCY_RESPONSE_ATMOS)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/request_911/atmos
			announcement_message = "Crewmembers of [station_name()]. This is the Terra Government's 811 dispatch. We've recieved a report of stationwide structural damage, atmospherics loss, fire, or otherwise, and we are \
				sending a Breach Control team to support your station.\n\n\
				If the Breach Control team requests that they need SWAT protection to do their job, or to report a faulty 811 call, we will send them in at additional cost to your station to the \
				tune of 20,000 cr.\n\n\
				The transcript of the call is as follows:\n\
				[GLOB.call_911_msg]"
			announcer = "Terra Government 811 Dispatch - Breach Control"
			poll_question = "The station has called for a Breach Control team. Will you respond?"
		if(EMERGENCY_RESPONSE_EMT)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/request_911/emt
			announcement_message = "Crewmembers of [station_name()]. This is the Terra Government EMTs. We've recieved a request for immediate medical support, and we are \
				sending our best emergency medical technicians to support your station.\n\n\
				If the first responders request that they need SWAT support to do their job, or to report a faulty 911 call, we will send them in at additional cost to your station to the \
				tune of 20,000 cr.\n\n\
				The transcript of the call is as follows:\n\
				[GLOB.call_911_msg]"
			announcer = "Terra Government EMTs"
			poll_question = "The station has called for medical support. Will you respond?"
		if(EMERGENCY_RESPONSE_EMAG)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/pizza/false_call
			announcement_message = "Thank you for ordering from Dogginos, [GLOB.pizza_order]! We're sending you that extra-large party package pizza delivery \
				right away!\n\n\
				Thank you for choosing our premium Fifteen Minutes or Less delivery option! Our pizza will be at your doorstep at [station_name()] as soon as possible thanks \
				to our lightning-fast warp drives installed on all Dogginos delivery shuttles!\n\
				Distance from your chosen Dogginos: 70,000 Lightyears"
			announcer = "Dogginos"
			poll_question = "The station has ordered 35,000 cr in pizza. Will you deliver?"
			list_to_use = "dogginos"
	priority_announce(announcement_message, announcer, 'modular_dripstation/sound/effects/families_police.ogg', has_important_message=TRUE)
	var/list/candidates = pollGhostCandidates(poll_question, "deathsquad")

	if(candidates.len)
		//Pick the (un)lucky players
		var/agents_number = min(team_size, candidates.len)

		var/list/spawnpoints = GLOB.emergencyresponseteamspawn
		var/index = 0
		GLOB.terragov_responder_info[list_to_use][TERRAGOV_AMT] = agents_number
		while(agents_number && candidates.len)
			var/spawn_loc = spawnpoints[index + 1]
			//loop through spawnpoints one at a time
			index = (index + 1) % spawnpoints.len
			var/mob/dead/observer/chosen_candidate = pick(candidates)
			candidates -= chosen_candidate
			if(!chosen_candidate.key)
				continue

			//Spawn the body
			var/mob/living/carbon/human/cop = new(spawn_loc)
			chosen_candidate.client.prefs.apply_prefs_to(cop, TRUE)
			cop.key = chosen_candidate.key

			//Give antag datum
			var/datum/antagonist/ert/request_911/ert_antag = new cops_to_send

			cop.mind.add_antag_datum(ert_antag)
			cop.mind.set_assigned_role(SSjob.GetJobType(ert_antag.ert_job_path))
			SSjob.SendToLateJoin(cop)
			//cop.grant_language(/datum/language/common, TRUE, TRUE, LANGUAGE_MIND)

			//Logging and cleanup
			log_game("[key_name(cop)] has been selected as an [ert_antag.name]")
			agents_number--
	GLOB.cops_arrived = TRUE
	return TRUE

/obj/machinery/computer/communications/proc/pre_911_check(mob/user)
	if (!authenticated_as_silicon_or_captain(user))
		return FALSE

	if (GLOB.cops_arrived)
		to_chat(user, span_warning("911 has already been called this shift!"))
		playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
		return FALSE

	if (!issilicon(user))
		var/obj/item/held_item = user.get_active_held_item()
		var/obj/item/card/id/id_card = held_item?.GetID()
		if (!istype(id_card))
			to_chat(user, span_warning("You need to swipe your ID!"))
			playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
			return FALSE
		if (!(ACCESS_CAPTAIN in id_card.access))
			to_chat(user, span_warning("You are not authorized to do this!"))
			playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
			return FALSE
	else
		to_chat(user, "The console refuses to let you dial 911 as an AI or Cyborg!")
		return FALSE
	return TRUE

/obj/machinery/computer/communications/proc/calling_911(mob/user, called_group_pretty = "EMTs", called_group = EMERGENCY_RESPONSE_EMT)
	message_admins("[ADMIN_LOOKUPFLW(user)] is considering calling the Terra Government [called_group_pretty].")
	var/call_911_msg_are_you_sure = "Are you sure you want to call 911? Faulty 911 calls results in a 20,000 cr fine and a 5 year jail \
		sentence."
	if(tgui_input_list(user, call_911_msg_are_you_sure, "Call 911", list("Yes", "No")) != "Yes")
		return
	message_admins("[ADMIN_LOOKUPFLW(user)] has acknowledged the faulty 911 call consequences.")
	if(tgui_input_list(user, GLOB.call911_do_and_do_not[called_group], "Call [called_group_pretty]", list("Yes", "No")) != "Yes")
		return
	message_admins("[ADMIN_LOOKUPFLW(user)] has read and acknowleged the recommendations for what to call and not call [called_group_pretty] for.")
	var/reason_to_call_911 = stripped_input(user, "What do you wish to call 911 [called_group_pretty] for?", "Call 911", null, MAX_MESSAGE_LEN)
	if(!reason_to_call_911)
		to_chat(user, "You decide not to call 911.")
		return
	GLOB.cops_arrived = TRUE
	GLOB.call_911_msg = reason_to_call_911
	GLOB.caller_of_911 = user.name
	log_game("[key_name(user)] has called the Terra Government [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]")
	message_admins("[ADMIN_LOOKUPFLW(user)] has called the Terra Government [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]")
	deadchat_broadcast(" has called the Terra Government [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]", span_name("[user.real_name]"), user, message_type = DEADCHAT_ANNOUNCEMENT)

	call_911(called_group)
	to_chat(user, span_notice("Authorization confirmed. 911 call dispatched to the Terra Government [called_group_pretty]."))
	playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)

/datum/antagonist/ert/request_911
	name = "911 Responder"
	antag_hud_name = "police"
	//suicide_cry = "FOR THE Terra Government!!"
	var/department = "Some stupid shit"

/datum/antagonist/ert/request_911/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for the Terra Government as a [role].</font></B>"
	missiondesc += "<BR>You are responding to emergency calls from the station for immediate TerraGov [department] assistance!\n"
	missiondesc += "<BR><B>911 Transcript is as follows</B>:"
	missiondesc += "<BR> [GLOB.call_911_msg]"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Contact [GLOB.caller_of_911] and assist them in resolving the matter."
	missiondesc += "<BR> <B>2.</B> Protect, ensure, and uphold the rights of Terra Government citizens on board [station_name()]."
	missiondesc += "<BR> <B>3.</B> If you believe yourself to be in danger, unable to do the job assigned to you due to a dangerous situation, \
		or that the 911 call was made in error, you can use the S.W.A.T. Backup Caller in your backpack to vote on calling a S.W.A.T. team to assist in the situation."
	missiondesc += "<BR> <B>4.</B> When you have finished with your work on the station, use the Beamout Tool in your backpack to beam out yourself \
		along with anyone you are pulling."
	to_chat(owner, missiondesc)
	var/mob/living/greeted_mob = owner.current
	greeted_mob.playsound_local(greeted_mob, 'modular_dripstation/sound/effects/families_police.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)

/datum/outfit/request_911
	name = "911 Response: Base"
	back = /obj/item/storage/backpack/unknown
	box = /obj/item/storage/box/forcing
	backpack_contents = list(/obj/item/terragov_reporter/swat_caller = 1)

/datum/outfit/request_911/post_equip(mob/living/carbon/human/human_to_equip, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/card/id/ID_to_give = human_to_equip.wear_id
	if(istype(ID_to_give))
		ID_to_give.access += ACCESS_TERRAGOV
		ID_to_give.access += ACCESS_TERRAGOVMC
		ID_to_give.access += ACCESS_MAINT_TUNNELS
		ID_to_give.access += ACCESS_EXTERNAL_AIRLOCKS
		shuffle_inplace(ID_to_give.access) // Shuffle access list to make NTNet passkeys less predictable
		ID_to_give.registered_name = human_to_equip.real_name
		if(human_to_equip.age)
			ID_to_give.registered_age = human_to_equip.age
		ID_to_give.update_label()
		ID_to_give.update_icon()
		human_to_equip.sec_hud_set_ID()

/*
*	POLICE
*/

/datum/antagonist/ert/request_911/police
	name = "Marshal"
	role = "Marshal"
	department = "Marshal"
	outfit = /datum/outfit/request_911/police

/datum/outfit/request_911/police
	name = "911 Response: Marshal"
	back = /obj/item/storage/backpack/unknown
	uniform = /obj/item/clothing/under/rank/security/spacepol
	suit = /obj/item/clothing/suit/armor/vest/police
	shoes = /obj/item/clothing/shoes/cowboy/black
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/headset_sec/alt
	head = /obj/item/clothing/head/warden/drill/marshal
	belt = /obj/item/storage/belt/holster/m1911_alt
	r_pocket = /obj/item/lighter
	l_pocket = /obj/item/restraints/handcuffs
	suit_store = /obj/item/melee/classic_baton
	id = /obj/item/card/id/idtags/response_911
	backpack_contents = list(
		/obj/item/lighter = 1,
		/obj/item/storage/box/handcuffs = 1,
		/obj/item/terragov_reporter/swat_caller = 1,
		/obj/item/beamout_tool = 1)

/datum/outfit/request_911/police/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	
	var/obj/item/card/id/ID_to_give = H.wear_id
	if(istype(ID_to_give))
		ID_to_give.access += ACCESS_WEAPONS
		ID_to_give.access += ACCESS_SEC_DOORS
		ID_to_give.access += ACCESS_MAINT_TUNNELS
		ID_to_give.access += ACCESS_EXTERNAL_AIRLOCKS
	
	
	var/obj/item/badge/badge = new /obj/item/badge/security/warden1
	badge.owner_string = H.real_name
	var/obj/item/clothing/suit/my_suit = H.wear_suit
	my_suit.attach_badge(badge)

/*
*	BREACH CONTROL
*/

/datum/antagonist/ert/request_911/atmos
	name = "Breach Control Technician"
	role = "Breach Control Technician"
	department = "Breach Control"
	outfit = /datum/outfit/request_911/atmos

/datum/outfit/request_911/atmos
	name = "811 Response: Breach Control"
	back = /obj/item/storage/backpack/unknown
	uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	suit = /obj/item/clothing/suit/space/hardsuit/dualmode/engineering
	shoes = /obj/item/clothing/shoes/workboots
	ears = /obj/item/radio/headset/headset_eng
	mask = /obj/item/clothing/mask/gas/atmos
	belt = /obj/item/storage/belt/utility/full
	suit_store = /obj/item/tank/internals/oxygen/yellow
	id = /obj/item/card/id/idtags/response_911
	l_pocket = /obj/item/extinguisher/mini
	backpack_contents = list(
		/obj/item/extinguisher = 1,
		/obj/item/storage/box/smart_metal_foam = 2,
		/obj/item/terragov_reporter/swat_caller = 1,
		/obj/item/beamout_tool = 1)

/datum/outfit/request_911/atmos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	
	var/obj/item/card/id/ID_to_give = H.wear_id
	if(istype(ID_to_give))
		ID_to_give.access += ACCESS_ENGINE
		ID_to_give.access += ACCESS_EVA
		ID_to_give.access += ACCESS_ENGINE_EQUIP
		ID_to_give.access += ACCESS_TCOMSAT
		ID_to_give.access += ACCESS_CONSTRUCTION
		ID_to_give.access += ACCESS_NETWORK
		ID_to_give.access += ACCESS_RESEARCH
		ID_to_give.access += ACCESS_ATMOSPHERICS
		ID_to_give.access += ACCESS_MINERAL_STOREROOM

/*
*	EMT
*/

/datum/antagonist/ert/request_911/emt
	name = "Emergency Medical Technician"
	role = "EMT"
	department = "EMT"
	outfit = /datum/outfit/request_911/emt

/datum/outfit/request_911/emt
	name = "911 Response: EMT"
	back = /obj/item/storage/backpack/unknown
	uniform = /obj/item/clothing/under/rank/medical/paramedic/emt
	shoes = /obj/item/clothing/shoes/sneakers/white
	ears = /obj/item/radio/headset/headset_med
	head = /obj/item/clothing/head/soft/emt
	id = /obj/item/card/id/idtags/response_911
	suit =  /obj/item/clothing/suit/toggle/labcoat/emt
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	l_pocket = /obj/item/storage/pouch/surgery/full
	belt = /obj/item/storage/belt/medical
	suit_store = /obj/item/flashlight/pen/paramedic
	backpack_contents = list(
		/obj/item/roller = 1,
		/obj/item/terragov_reporter/swat_caller = 1,
		/obj/item/beamout_tool = 1)

/datum/outfit/request_911/emt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	
	var/obj/item/card/id/ID_to_give = H.wear_id
	if(istype(ID_to_give))
		ID_to_give.access += ACCESS_EVA
		ID_to_give.access += ACCESS_MEDICAL
		ID_to_give.access += ACCESS_RESEARCH

/datum/antagonist/ert/request_911/swat
	name = "Armed S.W.A.T. Officer"
	role = "S.W.A.T. Officer"
	department = "Police"
	outfit = /datum/outfit/request_911/swat

/datum/antagonist/ert/request_911/swat/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for the Terra Government as a [role].</font></B>"
	missiondesc += "<BR>You are here to backup the 911 first responders, as they have reported for your assistance..\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>2.</B> Arrest anyone who interferes the work of the first responders."
	missiondesc += "<BR> <B>3.</B> Use lethal force in the arrest of the suspects if they will not comply, or the station refuses to comply."
	missiondesc += "<BR> <B>4.</B> If you believe the station is engaging in treason and is firing upon first responders and S.W.A.T. members, use the \
		Treason Reporter in your backpack to call the military."
	missiondesc += "<BR> <B>5.</B> When you have finished with your work on the station, use the Beamout Tool in your backpack to beam out yourself \
		along with anyone you are pulling."
	to_chat(owner, missiondesc)
	var/mob/living/greeted_mob = owner.current
	greeted_mob.playsound_local(greeted_mob, 'modular_dripstation/sound/effects/families_police.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)

/datum/outfit/request_911/swat
	name = "911 Response: Armed S.W.A.T. Officer"
	back = /obj/item/storage/backpack/unknown
	uniform = /obj/item/clothing/under/rank/security/spacepol/camo
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/sunglasses/aviators
	mask = /obj/item/clothing/mask/sec_clava/terrapol
	ears = /obj/item/radio/headset/headset_sec/alt
	head = /obj/item/clothing/head/helmet/riot/spacepol
	belt = /obj/item/storage/belt/holster/m1911_alt
	suit = /obj/item/clothing/suit/space/swat
	r_pocket = /obj/item/storage/pouch/shotgun/full
	l_pocket = /obj/item/storage/pouch/magazine/pistol/m45full
	id = /obj/item/card/id/idtags/response_911
	suit_store = /obj/item/gun/ballistic/shotgun/riot
	backpack_contents = list(/obj/item/storage/box/handcuffs = 2,
		/obj/item/melee/baton/loaded = 1,
		/obj/item/lighter = 1,
		/obj/item/terragov_reporter/treason_reporter = 1,
		/obj/item/beamout_tool = 1)

/datum/outfit/request_911/swat/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	
	var/obj/item/card/id/ID_to_give = H.wear_id
	if(istype(ID_to_give))
		ID_to_give.access += ACCESS_WEAPONS
		ID_to_give.access += ACCESS_HEADS
		ID_to_give.access += ACCESS_BRIG

/datum/antagonist/ert/request_911/military
	name = "Terra Government Military"
	role = "Private"
	department = "Military"
	outfit = /datum/outfit/terragov/request_911

/datum/antagonist/ert/request_911/military/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for the Terra Government as a [role].</font></B>"
	missiondesc += "<BR>You are here to assume control of [station_name()] due to the occupants engaging in Treason as reported by our SWAT team.\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>2.</B> Arrest all suspects involved in the treason attempt."
	missiondesc += "<BR> <B>3.</B> Assume control of the station for the Terra Government, and initiate evacuation procedures to get non-offending citizens \
		away from the scene."
	missiondesc += "<BR> <B>4.</B> If you need to use lethal force, do so, but only if you must."
	to_chat(owner, missiondesc)
	var/mob/living/greeted_mob = owner.current
	greeted_mob.playsound_local(greeted_mob, 'modular_dripstation/sound/effects/families_police.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)

/datum/outfit/terragov/request_911
	name = "911 Response: T.G.A.F. Infantry Trooper"
	belt = /obj/item/storage/belt/military/webbing/terragov
	backpack_contents = list(
		/obj/item/storage/box/handcuffs = 1,
		/obj/item/melee/baton/loaded = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/beamout_tool = 1)

/datum/outfit/terragov/request_911/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	//Could use a type
	var/obj/item/storage/belt/military/webbing/terragov/belt_store = H.belt
	for(var/i = 3 to 0 step -1)
		SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/r556, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/ammo_box/magazine/m45, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/flashlight/glowstick/blue, null, TRUE, TRUE)
	SEND_SIGNAL(belt_store, COMSIG_TRY_STORAGE_INSERT, new /obj/item/grenade/syndieminibomb/concussion/frag, null, TRUE, TRUE)

/obj/item/terragov_reporter
	name = "TerraGov reporter"
	desc = "Use this in-hand to vote to call TerraGov backup. If half your team votes for it, SWAT will be dispatched."
	icon = 'modular_dripstation/icons/obj/misc.dmi'
	icon_state = "reporter_off"
	w_class = WEIGHT_CLASS_SMALL
	/// Was the reporter turned on?
	var/activated = FALSE
	/// What antagonist should be required to use the reporter?
	var/type_to_check = /datum/antagonist/ert/request_911
	/// What table should we be incrementing votes in and checking against in the TerraGov responders global?
	var/type_of_callers = "911_responders"
	/// What source should be supplied for the announcement message?
	var/announcement_source = "Terra Government S.W.A.T."
	/// Should the station be issued a fine when the vote completes?
	var/fine_station = TRUE
	/// What poll message should we show to the ghosts when they are asked to join the squad?
	var/ghost_poll_msg = "example crap"
	/// How many ghosts should we pick from the applicants to become members of the squad?
	var/amount_to_summon = 4
	/// What antagonist type should we give to the ghosts?
	var/type_to_summon = /datum/antagonist/ert/request_911/swat
	/// What table should be be incrementing amount in in the TerraGov responders global?
	var/summoned_type = "swat"
	/// What jobban should we be checking for the ghost polling?
	var/jobban_to_check = ROLE_DEATHSQUAD
	/// What announcement message should be displayed if the vote succeeds?
	var/announcement_message = "Example announcement message"

/obj/item/terragov_reporter/proc/pre_checks(mob/user)
	if(GLOB.terragov_responder_info[type_of_callers][TERRAGOV_AMT] == 0)
		to_chat(user, span_warning("There are no responders. You likely spawned this in as an admin. Please don't do this."))
		return FALSE
	if(!user.mind.has_antag_datum(type_to_check))
		to_chat(user, span_warning("You don't know how to use this!"))
		return FALSE
	return TRUE

/obj/item/terragov_reporter/proc/questions(mob/user)
	return TRUE

/obj/item/terragov_reporter/attack_self(mob/user, modifiers)
	. = ..()
	if(!pre_checks(user))
		return
	if(!activated && !GLOB.terragov_responder_info[type_of_callers][TERRAGOV_DECLARED])
		if(!questions(user))
			return
		activated = TRUE
		icon_state = "reporter_on"
		GLOB.terragov_responder_info[type_of_callers][TERRAGOV_VOTES]++
		var/current_votes = GLOB.terragov_responder_info[type_of_callers][TERRAGOV_VOTES]
		var/amount_of_responders = GLOB.terragov_responder_info[type_of_callers][TERRAGOV_AMT]
		to_chat(user, span_warning("You have activated the device. \
		Current Votes: [current_votes]/[amount_of_responders] votes."))
		if(current_votes >= amount_of_responders * 0.5)
			GLOB.terragov_responder_info[type_of_callers][TERRAGOV_DECLARED] = TRUE
			if(fine_station)
				var/datum/bank_account/station_balance = SSeconomy.get_dep_account(ACCOUNT_CAR)
				station_balance?._adjust_money(TERRAGOV_FINE_AMOUNT) // paying for the gas to drive all the fuckin' way out to the frontier

			priority_announce(announcement_message, announcement_source, 'modular_dripstation/sound/effects/families_police.ogg', has_important_message = TRUE)
			var/list/candidates = pollGhostCandidates(ghost_poll_msg, jobban_to_check)

			if(candidates.len)
				//Pick the (un)lucky players
				var/agents_number = min(amount_to_summon, candidates.len)
				GLOB.terragov_responder_info[summoned_type][TERRAGOV_AMT] = agents_number

				var/list/spawnpoints = GLOB.emergencyresponseteamspawn
				var/index = 0
				while(agents_number && candidates.len)
					var/spawn_loc = spawnpoints[index + 1]
					//loop through spawnpoints one at a time
					index = (index + 1) % spawnpoints.len
					var/mob/dead/observer/chosen_candidate = pick(candidates)
					candidates -= chosen_candidate
					if(!chosen_candidate.key)
						continue

					//Spawn the body
					var/mob/living/carbon/human/cop = new(spawn_loc)
					chosen_candidate.client.prefs.apply_prefs_to(cop, TRUE)
					cop.key = chosen_candidate.key

					//Give antag datum
					var/datum/antagonist/ert/request_911/ert_antag = new type_to_summon

					cop.mind.add_antag_datum(ert_antag)
					cop.mind.set_assigned_role(SSjob.GetJobType(ert_antag.ert_job_path))
					SSjob.SendToLateJoin(cop)
					//cop.grant_language(/datum/language/common, TRUE, TRUE, LANGUAGE_MIND)

					//Logging and cleanup
					log_game("[key_name(cop)] has been selected as an [ert_antag.name]")
					agents_number--

/obj/item/terragov_reporter/swat_caller
	name = "S.W.A.T. backup caller"
	desc = "Use this in-hand to vote to call TerraGov S.W.A.T. backup. If half your team votes for it, SWAT will be dispatched."
	type_to_check = /datum/antagonist/ert/request_911
	type_of_callers = "911_responders"
	announcement_source = "Terra Government S.W.A.T."
	fine_station = TRUE
	ghost_poll_msg = "The TerraGov 911 services have requested a S.W.A.T. backup. Do you wish to become a S.W.A.T. member?"
	amount_to_summon = 6
	type_to_summon = /datum/antagonist/ert/request_911/swat
	summoned_type = "swat"
	announcement_message = "Hello, crewmembers. Our emergency services have requested S.W.A.T. backup, either for assistance doing their job due to crew \
		impediment, or due to a fraudulent 911 call. We have billed the station 20,000 cr for this, to cover the expenses of flying a second emergency response to \
		your station. Please comply with all requests by said S.W.A.T. members."

/obj/item/terragov_reporter/swat_caller/questions(mob/user)
	var/question = "Does the situation require additional S.W.A.T. backup, involve the station impeding you from doing your job, \
		or involve the station making a fraudulent 911 call and needing an arrest made on the caller?"
	if(tgui_input_list(user, question, "S.W.A.T. Backup Caller", list("Yes", "No")) != "Yes")
		to_chat(user, "You decide not to request S.W.A.T. backup.")
		return FALSE
	message_admins("[ADMIN_LOOKUPFLW(user)] has voted to summon S.W.A.T backup.")
	return TRUE

/obj/item/terragov_reporter/treason_reporter
	name = "treason reporter"
	desc = "Use this in-hand to vote that the station is engaging in Treason. If half your team votes for it, the Military will handle the situation."
	type_to_check = /datum/antagonist/ert/request_911/swat
	type_of_callers = "swat"
	announcement_source = "Terra Government National Guard"
	fine_station = FALSE
	ghost_poll_msg = "The station has decided to engage in treason. Do you wish to join the Terra Government Military?"
	amount_to_summon = 12
	type_to_summon = /datum/antagonist/ert/request_911/military
	summoned_type = "military"
	announcement_message = "Crewmembers of the station. You have refused to comply with first responders and SWAT officers, and have assaulted them, \
		and they are unable to carry out the wills of the Terra Government, despite residing within Terra Government borders.\n\
		As such, we are charging those responsible with Treason. The penalty of which is death, or no less than twenty-five years in jail.\n\
		Treason is a serious crime. Our military forces are en route to your station. They will be assuming direct control of the station, and \
		will be evacuating civilians from the scene.\n\
		Non-offending citizens, prepare for evacuation. Comply with all orders given to you by Terra Government military personnel.\n\
		To all those who are engaging in treason, lay down your weapons and surrender. Refusal to comply may be met with lethal force."

/obj/item/terragov_reporter/treason_reporter/questions(mob/user)
	var/list/list_of_questions = list(
		"Treason is the crime of attacking a state authority to which one owes allegiance. The station is located within Terra Government space, \
			and owes allegiance to the Terra Government despite being owned by Nanotrasen. Did the station engage in this today?",
		"Did station crewmembers assault you or the SWAT team at the direction of Security and/or Command?",
		"Did station crewmembers actively prevent you and the SWAT team from accomplishing your objectives at the direction of Security and/or Command?",
		"Were you and your fellow SWAT members unable to handle the issue on your own?",
		"Are you absolutely sure you wish to declare the station as engaging in Treason? Misuse of this can and will result in \
			administrative action against your account."
	)
	for(var/question in list_of_questions)
		if(tgui_input_list(user, question, "Treason Reporter", list("Yes", "No")) != "Yes")
			to_chat(user, "You decide not to declare the station as treasonous.")
			return FALSE
	message_admins("[ADMIN_LOOKUPFLW(user)] has acknowledged the consequences of a false claim of Treason administratively, \
		and has voted that the station is engaging in Treason.")
	return TRUE

/obj/item/terragov_reporter/pizza_managers
	name = "Dogginos uncompliant customer reporter"
	desc = "Use this in-hand to vote to call for Dogginos Regional Managers if the station refuses to pay for their pizza. \
		If half your delivery squad votes for it, Dogginos Regional Managers will be dispatched."
	type_to_check = /datum/antagonist/ert/pizza/false_call
	type_of_callers = "dogginos"
	announcement_message = "Hey there, custo-mores! Our delivery drivers have reported that you guys are having some issues with payment for your order that \
		you placed at the Dogginos that's the seventh furthest Dogginos in the galaxy from your station, and we want to ensure maximum customer satisfaction and \
		employee satisfaction as well.\n\
		We've gone ahead and sent some some of our finest regional managers to handle the situation.\n\
		We hope you enjoy your pizzas, and that we'll be able to recieve the bill of 35,000 cr plus the fifteen percent tip for our drivers shortly!"
	announcement_source = "Dogginos"
	fine_station = FALSE
	ghost_poll_msg = "Dogginos is sending regional managers to get the station to pay up the pizza money they owe. Are you ready to do some Customer Relations?"
	amount_to_summon = 8
	type_to_summon = /datum/antagonist/ert/pizza/leader/false_call
	summoned_type = "dogginos_manager"

/obj/item/terragov_reporter/pizza_managers/questions(mob/user)
	if(tgui_input_list(user, "Is the station refusing to pay their bill of 35,000 cr, including a fifteen percent tip for delivery drivers?", "Dogginos Uncompliant Customer Reporter", list("Yes", "No")) != "Yes")
		to_chat(user, "You decide not to request management assist you with the delivery.")
		return FALSE
	message_admins("[ADMIN_LOOKUPFLW(user)] has voted to summon Dogginos management to resolve the lack of payment.")
	return TRUE

/datum/antagonist/ert/pizza/false_call
	outfit = /datum/outfit/centcom/ert/pizza/false_call

/datum/outfit/centcom/ert/pizza/false_call
	backpack_contents = list(
		/obj/item/storage/box/forcing,
		/obj/item/kitchen/knife/combat/survival,
		/obj/item/storage/box/ingredients/italian,
		/obj/item/terragov_reporter/pizza_managers,
	)
	r_hand = /obj/item/pizzabox/meat
	l_hand = /obj/item/pizzabox/vegetable

/datum/antagonist/ert/pizza/false_call/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for Dogginos as a delivery person.</font></B>"
	missiondesc += "<BR>You are here to deliver some pizzas from Dogginos!\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Deliver the pizzas ordered by [GLOB.pizza_order]."
	missiondesc += "<BR> <B>2.</B> Collect the bill, which totals to 35,000 cr plus a fifteen percent tip for delivery drivers."
	missiondesc += "<BR> <B>3.</B> If they refuse to pay, you may summon the Dogginos Regional Managers to help resolve the issue."
	to_chat(owner, missiondesc)

/datum/antagonist/ert/pizza/leader/false_call/greet()
	var/missiondesc =  ""
	missiondesc += "<B><font size=5 color=red>You are NOT a Nanotrasen Employee. You work for Dogginos as a Regional Manager.</font></B>"
	missiondesc += "<BR>You are here to resolve a dispute with some customers who refuse to pay their bill!\n"
	missiondesc += "<BR><B>Your Mission</B>:"
	missiondesc += "<BR> <B>1.</B> Collect the money owed by [GLOB.pizza_order], which amounts to 35,000 cr plus a fifteen percent tip for the delivery drivers."
	missiondesc += "<BR> <B>2.</B> Use any means necessary to collect the owed funds. The thousand degree knife in your backpack will help in this task."
	to_chat(owner, missiondesc)

/obj/item/beamout_tool
	name = "beam-out tool" // TODO, find a way to make this into drop pods cuz that's cooler visually
	desc = "Use this to begin the lengthy beam-out  process to return to Terra Government space. It will bring anyone you are pulling with you."
	icon = 'modular_dripstation/icons/obj/misc.dmi'
	icon_state = "beam_me_up_scotty"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/beamout_tool/attack_self(mob/user, modifiers)
	. = ..()
	if(!user.mind.has_antag_datum(/datum/antagonist/ert/request_911))
		to_chat(user, span_warning("You don't understand how to use this device."))
		return
	message_admins("[ADMIN_LOOKUPFLW(user)] has begun to beam-out using their beam-out tool.")
	to_chat(user, "You have begun the beam-out process. Please wait for the beam to reach the station.")
	user.balloon_alert(user, "begun beam-out")
	if(do_after(user, 30 SECONDS))
		to_chat(user, "You have completed the beam-out process and are returning to the Terra Government.")
		message_admins("[ADMIN_LOOKUPFLW(user)] has beamed themselves out.")
		if(isliving(user))
			var/mob/living/living_user = user
			if(living_user.pulling)
				if(ishuman(living_user.pulling))
					var/mob/living/carbon/human/beamed_human = living_user.pulling
					message_admins("[ADMIN_LOOKUPFLW(user)] has beamed out [ADMIN_LOOKUPFLW(beamed_human)] alongside them.")
				else
					message_admins("[ADMIN_LOOKUPFLW(user)] has beamed out [living_user.pulling] alongside them.")
				var/turf/pulling_turf = get_turf(living_user.pulling)
				playsound(pulling_turf, 'sound/magic/Repulse.ogg', 100, 1)
				var/datum/effect_system/spark_spread/quantum/sparks = new
				sparks.set_up(10, 1, pulling_turf)
				sparks.attach(pulling_turf)
				sparks.start()
				qdel(living_user.pulling)
			var/turf/user_turf = get_turf(living_user)
			playsound(user_turf, 'sound/magic/Repulse.ogg', 100, 1)
			var/datum/effect_system/spark_spread/quantum/sparks = new
			sparks.set_up(10, 1, user_turf)
			sparks.attach(user_turf)
			sparks.start()
			qdel(user)
	else
		user.balloon_alert(user, "beam-out cancelled")
