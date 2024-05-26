/obj/item/stack/sheet/mineral/wood
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'
	novariants = FALSE

/obj/item/stack/sheet/runed_metal
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'
	novariants = FALSE

/obj/item/stack/tile/brass
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/cardboard
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'
	novariants = FALSE

/obj/item/stack/tile/bronze
	icon_state = "sheet-bronze"
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/ruinous_metal
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/glass
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/plasmaglass
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/metal
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/hairlesshide
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/wetleather
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/leather
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/rglass
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/plastic
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/plastitaniumglass
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/plasmarglass
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/sandstone
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/diamond
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'
	novariants = FALSE

/obj/item/stack/sheet/mineral/plasma
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/gold
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/silver
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/bananium
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/plastitanium
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/snow
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/titaniumglass
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/coal
	icon_state = "coal"
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/mineral/metal_hydrogen
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/sheet/paperframes
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/telecrystal
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/ore/bluespace_crystal
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'

/obj/item/stack/ore/bluespace_crystal/artificial
	icon_state = "synthetic_bluespace_crystal"

/obj/item/stack/ore/bluespace_crystal/refined/nt
	icon_state = "ntcrystal"

/obj/item/stack/telecrystal
	icon = 'modular_dripstation/icons/obj/stack_objects.dmi'
	var/list/stack_overlays

/obj/item/stack/telecrystal/update_overlays()
	. = ..()
	var/difference = min(10, amount) - (LAZYLEN(stack_overlays)+1)
	if(difference == 0)
		return
	else if(difference < 0 && LAZYLEN(stack_overlays))			//amount < stack_overlays, remove excess.
		if (LAZYLEN(stack_overlays)-difference <= 0)
			stack_overlays = null;
		else
			stack_overlays.len += difference
	else if(difference > 0)			//amount > stack_overlays, add some.
		for(var/i in 1 to difference)
			var/mutable_appearance/newore = mutable_appearance(icon, icon_state)
			newore.pixel_x = rand(-8,8)
			newore.pixel_y = rand(-8,8)
			LAZYADD(stack_overlays, newore)
	if (stack_overlays)
		. += stack_overlays

/obj/item/stack/telecrystal/Initialize(mapload)
	. = ..()
	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)
