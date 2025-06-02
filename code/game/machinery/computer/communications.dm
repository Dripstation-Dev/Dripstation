#define IMPORTANT_ACTION_COOLDOWN (60 SECONDS)
#define MAX_STATUS_LINE_LENGTH 40

#define STATE_BUYING_SHUTTLE "buying_shuttle"
#define STATE_CHANGING_STATUS "changing_status"
#define STATE_MAIN "main"
#define STATE_MESSAGES "messages"

#define STATE_BUYING_MERCENARIES "buying_mercenaries"

/*
#define FREE_MERC "I`m here to loot your corpses."
#define MILITECH_MERC "Heavy here."
#define SHELLGUARD_MERC "Sec+"
GLOBAL_LIST_INIT(mercs_datums_list, list(
	FREE_MERC = /datum/merc/free,
	MILITECH_MERC = /datum/merc/militech,
	SHELLGUARD_MERC = /datum/merc/shellguard,
	))

GLOBAL_LIST_INIT(mercs_datums_list, list ( \
	new/datum/merc/militech("Militech Corp&Gov Asset Security", "group of 3 operatives", 3, 200, null, "kva"), \
	new/datum/merc/shellguard("Shellguard", "group of 5 operatives", 5, 100, null, "kva"), \
	))
*/


GLOBAL_VAR_INIT(cops_arrived, FALSE)
#define EMERGENCY_RESPONSE_POLICE "WOOP WOOP THAT'S THE SOUND OF THE POLICE"
#define EMERGENCY_RESPONSE_ATMOS "DISCO INFERNO"
#define EMERGENCY_RESPONSE_EMT "AAAAAUGH, I'M DYING, I NEEEEEEEEEED A MEDIC BAG"
#define EMERGENCY_RESPONSE_EMAG "AYO THE PIZZA HERE"

// The communications computer
/obj/machinery/computer/communications
	name = "communications console"
	desc = "A console used for high-priority announcements and emergencies."
	icon_screen = "comm"
	icon_keyboard = "tech_key"
	req_access = list(ACCESS_HEADS)
	circuit = /obj/item/circuitboard/computer/communications
	light_color = LIGHT_COLOR_BLUE

	/// Cooldown for important actions, such as messaging CentCom or other sectors
	COOLDOWN_DECLARE(static/important_action_cooldown)

	/// The current state of the UI
	var/state = STATE_MAIN

	/// The current state of the UI for AIs
	var/cyborg_state = STATE_MAIN

	/// The name of the user who logged in
	var/authorize_name

	/// The access that the card had on login
	var/list/authorize_access

	/// The messages this console has been sent
	var/list/datum/comm_message/messages

	/// How many times the alert level has been changed
	/// Used to clear the modal to change alert level
	var/alert_level_tick = 0

	/// The last lines used for changing the status display
	var/static/last_status_display

	/// Allows use off station z-level
	var/unlocked = FALSE

	var/list/mercs_datums_list = list(
	/datum/merc/free,
	/datum/merc/militech,
	/datum/merc/shellguard,
	/datum/merc/gorlex,
	)

/obj/machinery/computer/communications/unlocked
	unlocked = TRUE

/obj/machinery/computer/communications/Initialize(mapload)
	. = ..()
	GLOB.shuttle_caller_list += src
	AddComponent(/datum/component/gps, "Secured Communications Signal")

/// Are we NOT a silicon, AND we're logged in as the captain?
/obj/machinery/computer/communications/proc/authenticated_as_non_silicon_captain(mob/user)
	if(is_synth(user))
		return FALSE
	if (issilicon(user))
		return FALSE
	return ACCESS_CAPTAIN in authorize_access

/// Are we a silicon, OR we're logged in as the captain?
/obj/machinery/computer/communications/proc/authenticated_as_silicon_or_captain(mob/user)
	if(is_synth(user))
		return FALSE
	if (issilicon(user))
		return TRUE
	return ACCESS_CAPTAIN in authorize_access

/// Are we NOT a silicon, AND we're logged in as a head
/obj/machinery/computer/communications/proc/authenticated_as_non_silicon_head(mob/user)
	if(issilicon(user))
		return FALSE
	return ACCESS_HEADS in authorize_access

/// Are we a silicon, OR logged in?
/obj/machinery/computer/communications/proc/authenticated(mob/user)
	if (issilicon(user))
		return TRUE
	return authenticated

/obj/machinery/computer/communications/attackby(obj/I, mob/user, params)
	if(istype(I, /obj/item/card/id))
		attack_hand(user)
	else
		return ..()

