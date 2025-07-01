/datum/quirk/combattraining //low rank CQC
	name = "Unarmed combat trainings"
	desc = "You try to remember some basics of unarmed combat... It`s hard enough."
	icon = "chevron-up"
	value = 6
	gain_text = span_danger("Yeah, I`d use some skills.")
	lose_text = span_notice("Okey, time to touch some grass.")
	medical_record_text = "During physical examination, patient was found to have muscles strengthened by years of training."
	var/datum/martial_art/trained/spesslife = new

/datum/quirk/combattraining/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	spesslife.teach(H)

/datum/quirk/combattraining/post_add()
	to_chat(quirk_holder, span_boldannounce("Your muscles remembers some basics of unarmed combat."))
	var/mob/living/carbon/C = quirk_holder
	var/obj/item/paper/combattesting/combatpermit = new(C.loc)
	combatpermit.update_text(C.real_name)
	var/obj/item/storage/wallet/passport/P = C.get_item_by_slot(ITEM_SLOT_ID)
	if(istype(P))
		P.attackby(combatpermit, C)
	else
		var/list/slots = list("In your left pocket" = ITEM_SLOT_LPOCKET, "In your right pocket" = ITEM_SLOT_RPOCKET, "In your backpack" = ITEM_SLOT_BACKPACK)
		C.equip_in_one_of_slots(combatpermit, slots, 0)

/datum/quirk/combattraining/remove()
	var/mob/living/carbon/human/H = quirk_holder
	spesslife.remove(H)

/obj/item/paper/combattesting
	name = "Martial arts test cetificate (Form NT-114S)"
	desc = "Cetificate that confirms that somebody has trained to perform standart issue martial techniques."
	var/mtype = "standart"

/obj/item/paper/combattesting/cqc
	name = "Martial arts test cetificate (Form NT-114A)"
	desc = "Cetificate that confirms that somebody has trained to perform advanced martial techniques."
	mtype = "advanced"

/obj/item/paper/combattesting/proc/update_text(signature)
	written = list()
	written += new/datum/langtext("<center><h3>Martial arts test cetificate NT-114S</h3></center><hr>",/datum/language/common)
	written += new/datum/langtext("<b>Name: [signature]</b> ",/datum/language/common)
	written += new/datum/langtext("<br><br>",/datum/language/common)
	written += new/datum/langtext("<b>This cetificate confirms that emploee had extensive trainings in the past and can perform [mtype] martial techniques. </b> ",/datum/language/common)
	written += new/datum/langtext("<br><br>",/datum/language/common)
	written += new/datum/langtext("<b>Sign Here: </b>",/datum/language/common)
	written += new/datum/langtext("<i>[signature]</i>",/datum/language/common)
	written += new/datum/langtext("<br><hr>",/datum/language/common)
	written += new/datum/langtext("<b>Reviewed By: Centcom</b>",/datum/language/common)
	written += new/datum/langtext("<br>",/datum/language/common)
	written += new/datum/langtext("<b>Stamp Below if Approved</b>",/datum/language/common)
	update_appearance(UPDATE_ICON)
	var/datum/asset/spritesheet/sheet = get_asset_datum(/datum/asset/spritesheet/simple/paper)
	if (isnull(stamps))
		stamps = sheet.css_tag()
	stamps += sheet.icon_tag("stamp-cent")
	var/mutable_appearance/stampoverlay = mutable_appearance('modular_dripstation/icons/obj/bureaucracy.dmi', "paper_stamp-cent")
	stampoverlay.pixel_x = rand(-2, 2)
	stampoverlay.pixel_y = rand(-3, 2)

	LAZYADD(stamped, "stamp-cent")
	add_overlay(stampoverlay)

/datum/quirk/drunkhealing
	value = 3

