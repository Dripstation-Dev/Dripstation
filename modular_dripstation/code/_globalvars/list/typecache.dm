//see: https://github.com/HippieStation/HippieStation/blob/fix-lag/code/_globalvars/lists/typecache.dm
//please store common type caches here.
//type caches should only be stored here if used in mutiple places or likely to be used in mutiple places.

//Note: typecache can only replace istype if you know for sure the thing is at least a datum.

// Don't do state change in these atoms
GLOBAL_LIST_INIT(no_reagent_statechange_typecache, typecacheof(list(
	/obj/effect/particle_effect/water,
	/obj/effect/decal/cleanable,
	/obj/effect/particle_effect/fluid/smoke/chem/smoke_machine,
	/mob)
))

GLOBAL_LIST_INIT(statechange_reagent_blacklist, typecacheof(list(
	/datum/reagent/oxygen,
	/datum/reagent/nitrogen,
	/datum/reagent/nitrous_oxide,
	/datum/reagent/toxin/plasma,
	/datum/reagent/smoke_powder,
	/datum/reagent/carbondioxide,
	/datum/reagent/consumable/cooking_oil,	/*I really don`t know why they are not in this list*/
	/datum/reagent/consumable/sodiumchloride,
	/datum/reagent/consumable/frostoil,
	/datum/reagent/consumable/cornoil,
	/datum/reagent/consumable/flour,
	/datum/reagent/consumable/liquidelectricity,
	/datum/reagent/toxin/acid,
	/datum/reagent/toxin/cyanide,
	/datum/reagent/water,
	/datum/reagent/blood,
	/datum/reagent/carbon,
	/datum/reagent/uranium,
	/datum/reagent/space_cleaner,
	/datum/reagent/carpet,
	/datum/reagent/colorful_reagent,
	/datum/reagent/drying_agent,
	/datum/reagent/glitter)
))

GLOBAL_LIST_INIT(vaporchange_reagent_blacklist, typecacheof(list(
	/datum/reagent/lube,
	/datum/reagent/clf3,
	/datum/reagent/mutationtoxin)
))

GLOBAL_LIST_INIT(solidchange_reagent_blacklist, typecacheof(list(
	/datum/reagent/thermite)
))

GLOBAL_LIST_INIT(statechange_turf_blacklist, typecacheof(list(
	/turf/open/indestructible/sound/pool,
	/turf/open/space,
	/turf/open/chasm,
	/turf/open/lava)
))

