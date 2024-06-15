/obj/item/shield/riot
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'

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

/obj/item/shield/energy
	base_icon_state = "syndieeshield"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
	block_chance = 40

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

/obj/item/shield/energy/bananium
	base_icon_state = "bananaeshield"
	icon = 'modular_dripstation/icons/obj/weapons/shield.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/shield_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/shield_righthand.dmi'
