/obj/projectile/plasma/combat
	range = 7
	mine_range = 5
	light_power = 2
	speed = 1.4 // plasma ball slow
	damage = 40
	wound_bonus = 10
	light_color = LIGHT_COLOR_GREEN
	damage_type = BURN
	pass_flags = PASSTABLE | PASSGRILLE
	icon_state = "plasma"
	icon = 'modular_dripstation/icons/effects/projectiles/projectiles.dmi'
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	tracer_type = /obj/effect/projectile/tracer/bfg
	muzzle_type = /obj/effect/projectile/muzzle/bfg
	impact_type = /obj/effect/projectile/impact/bfg