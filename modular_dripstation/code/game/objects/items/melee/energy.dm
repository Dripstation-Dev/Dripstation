/obj/item/melee/transforming/energy/sword
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'

/obj/item/holo/esword
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'

/obj/item/toy/sword
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'

/obj/item/melee/transforming/energy/machete
	name = "energy machete"
	desc = "A powerful energy-based hardlight sword that is easily stored when not in use. Used by Cybersun strike teams."
	icon_state = "machete_cybersun"
	item_state = "machete_cybersun"
	icon = 'modular_dripstation/icons/obj/weapons/blades.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/belt.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
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
