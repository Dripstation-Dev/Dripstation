
/////BURN FIXING SURGERIES//////

///// Debride burnt flesh
/datum/surgery/debride
	name = "Debride infected flesh"
	icon = 'icons/obj/stack_medical.dmi'
	icon_state = "gauze"
	steps = list(/datum/surgery_step/incise, /datum/surgery_step/debride_infected, /datum/surgery_step/patch_incise, /datum/surgery_step/close/*, /datum/surgery_step/dress*/)
	target_mobtypes = list(/mob/living/carbon)
	possible_locs = list(BODY_ZONE_R_ARM,BODY_ZONE_L_ARM,BODY_ZONE_R_LEG,BODY_ZONE_L_LEG,BODY_ZONE_CHEST,BODY_ZONE_PRECISE_GROIN,BODY_ZONE_HEAD)
	requires_real_bodypart = TRUE
	targetable_wound = /datum/wound/infected

/datum/surgery/debride/can_start(mob/living/user, mob/living/carbon/target)
	if(!istype(target))
		return FALSE
	if(..())
		var/obj/item/bodypart/targeted_bodypart = target.get_bodypart(user.zone_selected)
		var/datum/wound/infected/target_wound = targeted_bodypart.get_wound_type(targetable_wound)
		return(target_wound && target_wound.limb.infestation > 0)

//SURGERY STEPS

///// Debride
/datum/surgery_step/debride_infected
	name = "excise infection"
	implements = list(TOOL_SCALPEL = 100, TOOL_SAW = 60, TOOL_WIRECUTTER = 40)
	time = 3 SECONDS
	repeatable = TRUE
	preop_sound = 'sound/surgery/scalpel1.ogg'
	success_sound = 'sound/surgery/retractor2.ogg'
	failure_sound = 'sound/surgery/organ1.ogg'
	/// How much sanitization is added per step - no sanitization added
	var/sanitization_added = 0.5
	/// How much infestation is removed per step (positive number)
	var/infestation_removed = 8

/datum/surgery_step/debride_infected/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(surgery.operated_wound)
		var/datum/wound/infected/target_wound = surgery.operated_wound
		if(target_wound.limb.infestation <= 0)
			to_chat(user, span_notice("[target]'s [parse_zone(target_zone)] has no infected flesh to remove!"))
			surgery.status++
			repeatable = FALSE
			return
		if(target_wound.limb.infestation >= WOUND_INFECTION_SEPTIC)
			to_chat(user, span_userdanger("[target]'s [parse_zone(target_zone)] is beyond saving, probably you should severe it at this point!"))
			surgery.status++
			repeatable = FALSE
			return
		display_results(user, target, span_notice("You begin to excise infected flesh from [target]'s [target_wound.limb.name]..."),
			span_notice("[user] begins to excise infected flesh from [target]'s [target_wound.limb.name] with [tool]."),
			span_notice("[user] begins to excise infected flesh from [target]'s [target_wound.limb.name]."))
	else
		user.visible_message(span_notice("[user] looks for [target]'s [parse_zone(target_zone)]."), span_notice("You look for [target]'s [parse_zone(target_zone)]..."))

/datum/surgery_step/debride_infected/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/datum/wound/infected/target_wound = surgery.operated_wound
	var/obj/item/bodypart/BP = target.get_bodypart(target_zone)
	if(BP.infestation >= WOUND_INFECTION_SEPTIC)
		display_results(user, target, span_notice("You carve away some of the infected flesh from [target]'s [parse_zone(target_zone)] and realise that it`s too late to save."),
			span_notice("[user] carves away some of the infected flesh from [target]'s [parse_zone(target_zone)] with [tool]!"),
			span_notice("[user] carves away some of the infected flesh from [target]'s [parse_zone(target_zone)]!"))
		to_chat(user, span_userdanger("[target]'s [parse_zone(target_zone)] is beyond saving, probably you should severe it at this point!"))
		repeatable = FALSE
		return
	if(target_wound)
		display_results(user, target, span_notice("You successfully excise some of the infected flesh from [target]'s [parse_zone(target_zone)]."),
			span_notice("[user] successfully excises some of the infected flesh from [target]'s [parse_zone(target_zone)] with [tool]!"),
			span_notice("[user] successfully excises some of the infected flesh from [target]'s [parse_zone(target_zone)]!"))
		log_combat(user, target, "excised infected flesh in", addition="INTENT: [uppertext(user.a_intent)]")
		/*surgery.operated_bodypart.*/BP.receive_damage(brute=3, wound_bonus=CANT_WOUND)
		BP.applyInfestation(-infestation_removed)
		//BP.sanitization += sanitization_added
		if(BP.infestation <= 0)
			repeatable = FALSE
	else
		to_chat(user, span_warning("[target] has no infected flesh there!"))
	return ..()

