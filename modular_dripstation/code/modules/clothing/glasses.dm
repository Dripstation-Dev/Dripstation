/obj/item/clothing/glasses/meson
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/meson/gar
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes/eyes.dmi'
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/meson/sunglasses
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/meson/sunglasses/ce
	name = "advanced engineering aviators"
	desc = "A meson scanner built into a pair of aviators."
	icon_state = "aviator_meson"
	flash_protect = 1
	hud_type = null

/obj/item/clothing/glasses/science
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/sunglasses/chemical
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/sunglasses/chemical/aviator
	name = "chemical aviators"
	desc = "Science aviators."
	icon_state = "aviator_sci"
	custom_premium_price = 200

/obj/item/clothing/glasses/night
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	actions_types = list(/datum/action/item_action/toggle)
	visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_NIGHTVISION | VISOR_VISIONFLAGS
	var/hud_type = null

/obj/item/clothing/glasses/night/equipped(mob/living/carbon/human/user, slot)
	..()
	if(slot == ITEM_SLOT_EYES && hud_type && !up)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.show_to(user)

/obj/item/clothing/glasses/night/dropped(mob/living/carbon/human/user)
	. = ..()
	if(istype(user) && user.glasses == src && hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.hide_from(user)

/obj/item/clothing/glasses/night/visor_toggling()
	..()
	var/mob/living/carbon/human/user = usr	//shitcode
	if(!up)
		icon_state = "[icon_state]-off"
		item_state = "[item_state]-off"
		if(user.get_item_by_slot(ITEM_SLOT_EYES) == src && hud_type)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.hide_from(user)
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)
		if(user.get_item_by_slot(ITEM_SLOT_EYES) == src && hud_type)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.show_to(user)

/obj/item/clothing/glasses/night/emp_act(severity)
	if(. & EMP_PROTECT_SELF)
		return
	if(!up)
		visor_toggling()
		..()
	else
		return

/obj/item/clothing/glasses/night/security
	icon_state = "tact-securityhudnight"
	hud_type = DATA_HUD_SECURITY_ADVANCED

/obj/item/clothing/glasses/night/health
	icon_state = "tact-healthhudnight"
	hud_type = DATA_HUD_MEDICAL_ADVANCED

/obj/item/clothing/glasses/night/diagnostic
	icon_state = "tact-diagnostichudnight"
	hud_type = DATA_HUD_DIAGNOSTIC_ADVANCED

/obj/item/clothing/glasses/night/unn
	icon_state = "unn-nvg-blc"

/obj/item/clothing/glasses/material
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/material/mining/gar
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes/eyes.dmi'
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/sunglasses/reagent
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	icon_state = "sunhudbeer"

/obj/item/clothing/glasses/thermal
	icon_state = "thermal"
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/thermal/tactical
	name = "tactical thermal goggles"
	desc = "A pair of thermal goggles manufactured by the Cybersun Virtual Solutions."
	icon_state = "tact-thermal_nvg"
	actions_types = list(/datum/action/item_action/toggle)
	visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_NIGHTVISION | VISOR_VISIONFLAGS

/obj/item/clothing/glasses/thermal/tactical/visor_toggling()
	..()
	icon_state = "night-off"

/obj/item/clothing/glasses/thermal/tactical/emp_act(severity)
	if(. & EMP_PROTECT_SELF)
		return
	if(!up)
		visor_toggling()
		..()
	else
		return

/obj/item/clothing/glasses/thermal/xray
	name = "tactical xray goggles"
	desc = "A pair of xray goggles manufactured by the Cybersun Virtual Solutions."
	icon_state = "tact-xray_nvg"
	actions_types = list(/datum/action/item_action/toggle)
	visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_NIGHTVISION | VISOR_VISIONFLAGS

/obj/item/clothing/glasses/thermal/xray/visor_toggling()
	..()
	icon_state = "night-off"

/obj/item/clothing/glasses/thermal/xray/emp_act(severity)
	if(. & EMP_PROTECT_SELF)
		return
	if(!up)
		visor_toggling()
		..()
	else
		return

