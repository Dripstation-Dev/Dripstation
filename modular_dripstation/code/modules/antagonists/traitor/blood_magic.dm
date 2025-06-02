/datum/action/cooldown/spell/touch/blood
	name = "Blood Magic"
	button_icon = 'icons/mob/actions/actions_cult.dmi'
	button_icon_state = "telerune"
	desc = "Fear the Old Blood."

	invocation_type = INVOCATION_SHOUT
	sound = 'sound/effects/ghost.ogg'
	spell_requirements = SPELL_CASTABLE_WITHOUT_INVOCATION | SPELL_REQUIRES_NO_ANTIMAGIC
	school = SCHOOL_UNSET
	cooldown_time = 10 SECONDS
	var/health_cost = 0 //The amount of health taken from the user when invoking the spell

/*
/datum/action/cooldown/spell/touch/blood/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return .
	if(iscarbon(owner) && owner.health < 0)
		return . | SPELL_CANCEL_CAST
*/

/datum/action/cooldown/spell/touch/blood/cast(mob/living/carbon/cast_on)
	. = ..()
	if(!iscarbon(owner))
		return FALSE
	var/mob/living/carbon/U = owner
	blood_ritual(U)

/datum/action/cooldown/spell/touch/blood/proc/blood_ritual(mob/living/carbon/user)
	if(health_cost)
		if(user.active_hand_index == 1)
			user.apply_damage(health_cost, BRUTE, BODY_ZONE_L_ARM, wound_bonus = 10, sharpness = SHARP_EDGED)
		else
			user.apply_damage(health_cost, BRUTE, BODY_ZONE_R_ARM, wound_bonus = 10, sharpness = SHARP_EDGED)
	SEND_SOUND(user, sound('sound/effects/magic.ogg',0,1,25))

/datum/action/cooldown/spell/touch/blood/on_antimagic_triggered(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster)
	victim.visible_message(
		span_danger("The spell bounces off of [victim]!"),
		span_danger("The spell bounces off of you!"),
	)

/datum/action/cooldown/spell/touch/blood/stun
	name = "Stunning Aura"
	desc = "Will stun and mute a victim on contact. Those with shielded minds are uneffected."
	button_icon_state = "hand"
	background_icon_state = "bg_demon"
	overlay_icon_state = "bg_demon_border"

	health_cost = 10

	invocation = "Fuu ma'jin!"

	hand_path = /obj/item/melee/touch_attack/blood_fist


/datum/action/cooldown/spell/touch/blood/stun/is_valid_target(atom/cast_on)
	return isliving(cast_on)

/datum/action/cooldown/spell/touch/blood/stun/cast_on_hand_hit(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster)
//	if(!isliving(victim)) for now, makes heretic hand hit everything but it's for the best
//		return FALSE

	if(SEND_SIGNAL(caster, COMSIG_HERETIC_MANSUS_GRASP_ATTACK, victim) & COMPONENT_BLOCK_HAND_USE)
		return FALSE

	if(HAS_TRAIT(victim, TRAIT_MINDSHIELD))
		victim.visible_message("<span class='warning'>[victim] winces slightly as a red flash eminates from [caster]'s hand</span>", \
								   "<span class='userdanger'>You get a small headache as a red flash eminates from [caster]'s hand!</span>")

	if(isliving(victim))
		var/mob/living/living_hit = victim
		living_hit.apply_damage(10, BRUTE, wound_bonus = CANT_WOUND)
		if(iscarbon(victim))
			var/mob/living/carbon/carbon_hit = victim
			carbon_hit.cultslurring += 7
			carbon_hit.AdjustKnockdown(5 SECONDS)
			carbon_hit.apply_damage(50, STAMINA, BODY_ZONE_HEAD)
			carbon_hit.flash_act(1,1)
			carbon_hit.adjust_stutter(7 SECONDS)
			carbon_hit.adjust_jitter(7 SECONDS)
		if(issilicon(victim))
			var/mob/living/silicon/silicon_hit = victim
			silicon_hit.emp_act(EMP_LIGHT)
		if(is_servant_of_ratvar(victim))
			living_hit.apply_damage(10, BRUTE, wound_bonus = CANT_WOUND)	//10 additional damage
	return TRUE

/obj/item/melee/touch_attack/blood_fist
	name = "Blood Grasp"
	desc = "A sinister looking aura that distorts the flow of reality around it. \
		Causes knockdown, minor bruises, and stamina damage."
	icon = 'icons/obj/wizard.dmi'
	lefthand_file = 'icons/mob/inhands/misc/touchspell_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/touchspell_righthand.dmi'
	icon_state = "disintegrate"
	item_state = "disintegrate"
	color = RUNE_COLOR_RED

