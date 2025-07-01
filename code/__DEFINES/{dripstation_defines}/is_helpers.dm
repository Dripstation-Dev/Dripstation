#define isfelinid(A) (is_species(A, /datum/species/human/felinid))
#define isreplica(A) (is_species(A, /datum/species/replica))

#define isgrenade(A) (istype(A, /obj/item/grenade))

#define adjust_tripping(duration) adjust_timed_status_effect(duration, /datum/status_effect/tripping)
#define adjust_tripping_up_to(duration, up_to) adjust_timed_status_effect(duration, /datum/status_effect/tripping, up_to)
#define set_tripping(duration) set_timed_status_effect(duration, /datum/status_effect/tripping)
#define set_tripping_if_lower(duration) set_timed_status_effect(duration, /datum/status_effect/tripping, TRUE)
