//Procedures in this file: Inernal wound patching, Implant removal.
//////////////////////////////////////////////////////////////////
//					INTERNAL WOUND PATCHING						//
//////////////////////////////////////////////////////////////////

/datum/surgery/blood_vessel_fix
	name = "Blood Vessel manipulation"
	icon_state = "organ_manipulation"
	desc = "This surgery covers operations to fix blood vessels."
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	requires_real_bodypart = 1
	targetable_wound = /datum/wound/blood_vessel/artery
	possible_locs = list(BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_PRECISE_EYES, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/fix_artery,
		/datum/surgery_step/patch_incise,
		/datum/surgery_step/close
		)

/datum/surgery/blood_vessel_fix/can_start(mob/living/user, mob/living/carbon/target)
	if(!istype(target))
		return FALSE
	if(..())
		var/obj/item/bodypart/targeted_bodypart = target.get_bodypart(user.zone_selected)
		return(targeted_bodypart.get_wound_type(targetable_wound))

/datum/surgery/blood_vessel_fix/vein
	targetable_wound = /datum/wound/blood_vessel/vein
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/fix_vein,
		/datum/surgery_step/patch_incise,
		/datum/surgery_step/close
		)

/datum/surgery_step/fix_artery
	time = 5.5 SECONDS
	name = "fix artery"
	implements = list(/obj/item/stack/medical/suture = 100)
	preop_sound = 'modular_dripstation/sound/item/snip.ogg'
	success_sound = 'modular_dripstation/sound/item/snip.ogg'
	failure_sound = 'modular_dripstation/sound/item/snip.ogg'
	bloody_chance = 100

/datum/surgery_step/fix_artery/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/blood_vessel/artery/artery_wound = surgery.operated_wound
	if(!artery_wound)
		user.visible_message(span_notice("[user] looks for [target]'s [artery_wound.limb_name]."), span_notice("You look for [target]'s [artery_wound.limb_name]..."))
		return
	display_results(user, target, span_notice("You start patching the damaged blood vessel in [target]'s [artery_wound.limb_name] with \the [tool]..."),
			"[user] starts patching the damaged blood vessel in [target]'s [artery_wound.limb_name] with \the [tool].",
			"[user] starts patching the damaged blood vessel in [target]'s [artery_wound.limb_name] with \the [tool].")

/datum/surgery_step/fix_artery/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/blood_vessel/artery/artery_wound = surgery.operated_wound
	if(!artery_wound)
		to_chat(user, span_warning("[target] has no arterial wound there!"))
		return ..()
	display_results(user, target, span_notice("You have patched the damaged blood vessel in [target]'s [artery_wound.limb_name] with \the [tool]."),
			"[user] has patched the damaged blood vessel in [target]'s [artery_wound.limb_name] with \the [tool].",
			"[user] has patched the damaged blood vessel in [target]'s [artery_wound.limb_name] with \the [tool].")
	qdel(surgery.operated_wound)
	
	if(istype(tool, /obj/item/stack))
		var/obj/item/stack/used_stack = tool
		used_stack.use(1)
	return TRUE

/datum/surgery_step/fix_artery/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/blood_vessel/artery/artery_wound = surgery.operated_wound
	if(!artery_wound)
		to_chat(user, span_warning("[target] has no arterial wound there!"))
		return ..()
	display_results(user, target, span_warning("Your hand slips, smearing [tool] in the incision in [target]'s [artery_wound.limb_name]!"),
		span_warning("[user]'s hand slips, smearing [tool] in the incision in [target]'s [artery_wound.limb_name]!"),
		span_warning("[user]'s hand slips, smearing [tool] in the incision in [target]'s [artery_wound.limb_name]!"))
	
	if(istype(tool, /obj/item/stack))
		var/obj/item/stack/used_stack = tool
		used_stack.use(1)
	return TRUE

///// Sealing the vessels back together
/datum/surgery_step/fix_vein
	name = "weld vein" // if your doctor says they're going to weld your blood vessels back together, you're either A) on SS13, or B) in grave mortal peril
	implements = list(TOOL_CAUTERY = 100, /obj/item/gun/energy/laser = 90, TOOL_WELDER = 70, /obj/item = 30)
	time = 4.6 SECONDS
	preop_sound = 'sound/surgery/cautery1.ogg'
	success_sound = 'sound/surgery/cautery2.ogg'
	failure_sound = 'sound/items/welder.ogg'
	bloody_chance = 60
	fuckup_damage = 10
	fuckup_damage_type = BURN

/datum/surgery_step/fix_vein/tool_check(mob/user, obj/item/tool)
	if(implement_type == TOOL_WELDER || implement_type == /obj/item)
		return tool.get_temperature()

	return TRUE

/datum/surgery_step/fix_vein/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/blood_vessel/vein/vein_wound = surgery.operated_wound
	if(!vein_wound)
		user.visible_message(span_notice("[user] looks for [target]'s [vein_wound.limb_name]."), span_notice("You look for [target]'s [vein_wound.limb_name]..."))
		return
	display_results(user, target, span_notice("You begin to meld some of the split blood vessels in [target]'s [vein_wound.limb_name]..."),
		span_notice("[user] begins to meld some of the split blood vessels in [target]'s [vein_wound.limb_name] with [tool]."),
		span_notice("[user] begins to meld some of the split blood vessels in [target]'s [vein_wound.limb_name]."))

/datum/surgery_step/fix_vein/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/datum/wound/blood_vessel/vein/vein_wound = surgery.operated_wound
	if(!vein_wound)
		to_chat(user, span_warning("[target] has no torn vein there!"))
		return ..()

	display_results(user, target, span_notice("You successfully meld some of the split blood vessels in [target]'s [vein_wound.limb_name] with [tool]."),
		span_notice("[user] successfully melds some of the split blood vessels in [target]'s [vein_wound.limb_name] with [tool]!"),
		span_notice("[user] successfully melds some of the split blood vessels in [target]'s [vein_wound.limb_name]!"))
	qdel(surgery.operated_wound)
	return TRUE

/datum/surgery_step/fix_vein/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/blood_vessel/vein/vein_wound = surgery.operated_wound
	if(!vein_wound)
		to_chat(user, span_warning("[target] has no torn vein there!"))
		return ..()
	display_results(user, target, span_warning("Your hand slips, smearing [tool] in the incision in [target]'s [vein_wound.limb_name]!"),
		span_warning("[user]'s hand slips, smearing [tool] in the incision in [target]'s [vein_wound.limb_name]!"),
		span_warning("[user]'s hand slips, smearing [tool] in the incision in [target]'s [vein_wound.limb_name]!"))
	return TRUE
