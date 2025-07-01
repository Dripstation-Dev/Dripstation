// 40mm (Grenade Launcher

/obj/projectile/bullet/a40mm
	name ="40mm grenade"
	desc = "USE A WEEL GUN"
	icon_state = "40mm"
	icon = 'modular_dripstation/icons/effects/projectiles/projectiles.dmi'
	damage = 10

/obj/projectile/bullet/a40mm/proc/prime()
	return

/obj/projectile/bullet/a40mm/he
	name ="40mm HE grenade"
	damage = 40

/obj/projectile/bullet/a40mm/he/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, 0, 2, 1, 0, flame_range = 3)
	return BULLET_ACT_HIT

/obj/projectile/bullet/a40mm/gas
	name ="40mm tear gas grenade"
	var/chemtype = /datum/reagent/consumable/condensedcapsaicin

/obj/projectile/bullet/a40mm/gas/prime()
	var/datum/reagents/tmp_holder = new/datum/reagents(60)
	tmp_holder.my_atom = src.loc
	tmp_holder.add_reagent(chemtype , 60)
	var/datum/effect_system/fluid_spread/smoke/chem/smoke = new
	smoke.set_up(3, location = src.loc, carry = tmp_holder, silent = TRUE)
	playsound(src.loc, 'sound/effects/smoke.ogg', 50, 1, -3)
	smoke.start()

/obj/projectile/bullet/a40mm/gas/on_hit(atom/target, blocked = FALSE)
	..()
	prime()
	return BULLET_ACT_HIT

/obj/projectile/bullet/a40mm/gas/chlorinetwo
	name ="40mm chlorine two gas grenade"
	chemtype = /datum/reagent/toxin/chlorinetwo

/obj/projectile/bullet/a40mm/smoke
	name ="40mm smoke grenade"

/obj/projectile/bullet/a40mm/smoke/prime()
	playsound(src.loc, 'sound/effects/smoke.ogg', 50, 1, -3)
	var/datum/effect_system/fluid_spread/smoke/bad/smoke = new
	smoke.set_up(3, location = src.loc)
	smoke.start()

/obj/projectile/bullet/a40mm/smoke/on_hit(atom/target, blocked = FALSE)
	..()
	prime()
	return BULLET_ACT_HIT
