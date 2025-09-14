/// Amount of terror passively removed on every tick.
#define REGULAR_TERROR_AMOUNT 1
/// How much terror a random panic attack will give the victim.
#define PANIC_ATTACK_TERROR_AMOUNT 35
/// Amount of terror actively removed (or generated) upon being hugged.
#define HUG_TERROR_AMOUNT 60

/// The soft cap on how much passively generated terror you can have.
#define TERROR_CAP 190

/// The terror_buildup threshold for minor fear effects to occur.
#define TERROR_FEAR_THRESHOLD 70
/// The terror_buildup threshold for the more serious effects. Takes about 20 seconds of darkness buildup to reach.
#define TERROR_PANIC_THRESHOLD 140
/// Terror buildup will cause a heart attack and knock them out, removing the status effect.
#define TERROR_HEART_ATTACK_THRESHOLD 300

#define CONSCIOUSAY(text) if(owner.stat == CONSCIOUS) { ##text }

/obj/item/testing_doll
	name = "cursed ert doll"
	desc = "Fear me mortal!"
	icon_state = "ert"
	icon = 'modular_dripstation/icons/obj/toy.dmi'

/obj/item/testing_doll/attack_self(mob/user)
	var/mob/living/carbon/C = user
	if(istype(C))
		C.apply_status_effect(/datum/status_effect/terrified)

/datum/status_effect/terrified
	id = "terrified"
	status_type = STATUS_EFFECT_REFRESH
	remove_on_fullheal = TRUE
	alert_type = /atom/movable/screen/alert/status_effect/terrified
	///A value that represents how much "terror" the victim has built up. Higher amounts cause more averse effects.
	var/terror_buildup = 35

/datum/status_effect/terrified/refresh(effect, ...) //Don't call parent, just add to the current amount
	freak_out(PANIC_ATTACK_TERROR_AMOUNT)

/datum/status_effect/terrified/on_apply()
	RegisterSignal(owner, COMSIG_CARBON_PRE_MISC_HELP, PROC_REF(comfort_owner))
	if(prob(50))
		owner.emote("scream")
	to_chat(owner, span_alert("THEY GONNA KILL ME! RUN, HIDE!"))
	return TRUE

/datum/status_effect/terrified/on_remove()
	UnregisterSignal(owner, COMSIG_CARBON_HELPED)
	owner.remove_fov_trait(id, FOV_270_DEGREES)
	owner.remove_movespeed_modifier(MOVESPEED_ID_INTERROR_SPEED, TRUE)

/datum/status_effect/terrified/tick(seconds_per_tick, times_fired)
	terror_buildup -= REGULAR_TERROR_AMOUNT

	if(terror_buildup <= 0) //If we've completely calmed down, we remove the status effect.
		SEND_SIGNAL(owner, COMSIG_CLEAR_MOOD_EVENT, "terrified")
		qdel(src)
		return

	if(terror_buildup >= TERROR_FEAR_THRESHOLD) //The onset, minor effects of terror buildup
		owner.adjust_dizzy_up_to(10 SECONDS * seconds_per_tick, 10 SECONDS)
		owner.adjust_stutter_up_to(10 SECONDS * seconds_per_tick, 10 SECONDS)
		owner.adjust_jitter_up_to(10 SECONDS * seconds_per_tick, 10 SECONDS)
		owner.add_movespeed_modifier(MOVESPEED_ID_INTERROR_SPEED, override=TRUE, multiplicative_slowdown = -0.4)
		SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, "terrified", /datum/mood_event/fear)

	if(terror_buildup >= TERROR_PANIC_THRESHOLD) //If you reach this amount of buildup in an engagement, it's time to start looking for a way out.
		owner.playsound_local(get_turf(owner), 'sound/health/slowbeat.ogg', 40, 0, channel = CHANNEL_HEARTBEAT, use_reverb = FALSE)
		owner.add_fov_trait(id, FOV_270_DEGREES) //Terror induced tunnel vision
		owner.add_movespeed_modifier(MOVESPEED_ID_INTERROR_SPEED, override=TRUE, multiplicative_slowdown = -1)
		owner.adjust_eye_blur_up_to(10 SECONDS * seconds_per_tick, 10 SECONDS)
		if(prob(5)) //We have a little panic attack. Consider it GENTLE ENCOURAGEMENT to start running away.
			freak_out(PANIC_ATTACK_TERROR_AMOUNT)
			owner.visible_message(
				span_warning("[owner] drops to the floor for a moment, clutching their chest."),
				span_alert("Your heart lurches in your chest. You can't take much more of this!"),
				span_hear("You hear a grunt."),
			)
		SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, "terrified", /datum/mood_event/panic)
	else
		owner.remove_fov_trait(id, FOV_270_DEGREES)

	if(terror_buildup >= TERROR_HEART_ATTACK_THRESHOLD) //You should only be able to reach this by actively terrorizing someone
		owner.visible_message(
			span_warning("[owner] clutches [owner.p_their()] chest for a moment, then collapses to the floor."),
			span_alert("You mind goes blank and then there is nothing..."),
			span_hear("You hear something heavy collide with the ground."),
		)
		var/datum/disease/heart_failure/heart_attack = new(owner)
		heart_attack.stage = 2
		heart_attack.stage_prob = 4 //Advances twice as fast
		owner.ForceContractDisease(heart_attack)
		owner.Unconscious(20 SECONDS)
		SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, "terrified", /datum/mood_event/shock)
		qdel(src) //Victim passes out from fear, calming them down and permenantly damaging their heart.

