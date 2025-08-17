/datum/surgery_step/cause_ouchie(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, success)
	. = ..()
	SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "screw_up", /datum/mood_event/surgery)

/datum/surgery_step/patch_incise
	name = "patch incised skin"
	time = 2 SECONDS
	implements = list(/obj/item/stack/medical/suture = 100)
	preop_sound = 'modular_dripstation/sound/item/snip.ogg'
	success_sound = 'modular_dripstation/sound/item/snip.ogg'
	fuckup_damage = 1
	bloody_chance = 0

/datum/surgery_step/patch_incise/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, span_notice("You begin to patch incision in [target]'s [parse_zone(target_zone)]..."),
		"[user] begins to patch incision in [target]'s [parse_zone(target_zone)].",
		"[user] begins to patch incision in [target]'s [parse_zone(target_zone)].")

/datum/surgery_step/patch_incise/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/bleed_stacks_num
	var/obj/item/bodypart/affecting = target.get_bodypart(target_zone)
	for(var/datum/surgery_step/incise/I in surgery.steps)
		affecting?.heal_damage(5,0)
		if(istype(I, /datum/surgery_step/incise/nobleed))
			continue
		bleed_stacks_num ++
	if(locate(/datum/surgery_step/saw) in surgery.steps)
		affecting?.heal_damage(25,0)
	if (ishuman(target))
		var/mob/living/carbon/human/H = target
		var/obj/item/bodypart/BP = H.get_bodypart(target_zone)
		if(BP)
			BP.adjustBleedStacks(-(bleed_stacks_num*5 + 2))
	
	if(istype(tool, /obj/item/stack))
		var/obj/item/stack/used_stack = tool
		used_stack.use(1)
	return ..()