/datum/action/cooldown/spell/touch/blood/manipulation
	name = "Blood Rites"
	desc = "Empowers your hand to absorb blood to be used for advanced rites."
	invocation = "Fel'th Dol Ab'orod! S`Sarsĥs Sup`me!"
	spell_requirements = SPELL_CASTABLE_WITHOUT_INVOCATION | SPELL_REQUIRES_NO_ANTIMAGIC
	button_icon_state = "manip"
	background_icon_state = "bg_demon"
	overlay_icon_state = "bg_demon_border"
	hand_path = "/obj/item/melee/touch_attack/manipulator"
	health_cost = 5
	var/charges = 0

/obj/item/melee/touch_attack/manipulator
	name = "Blood Rite Aura"
	desc = "Absorbs blood from anything you touch. Use to self to cast an advanced rite."
	icon = 'icons/obj/wizard.dmi'
	lefthand_file = 'icons/mob/inhands/misc/touchspell_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/touchspell_righthand.dmi'
	icon_state = "disintegrate"
	item_state = "disintegrate"
	color = "#7D1717"

/obj/item/melee/touch_attack/manipulator/examine(mob/user)
	. = ..()
	. += "Attack self handspell to cast advanced rites."
	. += "Blood spear, blood bolt barrage, and blood frenzy cost 150, 300, and 500 charges respectively."
	. += "Spell has [spell_which_made_us?.resolve().charges] charges."

/obj/item/melee/touch_attack/manipulator/proc/check_menu(mob/user)
	if(!istype(user))
		CRASH("The cult construct selection radial menu was accessed by something other than a valid user.")
	if(user.incapacitated() || !user.Adjacent(src))
		return FALSE
	return TRUE

/obj/item/melee/touch_attack/manipulator/attack_self(mob/user)
	var/datum/action/cooldown/spell/touch/blood/manipulation/hand_spell = spell_which_made_us?.resolve()
	var/static/list/spells = list(
		"Blood Spear (150)" = image(icon = 'icons/obj/weapons/spears.dmi',icon_state = "bloodspear0"),
		"Blood Bolt Barrage (300)" = image(icon = 'icons/obj/guns/projectile.dmi',icon_state = "arcane_barrage"),
		"Blood Frenzy (500)" = image(icon = 'icons/mob/actions/actions_cult.dmi',icon_state = "sintouch")
		)
	var/chosen_rite = show_radial_menu(user, src, spells, custom_check = CALLBACK(src, PROC_REF(check_menu), user), require_near = TRUE)
	if(QDELETED(src) || QDELETED(hand_spell) || QDELETED(user))
		return FALSE
	if(!check_menu(user))
		to_chat(user, span_cultitalic("You decide against conducting a greater blood rite."))
		return
	switch(chosen_rite)
		if("Blood Spear (150)")
			if(hand_spell.charges < 150)
				to_chat(user, span_cultitalic("You need 150 charges to perform this rite."))
			else
				hand_spell.charges -= 150
				var/turf/T = get_turf(user)
				//qdel(src)
				var/datum/action/innate/cult/spear/S = new(user)
				var/obj/item/cult_spear/rite = new(T)
				S.Grant(user, rite)
				rite.spear_act = S
				if(user.put_in_hands(rite))
					to_chat(user, span_cultitalic("A [rite.name] appears in your hand!"))
					return TRUE
				else
					user.visible_message(span_warning("A [rite.name] appears at [user]'s feet!"), \
						 span_cultitalic("A [rite.name] materializes at your feet."))
					return FALSE
		if("Blood Bolt Barrage (300)")
			if(hand_spell.charges < 300)
				to_chat(user, span_cultitalic("You need 300 charges to perform this rite."))
			else
				var/obj/rite = new /obj/item/gun/ballistic/rifle/boltaction/enchanted/arcane_barrage/blood()
				//qdel(src)
				if(user.put_in_hands(rite))
					hand_spell.charges -= 300
					to_chat(user, span_cult("<b>Your hands glow with power!</b>"))
					return TRUE
				else
					to_chat(user, span_cultitalic("You need a free hand for this rite!"))
					qdel(rite)
					return FALSE
		if("Blood Frenzy (500)")
			if(hand_spell.charges < 500)
				to_chat(user, span_cultitalic("You need 500 charges to perform this rite."))
			else
				hand_spell.charges -= 500
				//qdel(src)
				user.reagents.add_reagent(/datum/reagent/medicine/changelinghaste, 5)
				to_chat(user, span_cultlarge("<b>Your feel the POWER OVERWHELMING YOU!!!</b>"))
				return TRUE

/obj/item/melee/touch_attack/manipulator/afterattack(atom/target, mob/living/carbon/user, proximity, click_parameters)
	if(!can_see(user, target, 5) || get_dist(target, user) > 5)
		user.visible_message(span_notice("[user]'s hand reaches out but nothing happens."))
		return
	. = ..(target, user, TRUE, click_parameters) //call the parent, forcing proximity = TRUE so even distant things are considered nearby