/obj/machinery/computer/communications/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return FALSE
	obj_flags |= EMAGGED
	if (authenticated)
		authorize_access = get_all_accesses()
	to_chat(user, span_danger("You scramble the communication routing circuits!"))
	playsound(src, 'sound/machines/terminal_alert.ogg', 50, 0)
	return TRUE

/obj/machinery/computer/communications/ui_act(action, list/params)
	var/static/list/approved_states = list(STATE_BUYING_SHUTTLE, STATE_BUYING_MERCENARIES, STATE_CHANGING_STATUS, STATE_MAIN, STATE_MESSAGES)	//dripstation edit
	var/static/list/approved_status_pictures = list("biohazard", "blank", "default", "lockdown", "redalert", "shuttle")

	. = ..()
	if (.)
		return

	. = TRUE

	if(authenticated(usr) && !unlocked && !is_station_level(z) && !IsAdminGhost(usr))
		if(issilicon(usr))
			visible_message("An error appears on the screen: Unable to contact authentication servers. Please move closer to the station.")
			return
		action = "toggleAuthentication" // We actually want to log out
		visible_message("An error appears on the screen: Unable to communicate with the station. Logging out.")

	switch (action)
		if ("answerMessage")
			if (!authenticated(usr))
				return

			var/answer_index = params["answer"]
			var/message_index = params["message"]

			// If either of these aren't numbers, then bad voodoo.
			if(!isnum(answer_index) || !isnum(message_index))
				message_admins("[ADMIN_LOOKUPFLW(usr)] provided an invalid index type when replying to a message on [src] [ADMIN_JMP(src)]. This should not happen. Please check with a maintainer and/or consult tgui logs.")
				CRASH("Non-numeric index provided when answering comms console message.")

			if (!answer_index || !message_index || answer_index < 1 || message_index < 1)
				return
			var/datum/comm_message/message = messages[message_index]
			if (message.answered)
				return
			message.answered = answer_index
			message.answer_callback.InvokeAsync()
		if ("callShuttle")
			if (!authenticated(usr))
				return
			var/reason = trim(params["reason"], MAX_MESSAGE_LEN)
			if (length(reason) < CALL_SHUTTLE_REASON_LENGTH)
				return
			SSshuttle.requestEvac(usr, reason)
			post_status("shuttle")
		if ("changeSecurityLevel")
			if (!COOLDOWN_FINISHED(src, important_action_cooldown))
				to_chat(usr, span_warning("The system is not able to change the security alert level more than once per minute, please wait."))
				return

			// Check if they have
			if (!issilicon(usr))
				var/obj/item/held_item = usr.get_active_held_item()
				var/obj/item/card/id/id_card = held_item?.GetID()
				if (!istype(id_card))
					to_chat(usr, span_warning("You need to swipe your ID!"))
					playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
					return
				if (!(ACCESS_HEADS in id_card.access))
					to_chat(usr, span_warning("You are not authorized to do this!"))
					playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
					return

			var/new_sec_level = SSsecurity_level.text_level_to_number(params["newSecurityLevel"])
			if (new_sec_level != SEC_LEVEL_GREEN && new_sec_level != SEC_LEVEL_BLUE)
				return
			if (SSsecurity_level.get_current_level_as_number() == new_sec_level)
				return

			SSsecurity_level.set_level(new_sec_level)

			to_chat(usr, span_notice("Authorization confirmed. Modifying security level."))
			playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)

			// Only notify people if an actual change happened
			log_game("[key_name(usr)] has changed the security level to [params["newSecurityLevel"]] with [src] at [AREACOORD(usr)].")
			message_admins("[ADMIN_LOOKUPFLW(usr)] has changed the security level to [params["newSecurityLevel"]] with [src] at [AREACOORD(usr)].")
			deadchat_broadcast(" has changed the security level to [params["newSecurityLevel"]] with [src] at [span_name("[get_area_name(usr, TRUE)]")].", span_name("[usr.real_name]"), usr)

			alert_level_tick += 1
			COOLDOWN_START(src, important_action_cooldown, IMPORTANT_ACTION_COOLDOWN)
		if ("deleteMessage")
			if (!authenticated(usr))
				return
			var/message_index = text2num(params["message"])
			if (!message_index)
				return
			LAZYREMOVE(messages, LAZYACCESS(messages, message_index))
		if ("makePriorityAnnouncement")
			if (!authenticated_as_silicon_or_captain(usr))
				return
			make_announcement(usr)
		if ("makeVoiceAnnouncement")
			if (!authenticated_as_non_silicon_captain(usr))
				return
			make_voice_announcement(usr)
		if ("messageAssociates")
			if (!authenticated_as_non_silicon_captain(usr))
				return
			if (!COOLDOWN_FINISHED(src, important_action_cooldown))
				return

			playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)
			var/message = trim(html_encode(params["message"]), MAX_MESSAGE_LEN)

			var/emagged = obj_flags & EMAGGED
			if (emagged)
				message_syndicate(message, usr)
				to_chat(usr, span_danger("SYSERR @l(19833)of(transmit.dm): !@$ MESSAGE TRANSMITTED TO SYNDICATE COMMAND."))
			else
				message_centcom(message, usr)
				to_chat(usr, span_notice("Message transmitted to Central Command."))

			var/associates = emagged ? "the Syndicate": "CentCom"
			usr.log_talk(message, LOG_SAY, tag = "message to [associates]")
			deadchat_broadcast(" has messaged [associates], \"[message]\" at [span_name("[get_area_name(usr, TRUE)]")].", span_name("[usr.real_name]"), usr)
			COOLDOWN_START(src, important_action_cooldown, IMPORTANT_ACTION_COOLDOWN)
		if ("purchaseShuttle")
			var/can_buy_shuttles_or_fail_reason = can_buy_shuttles(usr)
			if (can_buy_shuttles_or_fail_reason != TRUE)
				if (can_buy_shuttles_or_fail_reason != FALSE)
					to_chat(usr, span_alert("[can_buy_shuttles_or_fail_reason]"))
				return
			var/list/shuttles = flatten_list(SSmapping.shuttle_templates)
			var/datum/map_template/shuttle/shuttle = locate(params["shuttle"]) in shuttles
			if (!istype(shuttle))
				return
			if (!can_purchase_this_shuttle(shuttle))
				return
			if (!shuttle.prerequisites_met())
				to_chat(usr, span_alert("You have not met the requirements for purchasing this shuttle."))
				return
			var/datum/bank_account/bank_account = SSeconomy.get_dep_account(ACCOUNT_CAR)
			if (bank_account.account_balance < shuttle.credit_cost)
				return
			SSshuttle.shuttle_purchased = SHUTTLEPURCHASE_PURCHASED
			if(obj_flags & EMAGGED)
				SSshuttle.emag_shuttle_purchased = TRUE
			SSshuttle.unload_preview()
			SSshuttle.existing_shuttle = SSshuttle.emergency
			SSshuttle.emergency.name = shuttle.name
			SSshuttle.action_load(shuttle, replace = TRUE)
			bank_account.adjust_money(-shuttle.credit_cost)
			minor_announce("[authorize_name] has purchased [shuttle.name] for [shuttle.credit_cost] credits.[shuttle.extra_desc ? " [shuttle.extra_desc]" : ""]" , "Shuttle Purchase")
			message_admins("[ADMIN_LOOKUPFLW(usr)] purchased [shuttle.name].")
			SSblackbox.record_feedback("text", "shuttle_purchase", 1, shuttle.name)
			state = STATE_MAIN
		if ("purchaseMercenaries")
			var/can_buy_mercenaries_or_fail_reason = can_buy_mercenaries(usr)
			if (can_buy_mercenaries_or_fail_reason != TRUE)
				return

			//var/list/mercs_list = flatten_list(mercs_datums_list)
			var/t = locate(params["mercs_type"]) in mercs_datums_list
			var/datum/merc/mercs_type = t
			//if (!istype(mercs_type))
			//	return
			//if(!(mercs_type in GLOB.mercs_datums_list))
			//	return
			if (!can_purchase_this_mercs(mercs_type))
				return

			var/datum/bank_account/bank_account = SSeconomy.get_dep_account(ACCOUNT_CAR)
			if (bank_account.account_balance < mercs_type.credit_cost)
				return
			bank_account.adjust_money(-mercs_type.credit_cost)
			trigger_armed_mercs(mercs_type)
			minor_announce("[authorize_name] has purchased [mercs_type.name] for [mercs_type.credit_cost] credits.[mercs_type.extra_desc ? " [mercs_type.extra_desc]" : ""]" , "Merc Purchase")
			message_admins("[ADMIN_LOOKUPFLW(usr)] purchased [mercs_type.name].")
			SSblackbox.record_feedback("text", "merc_purchase", 1, mercs_type.name)
			state = STATE_MAIN
		if ("recallShuttle")
			// AIs cannot recall the shuttle
			if (!authenticated(usr) || issilicon(usr))
				return
			SSshuttle.cancelEvac(usr)
		if ("requestNukeCodes")
			if (!authenticated_as_non_silicon_captain(usr))
				return
			if (!COOLDOWN_FINISHED(src, important_action_cooldown))
				return
			var/reason = trim(html_encode(params["reason"]), MAX_MESSAGE_LEN)
			nuke_request(reason, usr)
			to_chat(usr, span_notice("Request sent."))
			usr.log_message("has requested the nuclear codes from CentCom with reason \"[reason]\"", LOG_SAY)
			priority_announce("The codes for the on-station nuclear self-destruct have been requested by [authorize_name]. Confirmation or denial of this request will be sent shortly.", "Nuclear Self-Destruct Codes Requested", SSstation.announcer.get_rand_report_sound())
			playsound(src, 'sound/machines/terminal_prompt.ogg', 50, FALSE)
			COOLDOWN_START(src, important_action_cooldown, IMPORTANT_ACTION_COOLDOWN)
		if ("restoreBackupRoutingData")
			if (!authenticated_as_non_silicon_captain(usr))
				return
			if (!(obj_flags & EMAGGED))
				return
			to_chat(usr, span_notice("Backup routing data restored."))
			playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)
			obj_flags &= ~EMAGGED
		if ("sendToOtherSector")
			if (!authenticated_as_non_silicon_captain(usr))
				return
			if (!can_send_messages_to_other_sectors(usr))
				return
			if (!COOLDOWN_FINISHED(src, important_action_cooldown))
				return

			var/message = trim(html_encode(params["message"]), MAX_MESSAGE_LEN)
			if (!message)
				return

			playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)

			var/destination = params["destination"]

			send2otherserver(station_name(), message, "Comms_Console", destination == "all" ? null : list(destination))
			minor_announce(message, title = "Outgoing message to allied station")
			usr.log_talk(message, LOG_SAY, tag = "message to the other server")
			message_admins("[ADMIN_LOOKUPFLW(usr)] has sent a message to the other server\[s].")
			deadchat_broadcast(" has sent an outgoing message to the other station(s).</span>", "<span class='bold'>[usr.real_name]", usr)

			COOLDOWN_START(src, important_action_cooldown, IMPORTANT_ACTION_COOLDOWN)
		if ("setState")
			if (!authenticated(usr))
				return
			if (!(params["state"] in approved_states))
				return
			if (state == STATE_BUYING_SHUTTLE && can_buy_shuttles(usr) != TRUE)
				return
			if (state == STATE_BUYING_MERCENARIES && can_buy_mercenaries(usr) != TRUE)
				return
			set_state(usr, params["state"])
			playsound(src, "terminal_type", 50, FALSE)
		if ("setStatusMessage")
			if (!authenticated(usr))
				return
			var/line_one = reject_bad_text(params["lineOne"] || "", MAX_STATUS_LINE_LENGTH)
			var/line_two = reject_bad_text(params["lineTwo"] || "", MAX_STATUS_LINE_LENGTH)
			post_status("alert", "blank")
			post_status("message", line_one, line_two)
			last_status_display = list(line_one, line_two)
			playsound(src, "terminal_type", 50, FALSE)
		if ("setStatusPicture")
			if (!authenticated(usr))
				return
			var/picture = params["picture"]
			if (!(picture in approved_status_pictures))
				return
			post_status("alert", picture)
			playsound(src, "terminal_type", 50, FALSE)
		if ("toggleAuthentication")
			// Log out if we're logged in
			if (authorize_name)
				authenticated = FALSE
				authorize_access = null
				authorize_name = null
				playsound(src, 'sound/machines/terminal_off.ogg', 50, FALSE)
				return
			if(!unlocked && !is_station_level(z) && !IsAdminGhost(usr))
				visible_message("An error appears on the screen: Unable to contact authentication servers. Please move closer to the station.")
				return
			if (obj_flags & EMAGGED)
				authenticated = TRUE
				authorize_access = get_all_accesses()
				authorize_name = "Unknown"
				to_chat(usr, span_warning("[src] lets out a quiet alarm as its login is overridden."))
				playsound(src, 'sound/machines/terminal_alert.ogg', 25, FALSE)
			else if (IsAdminGhost(usr))
				authenticated = TRUE
				authorize_access = get_all_accesses()
				authorize_name = usr.client.holder.admin_signature
			else
				var/obj/item/card/id/id_card = usr.get_idcard(hand_first = TRUE)
				if (check_access(id_card))
					authenticated = TRUE
					authorize_access = id_card.access
					authorize_name = "[id_card.registered_name] - [id_card.assignment]"

			state = STATE_MAIN
			playsound(src, 'sound/machines/terminal_on.ogg', 50, FALSE)
		if ("toggleEmergencyAccess")
			if (GLOB.emergency_access)
				if (!COOLDOWN_FINISHED(src, important_action_cooldown))
					to_chat(usr, span_alert("Maintenance airlock communications relays recharging. Please stand by."))
					return
				revoke_maint_all_access()
				log_game("[key_name(usr)] disabled emergency maintenance access.")
				message_admins("[ADMIN_LOOKUPFLW(usr)] disabled emergency maintenance access.")
				deadchat_broadcast(" disabled emergency maintenance access at [span_name("[get_area_name(usr, TRUE)]")].", span_name("[usr.real_name]"), usr)
			else
				make_maint_all_access()
				log_game("[key_name(usr)] enabled emergency maintenance access.")
				message_admins("[ADMIN_LOOKUPFLW(usr)] enabled emergency maintenance access.")
				deadchat_broadcast(" enabled emergency maintenance access at [span_name("[get_area_name(usr, TRUE)]")].", span_name("[usr.real_name]"), usr)
				COOLDOWN_START(src, important_action_cooldown, IMPORTANT_ACTION_COOLDOWN)
		if ("printSpare")
			if (authenticated_as_non_silicon_head(usr))
				if (!COOLDOWN_FINISHED(src, important_action_cooldown))
					return
				playsound(loc, 'sound/items/poster_being_created.ogg', 100, 1)
				new /obj/item/card/id/captains_spare/temporary(loc)
				COOLDOWN_START(src, important_action_cooldown, IMPORTANT_ACTION_COOLDOWN)
				priority_announce("The emergency spare ID has been printed by [authorize_name].", "Emergency Spare ID Warning System", SSstation.announcer.get_rand_report_sound())
		// SKYRAT code moment
		if ("callThePolice")
			if(!pre_911_check(usr))
				return
			calling_911(usr, "Marshals", EMERGENCY_RESPONSE_POLICE)
		if ("callBreachControl")
			if(!pre_911_check(usr))
				return
			calling_911(usr, "Breach Control", EMERGENCY_RESPONSE_ATMOS)
		if ("callTheParameds")
			if(!pre_911_check(usr))
				return
			calling_911(usr, "EMTs", EMERGENCY_RESPONSE_EMT)
		if("callThePizza")
			if(!(obj_flags & EMAGGED))
				return
			if(!pre_911_check(usr))
				return
			GLOB.cops_arrived = TRUE
			log_game("[key_name(usr)] has dialed for a pizza order from Dogginos using an emagged communications console.")
			message_admins("[ADMIN_LOOKUPFLW(usr)] has dialed for a pizza order from Dogginos using an emagged communications console.")
			deadchat_broadcast(" has dialed for a pizza order from Dogginos using an emagged communications console.", span_name("[usr.real_name]"), usr, message_type=DEADCHAT_ANNOUNCEMENT)
			GLOB.pizza_order = pick(GLOB.pizza_names)
			call_911(EMERGENCY_RESPONSE_EMAG)
			to_chat(usr, span_notice("Thank you for choosing Dogginos, [GLOB.pizza_order]!"))
			playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)
		// SKYRAT code end
				

