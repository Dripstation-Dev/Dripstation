/obj/item/surgical_processor
	icon = 'modular_dripstation/icons/obj/device.dmi'

/obj/item/stack/medical/tourniquet
	name = "medical tourniquet"
	desc = "A medical tourniquet for emergency stopping of bleeding."
	gender = MALE
	singular_name = "medical tourniquet"
	icon_state = "tourniquet"
	apply_sounds = list('sound/effects/rip1.ogg','sound/effects/rip2.ogg')
	self_delay = 50
	other_delay = 20
	max_amount = 3
	amount = 1
	grind_results = list(/datum/reagent/cellulose = 2)
	custom_price = 100
	var/list/normal_zones = list(BODY_ZONE_L_LEG, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_R_ARM)
	//absorption_rate = 0.25
	//absorption_capacity = 5
	//splint_factor = 0.35

// gauze is only relevant for wounds, which are handled in the wounds themselves
/obj/item/stack/medical/tourniquet/try_heal(mob/living/M, mob/user, silent)
	var/obj/item/bodypart/limb = M.get_bodypart(check_zone(user.zone_selected))
	if(!limb)
		to_chat(user, span_notice("There's nothing there to bandage!"))
		return
	if(!LAZYLEN(limb.wounds))
		to_chat(user, span_notice("There's no wounds that require tourniquet appling on [user==M ? "your" : "[M]'s"] [limb.name]!")) // good problem to have imo
		return
	if(!limb.body_zone in normal_zones)
		to_chat(user, span_notice("You can`t apply tourniquet on [user==M ? "your" : "[M]'s"] [limb.name]!")) // good problem to have imo
		return

	var/tourniquet_wound = FALSE
	for(var/i in limb.wounds)
		var/datum/wound/woundies = i
		if(woundies.wound_flags & ACCEPTS_GAUZE)
			tourniquet_wound = TRUE
			break
	if(!tourniquet_wound)
		to_chat(user, span_notice("There's no wounds that require tourniquet appling on [user==M ? "your" : "[M]'s"] [limb.name]!")) // good problem to have imo
		return

	if(limb.current_gauze && (limb.current_gauze.absorption_capacity * 0.8 > absorption_capacity)) // ignore if our new wrap is < 20% better than the current one, so someone doesn't bandage it 5 times in a row
		to_chat(user, span_warning("The bandage currently on [user==M ? "your" : "[M]'s"] [limb.name] is still in good condition! You can`t splint tourniquet around it!"))
		return
	if(limb.current_tourniquet)
		to_chat(user, span_warning("The tourniquet is already applied on [user==M ? "your" : "[M]'s"] [limb.name]!"))
		return

	user.visible_message(span_warning("[user] begins to apply the [src] on [M]'s [limb.name]..."), span_warning("You begin to apply the [src] on [user == M ? "your" : "[M]'s"] [limb.name]..."))

	playsound(src, 'sound/effects/rip2.ogg', 25)

	/// Use other_delay if healing someone else (usually 1 second)
	/// Use self_delay if healing yourself (usually 3 seconds)
	/// Reduce delay by 20% if medical
	if(!do_after(user, (user == M ? self_delay : other_delay) * (IS_MEDICAL(user) ? 0.8 : 1), M))
		return

	playsound(src, 'sound/effects/rip1.ogg', 25)

	user.visible_message(span_green("[user] applies [src] to [M]'s [limb.name]."), span_green("You apply the wounds on [user == M ? "yourself" : "[M]'s"] [limb.name]."))
	limb.apply_tourniquet(src)

/obj/item/stack/medical/tourniquet/three
	amount = 3

/obj/item/stack/medical/tourniquet/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] begins tightening \the [src] around [user.p_their()] neck! It looks like [user.p_they()] forgot how to use medical supplies!"))
	return OXYLOSS

/obj/item/scalpel/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/tourniquetsnapping, 1 SECONDS)

/obj/item/bodypart
	var/current_tourniquet

/obj/item/bodypart/proc/apply_tourniquet(obj/item/stack/medical/tourniquet)
	if(!istype(tourniquet))
		return
	current_tourniquet = new tourniquet.type(src, 1)
	ADD_TRAIT(src, TRAIT_COMPLETELY_STOPED_BLOOD_FLOW, tourniquet)
	addtimer(CALLBACK(src, PROC_REF(tourniquet_posteffect), tourniquet), 15 SECONDS)
	tourniquet.use(1)
	//SEND_SIGNAL(src, COMSIG_BODYPART_TOURNIQUET, tourniquet)

/obj/item/bodypart/proc/tourniquet_posteffect(obj/item/stack/medical/tourniquet)
	if(!tourniquet || !HAS_TRAIT_FROM(src, TRAIT_COMPLETELY_STOPED_BLOOD_FLOW, tourniquet))
		return
	ADD_TRAIT(src, TRAIT_PARALYSIS, tourniquet)
	update_disabled()
	

/datum/element/tourniquetsnapping
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2 // let bos cutters paeper cutters and etc do it too
	/// If not null, can snap
	var/snap_time_weak = 0 SECONDS

/datum/element/tourniquetsnapping/Attach(datum/target, snap_time_weak = 0 SECONDS)
	. = ..()

	if(!isitem(target))
		stack_trace("tourniquet snapping element added to non-item object: \[[target]\]")
		return ELEMENT_INCOMPATIBLE

	src.snap_time_weak = snap_time_weak

	RegisterSignal(target, COMSIG_ITEM_ATTACK , PROC_REF(try_toursnap_target))

/datum/element/tourniquetsnapping/proc/try_toursnap_target(obj/item/cutter, mob/living/carbon/target, mob/cutter_user, params)
	SIGNAL_HANDLER

	if(!istype(target)) //we aren't the kind of mob that can even have tour, so we skip.
		return

	if(!parse_zone(cutter_user.zone_selected))
		return

	var/obj/item/bodypart/BP = parse_zone(cutter_user.zone_selected)

	if(BP.current_tourniquet)
		return

	var/obj/item/stack/medical/tourniquet/tour = BP.current_tourniquet

	if(!istype(tour))
		return

	else if(isnull(src.snap_time_weak))
		cutter_user.visible_message(span_notice("[cutter_user] tries to cut through [target]'s restraints with [cutter], but fails!"))
		playsound(source = get_turf(cutter), soundin = cutter.usesound ? cutter.usesound : cutter.hitsound, vol = cutter.get_clamped_volume(), vary = TRUE)
		return COMPONENT_SKIP_ATTACK

	. = COMPONENT_SKIP_ATTACK

	INVOKE_ASYNC(src, PROC_REF(do_tournap_target), cutter, target, cutter_user, tour, BP)

/datum/element/tourniquetsnapping/proc/do_tournap_target(obj/item/cutter, mob/living/carbon/target, mob/cutter_user, obj/item/stack/medical/tourniquet/tour, obj/item/bodypart/BP)
	if(LAZYACCESS(cutter_user.do_afters, cutter))
		return

	log_combat(cutter_user, target, "cut or tried to cut [target]'s tour", cutter)

	var/snap_time = src.snap_time_weak

	if(snap_time == 0 || do_after(cutter_user, snap_time, target, interaction_key = cutter)) // If 0 just do it. This to bypass the do_after() creating a needless progress bar.
		cutter_user.do_attack_animation(target, used_item = cutter)
		cutter_user.visible_message(span_notice("[cutter_user] cuts [target]'s restraints with [cutter]!"))
		REMOVE_TRAITS_IN(BP, tour)
		qdel(BP.current_tourniquet)
		playsound(source = get_turf(cutter), soundin = cutter.usesound ? cutter.usesound : cutter.hitsound, vol = cutter.get_clamped_volume(), vary = TRUE)

	return
