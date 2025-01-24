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