/obj/machinery/computer/communications/ui_data(mob/user)
	var/list/data = list(
		"authenticated" = FALSE,
		"emagged" = FALSE,
	)

	var/ui_state = issilicon(user) ? cyborg_state : state

	if (authenticated || issilicon(user))
		data["authenticated"] = TRUE
		data["canLogOut"] = !issilicon(user)
		data["page"] = ui_state

		if (obj_flags & EMAGGED)
			data["emagged"] = TRUE

		switch (ui_state)
			if (STATE_MAIN)
				data["canBuyShuttles"] = can_buy_shuttles(user)
				data["canBuyMercs"] = can_buy_mercenaries(user)
				data["canMakeAnnouncement"] = FALSE
				data["canMakeVoiceAnnouncement"] = FALSE
				data["canMessageAssociates"] = FALSE
				data["canRecallShuttles"] = !issilicon(user)
				data["canRequestNuke"] = FALSE
				data["canSendToSectors"] = FALSE
				data["canSetAlertLevel"] = TRUE
				data["canToggleEmergencyAccess"] = TRUE
				data["importantActionReady"] = COOLDOWN_FINISHED(src, important_action_cooldown)
				data["shuttleCalled"] = FALSE
				data["shuttleLastCalled"] = FALSE
				data["aprilFools"] = check_holidays(APRIL_FOOLS)
				data["canPrintIdAndCode"] = FALSE

				data["alertLevel"] = SSsecurity_level.get_current_level_as_text()
				data["authorizeName"] = authorize_name
				data["canLogOut"] = !issilicon(user)
				data["shuttleCanEvacOrFailReason"] = SSshuttle.canEvac(user)

				if (authenticated_as_non_silicon_captain(user))
					data["canMessageAssociates"] = TRUE
					data["canRequestNuke"] = TRUE

				if (!issilicon(user))
					data["canPrintIdAndCode"] = TRUE

				if (can_send_messages_to_other_sectors(user))
					data["canSendToSectors"] = TRUE

					var/list/sectors = list()
					var/our_id = CONFIG_GET(string/cross_comms_name)

					for (var/server in CONFIG_GET(keyed_list/cross_server))
						if (server == our_id)
							continue
						sectors += server

					data["sectors"] = sectors

				if (authenticated_as_silicon_or_captain(user))
					data["canToggleEmergencyAccess"] = TRUE
					data["emergencyAccess"] = GLOB.emergency_access

					data["alertLevelTick"] = alert_level_tick
					data["canMakeAnnouncement"] = TRUE
					data["canMakeVoiceAnnouncement"] = ishuman(user)
					data["canSetAlertLevel"] = issilicon(user) ? "NO_SWIPE_NEEDED" : "SWIPE_NEEDED"

				if (SSshuttle.emergency.mode != SHUTTLE_IDLE && SSshuttle.emergency.mode != SHUTTLE_RECALL)
					data["shuttleCalled"] = TRUE
					data["shuttleRecallable"] = SSshuttle.canRecall()

				if (SSshuttle.emergencyCallAmount)
					data["shuttleCalledPreviously"] = TRUE
					if (SSshuttle.emergency_last_call_loc)
						data["shuttleLastCalled"] = format_text(SSshuttle.emergency_last_call_loc.name)
			if (STATE_MESSAGES)
				data["messages"] = list()

				if (messages)
					for (var/_message in messages)
						var/datum/comm_message/message = _message
						data["messages"] += list(list(
							"answered" = message.answered,
							"content" = message.content,
							"title" = message.title,
							"possibleAnswers" = message.possible_answers,
						))
			if (STATE_BUYING_SHUTTLE)
				var/datum/bank_account/bank_account = SSeconomy.get_dep_account(ACCOUNT_CAR)
				var/list/shuttles = list()

				for (var/shuttle_id in SSmapping.shuttle_templates)
					var/datum/map_template/shuttle/shuttle_template = SSmapping.shuttle_templates[shuttle_id]
					
					if (shuttle_template.credit_cost == INFINITY)
						continue
					
					if (!can_purchase_this_shuttle(shuttle_template))
						continue
					
					shuttles += list(list(
						"name" = shuttle_template.name,
						"description" = shuttle_template.description,
						"occupancy_limit" = shuttle_template.occupancy_limit,
						"creditCost" = shuttle_template.credit_cost,
						"initial_cost" = initial(shuttle_template.credit_cost),
						"emagOnly" = shuttle_template.emag_only,
						"prerequisites" = shuttle_template.prerequisites,
						"ref" = REF(shuttle_template),
					))

				data["budget"] = bank_account.account_balance
				data["shuttles"] = shuttles
			if (STATE_CHANGING_STATUS)
				data["lineOne"] = last_status_display ? last_status_display[1] : ""
				data["lineTwo"] = last_status_display ? last_status_display[2] : ""
			if(STATE_BUYING_MERCENARIES)
				var/datum/bank_account/bank_account = SSeconomy.get_dep_account(ACCOUNT_CAR)
				var/list/mercs = list()

				to_chat(usr, span_notice("Initializing STATE_BUYING_MERCENARIES"))
				for (var/team in mercs_datums_list)
					to_chat(usr, span_notice("Initial [team]"))
					var/datum/merc/mercs_type = team
					to_chat(usr, span_notice("Initial [mercs_type]"))
					//if(!istype(mercs_type, /datum/merc))
					//	to_chat(usr, span_notice("[mercs_type] out"))
					//	continue
					
					if (mercs_type.credit_cost == INFINITY)
						to_chat(usr, span_notice("[mercs_type] out - Infinity credit_cost"))
						continue
					
					if (!can_purchase_this_mercs(mercs_type))
						to_chat(usr, span_notice("[mercs_type] out - can_purchase_this_mercs"))
						continue
					
					mercs += list(list(
						"name" = mercs_type.name,
						"description" = mercs_type.description,
						"teamsize" = mercs_type.teamsize,
						"creditCost" = mercs_type.credit_cost,
						"initial_cost" = initial(mercs_type.credit_cost),
						"emagOnly" = mercs_type.emag_only,
						"prerequisites" = mercs_type.prerequisites,
						"ref" = REF(mercs_type),
					))
					to_chat(usr, span_notice("[mercs_type]"))

				data["budget"] = bank_account.account_balance
				data["mercs"] = mercs

	return data

