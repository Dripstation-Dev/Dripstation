/obj/item/melee/dualsaber
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	block_chance = 50
	force_wielded = 40
	desc = "A more powerful version on the energy sword, it is more capable of blocking energy projectiles in throw mode than its single bladed counterpart. 'At last we will have revenge' is carved on the side of the handle."

/obj/item/melee/dualsaber/IsReflect(mob/user)
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		if(prob(75))
			return TRUE
	return FALSE

/obj/item/melee/dualsaber/makeshift/IsReflect()//only 50% chance to reflect, so it still has the cool effect, but not 100% chance
	if(prob(50))
		return TRUE
	return FALSE