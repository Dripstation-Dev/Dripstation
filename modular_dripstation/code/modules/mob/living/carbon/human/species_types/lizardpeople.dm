/datum/species/lizard
	name = "Unati"
	plural_form = "Unathi"
	possible_genders = list(MALE, FEMALE)
	coldmod = 1.33 	//hates beeng cold
	heatmod = 0.67	//greatly appreciate heat, just not too much
	tempmod = 1.5	//heat like swoosh
	unarmed_wound_bonus = 2
	bodytemp_cold_damage_limit = BODYTEMP_NORMAL - 30
	bodytemp_heat_damage_limit = BODYTEMP_NORMAL + 70
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,DIGITIGRADE,HAS_FLESH,HAS_BONE,HAS_TAIL)
	inherent_traits = list(TRAIT_NO_NORMAL_FEAR, TRAIT_COLDBLOODED)
	default_features = list("mcolor" = "#00FF00", "tail_lizard" = "Smooth", "snout" = "Round", "horns" = "None", "frills" = "None", "spines" = "None", "body_markings" = "None", "legs" = "Digitigrade Legs")
	aiminginaccuracy = 5 //they prefer melee combat, has claws and are not skilled in long range fightsss
	mutantappendix = /obj/item/organ/appendix/lizard

/datum/species/lizard/get_species_description()
	return "The first sentient beings encountered by the Terragov outside of the Sol system, unathi are the most \
		commonly encountered non-human species in Terragov space. Despite being one of the most integrated species in the Terragov, they \
		are also one of the most heavily discriminated against."

/datum/species/lizard/get_species_lore()
	return list(
		"Born on the planet of Moges, unathi evolved from raptor-like creatures and quickly became the \
		dominant species thanks to the warm climate of the planet and their intelligence combined with relatively \
		dexterous claws. Unathi developed similarly to humans technologically and geopolitically, mastering fire, \
		agriculture, writing, metalworking, architecture, and the applications of plasma; empires rose and fell; \
		varied and rich cultures emerged and grew. By the time first contact occurred between humans and unathi, \
		the latter were a kind of space empire age, but having only a few planets colonised without of their core \
		system.",
 
		"The Terragov was highly interested in Moges for two reasons when it was discovered. The first was the \
		discovery of sapient life. The second was the great plethora of plasma and bluespace located on the planet. \
		After the first contact between Terragov Exploration Corps and Unathi Navi, diplomatic team was quickly assembled, \
		but the first diplomatic contact turned violent. Afterwards, the Terragov companies, that claimed rights on Moges Empire territories \
		waged war to conquer them. In a year vast amounts of newly founded colonies, both unathi and human, became the grey war zone. \
		Unathi slavery became common, and most slaves were pressed into hazardous conditions in the expluatation of several colonies \
		with rich plasma veins. As time went on, those companies became semyindependant and formed Trade Military Coalition. \
		In 2463 diplomatic issues between Terra and Moges were resolved, though Trade Military Coalition continued to raid \
		and enslave unathi. Terragov couldn`t stop the agression of the TMC because of legal toubles and lack of military strength at the right time, \
		therefore imposed economic sanctions. Terragov space was soonly became overpopulated by unathi refugees and former slaves.\
		Many human companies started exploit unathi as workers, as labor laws for non-humans offered significantly less privilege than \
		what would be expected.",
 
		"Unati communities within Terragov are organized in clans, though their impact on the culture of the individuals is limited. \
		They tend to often live like humans, only occasionally practicing some of their clan traditions. Despite efforts to integrate \
		unathi into the Terragov through establishments such as habituation stations, a certain pridefulness nonetheless survived amongst \
		unathi, as they're often eager to prove their worth and qualities. In addition, strength and honor are still values commonly held \
		by unathi. Awareness of the past and current atrocities committed against unathi by the humans vary greatly \
		between individuals, both amongst humans and unathi.",
 
		"Today, unathi are now considered Terragov citizens and claim almost all the same rights as humans \
		do. However, lawyers still struggle in rigged courts to try and claim a sense of equality \
		for all those who exist in the Terragov as honest citizens. Humans and unathi exist side by side \
		across the Terragov in harmony, but without much fraternity. While full-blown hostility is rare, \
		prejudice is common.",
	)

///КОСТЫЛЬ, НУЖНЫ НОРМАЛЬНЫЕ ЗВУКИ ДЛЯ ВИДА///
/datum/species/lizard/get_laugh_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_LAUGH_SOUND(user)

