/obj/item/melee/transforming/energy/axe 
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'

/obj/item/melee/transforming/energy/sword
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'

/obj/item/holo/esword
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'

/obj/item/toy/sword
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/weapons_on_belt.dmi'

/obj/item/melee/transforming/energy/sword/saber
	slot_flags = ITEM_SLOT_BELT
	var/slot_flags_transform = ITEM_SLOT_BELT

/obj/item/melee/transforming/energy/sword/saber/transform_weapon(mob/living/user, supress_message_text)
	. = ..()
	if(. && active)
		slot_flags = null
	if(. && !active)
		slot_flags = slot_flags_transform

/obj/item/melee/transforming/energy/sword/saber/sabre
	name = "energy sabre"
	desc = "A powerful energy-based hardlight blade that is easily stored when not in use. Used by boarding parties."
	icon_state = "esaber0"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'

/obj/item/melee/transforming/energy/sword/saber/sabre/transform_weapon(mob/living/user, supress_message_text)
	. = ..()
	if(. && active && saber_color)
		icon_state = "esaber[saber_color]"

/obj/item/melee/transforming/energy/sword/nt
	name = "hardlight blade"
	desc = "A powerful energy-based hardlight blade that is easily stored when not in use. NT property."
	icon_state = "ntesword0"
	icon_state_on = "ntesword1"
	item_state = "sword0"
	icon_state_on = "swordblue"
	saber_color = null
	light_color = "#40ceff"

/obj/item/melee/transforming/energy/machete
	name = "energy machete"
	desc = "A powerful energy-based hardlight sword that is easily stored when not in use. Used by Cybersun strike teams."
	icon_state = "machete_cybersun"
	item_state = "machete_cybersun"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/melee_righthand.dmi'
	force = 10
	force_on = 40
	throwforce = 5
	throwforce_on = 30
	hitsound = 'sound/weapons/bladeslice.ogg'
	flags_1 = CONDUCT_1
	armour_penetration = 60
	block_chance = 30
	light_color = "#a52019"

/obj/item/melee/transforming/energy/machete/transform_weapon(mob/living/user, supress_message_text)
	. = ..()
	if(.)
		if(active)
			icon_state = "[initial(icon_state)]_active"
			item_state = "[initial(item_state)]_active"
			START_PROCESSING(SSobj, src)
		else
			icon_state = initial(icon_state)
			item_state = initial(item_state)
			STOP_PROCESSING(SSobj, src)
		set_light_on(active)

/obj/item/melee/transforming/energy/machete/unknown
	name = "alien energy machete"
	desc = "A powerful energy-based hardlight sword that is easily stored when not in use. Used by alien parties."
	icon_state = "machete_energy"
	item_state = "machete_energy"
	light_color = "#6600cc"
