/obj/item/shield
	var/antithrow_bonus = 30
	var/leap_block = TRUE
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_block_shield.ogg'
	attack_verb = list("shielded", "bashed")
	var/bash = FALSE
	var/bash_sound 
	COOLDOWN_DECLARE(bash_cooldown)
	var/bash_cooldown_time = 30 SECONDS
	var/bash_multi = 1

/obj/item/shield/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(transparent && (hitby.pass_flags & PASSGLASS))
		return FALSE
	if(attack_type == THROWN_PROJECTILE_ATTACK)
		final_block_chance += antithrow_bonus
	if(attack_type == LEAP_ATTACK && leap_block)
		final_block_chance = 100
	return ..()

/obj/item/shield/examine(mob/user)
	. = ..()
	if(bash && (in_range(user, src) || isobserver(user)))
		. += span_notice("You can bash people with it. Attack person with disarm intent aiming to the head to do so.[COOLDOWN_FINISHED(src, bash_cooldown)?"":"Current bash cooldown"[COOLDOWN_TIMELEFT(src, bash_cooldown)]]")
		return

/obj/item/shield/afterattack(atom/target, mob/user, proximity)
	if(!bash || !COOLDOWN_FINISHED(src, bash_cooldown))
		return ..()
	var/mob/living/carbon/C = target
	var/mob/living/carbon/U = user
	if(user.a_intent == INTENT_DISARM && istype(C) && istype(U) && user.zone_selected == BODY_ZONE_HEAD)
		C.adjust_staggered_up_to(1 SECONDS*bash_multi, 3 SECONDS)
		C.adjust_confusion_up_to(1 SECONDS*bash_multi, 3 SECONDS)
		C.adjust_eye_blur_up_to(0.5 SECONDS*bash_multi, 1.5 SECONDS)
		C.say("Ugh-")
		U.adjustStaminaLoss(10*bash_multi)
		playsound(C.loc, bash_sound, 50, 2)
		COOLDOWN_START(src, bash_cooldown, bash_cooldown_time)

/obj/item/shield/riot/on_shield_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", damage = 0, attack_type = MELEE_ATTACK)
	if(!damage)
		return ..()
	var/dam = damage	//avoiding issues with demolition_mod
	if(istype(hitby, /obj))
		var/obj/hit = hitby
		dam = damage * ((1 + hit.demolition_mod)/2)
	if (atom_integrity <= dam)
		var/turf/T = get_turf(owner)
		T.visible_message(span_warning("[hitby] destroys [src]!"))
		shatter(owner)
		qdel(src)
		return FALSE
	take_damage(dam)
	return ..()

/obj/item/shield/riot
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_block_shield.ogg'
	bash_sound = 'modular_dripstation/sound/weapons/wpn_bash_shield_light.wav'
	bash = TRUE

/obj/item/shield/riot/robust
	name = "riot control shield"
	desc = "A shield adept at blocking blunt objects from connecting with the torso of the shield wielder. This one is pretty robust."
	max_integrity = 100
	slowdown = 0
	block_chance = 60
	slot_flags = null
	icon_state = "riot_robust"
	item_state = "riot_robust"

/obj/item/shield/riot/robust/nt
	name = "NT riot control shield"
	desc = "A shield adept at blocking blunt objects from connecting with the torso of the shield wielder. This one is pretty robust. Has Nanotrasen logo on it."
	icon_state = "riot_robust_nt"
	item_state = "riot_robust_nt"

/obj/item/shield/riot/roman
	icon = 'icons/obj/shields.dmi'
	worn_icon = 'icons/mob/clothing/back.dmi'

/obj/item/shield/riot/roman
	icon = 'icons/obj/shields.dmi'
	worn_icon = 'icons/mob/clothing/back.dmi'

/obj/item/shield/riot/buckler
	icon = 'icons/obj/shields.dmi'
	worn_icon = 'icons/mob/clothing/back.dmi'

/obj/item/shield/riot/goliath
	icon = 'icons/obj/shields.dmi'
	worn_icon = 'icons/mob/clothing/back.dmi'

/obj/item/shield/riot/tele
	icon = 'icons/obj/shields.dmi'
	worn_icon = 'icons/mob/clothing/back.dmi'

/obj/item/shield/bulletproof
	name = "bulletproof shield"
	desc = "A shield adept at blocking physical projectiles from connecting with the torso of the shield wielder."
	icon_state = "metal"
	item_state = "metal"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	alternate_worn_layer = SIDE_HEAD_LAYER
	max_integrity = 200
	transparent = FALSE
	antithrow_bonus = 0
	slowdown = 0.3
	force = 15
	throwforce = 20
	throw_speed = 1
	throw_range = 2
	bash_cooldown_time = 1 MINUTES
	bash_sound = 'modular_dripstation/sound/weapons/wpn_bash_shield_heavy.wav'
	bash_multi = 2
	bash = TRUE

/obj/item/shield/bulletproof/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(istype(hitby, /obj/projectile/bullet))
		final_block_chance += 30
	return ..()

/obj/item/shield/bulletproof/proc/shatter(mob/living/carbon/human/owner)
	playsound(owner, 'sound/effects/bang.ogg', 100)
	new /obj/item/stack/sheet/metal((get_turf(src)), 5)