/obj/item/clothing/glasses/thermal/monocle
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/thermal/eyepatch
	icon_state = "thermalpatch_combat"
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/sunglasses/night
	name = "tactical sunglasses"
	icon_state = "sunhudnight"
	color_cutoffs = list(10, 30, 10)
	glass_colour_type = /datum/client_colour/glass_colour/green

/obj/item/clothing/glasses/sunglasses/night/aviator
	name = "tactical aviators"
	icon_state = "aviator_nv"

/obj/item/clothing/glasses/sunglasses/thermal
	name = "tactical sunglasses"
	icon_state = "sunthermal"
	vision_flags = SEE_MOBS
	// Going for an orange color here
	color_cutoffs = list(25, 8, 5)
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/glasses/sunglasses/thermal/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	thermal_overload()

/obj/item/clothing/glasses/sunglasses/thermal/aviator
	name = "tactical aviators"
	icon_state = "aviator_thermal"

/obj/item/clothing/glasses/welding
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'

/obj/item/clothing/glasses/regular
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/orange
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/red
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/ballistic
	name = "ballistic glasses"
	desc = "Basic tight-fitting goggles that protect vision organs from splinters and dust."
	icon_state = "ballistic"
	flags_cover = GLASSESCOVERSEYES
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/////HUDs///////
/obj/item/clothing/glasses/sunglasses
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/sunglasses/aviators
	name = "aviators"
	desc = "Protect your vision with stile!"
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/health
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/health/night/cultblind
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/regular
	name = "prescription glasses"
	desc = "Corrects your vision!"
	icon_state = "glasses"
	item_state = "glasses"
	vision_correction = 1 //corrects nearsightedness

/obj/item/clothing/glasses/hud/health/prescription
	name = "prescription medicalHUD glasses"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status. Also corrects your vision."
	icon_state = "healthhudpresc"
	item_state = "glasses"
	vision_correction = 1 //corrects nearsightedness

/obj/item/clothing/glasses/hud/health/military
	name = "military health HUDs"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status. This ones are military grade."
	icon_state = "medhud_military"
	hud_type = DATA_HUD_MEDICAL_ADVANCED

/obj/item/clothing/glasses/hud/health/idris
	name = "Idris Brand health HUDs"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status. Idris brand."
	icon_state = "healthhud_idris"

/obj/item/clothing/glasses/hud/health/zeng
	name = "Zeng-Hu Brand health HUDs"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status. Zeng-Hu brand."
	icon_state = "healthhud_zeng"

/obj/item/clothing/glasses/hud/health/nt
	name = "Nanotrasen Brand health HUDs"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status. Nanotrasen brand."
	icon_state = "healthhud_nt"

/obj/item/clothing/glasses/hud/health/sunglasses/cmo
	name = "medical advanced HUDaviators"
	desc = "Aviators with a medical HUD. This one is augmented with a reagent scanner."
	icon_state = "aviator_cmo"
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	clothing_flags = null	//comment this if you want to enable scanreagents for cmo

/obj/item/clothing/glasses/hud/health/sunglasses/aviators
	name = "medical HUDaviators"
	desc = "Aviators with a medical HUD."
	icon_state = "aviator_med"
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/diagnostic
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/diagnostic/military
	name = "military diagnostic HUDs"
	desc = "A heads-up display capable of analyzing the integrity and status of robotics and exosuits. This ones are military grade."
	icon_state = "diagnostichud_military"
	hud_type = DATA_HUD_DIAGNOSTIC_ADVANCED

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/rd
	name = "diagnostic advanced HUDaviators"
	desc = "Aviators with a diagnostic HUD." //This one is augmented with a reagent scanner."
	icon_state = "aviator_rd"
	clothing_flags = null	//comment this if you want to enable scanreagents for rd

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/aviators
	name = "diagnostic HUDaviators"
	desc = "Aviators with a diagnostic HUD."
	icon_state = "aviator_diagnostic"
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/permit
	name = "weapon permit HUDs"
	desc = "A heads-up display capable of checking weapon permit status."
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	icon_state = "permithud"
	flags_cover = null //GLASSESCOVERSEYES
	hud_type = DATA_HUD_PERMIT

