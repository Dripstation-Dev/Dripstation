// Zipties, cable cuffs, etc. Can be cut with wirecutters instantly.
#define HANDCUFFS_TYPE_WEAK 0
// Handcuffs... alien handcuffs. Can be cut through only by jaws of life.
#define HANDCUFFS_TYPE_STRONG 1
/obj/item/restraints/handcuffs
	var/restraint_strength = HANDCUFFS_TYPE_STRONG

/obj/item/restraints/handcuffs/fake
	restraint_strength = HANDCUFFS_TYPE_WEAK

/obj/item/restraints/handcuffs/cable
	restraint_strength = HANDCUFFS_TYPE_WEAK

/obj/item/restraints/legcuffs/bola
	icon = 'modular_dripstation/icons/obj/handcuffs.dmi'

/obj/item/restraints/legcuffs/beartrap/energy
	icon = 'modular_dripstation/icons/obj/handcuffs.dmi'

/obj/item/restraints/handcuffs/lewd
	name = "kinky handcuffs"
	desc = "Fake handcuffs meant for erotic roleplay."
	icon_state = "pinkcuffs"
	item_state = "pinkcuffs"
	icon = 'modular_dripstation/icons/obj/kinky.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/equipment/kinky_left.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/equipment/kinky_right.dmi'
	breakouttime = 1 SECONDS
	restraint_strength = HANDCUFFS_TYPE_WEAK

/mob/living/carbon/update_inv_handcuffed()

/obj/item/restraints/handcuffs/lewd/apply_cuffs(mob/living/carbon/target, mob/user, dispense = 0)
	. = ..()

	// Similar code in general procedures does not correctly set the appearance
	target.remove_overlay(HANDCUFF_LAYER)
	if(!target.handcuffed)
		return
	target.overlays_standing[HANDCUFF_LAYER] = mutable_appearance('modular_dripstation/icons/mob/kinky.dmi', "pinkcuffs", -HANDCUFF_LAYER)
	target.apply_overlay(HANDCUFF_LAYER)
