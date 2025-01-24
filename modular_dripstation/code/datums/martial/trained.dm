///restrain combo string
#define LOW_RESTRAIN_COMBO "GG"

/datum/martial_art/trained
	name = "Trained Combat"
	id = MARTIALART_TRAINED
	help_verb = /mob/living/carbon/human/proc/trained_help
	block_chance = 60 //Don't get into melee with someone trained for melee and prepared for your attacks
	nonlethal = TRUE //all attacks deal solely stamina damage or knock out before dealing lethal amounts of damage
	var/chokehold_active = FALSE

/datum/martial_art/trained/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!(can_use(A) || can_use(D)))
		return FALSE
	if(findtext(streak,LOW_RESTRAIN_COMBO))
		streak = ""
		LowRestrain(A,D)
		return TRUE
	return FALSE

/datum/martial_art/trained/proc/LowRestrain(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(restraining)
		return
	if(!can_use(A))
		return FALSE
	if(!D.stat)
		log_combat(A, D, "restrained (Trained Combat)")
		D.visible_message(span_warning("[A] locks [D] into a restraining position!"), \
							span_userdanger("[A] locks you into a restraining position!"))
		A.do_attack_animation(D, ATTACK_EFFECT_GRAB)
		D.Stun(2 SECONDS)
		if(!(A.pulling == D))
			D.grabbedby(A, 1)
		if(A.grab_state < GRAB_AGGRESSIVE)
			A.grab_state = GRAB_AGGRESSIVE
		restraining = TRUE
	return TRUE

/datum/martial_art/trained/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(restraining && A.pulling == D && A.zone_selected == BODY_ZONE_HEAD)
		if(chokehold_active)
			return TRUE
		log_combat(A, D, "began to chokehold(Trained Combat)")
		D.visible_message(
			span_danger("[isipc(D) ? "[A] attempts to deactivate [D]!" : "[A] puts [D] into a chokehold!"]"),
			span_userdanger("[isipc(D) ? "[A] attempts to deactivate you!" : "[A] puts you into a chokehold!"]")
		)
		A.do_attack_animation(D, ATTACK_EFFECT_GRAB)
		if(handle_chokehold(A, D))
			D.Unconscious(40 SECONDS)
			if(A.grab_state < GRAB_NECK)
				A.grab_state = GRAB_NECK
			A.visible_message(span_danger("[A] relaxes their grip on [D]."), \
								span_danger("You relax your grip on [D].")) //visible message comes from attacker since defender is unconscious and therefore can't see
		else
			if(A.grab_state) //honestly with the way current grabs work this doesn't really do all that much
				A.grab_state = min(1, A.grab_state - 1) //immediately lose grab power...
				if(!A.grab_state || prob(BASE_GRAB_RESIST_CHANCE/A.grab_state)) //...and have a chance to lose the entire grab
					A.visible_message(span_danger("[A] is put off balance, losing their grip on [D]!"), \
										span_danger("You are put off balance, and you lose your grip on [D]!"))
					A.stop_pulling()
				else
					A.visible_message(span_danger("[A] is put off balance, and struggles to maintain their grip on [D]!"), \
										"<span class='danger>You are put off balance, and struggle to maintain your grip on [D]!</span>")
		chokehold_active = FALSE
		restraining = FALSE
		return TRUE
	return FALSE

/datum/martial_art/trained/proc/handle_chokehold(mob/living/carbon/human/A, mob/living/carbon/human/D) //handles the chokehold attack, dealing oxygen damage until the target is unconscious or would have less than 20 health before knocking out
	chokehold_active = TRUE
	var/damage2deal = 10
	while(do_after(A, isipc(D) ? 7 SECONDS : 1 SECONDS, D)) // doesn't make sense to deal oxygen damage to IPCs so instead do a longer channel that automatically succeeds
		if(!A.grab_state)
			return FALSE
		if(isipc(D)) // have you tried turning it off and on again
			return TRUE
		damage2deal = 10 * (1+D.getStaminaLoss()/100) //stamina damage boosts the effectiveness of an attack, making using other attacks to prepare important
		if(HAS_TRAIT(D, TRAIT_NOBREATH))
			damage2deal *= 0.5 // if they don't breathe they can't be choked, but you can still cut off blood flow to the head
		if(D.health - damage2deal < 20 || D.stat)
			return TRUE
		D.apply_damage(damage2deal, OXY) // respect oxygen damage mods
		if(D.getOxyLoss() >= 70)	//it`s less effective than cqc
			return TRUE

/datum/martial_art/trained/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!(can_use(A) || can_use(D)))
		return FALSE
	if(restraining && A.pulling == D && (A.zone_selected == BODY_ZONE_L_ARM || A.zone_selected == BODY_ZONE_R_ARM))
		armlock(A, D)
		if(A.grab_state < GRAB_NECK)
			A.grab_state = GRAB_NECK
	else
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		var/picked_hit_type = pick("punched effectively", "kicked effectively", "tacticooled")
		var/effective_damage = A.get_punchdamagehigh()
		D.apply_damage(effective_damage, STAMINA)
		playsound(get_turf(D), 'sound/weapons/cqchit1.ogg', 50, 1, -1)
		D.visible_message(span_danger("[A] [picked_hit_type] [D]!"), \
						  span_userdanger("[A] [picked_hit_type] you!"))
		log_combat(A, D, "[picked_hit_type] (Trained Combat)")
		if(!(A.mobility_flags & MOBILITY_STAND) && (D.mobility_flags & MOBILITY_STAND))
			D.visible_message("<span class='warning'>[A] leg sweeps [D]!", \
								span_userdanger("[A] leg sweeps you!"))
			playsound(get_turf(A), 'sound/effects/hit_kick.ogg', 50, 1, -1)
			D.Knockdown(30)
			A.set_resting(FALSE)
			A.SetKnockdown(0)
			log_combat(A, D, "leg sweeped (Trained Combat)")
	return TRUE

