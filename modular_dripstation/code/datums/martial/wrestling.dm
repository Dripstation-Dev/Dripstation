/datum/martial_art/wrestling
	display_combos = TRUE

/datum/martial_art/wrestling/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	switch(streak)
		if("drop")
			reset_streak(D)
			drop(A,D)
			return 1
		if("strike")
			reset_streak(D)
			strike(A,D)
			return 1
		if("kick")
			reset_streak(D)
			kick(A,D)
			return 1
		if("throw")
			reset_streak(D)
			throw_wrassle(A,D)
			return 1
		if("slam")
			reset_streak(D)
			slam(A,D)
			return 1
	return 0
