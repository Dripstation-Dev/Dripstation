/// Mood application categories for this objective
/// Used to reduce duplicate code for applying moods to players based on their state
/datum/demoralise_moods
	/// Mood category to apply to moods
	var/mood_category
	/// Text to display to an antagonist upon receiving this mood
	var/antag_notification
	/// Mood datum to apply to an antagonist
	var/datum/mood_event/antag_mood
	/// Text to display to a crew member upon receiving this mood
	var/crew_notification
	/// Mood datum to apply to a crew member
	var/datum/mood_event/crew_mood
	/// Text to display to a head of staff upon receiving this mood
	var/authority_notification
	/// For literacy checks
	var/reading_requirements = READING_CHECK_LIGHT
	/// Mood datum to apply to a head of staff or security
	var/datum/mood_event/authority_mood

/datum/demoralise_moods/poster
	mood_category = "evil poster"
	antag_notification = "Nice poster."
	antag_mood = /datum/mood_event/traitor_poster_antag
	crew_notification = "Wait, is what that poster says true?"
	crew_mood = /datum/mood_event/traitor_poster_crew
	authority_notification = "Hey! Who put up that poster?"
	authority_mood = /datum/mood_event/traitor_poster_auth
	reading_requirements = (READING_CHECK_LITERACY | READING_CHECK_LIGHT)

/datum/mood_event/traitor_poster_antag
	description = "I am doing the right thing."
	mood_change = 2
	timeout = 2 MINUTES
	hidden = TRUE

/datum/mood_event/traitor_poster_crew
	description = "That poster made me feel bad about my job..."
	mood_change = -2
	timeout = 2 MINUTES
	hidden = TRUE

/datum/mood_event/traitor_poster_auth
	description = "That poster better not be giving the crew any funny ideas..."
	mood_change = -3
	timeout = 2 MINUTES
	hidden = TRUE

/datum/demoralise_moods/graffiti
	mood_category = "evil graffiti"
	antag_notification = "A three headed snake. Nice."
	antag_mood = /datum/mood_event/traitor_graffiti_antag
	crew_notification = "Is that... a three headed snake?"
	crew_mood = /datum/mood_event/traitor_graffiti_crew
	authority_notification = "A three headed snake only means trouble."
	authority_mood = /datum/mood_event/traitor_graffiti_auth

/datum/mood_event/traitor_graffiti_antag
	description = "The Syndicate logo? How delightfully bold."
	mood_change = 2
	timeout = 2 MINUTES
	hidden = TRUE

/datum/mood_event/traitor_graffiti_crew
	description = "The Syndicate logo? Am I safe here?"
	mood_change = -2
	timeout = 2 MINUTES
	hidden = TRUE

/datum/mood_event/traitor_graffiti_auth
	description = "Which of these layabouts drew that Syndicate logo?!"
	mood_change = -3
	timeout = 2 MINUTES
	hidden = TRUE

/datum/demoralise_moods/module
	mood_category = "module"
	antag_notification = "I feel oddly refreshed."
	antag_mood = /datum/mood_event/traitor_module_antag
	crew_notification = "My head hurts. It feels like something is driving nails into my brain!"
	crew_mood = /datum/mood_event/traitor_module_crew
	authority_notification = "My heads beginning to spin. The enemy is at the gate. I'm all alone..."
	authority_mood = /datum/mood_event/traitor_module_auth
	reading_requirements = (READING_CHECK_LIGHT)

/datum/mood_event/traitor_module_antag
	description = "I think I'll cause problems on purpose."
	mood_change = 1
	timeout = 2 MINUTES
	hidden = TRUE

/datum/mood_event/traitor_module_crew
	description = "They're on the station! I know it! They're going to get me!"
	mood_change = -4
	timeout = 2 MINUTES
	hidden = TRUE

/datum/mood_event/traitor_module_auth
	description = "Nobody on this station is on my side, and the enemy could be anyone! I have to take more drastic measures..."
	mood_change = -5
	timeout = 2 MINUTES
	hidden = TRUE
