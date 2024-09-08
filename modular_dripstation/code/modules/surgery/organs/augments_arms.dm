/obj/item/organ/cyberimp/arm/toolset
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "multitool_utility"

/obj/item/organ/cyberimp/arm/toolset/surgery
	icon_state = "multitool_medical"

/obj/item/organ/cyberimp/arm/toolset/janitorial
	name = "janitor toolset implant"
	desc = "A set of janitor tools hidden behind a concealed panel on the user's arm."
	icon_state = "multitool"
	contents = newlist(/obj/item/mop/advanced, /obj/item/soap, /obj/item/lightreplacer, /obj/item/holosign_creator, /obj/item/melee/flyswatter, /obj/item/reagent_containers/spray/cleaner)

/obj/item/organ/internal/cyberimp/arm/hacking
	name = "hacking arm implant"
	desc = "A small arm implant containing an advanced screwdriver, combat wrench and multitool designed for combat engineers and on-the-field machine modification."
	icon_state = "multitool_syndicate"
	contents = newlist(/obj/item/screwdriver/nuke/hacking, /obj/item/wrench/combat, /obj/item/jawsoflife/syndicate, /obj/item/multitool/ai_detect/red)

/obj/item/screwdriver/nuke/hacking
	toolspeed = 0.33

/obj/item/organ/cyberimp/arm/esword
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "arm_energy"
	contents = newlist(/obj/item/melee/transforming/energy/blade)
	syndicate_implant = TRUE

/obj/item/melee/transforming/energy/blade
	lefthand_file = 'modular_dripstation/icons/mob/inhands/augment_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/augment_righthand.dmi'

/obj/item/organ/cyberimp/arm/hardlight
	name = "arm-mounted hardlight blade"
	desc = "Combat arm with highly dangerous cybernetic implant that can project a deadly blade of concentrated energy."
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "arm_hardlight"
	contents = newlist(/obj/item/melee/transforming/energy/blade/hardlight)

/obj/item/organ/cyberimp/arm/hardlight/stealth
	syndicate_implant = TRUE

/obj/item/organ/cyberimp/arm/medibeam
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "multitool_syndicatemedical"

/obj/item/organ/cyberimp/arm/flash
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "arm_flash"

/obj/item/organ/cyberimp/arm/flash/rev
	icon_state = "arm_revflash"

/obj/item/organ/cyberimp/arm/baton
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "arm_baton"

/obj/item/organ/cyberimp/arm/combat
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "multitool_combat"

/obj/item/organ/cyberimp/arm/syndie_mantis
	desc = "Modernized mantis blades designed and coined by Gorlex operatives. Energy actuators makes the blade a much deadlier weapon and provides protection."
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "mantis_syndicate"

/obj/item/organ/cyberimp/arm/nt_mantis
	name = "N.A.N.O. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. This one provides extra wound chances.  Wielding two will let you double-attack."
	contents = newlist(/obj/item/mantis/blade/NT)
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "mantis_militech"

/obj/item/organ/cyberimp/arm/militech_mantis
	name = "H.E.P.H.A.E.S.T.U.S. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. This one provides extra toolspeed and damage. Wielding two will let you double-attack."
	contents = newlist(/obj/item/mantis/blade/hepestus)

/obj/item/organ/cyberimp/arm/blade
	name = "unbranded mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. Wielding two will let you double-attack."
	contents = newlist(/obj/item/mantis/blade)

/obj/item/organ/cyberimp/arm/shellguard_mantis
	name = "S.H.E.L.L. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. This one provides extra protection. Wielding two will let you double-attack."
	contents = newlist(/obj/item/mantis/blade/shellguard)

/obj/item/organ/cyberimp/arm/hfreq_mantis
	name = "S.H.E.L.L. mantis blade implants"
	desc = "Retractable arm-blade implants to get you out of a pinch. This one provides better armor penetration. Wielding two will let you double-attack."
	contents = newlist(/obj/item/mantis/blade/hfreq)

/obj/item/mantis/blade
	icon = "modular_dripstation/icons/obj/augments.dmi"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/augment_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/augment_righthand.dmi'
	icon_state = "mantis"
	force = 18

/obj/item/mantis/blade/NT
	name = "N.A.N.O. mantis blade"
	icon_state = "mantis"
	wound_bonus = 30

/obj/item/mantis/blade/hepestus
	name = "H.E.P.H.A.E.S.T.U.S. mantis blade"
	icon_state = "mantis_militech"
	force = 24
	toolspeed = 0.2

/obj/item/mantis/blade/shellguard
	name = "S.H.E.L.L. mantis blade"
	icon_state = "mantis_shellguard"
	block_chance = 30

/obj/item/mantis/blade/hfreq
	name = "high frequency mantis blade"
	armour_penetration = 50
	icon_state = "mantis_hfreq"

/obj/item/mantis/blade/syndicate
	icon_state = "mantis_syndicate"
	force = 20

/obj/item/organ/cyberimp/arm/stechkin_implant
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "popout_stechkin"

/obj/item/gun/ballistic/automatic/pistol/implant
	icon = "modular_dripstation/icons/obj/augments.dmi"
	icon_state = "popout_stechkin"