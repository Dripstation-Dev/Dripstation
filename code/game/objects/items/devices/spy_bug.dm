/datum/component/bugged/proc/Hear(datum/source, list/hearing_args)
	var/atom/movable/virtualspeaker/speaker = new(null, hearing_args[HEARING_SPEAKER], null)
	var/datum/signal/subspace/vocal/signal = new(hearing_args[HEARING_SPEAKER], FREQ_SYNDICATE, speaker, /datum/language/common, hearing_args[HEARING_RAW_MESSAGE], list(SPAN_ROBOT), list())
	signal.send_to_receivers()

/datum/component/bugged/Initialize()
	RegisterSignals(parent, list(COMSIG_MOVABLE_HEAR), PROC_REF(Hear))

/obj/item/spy_bug
	name = "\improper spy bug" 
	desc = "A small little dot commonly used by the Syndicate to track communications."
	icon = 'icons/obj/device.dmi'
	icon_state = "bug"
	w_class = WEIGHT_CLASS_TINY

/obj/item/spy_bug/Initialize()
	RegisterSignal(src, COMSIG_ITEM_ATTACK , PROC_REF(try_placebug))

/obj/item/spy_bug/proc/try_placebug(obj/item/source, atom/target, mob/living/carbon/user, click_parameters)
	SIGNAL_HANDLER
	
	target.AddComponent(/datum/component/bugged)
	user.show_message(span_notice("You attach \the [src.name] onto [target]!"))
	log_combat(user, target, "placed bug", src.name, "(stealth)")
	add_fingerprint(user)
	target.AddComponent(/datum/component/bugged)
	qdel(src)
	return COMPONENT_SKIP_ATTACK

/obj/item/spy_bug/Bump(atom/A)
	A.AddComponent(/datum/component/bugged)
	qdel(src)
	. = ..()


/*
/obj/item/spy_bug/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if (!proximity_flag)
		return
	target.AddComponent(/datum/component/bugged)
	user.show_message(span_notice("You attach \the [name] onto [target]!"))
	qdel(src)
*/

/obj/item/storage/box/syndie_kit/bugs
	name = "box of bugs"
	desc = "Bzzz....?"

/obj/item/storage/box/syndie_kit/bugs/PopulateContents()
	for (var/i = 0 to 9)
		new /obj/item/spy_bug(src)
