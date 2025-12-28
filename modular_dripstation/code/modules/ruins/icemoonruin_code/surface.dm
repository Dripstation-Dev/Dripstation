/obj/structure/frosen_mech
	name = "frosen wreck"
	desc = "The remains of a monstrous war machine."
	icon = 'modular_dripstation/icons/obj/mech_derelict.dmi'
	icon_state = "green"
	bound_width = 260
	bound_height = 160
	flags_1 = ON_BORDER_1
	appearance_flags = 0
	layer = FLY_LAYER
	anchored = TRUE
	density = TRUE
	bound_width = 416
	bound_height = 64
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/structure/frosen_mech/Initialize(mapload)
	. = ..()
	src.freeze()