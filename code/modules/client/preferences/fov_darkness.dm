/datum/preference/numeric/fov_darkness
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "fov_darkness"
	savefile_identifier = PREFERENCE_PLAYER

	minimum = 0
	maximum = 255

/datum/preference/numeric/fov_darkness/create_default_value()
	return 200

/datum/preference/numeric/fov_darkness/apply_to_client_updated(client/client, value)
	if(client.mob)
		var/datum/component/field_of_vision/fov_component = client.mob.GetComponent(/datum/component/field_of_vision)
		if(!fov_component)
			return
		fov_component.visual_shadow.alpha = value

