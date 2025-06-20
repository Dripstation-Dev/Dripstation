/obj/item/shield
	var/antithrow_bonus = 30
	var/leap_block = TRUE
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_block_shield.ogg'

/obj/item/shield/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(transparent && (hitby.pass_flags & PASSGLASS))
		return FALSE
	if(attack_type == THROWN_PROJECTILE_ATTACK)
		final_block_chance += antithrow_bonus
	if(attack_type == LEAP_ATTACK)
		final_block_chance = leap_block
	return ..()

/obj/item/shield/riot
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_sound = 'modular_dripstation/sound/weapons/block/sound_weapons_block_shield.ogg'

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
	max_integrity = 200
	transparent = FALSE
	antithrow_bonus = 0
	force = 15
	throwforce = 20
	throw_speed = 1
	throw_range = 2

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
	if (atom_integrity <= dam)
		var/turf/T = get_turf(owner)
		T.visible_message(span_warning("[hitby] destroys [src]!"))
		shatter(owner)
		qdel(src)
		return FALSE
	take_damage(dam)
	return ..()

/obj/item/shield/energy
	base_icon_state = "syndieeshield"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_chance = 40
	antithrow_bonus = 0
	block_sound = 'modular_dripstation/sound/shield_drained.ogg'
	block_color = COLOR_RED

/obj/item/shield/energy/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(active)
		if(istype(hitby, /obj/projectile/bullet))
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

/obj/item/shield/energy/IsReflect()
	return (active*(block_chance+35)/100)

/obj/item/shield/energy/advanced
	base_icon_state = "eshield"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_chance = 65
	block_color = COLOR_BLUE

/obj/item/shield/energy/bananium
	base_icon_state = "bananaeshield"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_color = COLOR_YELLOW