/datum/martial_art/trained/proc/armlock(mob/living/carbon/human/A, mob/living/carbon/human/D) //handles armlock advance grab
	if(chokehold_active || D.stat)
		to_chat(A, span_warning("You can`t armlock while target is unconscious or you busy performing chokehold!"))
		return FALSE
	log_combat(A, D, "armlock(Trained Combat)")
	D.visible_message(
		span_danger("[A] attempts to advance restrain on [D]!"),
		span_userdanger("[A] attempts to advance restrain on you!")
	)
	A.do_attack_animation(D, ATTACK_EFFECT_GRAB)
	if(!do_after(A, 1.7 SECONDS, D))
		return FALSE
	if(isipc(D))
		var/datum/effect_system/spark_spread/s = new
		s.set_up(2, 1, D)
		s.start()
	A.do_attack_animation(D, ATTACK_EFFECT_DISARM2)
	playsound(D, 'modular_dripstation/sound/weapons/knockdown.ogg', 20, TRUE, -1)
	if(D.mobility_flags & MOBILITY_STAND)
		D.set_resting(TRUE)
	D.Immobilize(5 SECONDS)
	A.forceMove(get_turf(D))
	D.visible_message(
		span_danger("[A] successfully armlocks [D]!"),
		span_userdanger("[A] successfully armlocks you!")
	)

///CQC grab, no stun
/datum/martial_art/trained/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(A.a_intent == INTENT_GRAB && A!=D && (can_use(A) && can_use(D))) // A!=D prevents grabbing yourself
		add_to_streak("G",D)
		if(check_streak(A,D)) //if a combo is made no grab upgrade is done
			return TRUE
		if(D.grabbedby(A))
			D.drop_all_held_items()
			A.changeNext_move(CLICK_CD_CLICK_ABILITY)	//0.6 Seconds instead of 1, less frustrating
			//D.Stun(0.5 SECONDS)
		if(A.grab_state < 1)
			restraining = FALSE
		return TRUE
	else
		return FALSE

///CQC-like counter: attacker's weapon is placed in the defender's offhand and they are knocked down
/datum/martial_art/trained/handle_counter(mob/living/carbon/human/user, mob/living/carbon/human/attacker)
	if(!can_use(user))
		return
	if(!(user.mobility_flags & MOBILITY_STAND))	//counter attack stance works only when standing 
		return
	if(user.get_timed_status_effect_duration(/datum/status_effect/staggered))	//gloves counters your pathetic attempts to counter
		to_chat(user, span_warning("You're too off balance to counter this!"))
		return
	user.adjustStaminaLoss(35)	//Can't block forever. Not so effective as real CQC, can do it only a few times before screw up
	user.do_attack_animation(attacker, ATTACK_EFFECT_DISARM)
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
	else
		attacker.visible_message(span_warning("[user] grabs [attacker]'s arm as they attack and throws them to the ground!"), \
							span_userdanger("[user] grabs your arm as you attack and throws you to the ground!"))
		playsound(get_turf(attacker), 'modular_dripstation/sound/sweep_1.ogg', 50, 1, -1)
		if(I && !HAS_TRAIT(I, TRAIT_NODROP) && !CHECK_BITFIELD(I.item_flags, ABSTRACT))
			if(attacker.temporarilyRemoveItemFromInventory(I))
				var/hand = user.get_inactive_hand_index()
				if(!user.put_in_hand(I, hand))
					I.forceMove(get_turf(attacker))
		attacker.Knockdown(60)


/mob/living/carbon/human/proc/trained_help()
	set name = "Remember The Basics"
	set desc = "You try to remember some of the basics of your combat trainings."
	set category = "Combat Trainings"
	to_chat(usr, "<b><i>You try to remember some of the basics of your combat trainings.</i></b>")

	to_chat(usr, span_notice("<b>All of your unarmed attacks deal the most effective stamina damage you can perform while punching someone instead of your normal physical damage type</b>"))

	to_chat(usr, span_notice("<b>Grab Intent</b> Allow you to quickly increase the strength of your grabs"))
	to_chat(usr, span_notice("<b>Harm Intent</b> Will deal a competitive amount of stamina damage, and hitting a standing opponent while you are prone will both knock them down and stand you up"))

	to_chat(usr, "[span_notice("Restrain")]: <i>Grab Grab. Locks opponents into a restraining position, making your grab imposible to break out of for 2 seconds. Use <b>Harm Intent</b> on opponents arm to armlock or <b>Disarm Intent</b> on head to choke him to unconscious state.</i>")

	to_chat(usr, "<b><i>In addition, by having your throw mode on when being attacked, you enter an active defense mode where you have a chance to counter attacks done to you. Beware, counter-attacks are tiring and you won't be able to defend yourself forever!</i></b>")