/datum/species/lizard
	name = "Unati"
	plural_form = "Unathi"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,DIGITIGRADE,HAS_FLESH,HAS_BONE,HAS_TAIL)
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
		unathi slavery became common, and most slaves were pressed into hazardous conditions in the expluatation of several colonies \
		with rich plasma veins. As time went on, those companies became semyindependant and formed Trade Military Coalition. \
		In 2463 diplomatic issues between Terra and Moges were resolved, though Trade Military Coalition continued to raid \
		and enslave unathi. Terragov couldn`t stop the agression of the TMC because of legal toubles and lack of military strength at the right time, \
		therefore imposed economic sanctions. Terragov space was soonly became overpopulated by unathi refugees and former slaves\
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
	return SPECIES_DEFAULT_SCREAM_SOUND(user)

/datum/species/lizard/get_cough_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_COUGH_SOUND(user)

/datum/species/lizard/get_gasp_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_GASP_SOUND(user)

/datum/species/lizard/get_sigh_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SIGH_SOUND(user)

/datum/species/lizard/get_sneeze_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SNEEZE_SOUND(user)

/datum/species/lizard/get_sniff_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SNIFF_SOUND(user)

/datum/species/lizard/get_cry_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_CRY_SOUND(user)

/datum/species/lizard/get_moan_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_MOAN_SOUND(user)

/datum/species/lizard/get_yawn_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_YAWN_SOUND(user)
