//Throwing stuff
/mob/living/carbon/proc/toggle_throw_mode()
	if(stat)
		return
	if(ismecha(loc))
		var/obj/mecha/M = loc
		if(M.occupant == src)
			M.cycle_action.Activate()
			return
	if(in_throw_mode)
		throw_mode_off(THROW_MODE_TOGGLE)
	else
		throw_mode_on(THROW_MODE_TOGGLE)


/mob/living/carbon/proc/throw_mode_off(method)
	if(in_throw_mode > method) //A toggle doesnt affect a hold
		return
	in_throw_mode = THROW_MODE_DISABLED
	if(client && hud_used)
		hud_used.throw_icon.icon_state = "act_throw_off"


/mob/living/carbon/proc/throw_mode_on(mode = THROW_MODE_TOGGLE)
	in_throw_mode = mode
	if(client && hud_used)
		hud_used.throw_icon.icon_state = "act_throw_on"