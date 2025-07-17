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
