#define WORLEY_REG_SIZE "reg_size"
#define WORLEY_THRESHOLD "threshold"
#define WORLEY_NODE_PER_REG "node_per_reg"

/datum/map_generator/cave_generator/icemoon
	initial_closed_chance = 53
	weighted_open_turf_types = list(/turf/open/floor/plating/asteroid/snow/icemoon = 16, /turf/open/floor/plating/ice/icemoon = 1, /turf/open/floor/plating/asteroid/snow/ice/icemoon = 1, /turf/open/floor/plating/asteroid/snow/deep/icemoon = 1)
	weighted_closed_turf_types = list(/turf/closed/mineral/random/snow = 1)
	weighted_mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/wolf = 50, /obj/structure/spawner/ice_moon = 3, \
						  /mob/living/simple_animal/hostile/asteroid/polarbear = 30, /obj/structure/spawner/ice_moon/polarbear = 3, \
						  /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50, 
						  /mob/living/simple_animal/hostile/asteroid/marrowweaver/ice = 30,
						  /mob/living/simple_animal/hostile/asteroid/ice_whelp = 10,
						  /mob/living/simple_animal/hostile/asteroid/wolf/vulpcanin = 10,
						  /mob/living/simple_animal/hostile/asteroid/ice_demon = 5, 
						  /mob/living/simple_animal/hostile/asteroid/old_demon = 1,
						  /mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
						  /mob/living/simple_animal/hostile/asteroid/ambusher = 10)
	weighted_flora_spawn_list = list(/obj/structure/flora/tree/pine = 2, /obj/structure/flora/rock/icy = 2, /obj/structure/flora/rock/pile/icy = 2, /obj/structure/flora/grass/both = 6)
	///Note that this spawn list is also in the lavaland generator
	weighted_feature_spawn_list = null

	var/list/ore_preferences = list(
		ORE_IRON = list(
			WORLEY_REG_SIZE = 10,
			WORLEY_THRESHOLD = 3,
			WORLEY_NODE_PER_REG = 50),

		ORE_SAND = list(
			WORLEY_REG_SIZE = 10,
			WORLEY_THRESHOLD = 1,
			WORLEY_NODE_PER_REG = 50),

		ORE_URANIUM = list(
			WORLEY_REG_SIZE = 10,
			WORLEY_THRESHOLD = 3,
			WORLEY_NODE_PER_REG = 50),

		ORE_TITANIUM = list(
			WORLEY_REG_SIZE = 10,
			WORLEY_THRESHOLD = 2,
			WORLEY_NODE_PER_REG = 50),

		ORE_PLASMA = list(
			WORLEY_REG_SIZE = 15,
			WORLEY_THRESHOLD = 6,
			WORLEY_NODE_PER_REG = 50),

		ORE_GOLD = list(
			WORLEY_REG_SIZE = 10,
			WORLEY_THRESHOLD = 3,
			WORLEY_NODE_PER_REG = 50),

		ORE_SILVER = list(
			WORLEY_REG_SIZE = 10,
			WORLEY_THRESHOLD = 3,
			WORLEY_NODE_PER_REG = 50)
		)

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
						  /mob/living/simple_animal/hostile/asteroid/wolf/vulpcanin = 4,
						  /mob/living/simple_animal/hostile/asteroid/ambusher = 2)
	feature_spawn_chance = 0.4
	weighted_feature_spawn_list = list(
		/obj/structure/spawner/ice_moon = 3, 
		/obj/structure/spawner/ice_moon/polarbear = 3,
		/obj/structure/geyser/random = 4, 
		/obj/structure/geyser/ash = 2,
		/obj/structure/geyser/stable_plasma = 18, 
		/obj/structure/geyser/oil = 24,
		/obj/structure/geyser/protozine = 10,
		/obj/structure/geyser/holywater = 6,
		/obj/structure/anomalies_diet/thumper = 1,
		/obj/structure/anomalies_diet/whirli = 1)
	weighted_open_turf_types = list(/turf/open/floor/plating/asteroid/snow/icemoon/top_layer = 17, /turf/open/floor/plating/ice/icemoon/top_layer = 1, /turf/open/floor/plating/asteroid/snow/ice/icemoon/top_layer = 1)
	weighted_closed_turf_types = list(/turf/closed/mineral/random/snow/top_layer = 1)

