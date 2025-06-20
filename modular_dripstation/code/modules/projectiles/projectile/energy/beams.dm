/obj/projectile/beam/laser/hitscan
	tracer_type = /obj/effect/projectile/tracer/laser/hitscan
	muzzle_type = /obj/effect/projectile/muzzle/laser/hitscan
	impact_type = /obj/effect/projectile/impact/laser/hitscan
	hitscan = TRUE
	eyeblur = 0

/obj/projectile/beam/practice/hitscan
	tracer_type = /obj/effect/projectile/tracer/laser/hitscan
	muzzle_type = /obj/effect/projectile/muzzle/laser/hitscan
	impact_type = /obj/effect/projectile/impact/laser/hitscan
	hitscan = TRUE
	eyeblur = 0

/obj/projectile/beam/laser/hitscan/sniper
	tracer_type = /obj/effect/projectile/tracer/laser/hitscan/sniper
	muzzle_type = /obj/effect/projectile/muzzle/laser/hitscan/sniper
	impact_type = /obj/effect/projectile/impact/laser/hitscan/sniper
	damage = 60
	light_color = LIGHT_COLOR_LAVENDER
	impact_effect_type = /obj/effect/temp_visual/impact_effect/purple_laser
	penetrations = 3
	penetration_flags = PENETRATE_OBJECTS | PENETRATE_MOBS
	range = 16

/obj/projectile/beam/laser/hitscan/sniper/on_hit(atom/target, blocked = FALSE)
	if((blocked != 100) && iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjustStaminaLoss(40)
		M.Knockdown(2 SECONDS)
	return ..()

/obj/projectile/beam/laser/spec	//basicly overpowered
	speed = 1
	armour_penetration = 10
	wound_bonus = -20
	bare_wound_bonus = 40
	damage = 30

/obj/projectile/beam/laser/hellfire/scatter
	name = "hellfire pellet"
	icon_state = "scatterlaser"
	damage = 10

/obj/projectile/beam/pulse
	icon_state = "pulse"
	icon = 'modular_dripstation/icons/effects/projectiles/projectiles.dmi'

/obj/projectile/beam/pulse/pistol
	icon_state = "pulse2"

/obj/projectile/beam/pulse/shotgun
	icon_state = "pulse1"

/obj/projectile/beam/pulse/heavy
	icon_state = "pulse_heavy"