/datum/reagent/consumable/condensedcapsaicin/reaction_mob(mob/living/M, methods=TOUCH, reac_volume)
	if(!ishuman(M) && !ismonkey(M))
		return

	var/mob/living/carbon/victim = M
	if(methods & (TOUCH|VAPOR))
		//check for protection
		var/mouth_covered = victim.is_mouth_covered()
		var/eyes_covered = victim.is_eyes_covered()

		//actually handle the pepperspray effects
		if ( eyes_covered && mouth_covered )
			return
		else if ( mouth_covered )	// Reduced effects if partially protected
			if(prob(50))
				victim.emote("scream")
			victim.adjust_eye_blur(14)
			victim.blind_eyes(10)
			victim.set_confusion_if_lower(10 SECONDS)
			victim.damageoverlaytemp = 75
			victim.Knockdown(6 SECONDS)
			M.adjustStaminaLoss(5)
			return
		else if ( eyes_covered ) // Eye cover is better than mouth cover
			if(prob(20))
				victim.emote("cough")
			victim.adjust_eye_blur(4)
			victim.set_confusion_if_lower(5 SECONDS)
			victim.damageoverlaytemp = 50
			M.adjustStaminaLoss(5)
			return
		else // Oh dear :D
			if(prob(60))
				victim.emote("scream")
			else
				victim.emote("cough")
			victim.adjust_eye_blur(14)
			victim.blind_eyes(10)
			victim.set_confusion_if_lower(12 SECONDS)
			victim.damageoverlaytemp = 100
			victim.Knockdown(14 SECONDS)
			M.adjustStaminaLoss(10)
		victim.update_damage_hud()