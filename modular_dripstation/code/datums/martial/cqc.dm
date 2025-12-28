/datum/martial_art/cqc
	display_combos = TRUE
	var/mob/restraining_mob

/datum/martial_art/cqc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!(can_use(A) || can_use(D)))
		return FALSE
	if(findtext(streak,SLAM_COMBO))
		reset_streak(D)
		Slam(A,D)
		return TRUE
	if(findtext(streak,KICK_COMBO))
		reset_streak(D)
		Kick(A,D)
		return TRUE
	if(findtext(streak,RESTRAIN_COMBO))
		reset_streak(D)
		Restrain(A,D)
		return TRUE
	if(findtext(streak,PRESSURE_COMBO))
		reset_streak(D)
		Pressure(A,D)
		return TRUE
	if(findtext(streak,CONSECUTIVE_COMBO))
		reset_streak(D)
		Consecutive(A,D)
		return TRUE
	return FALSE


/datum/martial_art/cqc/reset_streak(mob/living/new_target)
	if(new_target && new_target != restraining_mob)
		restraining_mob = null
	return ..()

///CQC grab, stun & disarm

/datum/martial_art/cqc/grab_act(mob/living/A, mob/living/D)
	if(A != D && can_use(A)) // A != D prevents grabbing yourself
		add_to_streak("G", D)
		if(check_streak(A, D)) //if a combo is made no grab upgrade is done
			return TRUE
		D.Immobilize(3 SECONDS)
		if(A.grab_state == GRAB_AGGRESSIVE)
			log_combat(A, D, "aggressively grabbed neck")
			D.visible_message(span_warning("[A] violently grabs [D]`s neck!"), \
							span_userdanger("You're neck grabbed violently by [A]!"), span_hear("You hear sounds of aggressive fondling!"), COMBAT_MESSAGE_RANGE, A)
			to_chat(A, span_danger("You violently grab [D]`s neck!"))
			D.drop_all_held_items()	
			D.grabbedby(A, TRUE, TRUE) //Instant neck grab if already grabbed
			A.changeNext_move(CLICK_CD_RAPID)	//0.2 Seconds instead of 1, less frustrating
			return TRUE
	return FALSE

///CQC counter: attacker's weapon is placed in the defender's offhand and they are knocked down
/datum/martial_art/cqc/handle_counter(mob/living/carbon/human/user, mob/living/carbon/human/attacker)
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
	user.adjustStaminaLoss(10)	//Can't block forever. Really, if this becomes a problem you're already screwed.
	var/obj/item/I = attacker.get_active_held_item()
	if(I && istype(I, /obj/item/melee/touch_attack))
		attacker.visible_message(span_warning("[user] twists [attacker]'s arm, sending their [I] back towards them!"), \
						span_userdanger("[user] grabs your arm as you attack and send your [I] back towards you!"))
		to_chat(user, span_danger("Making sure to avoid [attacker]'s [I], you twist their arm to send it right back at them!"))
		playsound(get_turf(attacker), 'modular_dripstation/sound/sweep_2.ogg', 50, 1, -1)
		var/obj/item/melee/touch_attack/touch_weapon = I
		var/datum/action/cooldown/spell/touch/touch_spell = touch_weapon.spell_which_made_us?.resolve()
		if(!touch_spell)
			return
		INVOKE_ASYNC(touch_spell, /datum/action/cooldown/spell/touch.proc/do_hand_hit, touch_weapon, attacker, attacker)
		return COMPONENT_NO_AFTERATTACK
	else if(user.a_intent == INTENT_HELP)	//chill bro
		attacker.visible_message(span_warning("[user] carefully dodges [attacker]'s attack!"), \
						span_userdanger("[user] reflects your arm as you attack and evades your attack!"))
		to_chat(user, span_danger("You take great care to remain untouched by [attacker]'s attack!"))
		cool_dash_effect(user, attacker, I)
		user.adjustStaminaLoss(-25)	//you feel like on morality high ground of the fight and can chill
		return
	else if(I)
		user.do_attack_animation(attacker, ATTACK_EFFECT_DISARM)
		attacker.visible_message(span_warning("[user] grabs [attacker]'s arm as they attack and throws them to the ground!"), \
							span_userdanger("[user] grabs your arm as you attack and throws you to the ground!"))
		playsound(get_turf(attacker), 'modular_dripstation/sound/sweep_1.ogg', 50, 1, -1)
		if(I && !HAS_TRAIT(I, TRAIT_NODROP) && !CHECK_BITFIELD(I.item_flags, ABSTRACT))
			if(attacker.temporarilyRemoveItemFromInventory(I))
				var/hand = user.get_inactive_hand_index()
				if(!user.put_in_hand(I, hand))
					I.forceMove(get_turf(attacker))
		attacker.Knockdown(60)
		return
	else
		attacker.visible_message(span_warning("[user] grabs [attacker]'s arm as they attack and twists it!"), \
							span_userdanger("[user] grabs your arm as you attack and twists it, you feel staggered!"))
		attacker.adjust_staggered_up_to(2 SECONDS, 4 SECONDS)
		playsound(get_turf(attacker), 'modular_dripstation/sound/sweep_2.ogg', 50, 1, -1)
		if(attacker.a_intent == INTENT_GRAB)
			user.start_pulling(attacker, TRUE)
			attacker.grabbedby(user, FALSE, TRUE)
		return

