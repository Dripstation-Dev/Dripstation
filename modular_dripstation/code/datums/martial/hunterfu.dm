/datum/martial_art/hunterfu
	display_combos = TRUE

/datum/martial_art/hunterfu/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(findtext(streak, BODYSLAM_COMBO))
		reset_streak(D)
		body_slam(A, D)
		return TRUE
	if(findtext(streak, STAKESTAB_COMBO))
		reset_streak(D)
		stake_stab(A, D)
		return TRUE
	if(findtext(streak, NECKSNAP_COMBO))
		reset_streak(D)
		neck_snap(A, D)
		return TRUE
	if(findtext(streak, HOLYKICK_COMBO))
		reset_streak(D)
		holy_kick(A, D)
		return TRUE
	return FALSE