/*
/datum/quirk/drunkhealing/on_process()
	var/mob/living/carbon/C = quirk_holder
	//Prevent Prosthetic healing from liquor
	switch(C.get_drunk_amount())
		if (6 to 40)
			C.adjustBruteLoss(-0.1, FALSE, FALSE, required_status = BODYPART_ORGANIC)
			C.adjustFireLoss(-0.05, FALSE, FALSE, required_status = BODYPART_ORGANIC)
		if (41 to 60)
			C.adjustBruteLoss(-0.4, FALSE, FALSE, required_status = BODYPART_ORGANIC)
			C.adjustFireLoss(-0.2, FALSE, FALSE, required_status = BODYPART_ORGANIC)
		if (61 to INFINITY)
			C.adjustBruteLoss(-0.8, FALSE, FALSE, required_status = BODYPART_ORGANIC)
			C.adjustFireLoss(-0.4, FALSE, FALSE, required_status = BODYPART_ORGANIC)
*/

/datum/quirk/psychopathic
	name = "Psychopathic"
	desc = "You often hear to yourself: Hey, secy, how many animals have you killed as a child?"
	icon = "meh"
	value = 5
	mob_trait = TRAIT_PSYCHOPATHIC
	mood_quirk = TRUE
	gain_text = span_danger("You don`t mind if they all die.")
	lose_text = span_notice("Okey, time to touch some grass.")
	medical_record_text = "The patient has a psychopathic personality disorder. It is normal for him to react socially distantly to certain events."

/datum/quirk/psychopathic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier -= 0.6

/datum/quirk/psychopathic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier += 0.6

/datum/quirk/apathetic
	mob_trait = TRAIT_APATHETIC

/datum/quirk/no_appendix
	name = "Appendicitis Survivor"
	desc = "You had a run in with appendicitis in the past and no longer have an appendix."
	icon = "notes-medical"
	value = 1
	gain_text = span_notice("You no longer have an appendix.")
	lose_text = span_danger("Your appendix has magically.. regrown?")
	medical_record_text = "Patient had appendicitis in the past and has had their appendix surgically removed."
	/// The mob's original appendix
	var/obj/item/organ/appendix/old_appendix

/datum/quirk/no_appendix/post_add()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder
	old_appendix = carbon_quirk_holder.getorganslot(ORGAN_SLOT_APPENDIX)

	if(isnull(old_appendix))
		return

	old_appendix.Remove(carbon_quirk_holder, special = TRUE)
	old_appendix.moveToNullspace()

	STOP_PROCESSING(SSobj, old_appendix)

/datum/quirk/no_appendix/remove()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder

	if(isnull(old_appendix))
		return

	var/obj/item/organ/appendix/current_appendix = carbon_quirk_holder.getorganslot(ORGAN_SLOT_APPENDIX)

	// if we have not gained an appendix already, put the old one back
	if(isnull(current_appendix))
		old_appendix.Insert(carbon_quirk_holder, special = TRUE)
	else
		qdel(old_appendix)

	old_appendix = null

/datum/quirk/surgeon
	name = "Professional Surgeon"
	desc = "You have spend a lot more time than others to get used to the modern surgery. Your skill allows you to avoid critical failurs, but you still causes some mess when performing operations on alive and conscious patients."
	icon = "notes-medical"
	value = 5
	mob_trait = TRAIT_MEDIC
	gain_text = span_danger("You getting ready to show your absolute medical skill.")
	lose_text = span_notice("Okey, time to touch some grass.")
	medical_record_text = "The patient has a skill to perform surgeries without failurs."

/obj/item/paper/license
	name = "Surgeon license"
	desc = "Nice medical license, what would you do with it?"

/obj/item/paper/license/proc/update_text(signature)
	info = "<center><B>Medical license</B></center><BR><BR><BR> This medical license confirms that user is licensed medical worker and admitted to perform surgery operations.<BR><BR><BR>Issued for "
	info += "<i>[signature]</i>"
	var/datum/asset/spritesheet/sheet = get_asset_datum(/datum/asset/spritesheet/simple/paper)
	if (isnull(stamps))
		stamps = sheet.css_tag()
	stamps += sheet.icon_tag("stamp-cent")