/datum/martial_art/proc/cool_dash_effect(mob/living/carbon/human/defender, mob/living/carbon/human/attacker, obj/item/I)
	var/turf/owner_turf = get_turf(defender)
	var/turf/attacker_turf = get_turf(attacker)
	var/turf/step_back_turf = get_step(owner_turf, get_cardinal_dir(attacker_turf, owner_turf))
	var/turf/step_forward_turf = owner_turf
	playsound(owner_turf, SFX_EVADE, 50, 1, -1)	//just casually dodge
	var/should_step = TRUE
	if(isclosedturf(step_back_turf) || isgroundlessturf(step_back_turf))
		should_step = FALSE
	for(var/atom/A in step_back_turf)
		if(!A.CanPass(defender, step_back_turf))
			should_step = FALSE
			break
	if(should_step)
		//new /obj/effect/temp_visual/small_smoke/halfsecond(step_back_turf)
		//new /obj/effect/temp_visual/small_smoke/halfsecond(step_forward_turf)
		defender.AddComponent(/datum/component/after_image, 2, 0.5, FALSE)
		defender.Moved(owner_turf, step_back_turf, TRUE)
		attacker.Moved(attacker_turf, step_forward_turf, TRUE)
		var/datum/component/after_image = defender.GetComponent(/datum/component/after_image)
		qdel(after_image)
	if(I)
		playsound(attacker_turf, SFX_SLASHMISS, 40, 1, -1)
	else
		playsound(attacker_turf, SFX_GENERICMISS, 40, 1, -1)

/datum/martial_art/cqc/proc/Restrain(mob/living/A, mob/living/D)
	if(restraining_mob)
		return
	if(!can_use(A))
		return FALSE
	if(!D.stat)
		log_combat(A, D, "restrained (CQC)")
		D.visible_message(span_warning("[A] locks [D] into a restraining position!"), \
							span_userdanger("[A] locks you into a restraining position!"))
		A.do_attack_animation(D, ATTACK_EFFECT_GRAB)
		D.adjustStaminaLoss(20)
		D.Stun(10 SECONDS)
		restraining_mob = D
		addtimer(VARSET_CALLBACK(src, restraining_mob, null), 50, TIMER_UNIQUE)
		return TRUE

