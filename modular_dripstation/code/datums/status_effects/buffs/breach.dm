/datum/status_effect/breaching_and_cleaving
	id = "breaching_and_cleaving"
	duration = -1
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/breaching_and_cleaving
	var/datum/armor/armor_boost = /datum/armor/cleaving_armor_boost

/datum/armor/cleaving_armor_boost
	melee = 0
	bullet = 20
	laser = 20
	energy = 20
	bomb = 50

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
	armor_boost = new
	H.physiology.armor = H.physiology.armor.attachArmor(armor_boost)
	H.physiology.stamina_mod *= 0.8

/datum/status_effect/breaching_and_cleaving/on_remove()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		H.physiology.armor = H.physiology.armor.detachArmor(armor_boost)
		H.physiology.stamina_mod /= 0.8
	QDEL_NULL(armor_boost)

/datum/status_effect/breaching_and_cleaving/fixersorrow
	alert_type = /atom/movable/screen/alert/status_effect/fixersorrow
	armor_boost = /datum/armor/fixersorrow

/datum/armor/fixersorrow
	melee = 20
	bullet = 20
	energy = 20
	bomb = 50

/atom/movable/screen/alert/status_effect/fixersorrow
	name = "That`s that, and this is this"
	desc = "<span class='notice'>I`m just an ordinary fixer who`s hit rock bottom.</span>"
	icon_state = "sorrow"
	icon = 'modular_dripstation/icons/mob/alerts.dmi'
