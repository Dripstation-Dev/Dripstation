/obj/item/organ/lungs
	var/is_ruptured = FALSE

/obj/item/organ/lungs/rupture()
	var/obj/item/organ/lungs/parent = owner.getorganslot(ORGAN_SLOT_LUNGS)
	if(istype(parent))
		owner.pain(100, TRUE)
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
		if(prob(2))
			owner.visible_message(span_danger(
				"blood drips from <B>\the [owner]'s</B> [name]!"),
			)
			owner.bleed(3, TRUE)
			if(!owner.losebreath)
				INVOKE_ASYNC(owner, TYPE_PROC_REF(/mob, emote), "cough")
	return
