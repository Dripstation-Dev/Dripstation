/mob
	plane = GAME_PLANE_FOV_HIDDEN

/mob/key_down(key, client/client, full_key)
	..()
	SEND_SIGNAL(src, COMSIG_MOB_KEYDOWN, key, client, full_key)