/datum/quirk/surgeon/post_add()
	var/mob/living/carbon/C = quirk_holder
	var/obj/item/paper/license/med_license = new
	med_license.update_text(C.real_name)
	var/obj/item/storage/wallet/passport/P = C.get_item_by_slot(ITEM_SLOT_ID)
	if(istype(P))
		P.attackby(med_license, C)
	else
		var/list/slots = list("In your left pocket" = ITEM_SLOT_LPOCKET, "In your right pocket" = ITEM_SLOT_RPOCKET, "In your backpack" = ITEM_SLOT_BACKPACK)
		C.equip_in_one_of_slots(med_license, slots, 0)



/datum/quirk/glock
	name = "Weapon Carry Permit"
	desc = "Your past allowed you to have Terragov and Nanotrasen license to carry and own a specific gun. Glock 17 one."
	icon = "gun"
	value = 6
	gain_text = span_danger("I have a gun and gun permit.")
	lose_text = span_notice("I has no gun permit. Wow, that`s unfortunate, if you still have a gun.")
	medical_record_text = "The patient has a skill issue to carry gun."

/obj/item/paper/carry_permit_glock
	name = "Weapon carry permit (Form NT-073D)"
	desc = "Weapon carry permit, containing confirmation that emploee can carry guns."

/obj/item/paper/carry_permit_glock/proc/update_text(signature)
	written = list()
	written += new/datum/langtext("<center><h3>Weapon carry permit NT-073D</h3></center><hr>",/datum/language/common)
	written += new/datum/langtext("<b>Name: [signature]</b> ",/datum/language/common)
	written += new/datum/langtext("<br><br>",/datum/language/common)
	written += new/datum/langtext("<b>Glock 17 carry and owning confirmation permit. </b> ",/datum/language/common)
	written += new/datum/langtext("<br><br>",/datum/language/common)
	written += new/datum/langtext("<b>Sign Here: </b>",/datum/language/common)
	written += new/datum/langtext("<i>[signature]</i>",/datum/language/common)
	written += new/datum/langtext("<br><hr>",/datum/language/common)
	written += new/datum/langtext("<b>Reviewed By: Centcom</b>",/datum/language/common)
	written += new/datum/langtext("<br>",/datum/language/common)
	written += new/datum/langtext("<b>Stamp Below if Approved</b>",/datum/language/common)
	update_appearance(UPDATE_ICON)
	var/datum/asset/spritesheet/sheet = get_asset_datum(/datum/asset/spritesheet/simple/paper)
	if (isnull(stamps))
		stamps = sheet.css_tag()
	stamps += sheet.icon_tag("stamp-cent")
	var/mutable_appearance/stampoverlay = mutable_appearance('modular_dripstation/icons/obj/bureaucracy.dmi', "paper_stamp-cent")
	stampoverlay.pixel_x = rand(-2, 2)
	stampoverlay.pixel_y = rand(-3, 2)

	LAZYADD(stamped, "stamp-cent")
	add_overlay(stampoverlay)

/datum/quirk/glock/post_add()
	var/mob/living/carbon/C = quirk_holder
	var/obj/item/paper/carry_permit_glock/glockpermit = new
	var/obj/item/storage/pouch/pistol/glock17/gun = new(C.loc)
	var/obj/item/ammo_box/magazine/pistolm9mm/ammo = new(C.loc)
	var/list/slots = list("In your left pocket" = ITEM_SLOT_LPOCKET, "In your right pocket" = ITEM_SLOT_RPOCKET, "In your backpack" = ITEM_SLOT_BACKPACK)
	glockpermit.update_text(C.real_name)
	var/obj/item/storage/wallet/passport/P = C.get_item_by_slot(ITEM_SLOT_ID)
	if(istype(P))
		P.attackby(glockpermit, C)
	else
		C.equip_in_one_of_slots(glockpermit, slots, 0)
	C.equip_in_one_of_slots(gun, slots, 0)
	C.equip_in_one_of_slots(ammo, slots, 0)
	var/obj/item/W = C.get_item_by_slot(ITEM_SLOT_ID)
	var/obj/item/card/id/I = W?.GetID()
	I.access += ACCESS_WEAPONS

