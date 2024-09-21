/obj/effect/light_emitter/green_energy_sword //used so there's a combination of both their head light and light coming off the energy sword
	set_luminosity = 2
	set_cap = 2.5
	light_color = LIGHT_COLOR_GREEN

/obj/effect/light_emitter/energy_dagger//used so there's a combination of both their head light and light coming off the energy sword
	set_luminosity = 1
	set_cap = 1.5
	light_color = LIGHT_COLOR_RED

/obj/effect/light_emitter/energy_axe //used so there's a combination of both their head light and light coming off the energy sword
	set_luminosity = 4
	set_cap = 2.5
	light_color = "#ff4800" //red-orange

/mob/living/simple_animal/hostile/syndicate
	icon = 'modular_dripstation/icons/mob/simple_human.dmi'

/mob/living/simple_animal/hostile/syndicate/melee //dude with eknife
	attack_sound = 'sound/weapons/blade1.ogg'
	var/obj/effect/light_emitter/energy_dagger/edag

/mob/living/simple_animal/hostile/syndicate/melee/Initialize(mapload)
	. = ..()
	edag = new(src)
	set_light(2)

/mob/living/simple_animal/hostile/syndicate/melee/Destroy()
	QDEL_NULL(edag)
	return ..()

/mob/living/simple_animal/hostile/syndicate/melee/bullet_act(obj/projectile/Proj)
	if(prob(projectile_deflect_chance))
		visible_message(span_danger("[src] blocks [Proj] with its weapon!"))
		return BULLET_ACT_BLOCK
	return ..()

/mob/living/simple_animal/hostile/syndicate/melee/space/stormtrooper
	melee_damage_lower = 25
	melee_damage_upper = 25
	projectile_deflect_chance = 25
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'

/mob/living/simple_animal/hostile/syndicate/melee/space/stormtrooper/Initialize(mapload)
	. = ..()
	set_light(4)

/mob/living/simple_animal/hostile/syndicate/melee/sword
	attack_sound = "swing_hit"
	armour_penetration = 50
	light_color = "#ff4800"
	var/obj/effect/light_emitter/energy_axe/axe //dude with a fucking axe

/mob/living/simple_animal/hostile/syndicate/melee/sword/Initialize(mapload)
	. = ..()
	set_light(2)

/mob/living/simple_animal/hostile/syndicate/melee/sword/Destroy()
	QDEL_NULL(sord)
	return ..()

/mob/living/simple_animal/hostile/syndicate/melee/sword/space
	attack_sound = 'sound/weapons/blade1.ogg'
	armour_penetration = 35
	light_color = LIGHT_COLOR_RED
	var/obj/effect/light_emitter/green_energy_sword/gsord
	projectile_deflect_chance = 75

/mob/living/simple_animal/hostile/syndicate/melee/sword/space/Initialize(mapload)
	. = ..()
	gsord = new(src)
	set_light(4)

/mob/living/simple_animal/hostile/syndicate/melee/sword/space/Destroy()
	QDEL_NULL(gsord)
	return ..()

/mob/living/simple_animal/hostile/syndicate/melee/sword/space/stormtrooper
	melee_damage_lower = 40
	melee_damage_upper = 40
	projectile_deflect_chance = 25
	attacktext = "slashes"
	attack_sound = 'sound/weapons/bladeslice.ogg'

///////////////Guns////////////

/mob/living/simple_animal/hostile/syndicate/ranged/smg/space
	casingtype = /obj/item/ammo_casing/a556

/mob/living/simple_animal/hostile/syndicate/ranged/shotgun
	casingtype = /obj/item/ammo_casing/shotgun/buckshot/syndie

/mob/living/simple_animal/hostile/syndicate/ranged/shotgun/space
	casingtype = /obj/item/ammo_casing/shotgun/flechette

/mob/living/simple_animal/hostile/syndicate/ranged/shotgun/space/stormtrooper
	casingtype = /obj/item/ammo_casing/shotgun/frag12
	rapid = 1
	rapid_fire_delay = 8