/obj/item/shield/bulletproof/on_shield_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", damage = 0, attack_type = MELEE_ATTACK)
	if(!damage)
		return ..()
	var/dam = damage
	if(attack_type == PROJECTILE_ATTACK && !istype(hitby, /obj/projectile/bullet))
		dam += damage
	if(istype(hitby, /obj))
		dam *= demolition_mod
	if (atom_integrity <= dam)
		var/turf/T = get_turf(owner)
		T.visible_message(span_warning("[hitby] destroys [src]!"))
		shatter(owner)
		qdel(src)
		return FALSE
	take_damage(dam)
	return ..()

/obj/item/shield/energy
	name = "energy combat shield"
	desc = "A shield that reflects almost all energy projectiles, but is useless against conventional strong and armor piercing projectiles. It can be retracted, expanded, and stored anywhere."
	base_icon_state = "syndieeshield"
	icon_state = "syndieeshield1"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_chance = 55
	on_force = 17
	wound_bonus = 5
	leap_block = FALSE
	antithrow_bonus = 0
	slowdown = 0
	alternate_worn_layer = SIDE_HEAD_LAYER
	block_sound = 'modular_dripstation/sound/shield_drained.ogg'
	block_color = COLOR_RED
	light_color = COLOR_RED
	light_system = MOVABLE_LIGHT
	light_range = 3
	light_power = 1
	light_on = FALSE
	var/shield_charge = 0
	var/full_shield_charge = 100
	var/restart_shield_rate = 0.15
	COOLDOWN_DECLARE(eshield_cooldown)

/obj/item/shield/energy/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		if(COOLDOWN_FINISHED(src, eshield_cooldown))
			. += span_notice("Shield is ready. Current charge: "[shield_charge >= full_shield_charge ? "[span_green("100%")]":"[span_red("[shield_charge/full_shield_charge*100]")]%. Reactivate to recharge."])
		else
			. += span_notice("Shield is curretly recharging, estimated time: [COOLDOWN_TIMELEFT(src, eshield_cooldown)]")
		return

/obj/item/shield/energy/attack_self(mob/living/carbon/human/user)
	if(clumsy_check && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		to_chat(user, span_warning("You beat yourself in the head with [src]."))
		user.take_bodypart_damage(5)
	set_state(user)

/obj/item/shield/energy/proc/set_state(mob/living/carbon/human/user, state = -1)
	if(!COOLDOWN_FINISHED(src, eshield_cooldown))
		to_chat(user, span_notice("[src] refuses to activate."))
		playsound(user, 'sound/machines/beep.ogg', 35, 1)
		return
	if(state != -1)
		active = state
	else
		active = !active
	icon_state = "[base_icon_state][active]"

	if(active)
		shield_charge = full_shield_charge
		leap_block = TRUE
		force = on_force
		throwforce = on_throwforce
		throw_speed = on_throw_speed
		set_light_on(TRUE)
		w_class = WEIGHT_CLASS_BULKY
		playsound(user, 'sound/weapons/saberon.ogg', 35, 1)
		to_chat(user, span_notice("[src] is now active."))
	else
		if(state != -1)
			to_chat(user, span_notice("[src] deactivates!"))
		else
			to_chat(user, span_notice("[src] can now be concealed."))
		var/time_to_restart = full_shield_charge - shield_charge
		if(time_to_restart > 0)
			COOLDOWN_START(src, eshield_cooldown, time_to_restart * restart_shield_rate SECONDS)
		shield_charge = initial(shield_charge)
		leap_block = initial(leap_block)
		force = initial(force)
		throwforce = initial(throwforce)
		throw_speed = initial(throw_speed)
		set_light_on(FALSE)
		w_class = WEIGHT_CLASS_TINY
		playsound(user, 'sound/weapons/saberoff.ogg', 35, 1)
	add_fingerprint(user)

/obj/item/shield/energy/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(active)
		if(istype(hitby, /obj/projectile/bullet))
			final_block_chance -= 5
			var/obj/projectile/bullet/P = hitby
			if(P.damage >= 30 || P.armour_penetration >= 30)
				var/turf/T = get_turf(owner)
				T.visible_message(span_warning("The sheer force from [P] passes through the [src]!"))
				var/datum/effect_system/spark_spread/sparks = new
				sparks.set_up(5, 1, T)
				playsound(T, 'sound/effects/empulse.ogg', 100)
				return 0
		return ..()
	return 0

/obj/item/shield/energy/on_shield_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", damage = 0, attack_type = MELEE_ATTACK)
	if(!damage)
		return ..()
	shield_charge -= damage
	if(shield_charge <= 0)
		set_state(owner, 0)
	return ..()

/obj/item/shield/energy/IsReflect()
	return (active*(block_chance+35)/100)

/obj/item/shield/energy/security
	name = "energy security shield"
	desc = "A shield that reflects almost all energy projectiles, but is useless against conventional strong and armor piercing projectiles. It can be retracted, expanded, and stored anywhere. Probably trophy taken from some unfortunate bastard."
	restart_shield_rate = 0.2

/obj/item/shield/energy/advanced
	name = "energy advanced shield"
	base_icon_state = "eshield"
	icon_state = "eshield1"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_chance = 65
	block_color = COLOR_BLUE
	light_color = COLOR_BLUE
	full_shield_charge = 200
	restart_shield_rate = 0.05

/obj/item/shield/energy/bananium
	base_icon_state = "bananaeshield"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_color = COLOR_YELLOW
	light_color = COLOR_YELLOW
