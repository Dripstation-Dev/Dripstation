/datum/martial_art/cqc/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(A.a_intent == INTENT_GRAB && A!=D && (can_use(A) && can_use(D))) // A!=D prevents grabbing yourself
		add_to_streak("G",D)
		if(check_streak(A,D)) //if a combo is made no grab upgrade is done
			return TRUE
		if(D.grabbedby(A))
			D.Stun(0.5 SECONDS)
			A.changeNext_move(CLICK_CD_RAPID)
		if(A.grab_state < 1)
			restraining = FALSE
		return TRUE
	else
		return FALSE

///CQC counter: attacker's weapon is placed in the defender's offhand and they are knocked down
/datum/martial_art/cqc/handle_counter(mob/living/carbon/human/user, mob/living/carbon/human/attacker)
	if(!can_use(user))
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
	else
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
	if(user.a_intent == INTENT_GRAB)
		grab_act(user,attacker)