/datum/quirk/multilingual/english
	name = "Multilingual (Terran)"
	desc = "You spent a portion of your life learning to understand Terran. You may or may not be able to speak it based on your anatomy."
	specific = /datum/language/english
	gain_text = span_notice("You have learned to understand Terran.")
	lose_text = span_notice("You have forgotten how to understand Terran.")

/datum/quirk/multilingual/draconic
	name = "Multilingual (Sinta'unathi)"
	desc = "You spent a portion of your life learning to understand Sinta'unathi. You may or may not be able to speak it based on your anatomy."
	specific = /datum/language/draconic
	gain_text = span_notice("You have learned to understand Sinta'unathi.")	
	lose_text = span_notice("You have forgotten how to understand Sinta'unathi.")

/datum/quirk/multilingual/slavic
	name = "Multilingual (Slavic)"
	desc = "You spent a portion of your life learning to understand Slavic. You may or may not be able to speak it based on your anatomy."
	specific = /datum/language/slavic
	gain_text = span_notice("You have learned to understand Slavic.")
	lose_text = span_notice("You have forgotten how to understand Slavic.")


//////////SPACER//////////
#define LAST_STATE_PLANET "on_planet"
#define LAST_STATE_SPACE "in_space"

/datum/quirk/spacer_born
	name = "Spacer"
	desc = "You were born in space, and have never known the comfort of a planet's gravity. Your body has adapted to this. \
		You are more comfortable in zero and artifical gravity and are more resistant to the effects of space, \
		but travelling to a planet's surface for an extended period of time will make you feel sick."
	gain_text = span_notice("You feel at home in space.")
	lose_text = span_danger("You feel homesick.")
	icon = "user-astronaut"
	value = 6
	/// How long on a planet before we get averse effects
	var/planet_period = 3 MINUTES
	/// TimerID for time spend on a planet
	VAR_FINAL/planetside_timer
	/// How long in space before we get beneficial effects
	var/recover_period = 1 MINUTES
	/// TimerID for time spend in space
	VAR_FINAL/recovering_timer
	/// Determines the last state we were in ([LAST_STATE_PLANET] or [LAST_STATE_SPACE])
	VAR_FINAL/last_state

/datum/quirk/spacer_born/add(client/client_source)
	if(isdummy(quirk_holder))
		return

	// Using Z moved because we don't urgently need to check on every single turf movement for planetary status.
	// If you've arrived at a "planet", the entire Z is gonna be a "planet".
	// It won't really make sense to walk 3 feet and then suddenly gain / lose gravity sickness.
	// If I'm proven wrong, swap this to use Moved.
	RegisterSignal(quirk_holder, COMSIG_MOVABLE_Z_CHANGED, PROC_REF(spacer_moved))

	// Yes, it's assumed for planetary maps that you start at gravity sickness.
	check_z(quirk_holder, skip_timers = TRUE)

/datum/quirk/spacer_born/post_add()
	// drift slightly faster through zero G
	quirk_holder.inertia_move_delay *= 0.8
	var/mob/living/carbon/human/human_quirker = quirk_holder
	human_quirker.physiology.pressure_mod *= 0.8
	human_quirker.physiology.cold_mod *= 0.8

	var/on_a_planet = SSmapping.is_planetary()
	var/planet_job = istype(quirk_holder.mind?.assigned_role, /datum/job/mining)
	if(!on_a_planet && !planet_job)
		return
	//var/datum/bank_account/spacer_account = quirk_holder.get_bank_account()
	//if(!isnull(spacer_account))
	//	spacer_account.payday_modifier *= 1.25
	//	to_chat(quirk_holder, span_info("Given your background as a Spacer, you are awarded with a 25% hazard pay bonus due to your [on_a_planet ?  "station" : "occupational"] assignment."))

	// Supply them with some patches to help out on their new assignment
	var/obj/item/storage/pill_bottle/ondansetron/disgust_killers = new()
	disgust_killers.desc += " Best to take one when travelling to a planet's surface."
	if(quirk_holder.equip_to_slot_if_possible(disgust_killers, ITEM_SLOT_BACKPACK, qdel_on_fail = TRUE, initial = TRUE))
		to_chat(quirk_holder, span_info("You have been given some anti-emetic patches to assist in adjusting to planetary gravity."))

