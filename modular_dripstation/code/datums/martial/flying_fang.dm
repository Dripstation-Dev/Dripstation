/datum/martial_art/flyingfang
	display_combos = TRUE

/datum/martial_art/flyingfang/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return
	if(findtext(streak,TAIL_COMBO_START))
		streak = "T"
		Slam(A,D)
		return TRUE
	if(findtext(streak, TAIL_COMBO))
		reset_streak(D)
		Slap(A,D)
		return TRUE
	if(findtext(streak, CHOMP_COMBO))
		reset_streak(D)
		Chomp(A,D)
		return TRUE
