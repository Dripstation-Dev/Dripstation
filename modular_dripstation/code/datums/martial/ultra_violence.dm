/datum/martial_art/ultra_violence
	display_combos = TRUE

/datum/martial_art/ultra_violence/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)//A is user, D is target
	if(!can_use(A) || D.stat == DEAD)//stop hitting a corpse
		return FALSE

	if(findtext(streak, POCKET_PISTOL))
		reset_streak(D)
		pocket_pistol(A,D)
		return TRUE

	if(A == D) //you can pull your gun out by "grabbing" yourself
		return FALSE

	if(findtext(streak, BLOOD_BURST))
		reset_streak(D)
		blood_burst(A,D)
		return TRUE

	if(findtext(streak, GUN_HAND))
		reset_streak(D)
		gun_hand(A, D)
		return TRUE
