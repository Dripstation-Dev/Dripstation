/datum/outfit/traitor
	name = "Traitor (Preview only)"
	mask = /obj/item/clothing/mask/gas/syndicate

/datum/objective/demoralise_poster
	name = "demoralise"
	objective_name = "Sow doubt among the crew using Syndicate propaganda posters."
	explanation_text = "Let the crew see the fails of corporation they work on."

	//duplicate_type = /datum/objective/demoralise_poster
	/// All of the posters the traitor gets, if this list is empty they've failed
	var/list/posters = list()
	var/failed = FALSE

#define POSTERS_PROVIDED 5

/datum/objective/demoralise_poster/find_target(dupe_search_range, blacklist)
	return give_special_equipment()

/datum/objective/demoralise_poster/give_special_equipment()
	var/list/datum/mind/owners = get_owners()
	for(var/datum/mind/M in owners)
		var/mob/living/carbon/human/H = M.current
		if(!istype(H))
			return
		var/obj/item/storage/box/syndie_kit/posterbox = new(H.drop_location())
		for(var/i in 1 to POSTERS_PROVIDED)
			var/obj/item/poster/traitor/added_poster = new /obj/item/poster/traitor(posterbox)
			posters += added_poster
			RegisterSignal(added_poster, COMSIG_POSTER_PLACED, PROC_REF(on_poster_placed))
			RegisterSignal(added_poster, COMSIG_QDELETING, PROC_REF(on_poster_destroy))

		if(!H.equip_to_slot_if_possible(posterbox, ITEM_SLOT_BACK))
			posterbox.balloon_alert(H, "can`t materialize")
			addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, put_in_hands), posterbox), 10 SECONDS)

#undef POSTERS_PROVIDED

/datum/objective/demoralise_poster/proc/on_poster_placed(obj/item/poster/traitor/poster_placed)
	SIGNAL_HANDLER
	if(istype(poster_placed))
		posters -= poster_placed
		UnregisterSignal(poster_placed, COMSIG_QDELETING)

/datum/objective/demoralise_poster/proc/on_poster_destroy(obj/item/poster/traitor/poster)
	SIGNAL_HANDLER
	posters -= poster
	UnregisterSignal(poster, COMSIG_POSTER_PLACED)
	failed = TRUE

/datum/objective/demoralise_poster/check_completion()
	if(!failed && posters.len == 0)
		return TRUE
	return FALSE
