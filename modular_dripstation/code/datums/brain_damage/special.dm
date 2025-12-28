/datum/brain_trauma/special/ptsd
	name = "Combat PTSD"
	desc = "The patient is experiencing PTSD stemming from past combat exposure, resulting in a lack of emotions. Additionally, they are experiencing mild hallucinations."
	scan_desc = "PTSD"
	gain_text = span_warning("You're thrust back into the chaos of past! Explosions! Gunfire! Emotions, gone AWOL!")
	lose_text = span_notice("You feel flashbacks of past fade, as your emotions return and mind clear.")
	resilience = TRAUMA_RESILIENCE_ABSOLUTE
	can_gain = TRUE
	random_gain = FALSE
	/// Our cooldown declare for causing hallucinations
	COOLDOWN_DECLARE(ptsd_hallucinations)
	var/list/ptsd_hallucinations_list = list(
		/datum/hallucination/sounds/explosion,
		/datum/hallucination/sounds/far_explosion,
		/datum/hallucination/fake_alert,
		/datum/hallucination/stray_bullet,
		/datum/hallucination/battle,
	)

/datum/brain_trauma/special/ptsd/on_life(seconds_per_tick, times_fired)
	if(owner.stat != CONSCIOUS)
		return

	if(!COOLDOWN_FINISHED(src, ptsd_hallucinations))
		return

	owner.cause_hallucination(pick(ptsd_hallucinations_list), "Caused by The Combat PTSD brain trauma")
	COOLDOWN_START(src, ptsd_hallucinations, rand(10 SECONDS, 10 MINUTES))

/datum/brain_trauma/special/ptsd/on_gain()
	var/datum/component/mood/mob_mood = owner.GetComponent(/datum/component/mood)
	if(mob_mood)
		SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, "combat_ptsd", /datum/mood_event/desentized)
		mob_mood?.mood_modifier -= 1 //Basically nothing can change your mood
		mob_mood?.sanity_level = SANITY_DISTURBED //Makes sanity on a unstable level unless cured
	..()

/datum/brain_trauma/special/ptsd/on_lose()
	var/datum/component/mood/mob_mood = owner.GetComponent(/datum/component/mood)
	if(mob_mood)
		SEND_SIGNAL(owner, COMSIG_CLEAR_MOOD_EVENT, "combat_ptsd")
		mob_mood?.mood_modifier += 1
		mob_mood?.sanity_level = SANITY_GREAT
	return ..()

/datum/hallucination/sounds/explosion
	sound_name = "explosion"

/datum/hallucination/sounds/far_explosion
	sound_name = "far explosion"
