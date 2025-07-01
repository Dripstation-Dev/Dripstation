#define PASSPORT_NONE 		"None"
#define PASSPORT_TERRALOW	"Terragovlow"
#define PASSPORT_TERRAMIL	"Terragovmil"
#define PASSPORT_TMC		"TMC"
#define PASSPORT_LIZARD		"Lizard"
#define PASSPORT_USSP		"USSP"
#define PASSPORT_ANCAP		"ANCAP"
GLOBAL_LIST_INIT(passport_list, list(PASSPORT_NONE, PASSPORT_TERRALOW, PASSPORT_TERRAMIL, PASSPORT_TMC, PASSPORT_LIZARD, PASSPORT_USSP, PASSPORT_ANCAP))

/datum/preference/choiced/passport
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_key = "passport"
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE

/datum/preference/choiced/passport/create_default_value()
	return PASSPORT_NONE

/datum/preference/choiced/passport/init_possible_values()
	return list(PASSPORT_NONE, PASSPORT_TERRALOW, PASSPORT_TERRAMIL, PASSPORT_TMC, PASSPORT_LIZARD, PASSPORT_USSP, PASSPORT_ANCAP)

/datum/preference/choiced/passport/compile_constant_data()
	var/list/data = ..()

	data[CHOICED_PREFERENCE_DISPLAY_NAMES] = list(
		PASSPORT_NONE = "None",
		PASSPORT_TERRALOW = "Citizenship Rank 4 Terragov",
		PASSPORT_TERRAMIL = "Citizenship Rank 3 Terragov",
		PASSPORT_TMC = "Trade Military Coalition",
		PASSPORT_LIZARD = "Moges Empire",
		PASSPORT_USSP = "Union of Soviet Socialist Planets",
		PASSPORT_ANCAP = "Anarchic Capitalist Confederation",
	)

	return data

/datum/preference/choiced/passport/apply_to_human(mob/living/carbon/human/target, value)
	return
