#define ARMORID "armor-[melee]-[bullet]-[laser]-[energy]-[bomb]-[bio]-[rad]-[fire]-[acid]-[magic]-[wound]-[electric]"
/datum/status_effect/breaching_and_cleaving
	id = "breaching_and_cleaving"
	duration = -1
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/breaching_and_cleaving
	var/datum/armor/armor_boost = new /datum/armor/cleaving_armor_boost

/datum/armor/cleaving_armor_boost
	melee = 10
	bullet = 30
	laser = 20
	energy = 20
	bomb = 50

/datum/armor/cleaving_armor_boost/New()
	tag = ARMORID
	GenerateTag()

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
	armor_boost = new /datum/armor/fixersorrow

/datum/status_effect/breaching_and_cleaving/fixersorrow/on_apply()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		RegisterSignals(H, COMSIG_LIVING_STATUS_STUN, PROC_REF(on_stun), override = TRUE)
	return ..()

/datum/status_effect/breaching_and_cleaving/fixersorrow/on_remove()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		UnregisterSignal(H, COMSIG_LIVING_STATUS_STUN)
	return ..()

/datum/status_effect/breaching_and_cleaving/fixersorrow/proc/on_stun(amount, updating, ignore_canstun)
	if(!ignore_canstun)
		owner.AdjustKnockdown(min(amount/2, 4 SECONDS), updating, ignore_canstun)
		owner.adjust_staggered_up_to(amount, 20 SECONDS)
		return COMPONENT_NO_STUN

/datum/armor/fixersorrow
	melee = 20
	bullet = 30
	energy = 20
	bomb = 50

/datum/armor/fixersorrow/New()
	tag = ARMORID
	GenerateTag()

/atom/movable/screen/alert/status_effect/fixersorrow
	name = "That`s that, and this is this"
	desc = "<span class='notice'>I`m just an ordinary fixer who`s hit rock bottom.</span>"
	icon_state = "sorrow"
	icon = 'modular_dripstation/icons/mob/alerts.dmi'

#undef ARMORID