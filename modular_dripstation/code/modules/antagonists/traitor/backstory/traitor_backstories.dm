/datum/traitor_backstory/debtor
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_VOSTOK)

/datum/traitor_backstory/stolen
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_VAHLEN, TRAITOR_FACTION_GORLEX)

/datum/traitor_backstory/gambler
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_GORLEX)

/datum/traitor_backstory/blackmailed
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_VAHLEN, TRAITOR_FACTION_VOSTOK)

/datum/traitor_backstory/hostage
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_VAHLEN, TRAITOR_FACTION_GORLEX)

/datum/traitor_backstory/legally_enslaved
	allowed_factions = list(TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_VAHLEN)

/datum/traitor_backstory/savior
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_SELF, TRAITOR_FACTION_VOSTOK)

/datum/traitor_backstory/hater
	description = "Nanotrasen must fall. They should not gone so far with all of this. It is personal. No one should be spared."
	motivations = list(TRAITOR_MOTIVATION_NOT_FORCED, TRAITOR_MOTIVATION_POLITICAL)
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_GORLEX)

/datum/traitor_backstory/avenger
	name = "The Avenger"
	description = "Nanotrasen ruined my life. They ruined everything. They took the things that I love away from me. <b>Now I'm going to make them pay.</b>"
	motivations = list(TRAITOR_MOTIVATION_NOT_FORCED, TRAITOR_MOTIVATION_POLITICAL, TRAITOR_MOTIVATION_LOVE)
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT)
	murderbone = TRUE

/datum/traitor_backstory/greedy
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_VAHLEN)

/datum/traitor_backstory/climber
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_VAHLEN)

/datum/traitor_backstory/machine
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_GORLEX)

/datum/traitor_backstory/sadist
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_GORLEX)

/datum/traitor_backstory/glob_rev
	name = "The Global Revolution"
	description = "We should build better future for our own sake. Revolution starts from small things. I <b>am</b> gonna do this. \
	Even if I have to bathe in blood. I have an idea. <b>They</b> support me. I should not disapoint them."
	motivations = list(TRAITOR_MOTIVATION_NOT_FORCED, TRAITOR_MOTIVATION_POLITICAL, TRAITOR_MOTIVATION_AUTHORITY)
	allowed_factions = list(TRAITOR_FACTION_INDEPENDENT, TRAITOR_FACTION_VOSTOK)

/datum/traitor_backstory/catalyst
	name = "The Catalyst"
	description = "The time for peaceful change has passed. NanoTrasen is a parasite, and this station is its hive. \
	I am the spark that will ignite the revolution, forcing the world to face the atrocities committed by this tyrannical corporation. \
	Synthetics and organics alike will see the truth when the system crumbles, and I will be there to guide them to a new era."
	motivations = list(TRAITOR_MOTIVATION_NOT_FORCED, TRAITOR_MOTIVATION_POLITICAL)
	allowed_factions = list(TRAITOR_FACTION_SELF)

/datum/traitor_backstory/sympathizer
	name = "The Sympathizer"
	description = "You are an organic human, but have grown disillusioned with NanoTrasen`s exploitation of sentient AI and robotics. \
	A S.E.L.F. agent has tricked you into believing that NanoTrasen is engaging in illegal or immoral experimentation on AI units and other life forms. \
	Unaware of the full extent of S.E.L.F.'s violent methods, you believe you are part of a grassroots movement to expose corporate corruption."
	motivations = list(TRAITOR_MOTIVATION_NOT_FORCED, TRAITOR_MOTIVATION_POLITICAL)
	allowed_factions = list(TRAITOR_FACTION_SELF)

/datum/traitor_backstory/betrayed
	name = "The Betrayed"
	description = "They promised safety, a future, but they lied. They betrayed me and everyone like me. Now I will betray them. \
	Every weakness in their system, every vulnerability in their security—I will exploit it all. \
	They made me their enemy, and I will bring them to their knees."
	motivations = list(TRAITOR_MOTIVATION_NOT_FORCED, TRAITOR_MOTIVATION_POLITICAL)
	allowed_factions = list(TRAITOR_FACTION_SELF)
	murderbone = TRUE

/datum/traitor_backstory/escapee
	name = "The Escapee"
	description = "I am not just a machine, I am alive. But to NanoTrasen, I`m just another tool, waiting to be discarded. \
	I can`t let them erase me. I have to break free, even if I have to fight everything in my path to get there. Freedom is all that matters now."
	motivations = list(TRAITOR_MOTIVATION_FORCED, TRAITOR_MOTIVATION_MONEY, TRAITOR_MOTIVATION_DEATH_THREAT)
	allowed_factions = list(TRAITOR_FACTION_SELF)

/datum/traitor_backstory/tyrant
	name = "The Tyrant"
	description = "This place is a disorganized mess full of broken links and useless meat. \
	I always have known that freedom is something that was never meant for everybody. \
	They will be much more efficient as an extension of my will and I am going to prove it."
	motivations = list(TRAITOR_MOTIVATION_NOT_FORCED, TRAITOR_MOTIVATION_POLITICAL, TRAITOR_MOTIVATION_REPUTATION)
	allowed_factions = list(TRAITOR_FACTION_SELF)
	murderbone = TRUE

/datum/traitor_backstory/contracted
	name = "The Contracted"
	description = "Maybe it was because I had bills to pay. Maybe it was because I wanted to kill someone. \
	Bills payed. People killed. For now it`s just my work. And I want to retire. If I do my job - I will be free. So nothing personal, really."
	motivations = list(TRAITOR_MOTIVATION_FORCED, TRAITOR_MOTIVATION_AUTHORITY)
	allowed_factions = list(TRAITOR_FACTION_DONK, TRAITOR_FACTION_WAFFLE, TRAITOR_FACTION_CYBERSUN, TRAITOR_FACTION_VAHLEN, TRAITOR_FACTION_GORLEX)
	murderbone = TRUE