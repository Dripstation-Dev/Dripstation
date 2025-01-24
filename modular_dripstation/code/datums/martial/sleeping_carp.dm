block_chance = 90 //Carp evades freak shit like shoves and hands, 50% dodges other unarmed attacks

///Carp conter: carp evades freak shit like shoves and hands, 50% dodges other unarmed attacks
/datum/martial_art/the_sleeping_carp/handle_counter(mob/living/carbon/human/user, mob/living/carbon/human/attacker)
	if(!can_use(user))
		return
	var/obj/item/I = attacker.get_active_held_item()
	if(I && istype(I, /obj/item/melee/touch_attack))
		var/obj/item/melee/touch_attack/touch_weapon = I
		attacker.visible_message(span_warning("[user] carefully dodges [attacker]'s [touch_weapon]!"), \
						span_userdanger("[user] reflects your arm as you attack and evades your [touch_weapon]!"))
		to_chat(user, span_danger("You take great care to remain untouched by [attacker]'s [touch_weapon]!"))
	if(!I && prob(50))
		attacker.visible_message(span_warning("[user] carefully dodges [attacker]'s unarmed attack!"), \
						span_userdanger("[user] reflects your arm as you attack and evades your unarmed attack!"))
		to_chat(user, span_danger("You take great care to remain untouched by [attacker]'s unarmed attack!"))