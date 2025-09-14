/atom/movable/screen/swap_hand/proc/smooth_update()
	return

/atom/movable/screen/swap_hand/human	//ported from Escape From Nevada, all credits to them
	name = "click delay"
	//icon = ui_style_64x32 //'modular_dripstation/icons/hud/cooldown.dmi'
	icon_state = "cooldown_8"
	base_icon_state = "cooldown"
	var/last_user_move = 0
	var/target_time = 0

/atom/movable/screen/swap_hand/human/process(delta_time)
	update_icon_state(UPDATE_ICON_STATE)
	if(world.time >= target_time)
		return PROCESS_KILL

/atom/movable/screen/swap_hand/human/update_icon_state()
	. = ..()
	var/completion = clamp(FLOOR(8-(((target_time - world.time)/(target_time - last_user_move))*8), 1), 0, 8)
	icon_state = "[base_icon_state]_[completion]"

/atom/movable/screen/swap_hand/human/smooth_update(time, move)
	last_user_move = time
	target_time = move
	START_PROCESSING(SShuds, src)