/datum/quirk/spacer_born/remove()
	UnregisterSignal(quirk_holder, COMSIG_MOVABLE_Z_CHANGED)

	if(QDELING(quirk_holder))
		return

	quirk_holder.inertia_move_delay /= 0.8
	SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "spacer")
	if(quirk_holder.has_movespeed_modifier(MOVESPEED_SPACER_IN_SPACE))
		quirk_holder.remove_movespeed_modifier(MOVESPEED_SPACER_IN_SPACE)
	if(quirk_holder.has_movespeed_modifier(MOVESPEED_SPACER_ON_PLANET))
		quirk_holder.remove_movespeed_modifier(MOVESPEED_SPACER_ON_PLANET)
	if(quirk_holder.has_movespeed_modifier(MOVESPEED_SPACER_ON_PLANET_TOO_LONG))
		quirk_holder.remove_movespeed_modifier(MOVESPEED_SPACER_ON_PLANET_TOO_LONG)
	if(quirk_holder.has_movespeed_modifier(MOVESPEED_SPACER_ON_PLANET_NERFED))
		quirk_holder.remove_movespeed_modifier(MOVESPEED_SPACER_ON_PLANET_NERFED)
	quirk_holder.remove_status_effect(/datum/status_effect/spacer)

	var/mob/living/carbon/human/human_quirker = quirk_holder
	human_quirker.physiology.pressure_mod /= 0.8
	human_quirker.physiology.cold_mod /= 0.8

/// Check on Z change whether we should start or stop timers
/datum/quirk/spacer_born/proc/spacer_moved(mob/living/source, turf/old_turf, turf/new_turf, same_z_layer)
	SIGNAL_HANDLER

	check_z(source)

/**
 * Used to check if we should start or stop timers based on the quirk holder's location.
 *
 * * afflicted - the mob arriving / same as quirk holder
 * * skip_timers - if TRUE, this is being done instantly / should not have feedback (such as in init)
 */
/datum/quirk/spacer_born/proc/check_z(mob/living/spacer, skip_timers = FALSE)
	var/turf/open/what_turf = get_turf(spacer)
	if(is_mining_level(what_turf.z) || SSmapping.is_planetary() || spacer.onSyndieBase())
		on_planet(spacer, skip_timers)
	else
		in_space(spacer, skip_timers)

// Going to a planet

/**
 * Ran when we arrive on a planet.
 *
 * * afflicted - the mob arriving / same as quirk holder
 * * skip_timers - if TRUE, this is being done instantly / should not have feedback (such as in init)
 */
/datum/quirk/spacer_born/proc/on_planet(mob/living/afflicted, skip_timers = FALSE)
	if(planetside_timer || last_state == LAST_STATE_PLANET)
		return
	if(recovering_timer)
		deltimer(recovering_timer)
		recovering_timer = null

	last_state = LAST_STATE_PLANET

	if(skip_timers)
		on_planet_for_too_long(afflicted, TRUE)
		return

	// Recently exercising lets us last longer under heavy strain
	var/exercise_bonus = afflicted.has_status_effect(/datum/status_effect/exercised) ? 3 : 1
	planetside_timer = addtimer(CALLBACK(src, PROC_REF(on_planet_for_too_long), afflicted), planet_period * exercise_bonus, TIMER_STOPPABLE)
	SEND_SIGNAL(afflicted, COMSIG_ADD_MOOD_EVENT, "spacer", /datum/mood_event/spacer/on_planet)
	if(afflicted.movement_type == GROUND || afflicted.movement_type == FLYING)
		afflicted.add_movespeed_modifier(MOVESPEED_SPACER_ON_PLANET, update=TRUE, priority=100, multiplicative_slowdown=0.2, blacklisted_movetypes=(FLOATING))
	afflicted.remove_status_effect(/datum/status_effect/spacer) // removes the wellness effect.
	to_chat(afflicted, span_danger("You feel a bit sick under the gravity here."))