/datum/species/lizard/get_giggle_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_GIGGLE_SOUND(user)

/datum/species/lizard/get_scream_sound(mob/living/carbon/user)
	return UNATHI_DEFAULT_SCREAM_SOUND(user)

/datum/species/lizard/get_cough_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_COUGH_SOUND(user)

/datum/species/lizard/get_gasp_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_GASP_SOUND(user)

/datum/species/lizard/get_sigh_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SIGH_SOUND(user)

/datum/species/lizard/get_sneeze_sound(mob/living/carbon/user)
	return UNATHI_DEFAULT_SNEEZE_SOUND(user)

/datum/species/lizard/get_sniff_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SNIFF_SOUND(user)

/datum/species/lizard/get_cry_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_CRY_SOUND(user)

/datum/species/lizard/get_moan_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_MOAN_SOUND(user)

/datum/species/lizard/get_lewd_moan_sound(mob/living/carbon/user)
	return SFX_HISS

/datum/species/lizard/get_yawn_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_YAWN_SOUND(user)

/datum/species/lizard/on_species_gain(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	new /datum/bioware/lizard_scales(C)
	var/datum/component/regeneration/regen = C.GetComponent(/datum/component/regeneration)
	if(regen)
		regen.hunger_cap = NUTRITION_LEVEL_STARVING

/datum/species/lizard/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	var/datum/bioware/lizard_scales/LS
	if(LS in C.bioware)
		QDEL_NULL(LS)
	var/datum/component/regeneration/regen = C.GetComponent(/datum/component/regeneration)
	if(regen)
		regen.hunger_cap = NUTRITION_LEVEL_FED
		regen.health_per_second = initial(regen.health_per_second)

/datum/bioware/lizard_scales
	name = "Unathi Scales"
	desc = "Scales form a primitive armor, protecting the body from melee attacks."
	mod_type = BIOWARE_GENERIC
	var/datum/armor/scales_armor_boost = new /datum/armor(20, 0, 0, 0, 0, 0, 0, 0, 0)

/datum/bioware/lizard_scales/on_gain()
	..()
	owner.physiology.armor = owner.physiology.armor.attachArmor(scales_armor_boost)

/datum/bioware/lizard_scales/on_lose()
	..()
	owner.physiology.armor = owner.physiology.armor.detachArmor(scales_armor_boost)
	QDEL_NULL(scales_armor_boost)

/obj/item/sharpener
	var/claws_max = 8

/obj/item/sharpener/cult
	claws_max = 16

/obj/item/sharpener/eldritch
	claws_max = 12

/obj/item/sharpener/attack_self(mob/living/carbon/human/user, params)
	if(!istype(user))
		return
	if(used)
		to_chat(user, span_warning("The sharpening block is too worn to use again!"))
		return
	if(user.dna.species.attack_sound != SFX_CLAWS && requires_sharpness)//no fist sharpening
		to_chat(user, span_warning("You can only sharpen things that are already sharp, such as claws!"))
		return
		//to_chat(user, span_warning("You don't think \the claws will be the thing getting modified if you use it on \the [src]!"))
		//return
	if(user.physiology.unarmed_wound_bonus >= claws_max) //No sharpening claws further
		to_chat(user, span_warning("Claws has already been refined to perfect state before. It cannot be sharpened further!"))
		return
	user.visible_message(span_notice("[user] sharpens claws with [src]!"), span_notice("You sharpen claws, making them much more deadly than before."))
	playsound(src, 'sound/items/unsheath.ogg', 25, 1)
	user.physiology.unarmed_wound_bonus = clamp(user.physiology.unarmed_wound_bonus + increment, 0, max)
	if(user.physiology.punchdamagehigh_bonus < max)
		user.physiology.punchdamagehigh_bonus = clamp(user.physiology.punchdamagehigh_bonus + increment, 0, max)
	if(user.physiology.punchdamagelow_bonus < max)
		user.physiology.punchdamagelow_bonus = clamp(user.physiology.punchdamagelow_bonus + increment, 0, max)
	if(user.physiology.punchstunthreshold_bonus < max)
		user.physiology.punchstunthreshold_bonus = clamp(user.physiology.punchstunthreshold_bonus + increment, 0, max)
	name = "worn out [name]"
	desc = "[desc] At least, it used to."
	used = 1
	update_appearance(UPDATE_ICON)
