/datum/martial_art
	var/datum/weakref/holder //owner of the martial art
	var/display_combos = FALSE //shows combo meter if true
	var/combo_timer = 6 SECONDS // period of time after which the combo streak is reset.
	var/timerid

/datum/martial_art/proc/reset_streak(mob/living/carbon/human/new_target, update_icon = TRUE)
	if(timerid)
		deltimer(timerid)
	current_target = new_target
	streak = ""
	if(update_icon)
		var/mob/living/holder_living = holder?.resolve()
		holder_living?.hud_used?.combo_display.update_icon_state(streak)
