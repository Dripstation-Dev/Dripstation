/// Gender preference
/datum/preference/choiced/gender
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "gender"
	priority = PREFERENCE_PRIORITY_GENDER

/datum/preference/choiced/gender/init_possible_values()
	return list(MALE, FEMALE, PLURAL, NEUTER)

/datum/preference/choiced/gender/create_informed_default_value(datum/preferences/preferences)

	var/datum/species/species_type = preferences.read_preference(/datum/preference/choiced/species)

	var/list/possible_genders = initial(species_type.possible_genders)
	if(possible_genders.len < 1)
		stack_trace("[species_type.type] has no possible genders!")
		return list(PLURAL)

	return pick(possible_genders)

/datum/preference/choiced/gender/apply_to_human(mob/living/carbon/human/target, value)
	var/datum/species/S = target.dna.species

	if(!(value in S.possible_genders))
		target.gender = pick(S.possible_genders)
	else
		target.gender = value

	if((FACEHAIR in S.species_traits) && target.gender == FEMALE)	//dripstation edit
		target.facial_hair_style = "Shaved"	//Yeah, I know it`s shit af
