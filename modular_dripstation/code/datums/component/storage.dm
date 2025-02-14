/datum/component/storage/concrete/pockets/hosarmor
	attack_hand_interact = FALSE

/datum/component/storage/concrete/pockets/amber
	max_w_class = WEIGHT_CLASS_SMALL
	attack_hand_interact = FALSE

/datum/component/storage/concrete/pockets/shoes/Initialize()
	. = ..()
	set_holdable(list(
		/obj/item/kitchen/knife, /obj/item/boxcutter, /obj/item/switchblade, /obj/item/pen, //boxcutter dripstation edit
		/obj/item/scalpel, /obj/item/reagent_containers/syringe, /obj/item/dnainjector,
		/obj/item/reagent_containers/autoinjector/medipen, /obj/item/reagent_containers/dropper,
		/obj/item/implanter, /obj/item/screwdriver, /obj/item/weldingtool/mini,
		/obj/item/firing_pin, /obj/item/gun/ballistic/revolver/derringer,
		/obj/item/melee/classic_baton/telescopic, /obj/item/melee/transforming/vib_blade,
		/obj/item/melee/transforming/energy/sword
		),
		list(/obj/item/handdrill)
		)

/datum/component/storage/concrete/pockets/helmet
	max_w_class = WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/pockets/carrier
	max_items = 4
	max_w_class = WEIGHT_CLASS_NORMAL
	attack_hand_interact = FALSE
	quickdraw = TRUE

/datum/component/storage/concrete/pockets/carrier/Initialize()
	. = ..()
	set_holdable(list(	/obj/item/reagent_containers/autoinjector,
						/obj/item/ammo_box/magazine))