/datum/map_generator/cave_generator/icemoon/surface
	flora_spawn_chance = 4
	mob_spawn_chance = 8
	weighted_mob_spawn_list = list(/mob/living/simple_animal/hostile/asteroid/wolf = 50,
						  /mob/living/simple_animal/hostile/asteroid/polarbear = 30,
						  /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50, 
						  /mob/living/simple_animal/hostile/asteroid/marrowweaver/ice = 30,
						  /mob/living/simple_animal/hostile/asteroid/wolf/vulpcanin = 10,
						  /mob/living/simple_animal/hostile/asteroid/ice_whelp = 10,
						  /mob/living/simple_animal/hostile/asteroid/ice_demon = 5, 
						  /mob/living/simple_animal/hostile/asteroid/old_demon = 1,
						  /mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
						  /mob/living/simple_animal/hostile/asteroid/ambusher = 2)
	feature_spawn_chance = 0.3
	weighted_feature_spawn_list = list(
		/obj/structure/geyser/random = 3,
		/obj/structure/spawner/ice_moon = 9,
		/obj/structure/spawner/ice_moon/polarbear = 9,
		/obj/structure/spawner/ice_moon/demonic_portal/ice_whelp = 3,
		/obj/structure/spawner/ice_moon/demonic_portal/snowlegion = 6,
		/obj/structure/anomalies_diet/glacier = 1)
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
						  SPAWN_MEGAFAUNA = 2)
	feature_spawn_chance = 0.9
	weighted_feature_spawn_list = list(
		/obj/structure/spawner/ice_moon/demonic_portal = 3,
		/obj/structure/spawner/ice_moon/demonic_portal/ice_whelp = 2,
		/obj/structure/spawner/ice_moon/demonic_portal/snowlegion = 1,
		/obj/structure/geyser/random = 1
	)
	weighted_megafauna_spawn_list = list(/mob/living/simple_animal/hostile/megafauna/colossus = 1, /mob/living/simple_animal/hostile/megafauna/stalwart = 1)
	weighted_flora_spawn_list = list(/obj/structure/flora/rock/icy = 6, /obj/structure/flora/rock/pile/icy = 6)
	weighted_open_turf_types = list(/turf/open/floor/plating/asteroid/icerock = 30, /turf/open/floor/plating/asteroid/icerock/smooth = 2, /turf/open/floor/plating/asteroid/icerock/cracked = 2, /turf/open/floor/plating/ice/deep = 1, /turf/open/floor/plating/ice/deep/iceberg = 1, /turf/open/floor/plating/asteroid/iceberg = 1)
	weighted_closed_turf_types = list(/turf/closed/mineral/random/snow/icyrock = 1)


