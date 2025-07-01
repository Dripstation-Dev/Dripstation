/datum/status_effect/breaching_and_cleaving
	id = "breaching_and_cleaving"
	duration = -1
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/breaching_and_cleaving
	var/datum/armor/cleaving_armor_boost = new /datum/armor(0, 20, 20, 20, 0, 0, 50, 0, 0)

/atom/movable/screen/alert/status_effect/breaching_and_cleaving
	name = "Breaching and Cleaving!"
	desc = "<span class='danger'>Doors, people, machines... nothing will stand before your martial prowess!</span>"
	icon_state = "breachcleaver"
	icon = 'modular_dripstation/icons/mob/alerts.dmi'

/datum/status_effect/breaching_and_cleaving/on_apply()
	. = ..()
	if(!. || !ishuman(owner))
		return
	var/mob/living/carbon/human/H = owner
	H.physiology.armor = H.physiology.armor.attachArmor(cleaving_armor_boost)
	H.physiology.stamina_mod *= 0.8

/datum/status_effect/breaching_and_cleaving/on_remove()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		H.physiology.armor = H.physiology.armor.detachArmor(cleaving_armor_boost)
		H.physiology.stamina_mod /= 0.8
	QDEL_NULL(cleaving_armor_boost)