datum/action/cooldown/spell/touch/blood/manipulation/is_valid_target(atom/cast_on)
	return ishuman(cast_on) || istype(cast_on, /obj/effect/decal/cleanable/blood)

/datum/action/cooldown/spell/touch/blood/manipulation/cast_on_hand_hit(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster)
	if(ishuman(victim))
		var/mob/living/carbon/human/H = victim
		if(NOBLOOD in H.dna.species.species_traits)
			to_chat(owner,span_warning("Blood rites do not work on species with no blood!"))
			return FALSE
		else
			if(H.stat == DEAD)
				to_chat(owner,span_warning("[H.p_their(TRUE)] blood has stopped flowing, you'll have to find another way to extract it."))
				return FALSE
			if(H.cultslurring)
				to_chat(owner,span_danger("[H.p_their(TRUE)] blood has been tainted by an even stronger form of blood magic, it's no use to us like this!"))
				return FALSE
			if(H.blood_volume > BLOOD_VOLUME_OKAY(H))	
				if(!H.is_bleeding())
					to_chat(owner,span_danger("[H.p_theyre(TRUE)] have no bleeding wounds to drain blood from - you cannot drain [H.p_them()]!"))
					return FALSE
				H.blood_volume -= 100
				charges += 50
				owner.Beam(H,icon_state="drainbeam",time=10)
				playsound(get_turf(H), 'sound/magic/enter_blood.ogg', 50)
				H.visible_message(span_danger("[owner] has drained some of [H]'s blood!"))
				to_chat(owner,span_cultitalic("Your blood rite gains 50 charges from draining [H]'s blood."))
				new /obj/effect/temp_visual/cult/sparks(get_turf(H))
			else
				to_chat(owner,span_danger("[H.p_theyre(TRUE)] missing too much blood - you cannot drain [H.p_them()] further!"))
				return FALSE
	else if(istype(victim, /obj/effect/decal/cleanable/blood))
		blood_draw(victim)
	else 
		to_chat(owner,span_cultitalic("You have nothing to drain."))


/datum/action/cooldown/spell/touch/blood/manipulation/proc/blood_draw(atom/cast_on)
	var/temp = 0
	var/turf/T = get_turf(cast_on)
	if(T)
		for(var/obj/effect/decal/cleanable/blood/B in view(T, 2))
			if(B.blood_state == BLOOD_STATE_HUMAN)
				if(B.bloodiness == 100) //Bonus for "pristine" bloodpools, also to prevent cheese with footprint spam
					temp += 30
				else
					temp += max((B.bloodiness**2)/800,1)
				new /obj/effect/temp_visual/cult/turf/floor(get_turf(B))
				qdel(B)
		for(var/obj/effect/decal/cleanable/blood/trail_holder/TH in view(T, 2))
			qdel(TH)
		if(temp)
			owner.Beam(T,icon_state="drainbeam",time=15)
			new /obj/effect/temp_visual/cult/sparks(get_turf(owner))
			playsound(T, 'sound/magic/enter_blood.ogg', 50)
			to_chat(owner, span_cultitalic("Your blood rite has gained [round(temp)] charge\s from blood sources around you!"))
			charges += max(1, round(temp))


/obj/item/book/granter/action/spell/blood_magic
	granted_action = /datum/action/cooldown/spell/touch/blood/stun
	action_name = "blood magic"
	icon_state ="tome_cult_attack"
	desc = "This book feels warm and wet to the touch. S`Sarsĥs awaits..."
	remarks = list(
		"Okey, NTNet, how to use blood to perform tricks?",
		"Vampires... What about vampires?",
		"Bloodrites... really?",
		"Faint... I think I`m just lost like a half of my blood...",
		"What's the difference between a Nar`Sie and S`Sarsĥs?..",
		"The price of this is my soul...",
	)
	var/datum/action/cooldown/spell/second_granted_action = /datum/action/cooldown/spell/touch/blood/manipulation


/obj/item/book/granter/action/spell/blood_magic/can_learn(mob/user)
	if(!user.has_language(/datum/language/draconic))
		to_chat(user, span_notice("This book is on unknown language, you can`t read it."))
		return FALSE
	return ..()


/obj/item/book/granter/action/spell/blood_magic/on_reading_finished(mob/living/user)
	. = ..()
	var/datum/action/cooldown/spell/new_spell_sec = new second_granted_action(user.mind || user)
	new_spell_sec.Grant(user)
	user.mind.damnation_type = CONTRACT_MAGIC
	to_chat(user, span_notice("A profound emptiness washes over you as you lose ownership of your soul."))
