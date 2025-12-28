/mob/living/simple_animal/butterfly/lavaland
	unsuitable_atmos_damage = 0

/mob/living/simple_animal/butterfly/lavaland/temporary
	name = "strange butterfly"
	del_on_death = TRUE
	/// The atom that's spawning the butterflies
	var/atom/source = null
	/// Max distance in tiles before the butterfly despawns
	var/max_distance = 5
	/// Whether the butterfly will be destroyed at the end of its despawn timer
	var/will_be_destroyed = FALSE
	/// Despawn timer of the butterfly
	var/despawn_timer = 0

/mob/living/simple_animal/butterfly/lavaland/temporary/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSprocessing, src)

/mob/living/simple_animal/butterfly/lavaland/temporary/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/mob/living/simple_animal/butterfly/lavaland/temporary/process()
	if(should_despawn())
		if(will_be_destroyed)
			return
		will_be_destroyed = TRUE
		despawn_timer = addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/simple_animal/butterfly/lavaland/temporary, fadeout)), 5 SECONDS, TIMER_STOPPABLE)
		return

	if(will_be_destroyed)
		// Cancels the butterfly being destroyed
		will_be_destroyed = FALSE
		deltimer(despawn_timer)

/// Checks whether the butterfly should be despawned after the next check, based on distance from source
/mob/living/simple_animal/butterfly/lavaland/temporary/proc/should_despawn()
	if(get_dist(source, src) > max_distance)
		return TRUE
	return FALSE

/// Fade the butterfly out before deleting it.
/// Looks much better than it just blipping out of existence
/mob/living/simple_animal/butterfly/lavaland/temporary/proc/fadeout()
	animate(src, alpha = 0, 1 SECONDS)
	QDEL_IN(src, 1 SECONDS)

/mob/living/simple_animal/butterfly/lavaland/temporary/examine(mob/user)
	. = ..()
	. += span_notice("Something about it seems unreal...")