///CQC disarm, 65% chance to instantly pick up the opponent's weapon and deal 5 stamina damage, also used for choke attack
/datum/martial_art/cqc/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!(can_use(A) || can_use(D)))
		return FALSE
	add_to_streak("D",D)
	var/obj/item/I = null
	if(check_streak(A,D))
		return TRUE
	A.do_attack_animation(D, ATTACK_EFFECT_DISARM)
	if(!D.stat && !D.IsParalyzed() && !restraining_mob)
		if(prob(65))
			I = D.get_active_held_item()
			D.visible_message(span_warning("[A] quickly grabs [D]'s arm and and chops it, disarming them!"), \
								span_userdanger("[A] grabs your arm and chops it, disarming you!"))
			playsound(get_turf(D), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
			if(I && D.temporarilyRemoveItemFromInventory(I))
				A.put_in_hands(I)
			D.adjust_jitter(2 SECONDS)
			D.apply_damage(A.get_punchdamagehigh()/2, STAMINA) //5 damage
		else
			D.visible_message(span_danger("[A] grabs at [D]'s arm, but misses!"), \
								span_userdanger("[A] grabs at your arm, but misses!"))
			playsound(D, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
		log_combat(A, D, "disarmed (CQC)", "[I ? " grabbing \the [I]" : ""]")
	if(restraining_mob && A.pulling == restraining_mob)
		if(chokehold_active)
			return TRUE
		log_combat(A, D, "began to chokehold(CQC)")
		D.visible_message(
			span_danger("[isipc(D) ? "[A] attempts to deactivate [D]!" : "[A] puts [D] into a chokehold!"]"),
			span_userdanger("[isipc(D) ? "[A] attempts to deactivate you!" : "[A] puts you into a chokehold!"]")
		)
		if(handle_chokehold(A, D))
			D.Unconscious(40 SECONDS)
			if(A.grab_state < GRAB_NECK)
				A.grab_state = GRAB_NECK
			A.visible_message(span_danger("[A] relaxes their grip on [D]."), \
								span_danger("You relax your grip on [D].")) //visible message comes from attacker since defender is unconscious and therefore can't see
		else
			if(A.grab_state) //honestly with the way current grabs work this doesn't really do all that much
				A.grab_state = min(1, A.grab_state - 1) //immediately lose grab power...
				if(!A.grab_state || prob(BASE_GRAB_RESIST_CHANCE/max(0.5, A.grab_state - 1))) //...and have a chance to lose the entire grab
					A.visible_message(span_danger("[A] is put off balance, losing their grip on [D]!"), \
										span_danger("You are put off balance, and you lose your grip on [D]!"))
					A.stop_pulling()
				else
					A.visible_message(span_danger("[A] is put off balance, and struggles to maintain their grip on [D]!"), \
										"<span class='danger>You are put off balance, and struggle to maintain your grip on [D]!</span>")
	chokehold_active = FALSE
	restraining_mob = null
	return TRUE


/**
  * CQC consecutive attack
  *
  * Attack that causes 5 seconds paralyze and 10 seconds knockdown as well as 25 stamina damage
  */
/datum/martial_art/cqc/proc/Consecutive(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return FALSE
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	log_combat(A, D, "consecutive CQC'd (CQC)")
	playsound(get_turf(D), 'sound/weapons/cqchit2.ogg', 50, 1, -1)
	if(D.mobility_flags & MOBILITY_STAND)
		var/consecutivedamage = A.get_punchdamagehigh() * 1.5 + 10 //25 damage
		D.visible_message(span_warning("[A] delivers a firm blow to [D]'s head, knocking them down!"), \
							span_userdanger("[A] delivers a firm blow to your head, causing you to fall over!"))
		D.Paralyze(50)
		D.Knockdown(100)
		D.apply_damage(consecutivedamage, STAMINA)
	else	//kick him in his balls
		D.visible_message(span_warning("[A] delivers a firm blow to [D]'s head, totally paralising them!"), \
							span_userdanger("[A] delivers a firm blow to your head, causing you to scream in agony!"))
		D.flick_pain(100, TRUE, TRUE)
		D.Paralyze(150)	//okey, so you are on the floor
	return TRUE
