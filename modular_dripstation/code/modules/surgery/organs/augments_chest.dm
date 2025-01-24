/obj/item/organ/cyberimp/chest/spinalspeed
	name = "combat neural overclocker implant"
	desc = "Stimulates your central nervous system in order to enable you to perform muscle movements faster. Careful not to overuse it. Version with better cooling and emp protection."
	icon_state = "imp_spinal"
	icon = "modular_dripstation/icons/obj/augments.dmi"
	cooling_modifier = 3

/obj/item/organ/cyberimp/chest/spinalspeed/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_EMPPROOF_SELF, "innate_empproof")