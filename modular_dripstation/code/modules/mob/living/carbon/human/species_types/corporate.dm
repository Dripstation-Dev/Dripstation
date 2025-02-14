/datum/species/corporate
	name = "Corporate Replicant"
	id = "corporate"
	limbs_id = "human"
	hair_alpha = 0
	rare_say_mod = list("declares"= 10)
	speedmod = -0.5//Pretty fast
	brutemod = 0.9//Somewhat tough against firearms
	heatmod = 0.5//it's a little tough, but burning them to death not as hard though.
	coldmod = 0.75		//quick metabolism let their blood literally burn
	pressuremod = 0.75	//a bit of bluespace magic, they are not normal humans after all
	punchdamagelow = 10
	punchdamagehigh = 19//they are inhumanly strong
	punchstunthreshold = 16
	attack_verbs = list("robusts")
	use_skintones = TRUE
	species_traits = list(EYECOLOR,HAIR,LIPS,HAS_FLESH,HAS_BONE)
	inherent_traits = list(TRAIT_RADIMMUNE,TRAIT_VIRUSIMMUNE,TRAIT_NODISMEMBER,TRAIT_NOLIMBDISABLE,TRAIT_EAT_MORE)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | ERT_SPAWN
	var/info_text = "You are a <span class='danger'>Nanotrasen Cloned Operative</span>. You have an accelerated metabolism due to the fact that you were cloned by means of low cost growth boosters. Fulfill your duty or die trying."
	var/list/female_screams = list('sound/voice/human/femalescream_1.ogg', 'sound/voice/human/femalescream_2.ogg', 'sound/voice/human/femalescream_3.ogg', 'sound/voice/human/femalescream_4.ogg', 'sound/voice/human/femalescream_5.ogg')
	var/list/male_screams = list('sound/voice/human/malescream_1.ogg', 'sound/voice/human/malescream_2.ogg', 'sound/voice/human/malescream_3.ogg', 'sound/voice/human/malescream_4.ogg', 'sound/voice/human/malescream_5.ogg')
	smells_like = "corpo scum"

/datum/species/corporate/has_toes()
	return TRUE

/datum/species/corporate/get_scream_sound(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		return pick(female_screams)
	else
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(male_screams)

/datum/species/corporate/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	. = ..()
	to_chat(C, "[info_text]")
	C.skin_tone = "albino"

/mob/living/carbon/human/species/corporate
	race = /datum/species/corporate
