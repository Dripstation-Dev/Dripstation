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
	description = "<span class='warning'>Nothing will ever rival with what I seen in the past...</span>\n"
	mood_change = -3
	//special_screen_obj = "mood_desentized"	//fix screen

/datum/mood_event/fear
	description = "<span class='warning'>I should, I, can`t, what...</span>\n"
	mood_change = -10
	timeout = 5 MINUTES

/datum/mood_event/panic
	description = "<span class='userdanger'>AAAAAAAAAAAAAAAA...</span>\n"
	mood_change = -15
	timeout = 5 MINUTES

/datum/mood_event/shock
	description = "<span class='warning'>I can`t take this any longer...</span>\n"
	mood_change = -20
	timeout = 8 MINUTES
