/datum/map_generator/cave_generator/icemoon
	initial_closed_chance = 53
	weighted_open_turf_types = list(/turf/open/floor/plating/asteroid/snow/icemoon = 19, /turf/open/floor/plating/ice/icemoon = 1)
	weighted_closed_turf_types = list(/turf/closed/mineral/random/snow = 1)
	weighted_mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/wolf = 50, /obj/structure/spawner/ice_moon = 3, \
						  /mob/living/simple_animal/hostile/asteroid/polarbear = 30, /obj/structure/spawner/ice_moon/polarbear = 3, \
						  /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50, 
						  /mob/living/simple_animal/hostile/asteroid/marrowweaver/ice = 30,
						  /mob/living/simple_animal/hostile/asteroid/ice_whelp = 10,
						  /mob/living/simple_animal/hostile/asteroid/wolf/vulpkanin = 10,
						  /mob/living/simple_animal/hostile/asteroid/ice_demon = 5, 
						  /mob/living/simple_animal/hostile/asteroid/old_demon = 1,
						  /mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
						  /mob/living/simple_animal/hostile/asteroid/ambusher = 10)
	weighted_flora_spawn_list = list(/obj/structure/flora/tree/pine = 2, /obj/structure/flora/rock/icy = 2, /obj/structure/flora/rock/pile/icy = 2, /obj/structure/flora/grass/both = 6)
	///Note that this spawn list is also in the lavaland generator
	weighted_feature_spawn_list = null

/datum/map_generator/cave_generator/icemoon/top_layer
	flora_spawn_chance = 70
	initial_closed_chance = 10
	birth_limit = 5
	death_limit = 4
	smoothing_iterations = 10
	weighted_flora_spawn_list = list(
		/obj/structure/flora/tree/pine = 18,
		/obj/structure/flora/tree/dead = 1,
		/obj/structure/flora/tree/dead/jungle = 1,
		/obj/structure/flora/rock/icy = 1,
		/obj/structure/flora/rock/pile/icy = 3,
		/obj/structure/flora/grass/brown = 10,
		/obj/structure/flora/grass/both = 30,
		/obj/structure/flora/bush = 15,
	)
	mob_spawn_chance = 6
	weighted_mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/wolf = 20,
						  /mob/living/simple_animal/hostile/asteroid/polarbear = 10,
						  /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 5, 
						  /mob/living/simple_animal/hostile/asteroid/marrowweaver/ice = 5,
						  /mob/living/simple_animal/hostile/asteroid/ice_whelp = 5,
						  /mob/living/simple_animal/hostile/asteroid/wolf/vulpkanin = 4,
						  /mob/living/simple_animal/hostile/asteroid/ambusher = 2)
	feature_spawn_chance = 0.4
	weighted_feature_spawn_list = list(/obj/structure/geyser/ash = 10, 
		/obj/structure/spawner/ice_moon = 1, 
		/obj/structure/spawner/ice_moon/polarbear = 1,
		/obj/structure/geyser/random = 2, 
		/obj/structure/geyser/stable_plasma = 6, 
		/obj/structure/geyser/oil = 8,
		/obj/structure/geyser/protozine = 10,
		/obj/structure/geyser/holywater = 2)
	weighted_open_turf_types = list(/turf/open/floor/plating/asteroid/snow/icemoon/top_layer = 19, /turf/open/floor/plating/ice/icemoon/top_layer = 1)
	weighted_closed_turf_types = list(/turf/closed/mineral/random/snow/top_layer = 1)

/datum/map_generator/cave_generator/icemoon/surface
	flora_spawn_chance = 4
	mob_spawn_chance = 8
	weighted_mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/wolf = 50,
						  /mob/living/simple_animal/hostile/asteroid/polarbear = 30,
						  /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50, 
						  /mob/living/simple_animal/hostile/asteroid/marrowweaver/ice = 30,
						  /mob/living/simple_animal/hostile/asteroid/wolf/vulpkanin = 10,
						  /mob/living/simple_animal/hostile/asteroid/ice_whelp = 10,
						  /mob/living/simple_animal/hostile/asteroid/ice_demon = 5, 
						  /mob/living/simple_animal/hostile/asteroid/old_demon = 1,
						  /mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
						  /mob/living/simple_animal/hostile/asteroid/ambusher = 2)
	feature_spawn_chance = 0.3
	weighted_feature_spawn_list = list(
		/obj/structure/geyser/random = 1,
		/obj/structure/spawner/ice_moon = 3,
		/obj/structure/spawner/ice_moon/polarbear = 3,
		/obj/structure/spawner/ice_moon/demonic_portal/ice_whelp = 1,
		/obj/structure/spawner/ice_moon/demonic_portal/snowlegion = 2
	)
	birth_limit = 5
	death_limit = 4
	smoothing_iterations = 10

/datum/map_generator/cave_generator/icemoon/deep
	flora_spawn_chance = 1
	mob_spawn_chance = 20
	weighted_mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/ice_demon = 50,
						  /mob/living/simple_animal/hostile/asteroid/old_demon = 20,
						  /mob/living/simple_animal/hostile/asteroid/ice_whelp = 30,
						  /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 30,
						  /mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
						  SPAWN_MEGAFAUNA = 1)
	feature_spawn_chance = 0.8
	weighted_feature_spawn_list = list(
		/obj/structure/spawner/ice_moon/demonic_portal = 3,
		/obj/structure/spawner/ice_moon/demonic_portal/ice_whelp = 2,
		/obj/structure/spawner/ice_moon/demonic_portal/snowlegion = 1,
		/obj/structure/geyser/random = 1
	)
	weighted_megafauna_spawn_list = list(/mob/living/simple_animal/hostile/megafauna/colossus = 1)
	weighted_flora_spawn_list = list(/obj/structure/flora/rock/icy = 6, /obj/structure/flora/rock/pile/icy = 6)
	weighted_open_turf_types = list(/turf/open/floor/plating/asteroid/icerock = 30, /turf/open/floor/plating/asteroid/icerock/smooth = 2, /turf/open/floor/plating/asteroid/icerock/cracked = 2, /turf/open/floor/plating/ice/deep = 1, /turf/open/floor/plating/ice/deep/iceberg = 1, /turf/open/floor/plating/asteroid/iceberg = 1)
	weighted_closed_turf_types = list(/turf/closed/mineral/random/snow/icyrock = 1)