/**
 * Ran after remaining on a planet for too long.
 *
 * * afflicted - the mob arriving / same as quirk holder
 * * skip_timers - if TRUE, this is being done instantly / should not have feedback (such as in init)
 */
/datum/quirk/spacer_born/proc/on_planet_for_too_long(mob/living/afflicted, skip_timers = FALSE)
	if(QDELETED(src) || QDELETED(afflicted))
		return

	// Slightly reduced effects if we're on a planetary map to make it a bit more bearable
	var/nerfed_effects_because_planetary = SSmapping.is_planetary()
	var/moodlet_picked = nerfed_effects_because_planetary ? /datum/mood_event/spacer/on_planet/nerfed : /datum/mood_event/spacer/on_planet/too_long
	var/movespeed_id_picked = nerfed_effects_because_planetary ? MOVESPEED_SPACER_ON_PLANET_NERFED : MOVESPEED_SPACER_ON_PLANET_TOO_LONG
	var/movespeed_mod_picked = nerfed_effects_because_planetary ? 0.5 : 0.25

	planetside_timer = null
	afflicted.apply_status_effect(/datum/status_effect/spacer/gravity_sickness)
	SEND_SIGNAL(afflicted, COMSIG_ADD_MOOD_EVENT, "spacer", moodlet_picked)
	if(afflicted.movement_type == GROUND || afflicted.movement_type == FLYING)
		afflicted.add_movespeed_modifier(movespeed_id_picked, update=TRUE, priority=100, multiplicative_slowdown = movespeed_mod_picked, blacklisted_movetypes=(FLOATING))

	if(!skip_timers)
		to_chat(afflicted, span_danger("You've been here for too long. The gravity really starts getting to you."))

// Going back into space

/**
 * Ran when returning to space / somewhere with low gravity.
 *
 * * afflicted - the mob arriving / same as quirk holder
 * * skip_timers - if TRUE, this is being done instantly / should not have feedback (such as in init)
 */
/datum/quirk/spacer_born/proc/in_space(mob/living/afflicted, skip_timers = FALSE)
	if(recovering_timer || last_state == LAST_STATE_SPACE)
		return
	if(planetside_timer)
		deltimer(planetside_timer)
		planetside_timer = null

	last_state = LAST_STATE_SPACE

	if(skip_timers)
		comfortably_in_space(afflicted, TRUE)
		return

	recovering_timer = addtimer(CALLBACK(src, PROC_REF(comfortably_in_space), afflicted), recover_period, TIMER_STOPPABLE)
	afflicted.remove_status_effect(/datum/status_effect/spacer)
	SEND_SIGNAL(afflicted, COMSIG_CLEAR_MOOD_EVENT, "spacer")
	// Does not remove the movement modifier yet, it lingers until you fully recover
	to_chat(afflicted, span_green("You start feeling better now that you're back in space."))

/**
 * Ran when living back in space for a long enough period.
 *
 * * afflicted - the mob arriving / same as quirk holder
 * * skip_timers - if TRUE, this is being done instantly / should not have feedback (such as in init)
 */
/datum/quirk/spacer_born/proc/comfortably_in_space(mob/living/afflicted, skip_timers = FALSE)
	if(QDELETED(src) || QDELETED(afflicted))
		return

	recovering_timer = null
	afflicted.apply_status_effect(/datum/status_effect/spacer/gravity_wellness)
	SEND_SIGNAL(afflicted, COMSIG_ADD_MOOD_EVENT, "spacer", /datum/mood_event/spacer/in_space)
	if(afflicted.movement_type == FLOATING)
		afflicted.add_movespeed_modifier(MOVESPEED_SPACER_IN_SPACE, update=TRUE, priority=100, multiplicative_slowdown=-0.1, blacklisted_movetypes=(FLYING))
	if(!skip_timers)
		to_chat(afflicted, span_green("You feel better."))

#undef LAST_STATE_PLANET
#undef LAST_STATE_SPACE