/obj/machinery/computer/communications/ui_interact(mob/user, datum/tgui/ui)
	play_click_sound(user)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "CommunicationsConsole")
		ui.open()

/obj/machinery/computer/communications/ui_static_data(mob/user)
	return list(
		"callShuttleReasonMinLength" = CALL_SHUTTLE_REASON_LENGTH,
		"maxStatusLineLength" = MAX_STATUS_LINE_LENGTH,
		"maxMessageLength" = MAX_MESSAGE_LEN,
	)

/obj/machinery/computer/communications/proc/set_state(mob/user, new_state)
	if (issilicon(user))
		cyborg_state = new_state
	else
		state = new_state

/// Returns TRUE if the user can buy shuttles.
/// If they cannot, returns FALSE or a string detailing why.
/obj/machinery/computer/communications/proc/can_buy_shuttles(mob/user)
	if (!SSmapping.config.allow_custom_shuttles)
		return FALSE
	if (issilicon(user))
		return FALSE
	
	var/has_access = FALSE

	for (var/access in SSshuttle.has_purchase_shuttle_access)
		if (access in authorize_access)
			has_access = TRUE
			break

	if (!has_access)
		return FALSE

	if (SSshuttle.emergency.mode != SHUTTLE_RECALL && SSshuttle.emergency.mode != SHUTTLE_IDLE)
		return "The shuttle is already in transit."
	if (SSshuttle.shuttle_purchased == SHUTTLEPURCHASE_PURCHASED)
		return "A replacement shuttle has already been purchased."
	if (SSshuttle.shuttle_purchased == SHUTTLEPURCHASE_FORCED)
		return "Due to unforseen circumstances, shuttle purchasing is no longer available."
	return TRUE

