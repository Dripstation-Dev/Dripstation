/datum/martial_art/the_sleeping_carp
	block_chance = 90 //Carp evades freak shit like shoves and hands, 50% dodges other unarmed attacks
	display_combos = TRUE

/datum/martial_art/the_sleeping_carp/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(findtext(streak,WRIST_WRENCH_COMBO))
		reset_streak(D)
		wristWrench(A,D)
		return TRUE
	if(findtext(streak,BACK_KICK_COMBO))
		reset_streak(D)
		backKick(A,D)
		return TRUE
	if(findtext(streak,STOMACH_KNEE_COMBO))
		reset_streak(D)
		kneeStomach(A,D)
		return TRUE
	if(findtext(streak,HEAD_KICK_COMBO))
		reset_streak(D)
		headKick(A,D)
		return TRUE
	if(findtext(streak,ELBOW_DROP_COMBO))
		reset_streak(D)
		elbowDrop(A,D)
		return TRUE
	return FALSE

///Carp conter: carp evades freak shit like unarmed attacks and hands
/datum/martial_art/the_sleeping_carp/handle_counter(mob/living/carbon/human/user, mob/living/carbon/human/attacker)
	if(!can_use(user))
		return
	if(user.get_timed_status_effect_duration(/datum/status_effect/staggered))	//gloves counters your pathetic attempts to counter
		to_chat(user, span_warning("You're too off balance to counter this!"))
		return
	var/l_hand = user.get_empty_held_index_for_side("l")
	var/r_hand =  user.get_empty_held_index_for_side("r")
	if(!l_hand && !r_hand)
		to_chat(user, span_danger("You need an empty hand to deflect [attacker]'s attack with [name]!"))
		return
	var/obj/item/I = attacker.get_active_held_item()
	if(I && istype(I, /obj/item/melee/touch_attack))
		var/obj/item/melee/touch_attack/touch_weapon = I
		playsound(get_turf(user), SFX_EVADE, 50, 1, -1)	//just casually dodge
		playsound(get_turf(attacker), SFX_GENERICMISS, 40, 1, -1)
		attacker.visible_message(span_warning("[user] carefully dodges [attacker]'s [touch_weapon]!"), \
						span_userdanger("[user] reflects your arm as you attack and evades your [touch_weapon]!"))
		to_chat(user, span_danger("You take great care to remain untouched by [attacker]'s [touch_weapon]!"))
	if(!I)
		cool_dash_effect(user, attacker, I)
		attacker.visible_message(span_warning("[user] carefully dodges [attacker]'s attack!"), \
						span_userdanger("[user] reflects your arm as you attack and evades your attack!"))
		to_chat(user, span_danger("You take great care to remain untouched by [attacker]'s attack!"))
	user.adjustStaminaLoss(-15)	//you feel like on morality high ground of the fight and can chill