/datum/status_effect/terrified/get_examine_text()
	if(terror_buildup > TERROR_CAP) //If we're approaching a heart attack
		return span_boldwarning("[owner.p_they(TRUE)] [owner.p_are()] seizing up, about to collapse in fear!")

	if(terror_buildup >= TERROR_PANIC_THRESHOLD)
		return span_boldwarning("[owner] is visibly trembling and twitching. It looks like [owner.p_theyre()] freaking out!")

	if(terror_buildup >= TERROR_FEAR_THRESHOLD)
		return span_warning("[owner] looks very worried about something. [owner.p_are(TRUE)] [owner.p_they()] alright?")

	return span_notice("[owner] looks rather anxious. [owner.p_they(TRUE)] could probably use a hug...")

/// If we get a hug from a friend, we calm down! If we get a hug from a nightmare, we FREAK OUT.
/datum/status_effect/terrified/proc/comfort_owner(datum/source, mob/living/hugger)
	SIGNAL_HANDLER

	if(HAS_TRAIT(src, TRAIT_BADTOUCH)) //hey wait a minute, that's not a comforting, friendly hug!
		addtimer(CALLBACK(src, PROC_REF(freak_out), HUG_TERROR_AMOUNT))
		owner.visible_message(
			span_warning("[owner] recoils in fear as [hugger] waves [hugger.p_their()] arms and shrieks at [owner.p_them()]!"),
			span_boldwarning("[hugger] lash out at you, and you drop to the ground in fear!"),
			span_hear("You hear someone shriek in fear. How embarassing!"),
			)
		return COMPONENT_BLOCK_MISC_HELP

	terror_buildup -= HUG_TERROR_AMOUNT
	owner.visible_message(
		span_notice("[owner] seems to relax as [hugger] gives [owner.p_them()] a comforting hug."),
		span_nicegreen("You feel yourself calm down as [hugger] gives you a reassuring hug."),
		span_hear("You hear shuffling and a sigh of relief."),
	)

/**
 * Adds to the victim's terror buildup, makes them scream, and knocks them over for a moment.
 *
 * Makes the victm scream and adds the passed amount to their buildup.
 * Knocks over the victim for a brief moment.
 *
 * * amount - how much terror buildup this freakout will cause
 */

/datum/status_effect/terrified/proc/freak_out(amount)
	terror_buildup += amount
	if(prob(50))
		owner.Knockdown(0.5 SECONDS)
	owner.flick_pain(50, TRUE)	//fantom pain
	CONSCIOUSAY(owner.say(pick("Fuck, fuck, fuck, fuck!!.", "AAAAAAA!!", "FUCK OFF, JUST FUCK OFF!!.", "STOP, PLEASE STOP!!.", "FOR THE LOVE OF GODDESS, PLEASE STOP!!.")))
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		if(COOLDOWN_FINISHED(H, adrenaline_cooldown))
			H.apply_status_effect(STATUS_EFFECT_ADRENALINE)
			COOLDOWN_START(H, adrenaline_cooldown, 10 MINUTES)


/// The status effect popup for the terror status effect
/atom/movable/screen/alert/status_effect/terrified
	name = "Terrified!"
	desc = "Get in! Get out! DO SOMETHING!"
	icon_state = "terrified"
	icon = 'modular_dripstation/icons/mob/alerts.dmi'

#undef REGULAR_TERROR_AMOUNT
#undef PANIC_ATTACK_TERROR_AMOUNT
#undef HUG_TERROR_AMOUNT
#undef TERROR_CAP
#undef TERROR_FEAR_THRESHOLD
#undef TERROR_PANIC_THRESHOLD
#undef TERROR_HEART_ATTACK_THRESHOLD
#undef CONSCIOUSAY