/obj/machinery/computer/communications/proc/can_buy_mercenaries(mob/user)
	
	if (issilicon(user))
		return FALSE
	
	/*
	var/has_access = FALSE

	for (var/access in SSshuttle.has_purchase_shuttle_access)
		if (access in authorize_access)
			has_access = TRUE
			break

	if (!has_access)
		return FALSE

	if (SSshuttle.emergency.mode != SHUTTLE_RECALL && SSshuttle.emergency.mode != SHUTTLE_IDLE)
		return "The shuttle is already in transit."
	if (SSshuttle.shuttle_purchased == SHUTTLEPURCHASE_PURCHASED)
		return "A replacement shuttle has already been purchased."
	if (SSshuttle.shuttle_purchased == SHUTTLEPURCHASE_FORCED)
		return "Due to unforseen circumstances, shuttle purchasing is no longer available."
	*/
	if(is_ert_blocked())
		return "All Emergency Response Teams are dispatched and can not be called at this time."

	if(GLOB.cops_arrived)
		return "Signal from this region traced. No additional help from foreign forces allowed this shift due to standart protocols."

	if(SSsecurity_level.get_current_level_as_number() >= SEC_LEVEL_GAMMA)
		return "No response from standart signal repiter. Recalculating... Retracing... Error."
	
	return TRUE

