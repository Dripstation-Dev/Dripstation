/datum/species/human
	//deathsound = SFX_BODYFALL

/datum/species/human/get_laugh_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_LAUGH_SOUND(user)

/datum/species/human/get_giggle_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_GIGGLE_SOUND(user)

/datum/species/human/get_scream_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SCREAM_SOUND(user)

/datum/species/human/get_cough_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_COUGH_SOUND(user)

/datum/species/human/get_gasp_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_GASP_SOUND(user)

/datum/species/human/get_sigh_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SIGH_SOUND(user)

/datum/species/human/get_sneeze_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SNEEZE_SOUND(user)

/datum/species/human/get_sniff_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_SNIFF_SOUND(user)

/datum/species/human/get_cry_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_CRY_SOUND(user)

/datum/species/human/get_moan_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_MOAN_SOUND(user)

/datum/species/human/get_lewd_moan_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_LEWD_MOAN_SOUND(user)

/datum/species/human/get_yawn_sound(mob/living/carbon/user)
	return SPECIES_DEFAULT_YAWN_SOUND(user)

//datum/species/human/slavic
	//species_language_holder = /datum/language_holder/slavic

/datum/species/human/felinid
	screamsound = list('sound/voice/feline/scream1.ogg', 'sound/voice/feline/scream2.ogg', 'sound/voice/feline/scream3.ogg', 'sound/voice/feline/scream3.ogg', 'modular_dripstation/sound/emotes/cat/scream_cat.ogg')
	barefoot_step_sound = FOOTSTEP_MOB_PAW

/datum/species/human/felinid/get_cry_sound(mob/living/carbon/user)
	return CAT_DEFAULT_CRY_SOUND(user)

/datum/species/human/felinid/get_lewd_moan_sound(mob/living/carbon/user)
	return CAT_DEFAULT_LEWD_MOAN_SOUND(user)