/obj/item/clothing/glasses/hud/permit/sunglasses
	name = "weapon permit HUDsunglasses"
	desc = "Sunglasses with a weapon permit HUD."
	icon_state = "sunhudpermit"
	flash_protect = 1
	tint = 1
	glass_colour_type = /datum/client_colour/glass_colour/darkred

/obj/item/clothing/glasses/hud/permit/sunglasses/aviators
	name = "weapon permit HUDaviators"
	desc = "Aviators with a weapon permit HUD."
	icon_state = "aviator_permit"
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/security
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/security/military
	name = "military security HUDs"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status and security records. This ones are military grade."
	icon_state = "securityhud_military"

/obj/item/clothing/glasses/hud/security/ballistic
	name = "ballistic security glasses"
	desc = "Basic tight-fitting goggles that protect vision organs from splinters and dust. Security hud integrated."
	icon_state = "securityballistic"
	flags_cover = GLASSESCOVERSEYES
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/hud/security/ballistic/attack_self(mob/user)
	visor_toggling()
/obj/item/clothing/glasses/hud/security/ballistic/visor_toggling()
	..()
	if(up)
		alternate_worn_layer = ABOVE_HEAD_LAYER
		flags_cover = null
	else
		alternate_worn_layer = initial(alternate_worn_layer)
		flags_cover = initial(flags_cover)
	if(usr.get_item_by_slot(ITEM_SLOT_EYES) == src)
		usr.update_inv_glasses()
	for(var/X in actions)
		var/datum/action/A = X
		A.build_all_button_icons()


/obj/item/clothing/glasses/hud/security/ballistic/up/Initialize(mapload)
	. = ..()
	visor_toggling()


/obj/item/clothing/glasses/night/equipped(mob/living/carbon/human/user, slot)
	..()
	if(user.glasses == src && hud_type)
		if(!up)
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.show_to(user)
		else
			var/datum/atom_hud/H = GLOB.huds[hud_type]
			H.hide_from(user)


/obj/item/clothing/glasses/hud/security/pmc_ballistic
	name = "ballistic pmc glasses"
	desc = "Tight-fitting goggles that protect vision organs from flashes, splinters and dust. Basic security hud integrated."
	icon_state = "ballistic_pmc"
	flags_cover = GLASSESCOVERSEYES
	flash_protect = 1
	hud_type = DATA_HUD_SECURITY_BASIC

/obj/item/clothing/glasses/hud/security/militech_ballistic
	name = "ballistic militech visor"
	desc = "Advanced tight-fitting visor that protect vision organs from flashes, splinters and dust. Security and health hud integrated."
	icon_state = "ballistic_militech"
	flash_protect = 2
	tint = 1
	flags_cover = GLASSESCOVERSEYES
	hud_type = DATA_HUD_SECURITY_MEDICAL
	vision_flags = SEE_MOBS
	// Going for an orange color here
	color_cutoffs = list(25, 8, 5)
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/glasses/hud/security/militech_ballistic/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	thermal_overload()

/obj/item/clothing/glasses/hud/security/sunglasses/aviators
	name = "security HUDaviators"
	desc = "Aviators with a security HUD."
	icon_state = "aviator_sec"
	custom_premium_price = 200

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/hud/security/sunglasses/hos
	name = "security advanced HUDaviators"
	desc = "Aviators with a security HUD. For the station finest."
	icon_state = "aviator_sechos"
	hud_type = DATA_HUD_SECURITY_ADVANCED	//comment this if you want to enable medhud for hos

/obj/item/clothing/glasses/hud/security/sunglasses/gars
	icon = 'icons/obj/clothing/glasses.dmi'
	worn_icon = 'icons/mob/clothing/eyes/eyes.dmi'

/obj/item/clothing/glasses/hud/toggle/thermal
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'

/obj/item/clothing/glasses/hud/personnel
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	icon_state = "sunhudskill"
	flags_cover = null //GLASSESCOVERSEYES

/obj/item/clothing/glasses/hud/skill
	name = "skills HUDs"
	desc = "A heads-up display with a personnel HUD. This one is military grade."
	icon_state = "skillhud"
	icon = 'modular_dripstation/icons/obj/clothing/eyes.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/eyes.dmi'
	hud_type = DATA_HUD_SECURITY_BASIC
	flags_cover = null //GLASSESCOVERSEYES