/obj/machinery/computer/communications/proc/is_ert_blocked()
	return SSticker.mode && SSticker.mode.ert_disabled

/proc/trigger_armed_mercs(datum/merc/merctemplate = null)
	GLOB.cops_arrived = TRUE
	if (merctemplate)
		merctemplate = new merctemplate
	else
		merctemplate = new /datum/merc/shellguard

	var/list/mob/dead/observer/candidates = pollGhostCandidates("Do you wish to be considered for [merctemplate.polldesc] ?", "deathsquad", null)
	var/teamSpawned = FALSE

	if(candidates.len > 0)
		//Pick the (un)lucky players
		var/numagents = min(merctemplate.teamsize,candidates.len)

		//Create team
		var/datum/team/merc/merc_team = new merctemplate.team
		if(merctemplate.rename_team)
			merc_team.name = merctemplate.rename_team

		//Asign team objective
		var/datum/objective/missionobj = new
		missionobj.team = merc_team
		missionobj.explanation_text = merctemplate.mission
		missionobj.completed = TRUE
		merc_team.objectives += missionobj
		merc_team.mission = missionobj

		var/list/spawnpoints = GLOB.emergencyresponseteamspawn		//later fix it
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
			var/mob/living/carbon/human/MercOperative = new merctemplate.mobtype(spawnloc)
			chosen_candidate.client.prefs.apply_prefs_to(MercOperative)
			MercOperative.key = chosen_candidate.key

			if(merctemplate.enforce_human || !(MercOperative.dna.species.changesource_flags & ERT_SPAWN)) // Don't want any exploding plasmemes
				MercOperative.set_species(/datum/species/human)

			//Give antag datum
			var/datum/antagonist/merc/merc_antag

			if(numagents == 1)
				merc_antag = new merctemplate.leader_role
			else
				merc_antag = merctemplate.roles[WRAP(numagents,1,length(merctemplate.roles) + 1)]
				merc_antag = new merc_antag

			MercOperative.mind.add_antag_datum(merc_antag,merc_team)
			MercOperative.mind.assigned_role = merc_antag.name
			SSjob.SendToLateJoin(MercOperative)

			//Logging and cleanup
			//log_game("[key_name(ERTOperative)] has been selected as an [ert_antag.name]") | yogs - redundant
			numagents--
			teamSpawned++

		if (teamSpawned)
			message_admins("[merctemplate.polldesc] has spawned with the mission: [merctemplate.mission]")

		return TRUE
	else
		return FALSE

