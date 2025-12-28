/// Gives the player the option to succumb while in critical condition
/atom/movable/screen/alert/succumb
	name = "Succumb"
	desc = "Shuffle off this mortal coil."
	icon = 'modular_dripstation/icons/mob/alerts.dmi'
	icon_state = ALERT_SUCCUMB
	var/static/list/death_titles = list(
		"Goodnight, Sweet Prince",
		"Game Over, Man",
		"End Of The Road",
		"Live Long And Prosper",
		"See You Space Cowboy...",
		"The last shift",
		"It's Been An Honor",
		"The Curtains Close",
		"All Good Things Must End"
	)

/atom/movable/screen/alert/succumb/Click(location, control, params)
	if(!usr || !usr.client)
		return
	var/mob/living/living_owner = mob_viewer
	if(!CAN_SUCCUMB(living_owner) && !HAS_TRAIT(living_owner, TRAIT_SUCCUMB_OVERRIDE)) //checked again in [mob/living/verb/succumb()]
		return

	var/title = pick(death_titles)

	//Succumbing with a message
	var/last_whisper = tgui_input_text(living_owner, "Do you have any last words?", title, max_length = CHAT_MESSAGE_MAX_LENGTH, encode = FALSE) // saycode already handles sanitization
	if(isnull(last_whisper))
		return
	if(length(last_whisper))
		living_owner.say("#[last_whisper]")
	living_owner.succumb(whispered = length(last_whisper) > 0)

//MODsuit unique
/atom/movable/screen/alert/nocore
	name = "Missing Core"
	desc = "Unit has no core. No modules available until a core is reinstalled. Robotics may provide assistance."
	icon_state = "no_cell"

/atom/movable/screen/alert/emptycell/plasma
	name = "Out of Power"
	desc = "Unit's plasma core has no charge remaining. No modules available until plasma core is recharged. \
		Unit can be refilled through plasma fuel."

/atom/movable/screen/alert/emptycell/plasma/update_desc()
	. = ..()
	desc = initial(desc)

/atom/movable/screen/alert/lowcell/plasma
	name = "Low Charge"
	desc = "Unit's plasma core is running low. Unit can be refilled through plasma fuel."

/atom/movable/screen/alert/lowcell/plasma/update_desc()
	. = ..()
	desc = initial(desc)