//creates a 2d map of every single ore vein on the map
/datum/map_generator/cave_generator/icemoon/proc/generate_ores(list/turfs)
	var/list/ore_strings = list(
		ORE_PLASMA  = rustg_worley_generate("[ore_preferences[ORE_PLASMA][WORLEY_REG_SIZE]]",
										"[ore_preferences[ORE_PLASMA][WORLEY_THRESHOLD]]",
										"[ore_preferences[ORE_PLASMA][WORLEY_NODE_PER_REG]]",
										"[world.maxx]",
										"1",
										"2"),
		ORE_GOLD  = rustg_worley_generate("[ore_preferences[ORE_GOLD][WORLEY_REG_SIZE]]",
										"[ore_preferences[ORE_GOLD][WORLEY_THRESHOLD]]",
										"[ore_preferences[ORE_GOLD][WORLEY_NODE_PER_REG]]",
										"[world.maxx]",
										"1",
										"2"),
		ORE_URANIUM  = rustg_worley_generate("[ore_preferences[ORE_URANIUM][WORLEY_REG_SIZE]]",
										"[ore_preferences[ORE_URANIUM][WORLEY_THRESHOLD]]",
										"[ore_preferences[ORE_URANIUM][WORLEY_NODE_PER_REG]]",
										"[world.maxx]",
										"1",
										"2"),
		ORE_TITANIUM  = rustg_worley_generate("[ore_preferences[ORE_TITANIUM][WORLEY_REG_SIZE]]",
										"[ore_preferences[ORE_TITANIUM][WORLEY_THRESHOLD]]",
										"[ore_preferences[ORE_TITANIUM][WORLEY_NODE_PER_REG]]",
										"[world.maxx]",
										"1",
										"2"),
		ORE_SILVER  = rustg_worley_generate("[ore_preferences[ORE_SILVER][WORLEY_REG_SIZE]]",
										"[ore_preferences[ORE_SILVER][WORLEY_THRESHOLD]]",
										"[ore_preferences[ORE_SILVER][WORLEY_NODE_PER_REG]]",
										"[world.maxx]",
										"1",
										"2"),
		ORE_SAND  = rustg_worley_generate("[ore_preferences[ORE_SAND][WORLEY_REG_SIZE]]",
										"[ore_preferences[ORE_SAND][WORLEY_THRESHOLD]]",
										"[ore_preferences[ORE_SAND][WORLEY_NODE_PER_REG]]",
										"[world.maxx]",
										"1",
										"2"),
		ORE_IRON  = rustg_worley_generate("[ore_preferences[ORE_IRON][WORLEY_REG_SIZE]]",
										"[ore_preferences[ORE_IRON][WORLEY_THRESHOLD]]",
										"[ore_preferences[ORE_IRON][WORLEY_NODE_PER_REG]]",
										"[world.maxx]",
										"1",
										"2"))
	//order of generation, ordered from rarest to most common
	var/list/generation_queue = list(
		ORE_IRON,
		ORE_SAND,
		ORE_SILVER,
		ORE_TITANIUM,
		ORE_URANIUM,
		ORE_GOLD,
		ORE_PLASMA
	)
	var/return_list[world.maxx * world.maxy] 


	for(var/t in turfs)
		var/turf/gen_turf = t
		var/generated = FALSE
		for(var/ore in generation_queue)
			if(ore_strings[ore][world.maxx * (gen_turf.y - 1) + gen_turf.x] == "1")
				continue
			return_list[world.maxx * (gen_turf.y - 1) + gen_turf.x] = ore
			generated = TRUE
			break

		if(!generated)
			return_list[world.maxx * (gen_turf.y - 1) + gen_turf.x] = ORE_EMPTY

		CHECK_TICK

	//guaranteed spawn at least some sand ores in small pockets 

	for(var/i in 0 to 64)
		var/x = rand(16,239)
		var/y = rand(16,239)
		return_list[world.maxx * y + x] = ORE_SAND
		for(var/j in 1 to 8)
			var/x_o = x + rand(-j,j)
			var/y_o = y + rand(-j,j)
			return_list[world.maxx * y_o + x_o] = ORE_SAND

	return return_list
		
/datum/map_generator/cave_generator/icemoon/generate_terrain(list/turfs)
	. = ..()
	var/list/ore_map = generate_ores(turfs)
	for(var/i in turfs)
		var/turf/gen_turf = i
		if(istype(gen_turf, /turf/open/floor/plating/asteroid/snow/icemoon))
			var/turf/open/floor/plating/asteroid/snow/icemoon/IT = gen_turf
			IT.ore_present = ore_map[world.maxx * (gen_turf.y - 1) + gen_turf.x]
