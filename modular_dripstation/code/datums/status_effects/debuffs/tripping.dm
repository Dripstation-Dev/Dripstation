/// Tripping / "high" effect, makes your screen fucked
/datum/status_effect/tripping
	id = "tripping"
	alert_type = /atom/movable/screen/alert/status_effect/tripping
	remove_on_fullheal = TRUE
	tick_interval = 0.3 SECONDS

/datum/status_effect/tripping/on_creation(mob/living/new_owner, duration = 10 SECONDS)
	src.duration = duration
	return ..()

/datum/status_effect/tripping/on_apply()
	RegisterSignal(owner, COMSIG_LIVING_DEATH, PROC_REF(remove_tripping))

	SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, id, /datum/mood_event/high)
	owner.overlay_fullscreen(id, /atom/movable/screen/fullscreen/reallybadtrip)
	return TRUE

/datum/status_effect/tripping/on_remove()
	UnregisterSignal(owner, COMSIG_LIVING_DEATH)

	SEND_SIGNAL(owner, COMSIG_CLEAR_MOOD_EVENT, id)
	owner.clear_fullscreen(id)

/datum/status_effect/tripping/tick()
	// How much time is left, in seconds
	var/amount = (duration - world.time) / 10
	if(amount <= 0)
		return
	var/time_between_ticks = initial(tick_interval)

	// How much time will be left, in seconds, next tick
	var/next_amount = max((amount - (time_between_ticks * 0.1)), 0)

	// Now we can do the actual dizzy effects.
	// Don't bother animating if they're clientless.
	if(!owner.client)
		return

	// Want to be able to offset things by the time the animation should be "playing" at
	var/time = world.time
	var/delay = 0
	var/pixel_y_diff = 0

	var/list/view_range_list = getviewsize(owner.client.view)
	var/view_range = view_range_list[1]
	var/amplitude = amount * (sin(amount * (time)) + 1)
	var/y_diff = clamp(amplitude * cos(amount * time), -view_range, view_range)
	pixel_y_diff += y_diff
	// Brief explanation. We're basically snapping between different pixel_x/ys instantly, with delays between
	// Doing this with relative changes. This way we don't override any existing pixel_x/y values
	// We use EASE_OUT here for similar reasons, we want to act at the end of the delay, not at its start
	// Relative animations are weird, so we do actually need this
	animate(owner.client, pixel_x = 0, pixel_y = y_diff, 3, easing = JUMP_EASING | EASE_OUT, flags = ANIMATION_RELATIVE)
	delay += 0.1 SECONDS // This counts as a 0.2 second wait, so we need to shift the sine wave by that much

	y_diff = amplitude * cos(next_amount * (time + delay))
	pixel_y_diff += y_diff
	animate(pixel_x = 0, pixel_y = y_diff, 3, easing = JUMP_EASING | EASE_OUT, flags = ANIMATION_RELATIVE)

	// Now we reset back to our old pixel_x/y, since these animates are relative
	animate(pixel_x = 0, pixel_y = -pixel_y_diff, 3, easing = JUMP_EASING | EASE_OUT, flags = ANIMATION_RELATIVE)


/// Removes all of our tripping (self delete) on signal
/datum/status_effect/tripping/proc/remove_tripping(datum/source, admin_revive)
	SIGNAL_HANDLER

	qdel(src)

/// The status effect for "tripping"
/atom/movable/screen/alert/status_effect/tripping
	name = "Bad Trip"
	desc = "This shit is kinda heavy. Ffff..."
	icon_state = "high"
