/obj/projectile/beam/laser/hitscan
	tracer_type = /obj/effect/projectile/tracer/laser/hitscan
	muzzle_type = /obj/effect/projectile/muzzle/laser/hitscan
	impact_type = /obj/effect/projectile/impact/laser/hitscan
	hitscan = TRUE
	eyeblur = 0

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