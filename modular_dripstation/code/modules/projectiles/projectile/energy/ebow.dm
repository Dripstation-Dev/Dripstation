/obj/projectile/energy/bolt
	icon_state = "dart"
	icon = 'modular_dripstation/icons/effects/projectiles/projectiles.dmi'

/obj/projectile/energy/bolt/large //big ebow bolts
	name = "large bolt"
	irradiate = 300
	pass_flags = PASSGLASS

/obj/projectile/energy/bolt/on_hit(atom/target, blocked = FALSE)
	..()
	if(ishuman(target))
		target.reagents.add_reagent(/datum/reagent/toxin/relaxant, 8)
		target.reagents.add_reagent(/datum/reagent/toxin/mutetoxin, 8)
		target.reagents.add_reagent(/datum/reagent/toxin/anacea, 6)
