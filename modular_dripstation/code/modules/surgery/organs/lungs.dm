/obj/item/organ/lungs
	is_ruptured = FALSE

/obj/item/organ/lungs/rupture()
	if(owner && !is_ruptured)
		owner.flick_pain(100, TRUE)
	if(!is_ruptured)
		is_ruptured = TRUE

/obj/item/organ/lungs/on_life()
	..()
	if((!failed) && ((organ_flags & ORGAN_FAILING)))
		if(owner.stat == CONSCIOUS)
			owner.visible_message(span_userdanger("[owner] grabs [owner.p_their()] throat, struggling for breath!"))
		failed = TRUE
	else if(!(organ_flags & ORGAN_FAILING))
		failed = FALSE
	if(is_ruptured)
		if(damage == 0)
			is_ruptured = FALSE
		if(prob(8))
			owner.visible_message(span_danger(
				"Blood drips from <B>\the [owner]'s</B> mouth!"),
			)
			owner.bleed(3, TRUE)
			if(!owner.losebreath)
				INVOKE_ASYNC(owner, TYPE_PROC_REF(/mob, emote), "coughinblood")
		else if(prob(2))
			owner.visible_message(span_danger(
				"<B>\the [owner]'s</B> chockes with their own blood!"),
			)
			owner.bleed(10, TRUE)
			owner.losebreath++
			owner.adjustOxyLoss(HUMAN_MAX_OXYLOSS)
			INVOKE_ASYNC(owner, TYPE_PROC_REF(/mob, emote), "choke")
	return
