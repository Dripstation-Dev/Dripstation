/datum/status_effect/badass
	id = "badass"
	alert_type = null
	status_type = STATUS_EFFECT_REFRESH
	duration = 2 MINUTES
	tick_interval = 0

/datum/status_effect/badass/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_BADASS, "BADDASS_BUFF")

/datum/status_effect/badass/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_BADASS, "BADDASS_BUFF")
