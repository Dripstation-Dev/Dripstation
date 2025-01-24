/datum/mood_event/ate_without_table
	mood_change = 0		//F THIS RIMWORLD REFERENCE

/datum/mood_event/surgery
	timeout = 5 MINUTES

/datum/mood_event/bad_touch
	description = "<span class='warning'>I don't like when people touch me.</span>\n"
	mood_change = -3
	timeout = 4 MINUTES

/datum/mood_event/very_bad_touch
	description = "<span class='warning'>I really don't like when people touch me.</span>\n"
	mood_change = -5
	timeout = 4 MINUTES

//Used by the Veteran Advisor trait job
/datum/mood_event/desentized
	description = "Nothing will ever rival with what I seen in the past..."
	mood_change = -3
	//special_screen_obj = "mood_desentized"	//fix screen