/// Returns whether we are authorized to buy this specific shuttle.
/// Does not handle prerequisite checks, as those should still *show*.
/obj/machinery/computer/communications/proc/can_purchase_this_shuttle(datum/map_template/shuttle/shuttle_template)
	if (isnull(shuttle_template.who_can_purchase))
		return FALSE

	if (shuttle_template.emag_only)
		return !!(obj_flags & EMAGGED)

	for (var/access in authorize_access)
		if (access in shuttle_template.who_can_purchase)
			return TRUE

	return FALSE


/// Returns whether we are authorized to buy this specific team.
/// Does not handle prerequisite checks, as those should still *show*.
/obj/machinery/computer/communications/proc/can_purchase_this_mercs(datum/merc/merctemplate)
	//if (isnull(merctemplate.who_can_purchase))
	//	return FALSE

	if (merctemplate.emag_only)
		return !!(obj_flags & EMAGGED)

	//for (var/access in authorize_access)	//i dono why it don`t work, but it just don`t work.
	//	if (access in merctemplate.who_can_purchase)
	//		return TRUE

	return TRUE

/obj/machinery/computer/communications/proc/can_send_messages_to_other_sectors(mob/user)
	if (!authenticated_as_non_silicon_captain(user))
		return

	return length(CONFIG_GET(keyed_list/cross_server)) > 0