/datum/surgery_step/debride_infected/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, fail_prob = 0)
	..()
	var/obj/item/bodypart/BP = target.get_bodypart(target_zone)
	if(BP.infestation >= WOUND_INFECTION_SEPTIC)
		display_results(user, target, span_notice("You carve away some of the infected flesh from [target]'s [parse_zone(target_zone)] and realise that it`s too late to save."),
			span_notice("[user] carves away some of the infected flesh from [target]'s [parse_zone(target_zone)] with [tool] and realises that it`s too late to save!"),
			span_notice("[user] carves away some of the infected flesh from [target]'s [parse_zone(target_zone)] and realises that it`s too late to save!"))
		surgery.status++
		repeatable = FALSE
		return
	display_results(user, target, span_notice("You carve away some of the healthy flesh from [target]'s [parse_zone(target_zone)]."),
		span_notice("[user] carves away some of the healthy flesh from [target]'s [parse_zone(target_zone)] with [tool]!"),
		span_notice("[user] carves away some of the healthy flesh from [target]'s [parse_zone(target_zone)]!"))
	/*surgery.operated_bodypart.*/BP.receive_damage(brute=rand(2,5), sharpness=TRUE)

/datum/surgery_step/debride_infected/initiate(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, try_to_fail = FALSE)
	if(!..())
		return
	var/datum/wound/infected/target_wound = surgery.operated_wound
	var/obj/item/bodypart/BP = target.get_bodypart(target_zone)
	while(target_wound && BP.infestation > 0.25)
		if(!..())
			break

/* infestation handled with wounds - no point in dressing
///// Dressing burns
/datum/surgery_step/dress
	name = "bandage burns"
	implements = list(/obj/item/stack/medical/gauze = 100)
	time = 4 SECONDS
	preop_sound = 'sound/effects/rip2.ogg'
	success_sound = 'sound/effects/rip1.ogg'

/datum/surgery_step/dress/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/target_wound = surgery.operated_wound
	if(target_wound)
		display_results(user, target, span_notice("You begin to dress the burns on [target]'s [parse_zone(user.zone_selected)]..."),
			span_notice("[user] begins to dress the burns on [target]'s [parse_zone(user.zone_selected)] with [tool]."),
			span_notice("[user] begins to dress the burns on [target]'s [parse_zone(user.zone_selected)]."))
	else
		user.visible_message(span_notice("[user] looks for [target]'s [parse_zone(user.zone_selected)]."), span_notice("You look for [target]'s [parse_zone(user.zone_selected)]..."))

/datum/surgery_step/dress/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/datum/wound/target_wound = surgery.operated_wound
	if(target_wound)
		display_results(user, target, span_notice("You successfully wrap [target]'s [parse_zone(target_zone)] with [tool]."),
			span_notice("[user] successfully wraps [target]'s [parse_zone(target_zone)] with [tool]!"),
			span_notice("[user] successfully wraps [target]'s [parse_zone(target_zone)]!"))
		log_combat(user, target, "dressed burns in", addition="INTENT: [uppertext(user.a_intent)]")
		target_wound.sanitization += 3
		var/obj/item/bodypart/the_part = target.get_bodypart(target_zone)
		the_part.apply_gauze(tool)
	else
		to_chat(user, span_warning("[target] has no burns there!"))
	return ..()

/datum/surgery_step/dress/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, fail_prob = 0)
	..()
	if(istype(tool, /obj/item/stack))
		var/obj/item/stack/used_stack = tool
		used_stack.use(1)
*/
