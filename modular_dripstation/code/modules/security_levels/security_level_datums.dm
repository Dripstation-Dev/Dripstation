/**
 * AMBER
 *
 * Rogue security or troubles with chain of command detected
 */
/datum/security_level/amber
	name = "amber"
	announcement_color = "orange"
	sound = 'modular_dripstation/sound/alert/amber.ogg'
	number_level = SEC_LEVEL_AMBER
	elevating_to_configuration_key = /datum/config_entry/string/alert_amber
	lowering_to_configuration_key = /datum/config_entry/string/alert_amber
	shuttle_call_time_mod = ALERT_COEFF_AUTOEVAC_CRITICAL
	disable_night_mode = TRUE
	pod_access = FALSE
	emergency_doors = FALSE
	allow_cryo = FALSE

/datum/config_entry/string/alert_amber
	config_entry_value = "Central Command has ordered the Amber security level on the station. Spearhead Security contract is suspended untill further notice. All heads of stuff are ordered to stay in secure places. Violating Central Command`s and it`s representative`s orders is punishable by death."