/obj/machinery/computer/communications/proc/make_announcement(mob/living/user)
	var/is_ai = issilicon(user)
	if(!SScommunications.can_announce(user, is_ai))
		to_chat(user, span_alert("Intercomms recharging. Please stand by."))
		return
	var/input = stripped_multiline_input(user, "Please choose a message to announce to the station crew.", "What?")
	if(!input || !user.canUseTopic(src, !issilicon(usr)))
		return
	SScommunications.make_announcement(user, is_ai, input)
	deadchat_broadcast(" made a priority announcement from [span_name("[get_area_name(usr, TRUE)]")].", span_name("[user.real_name]"), user)

/obj/machinery/computer/communications/proc/make_voice_announcement(mob/living/user)
	if(!SScommunications.can_announce(user, FALSE))
		to_chat(user, span_alert("Intercomms recharging. Please stand by."))
		return
	var/datum/voice_announce/command/announce_datum = new(user.client, src)
	announce_datum.open()


/obj/machinery/computer/communications/proc/post_status(command, data1, data2)

	var/datum/radio_frequency/frequency = SSradio.return_frequency(FREQ_STATUS_DISPLAYS)

	if(!frequency)
		return

	var/datum/signal/status_signal = new(list("command" = command))
	switch(command)
		if("message")
			status_signal.data["msg1"] = data1
			status_signal.data["msg2"] = data2
		if("alert")
			status_signal.data["picture_state"] = data1

	frequency.post_signal(src, status_signal)


/obj/machinery/computer/communications/Destroy()
	GLOB.shuttle_caller_list -= src
	SSshuttle.autoEvac()
	return ..()

/// Override the cooldown for special actions
/// Used in places such as CentCom messaging back so that the crew can answer right away
/obj/machinery/computer/communications/proc/override_cooldown()
	COOLDOWN_RESET(src, important_action_cooldown)

/obj/machinery/computer/communications/proc/add_message(datum/comm_message/new_message)
	LAZYADD(messages, new_message)

/datum/comm_message
	var/title
	var/content
	var/list/possible_answers = list()
	var/answered
	var/datum/callback/answer_callback

/datum/comm_message/New(new_title,new_content,new_possible_answers)
	..()
	if(new_title)
		title = new_title
	if(new_content)
		content = new_content
	if(new_possible_answers)
		possible_answers = new_possible_answers

#undef MAX_STATUS_LINE_LENGTH
#undef STATE_BUYING_SHUTTLE
#undef STATE_CHANGING_STATUS
#undef STATE_BUYING_MERCENARIES
#undef STATE_MAIN
#undef STATE_MESSAGES
