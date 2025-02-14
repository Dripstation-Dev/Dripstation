/obj/item/gun/ballistic/automatic
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT, SELECT_FULLY_AUTOMATIC)
	available_attachments = list(
		/obj/item/attachment/scope/simple,
		/obj/item/attachment/scope/holo,
		/obj/item/attachment/scope/infrared,
		/obj/item/attachment/scope/sniper,
		/obj/item/attachment/scope/sniper/nvg,
		/obj/item/attachment/laser_sight,
		/obj/item/attachment/grip/vertical,
		/obj/item/attachment/grip/angled,
		/obj/item/attachment/grip/magnetic_harness,
		/obj/item/attachment/trigger/iff_module
	)

/obj/item/gun/ballistic/automatic/update_overlays()
	. = ..()
	if(!selector_switch_icon)
		return
	switch(fire_select)
		if(SELECT_SEMI_AUTOMATIC)
			. += "[initial(icon_state)]_semi"
		if(SELECT_BURST_SHOT)
			. += "[initial(icon_state)]_burst"
		if(SELECT_FULLY_AUTOMATIC)
			. += "[initial(icon_state)]_automatic"

/obj/item/gun/ballistic/minigun
	burst_size = 1
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_FULLY_AUTOMATIC)
	auto_fire_delay = 0.07 SECONDS

/obj/item/gun/ballistic/minigunosprey
	burst_size = 1
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_FULLY_AUTOMATIC)
	auto_fire_delay = 0.07 SECONDS

/obj/item/gun/ballistic/automatic/proto
	desc = "A fullauto 9mm submachine gun, designated 'SABR'. Has a threaded barrel for suppressors."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	item_state = "saber"
	burst_size = 1
	selector_switch_icon = TRUE
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/ballistic/automatic/c20r
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	spread = 5
	semi_auto_spread = 3
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT)
	selector_switch_icon = TRUE

/obj/item/gun/ballistic/automatic/c20r/cobra
	name = "\improper 'Cobra' 18"
	desc = "An older model of SMG manufactured by Scarborough Arms, a predecessor to the military C-20 series. Chambered in .45."
	can_bayonet = FALSE
	can_suppress = TRUE
	selector_switch_icon = FALSE
	icon_state = "c18_cobra"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'

/obj/item/gun/ballistic/automatic/c20r/cobra/ultrasecure
	pin = /obj/item/firing_pin/fucked

/obj/item/gun/ballistic/automatic/c20r/waffle
	name = "\improper WA-20"
	desc = "A brand new SMG manufactured by Waffle Arms. Chambered in .45."
	can_bayonet = FALSE
	empty_indicator = FALSE
	can_suppress = TRUE
	selector_switch_icon = FALSE
	spread = 4
	semi_auto_spread = 4
	fire_delay = 2
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT, SELECT_FULLY_AUTOMATIC)
	auto_fire_delay = 0.2 SECONDS
	icon_state = "waffle_smg"
	pin = /obj/item/firing_pin/fucked

/obj/item/gun/ballistic/automatic/c20r/waffle/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/c20r/vector
	name = "\improper UNN PDW-45V 'Vector'"
	desc = "A brand new SMG manufactured by UNN nicknamed Vector. Chambered in .45."
	can_bayonet = FALSE
	empty_indicator = TRUE
	can_suppress = FALSE
	selector_switch_icon = FALSE
	icon_state = "unn_vector"
	item_state = "v45"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	spread = 10
	fire_delay = 1
	pin = /obj/item/firing_pin/dna/secure
	burst_size = 3
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT, SELECT_FULLY_AUTOMATIC)
	auto_fire_delay = 0.07 SECONDS

/obj/item/gun/ballistic/automatic/c20r/aegis
	name = "\improper NB-20A 'Aegis'"
	desc = "An SMG manufactured for Nanotrasen`s Special Operations Department. Chambered in .45."
	can_bayonet = FALSE
	can_suppress = FALSE
	mag_display_ammo = FALSE
	selector_switch_icon = FALSE
	icon_state = "nt_aegis"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/ballistic/automatic/wt550
	name = "\improper WT-550 security auto carbine"
	desc = "An outdated personal defence weapon manufactured by Ward-Takahashi Arms Group. Uses 4.6x30mm rounds. Has a two-round burst, auto or a semi-automatic firing mode."
	item_state = "wt550"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	auto_fire_delay = 0.2 SECONDS

/obj/item/gun/ballistic/automatic/wt550/armory
	icon_state = "wt550_secure"
	item_state = "wt550_secure"
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/ballistic/automatic/wt550/combat
	icon_state = "wt550_secure"
	item_state = "wt550_secure"
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	starting_mag_type = /obj/item/ammo_box/magazine/wt550m9/wt_airburst
	initial_attachments = list(/obj/item/attachment/grip/angled, /obj/item/attachment/scope/holo, /obj/item/attachment/trigger/iff_module)

/obj/item/gun/ballistic/automatic/sa450
	name = "\improper Shellguard security auto carbine"
	desc = "A personal defence weapon that uses 4.6x30mm rounds, designated the SA-450 Automatic Carbine. Has a full auto and semi-automatic firing mode."
	icon_state = "shelg_smg"
	item_state = "shelg_smg"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	mag_type = /obj/item/ammo_box/magazine/sa450
	recoil = 0.5
	spread = 10
	semi_auto_spread = 4
	burst_size = 3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	can_suppress = TRUE
	can_bayonet = TRUE
	knife_x_offset = 25
	knife_y_offset = 12
	mag_display = TRUE
	auto_fire_delay = 0.15 SECONDS

/obj/item/gun/ballistic/automatic/mini_uzi
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	burst_size = 1
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_FULLY_AUTOMATIC)

/obj/item/gun/ballistic/automatic/tommygun
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	burst_size = 1
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_FULLY_AUTOMATIC)

/obj/item/gun/ballistic/automatic/m90
	name = "\improper Militech M-90gl"
	desc = "A three-round burst 5.56 toploading rifle, designated 'M-90gl'. Has an attached underbarrel grenade launcher which can be toggled on and off."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/smg_heavy.ogg'
	suppressed_sound = 'sound/weapons/gunshot_smg.ogg'
	mag_display = TRUE
	mag_display_ammo = TRUE
	selector_switch_icon = TRUE
	select = 0
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT)

/obj/item/gun/ballistic/automatic/m90/examine(mob/user)
	. = ..()
	. += span_info("Click AltCkick to toggle grenade launcher.")

/obj/item/gun/ballistic/automatic/m90/afterattack(atom/target, mob/living/user, flag, params)
	if(select == 1)
		underbarrel.afterattack(target, user, flag, params)
	else
		return ..()

/obj/item/gun/ballistic/automatic/m90/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_casing))
		if(istype(A, underbarrel.magazine.ammo_type))
			underbarrel.attack_self()
			underbarrel.attackby(A, user, params)
	else
		..()

/obj/item/gun/ballistic/automatic/m90/update_overlays()
	. = ..()
	if(select == 1)
		. += "[initial(icon_state)]_gren"

/obj/item/gun/ballistic/automatic/m90/AltClick()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(1)
			select = 0
			to_chat(user, span_notice("You switch to main caliber."))
		if(0)
			select = 1
			to_chat(user, span_notice("You switch to underbarrel grenade launcher."))
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_appearance(UPDATE_ICON)
	return

/obj/item/gun/ballistic/automatic/m90/m31a1
	name = "\improper Militech M-31a1 Advanced Infantry Combat Weapon"
	desc = "A three-round burst 5.56 toploading rifle, designated 'M-31a1', is more expensive in manufacturing predecessor of 'M-90gl'. It has an attached underbarrel grenade launcher which can be toggled on and off."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "m31a1"
	empty_indicator = FALSE
	can_suppress = TRUE
	selector_switch_icon = TRUE
	pin = /obj/item/firing_pin/dna/secure
	initial_attachments = list(/obj/item/attachment/trigger/iff_module)

/obj/item/gun/ballistic/automatic/m90/m31a1/Initialize(mapload)
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/dna(src)
	update_appearance(UPDATE_ICON)

/obj/item/gun/ballistic/automatic/m90/m31a1/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/m90/m31a1/unrestricted/Initialize(mapload)
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/unrestricted(src)
	update_appearance(UPDATE_ICON)

/obj/item/gun/ballistic/automatic/p90
	name = "\improper P-90 Personal Defense Weapon"
	desc = "A three-round burst 5.56 toploading rifle, designated 'P-90PDW'."
	icon_state = "p90"
	item_state = "m90"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	mag_type = /obj/item/ammo_box/magazine/m556
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/smg_heavy.ogg'
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	auto_fire_delay = 0.2 SECONDS
	pin = /obj/item/firing_pin
	mag_display = TRUE
	empty_indicator = TRUE

/obj/item/gun/ballistic/automatic/ar
	name = "\improper NT ARG-63"
	desc = "Nanotrasen's prime ballistic option based on the Ward-Takahashi design, fitted with a light polymer frame and other tactical furniture, and chambered in 5.56 - nicknamed 'Boarder' by Nanotrasen Special Operations teams."
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	mag_display = TRUE
	can_suppress = TRUE
	slot_flags = ITEM_SLOT_BACK
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/autorifle-1.ogg'
	item_state = "arifle"
	recoil = 0.4
	spread = 10
	fire_sound_volume = 80
	vary_fire_sound = 0
	burst_size = 3

/obj/item/gun/ballistic/automatic/ar/mk4
	name = "\improper Militech M-K4 Infantry Assault Rifle"
	desc = "A robust assault rifle used by Militech fighting forces."
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/autorifle-2.ogg'
	icon_state = "militech_mkIV"
	item_state = "militech_mkIV"
	pin = /obj/item/firing_pin/dna/secure
	spread = 5
	semi_auto_spread = 2

/obj/item/gun/ballistic/automatic/ar/mk4/grn
	name = "\improper Militech M-K4 Infantry Assault Rifle"
	desc = "A robust assault rifle used by Militech fighting forces."
	icon_state = "militech_mkIV_grn"
	item_state = "militech_mkIV_grn"

/obj/item/gun/ballistic/automatic/ar/tgm16
	name = "\improper TGM-16 Infantry Assault Rifle"
	desc = "A robust assault rifle used by Terra Gov Marine Corps."
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/autorifle-3.ogg'
	icon_state = "tgm16"
	pin = /obj/item/firing_pin
	spread = 8
	semi_auto_spread = 3

/obj/item/gun/ballistic/automatic/ar/waffle
	name = "\improper WA-5 Infantry Assault Rifle"
	desc = "A robust assault rifle used by mercinaries and Waffle Special Operations Division."
	icon_state = "waffle_assault"
	pin = /obj/item/firing_pin/fucked
	spread = 5
	semi_auto_spread = 2

/obj/item/gun/ballistic/automatic/ar/waffle/unrestricted
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/ar/ak814
	name = "\improper AK-814 Infantry Assault Rifle"
	desc = "A modern bullpup version of AK assault system favored by elite Soviet soldiers. Chambered in 5.45x39mm."
	icon_state = "ak814"
	item_state = "ak814"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	mag_type = /obj/item/ammo_box/magazine/r545
	starting_mag_type = /obj/item/ammo_box/magazine/r545
	recoil = 0.8
	spread = 12
	semi_auto_spread = 4
	burst_size = 1
	can_suppress = FALSE
	w_class = WEIGHT_CLASS_NORMAL
	auto_fire_delay = 0.1 SECONDS

/obj/item/gun/ballistic/automatic/ar/ak47
	name = "\improper AK-47 Assault Rifle"
	desc = "An old assault rifle, dating back to 20th century. It is commonly used by various bandits, pirates and colonists thanks to its reliability and ease of maintenance. Chambered in 7.62x39mm."
	icon_state = "ak47"
	item_state = "ak47"
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/ak47.ogg'
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_rack.ogg'
	mag_type = /obj/item/ammo_box/magazine/r762x39
	starting_mag_type = /obj/item/ammo_box/magazine/r762x39
	recoil = 1.5
	spread = 25
	burst_size = 1
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/ar/akm
	name = "\improper AKM Assault Rifle"
	desc = "An obsolete assault rifle seized from some frontier armory. Chambered in 7.62x39mm."
	icon_state = "akm"
	item_state = "akm"
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/ak47.ogg'
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_rack.ogg'
	mag_type = /obj/item/ammo_box/magazine/r762x39
	starting_mag_type = /obj/item/ammo_box/magazine/r762x39
	recoil = 1.2
	spread = 20
	burst_size = 1
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/ar/akm_tactical
	name = "\improper TMCAR-47M Tactical Assault Rifle"
	desc = "An obsolete assault rifle seized from some frontier armory and extensively modified to TMC standards. Chambered in 7.62x39mm."
	icon_state = "akm_tactical"
	item_state = "ak101"
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/ak47.ogg'
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_rack.ogg'
	recoil = 0.8
	spread = 15
	burst_size = 1
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/ar/ak101
	name = "\improper AK-101 Assault Rifle"
	desc = "More modern version of the cheap assault rifle chambered in 5.56mm. Comes with a foldable stock for easy storage, although accuracy is questionable when folded. Control click to toggle the stock."
	icon_state = "ak101"
	item_state = "ak101"
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/ak47.ogg'
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/ak47_rack.ogg'
	mag_type = /obj/item/ammo_box/magazine/r556
	starting_mag_type = /obj/item/ammo_box/magazine/r556
	spread = 10
	semi_auto_spread = 2
	recoil = 1.2
	burst_size = 1
	var/folded = FALSE
	var/unfolded_spread = 15
	var/unfolded_item_state = "ak101"
	var/folded_spread = 35
	var/folded_item_state = "ak101_stockless"
	can_suppress = FALSE
	auto_fire_delay = 0.2 SECONDS

/obj/item/gun/ballistic/automatic/ar/ak101/CtrlClick(mob/user)
	. = ..()
	if((!ishuman(user) || user.stat))
		return
	to_chat(user, "<span class='notice'>You start to [folded ? "unfold" : "fold"] the stock on the [src].</span>")
	if(do_after(user, 10, target = src))
		fold(user)
		user.update_inv_back()
		user.update_inv_hands()
		user.update_inv_s_store()

/obj/item/gun/ballistic/automatic/ar/ak101/proc/fold(mob/user)
	if(folded)
		to_chat(user, "<span class='notice'>You unfold the stock on the [src].</span>")
		spread = unfolded_spread
		item_state = unfolded_item_state
		w_class = WEIGHT_CLASS_BULKY
	else
		to_chat(user, "<span class='notice'>You fold the stock on the [src].</span>")
		spread = folded_spread
		item_state = folded_item_state
		w_class = WEIGHT_CLASS_NORMAL

	folded = !folded
	playsound(src.loc, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()

/obj/item/gun/ballistic/automatic/ar/ak101/update_overlays()
	. = ..()
	var/mutable_appearance/stock
	if(!folded)
		stock = mutable_appearance(icon, "ak101_stock")
	else
		stock = mutable_appearance(icon, null)
	. += stock

//STM-9
/obj/item/gun/ballistic/automatic/stm9
	name = "\improper Souze TM-9 Gen.3"
	desc = "STM 9x19mm sport pistol-carbine supplied by some unknown union to Terra Gov. Speed, accuracy and comfort recoil."
	icon_state = "stm9"
	item_state = "lwt650"
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	fire_delay = 0		//800 shots per minute, hello there
	burst_size = 1
	spread = 3				//need simple scope
	semi_auto_spread = 0
	recoil = 0.5
	pin = /obj/item/firing_pin
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	mag_display = TRUE
	can_suppress = TRUE
	can_unsuppress = TRUE
	vary_fire_sound = FALSE
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	load_sound = "sound/weapons/rifleload.ogg"
	load_empty_sound = "sound/weapons/rifleload.ogg"
	rack_sound = "sound/weapons/riflerack.ogg"
	eject_sound = "sound/weapons/rifleunload.ogg"
	eject_empty_sound = "sound/weapons/rifleunload.ogg"
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)

/obj/item/gun/ballistic/automatic/k41s
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	worn_icon = 'modular_dripstation/icons/mob/clothing/guns_on_back.dmi'
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)

/obj/item/gun/ballistic/automatic/k41s/dna
	pin = /obj/item/firing_pin/dna/secure

/obj/item/gun/ballistic/automatic/lwt650
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)

/obj/item/gun/ballistic/automatic/svd
	name = "\improper SR-33 Dragunov sniper rifle"
	desc = "A semiautomatic sniper rifle, famed for it's marksmanship, and is built from the ground up for it. Fires 7.62x54mmR rounds."
	icon_state = "svd"
	item_state = "sniper"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/svd.ogg'
	dry_fire_sound = 'modular_dripstation/sound/weapons/tgmc/sniper_empty.ogg'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/svd_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/svd_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/svd_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/svd_rack.ogg'
	fire_delay = 6
	burst_size = 1
	spread = 2
	mag_type = /obj/item/ammo_box/magazine/svd
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	recoil = 1
	available_attachments = list(
		/obj/item/attachment/scope/sniper_slav,
	)


/obj/item/gun/ballistic/automatic/pistol
	name = "WSP-10M"
	desc = "A small, easily concealable 10mm modern handgun. Has a threaded barrel for suppressors. Often named 'Stechkin', but nobody knows why."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	item_state = "pistol"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)
	available_attachments = list(
		/obj/item/attachment/scope/simple,
		/obj/item/attachment/scope/holo,
		/obj/item/attachment/scope/infrared,
		/obj/item/attachment/laser_sight,
		/obj/item/attachment/grip/vertical,
		/obj/item/attachment/grip/angled,
		/obj/item/attachment/grip/magnetic_harness,
		/obj/item/attachment/trigger/iff_module
	)

/obj/item/gun/ballistic/automatic/pistol/stickman
	icon = 'icons/obj/guns/projectile.dmi'


/obj/item/gun/ballistic/automatic/pistol/glock17
	name = "\improper Glock-17"
	desc = "A weapon from bygone times, this has been made to look like an old, blocky firearm from the 21st century. Chambered in 9x19mm."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "glock"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	can_suppress = FALSE
	fire_sound = 'modular_dripstation/sound/weapons/pistol/shot_alt.ogg'
	fire_delay = 1

/obj/item/gun/ballistic/automatic/pistol/glock17/ancile
	name = "\improper NB-2 'Ancile'"
	desc = "Nanotrasen easily concealable servise pistol. Chambered in 9x19mm."
	icon_state = "nt_ancile"
	item_state = "nt_ancile"
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/beretta.ogg'
	dry_fire_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_empty.ogg'
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_rack.ogg'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	can_suppress = FALSE
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	pin = /obj/item/firing_pin/implant/centcom_mindshield

/obj/item/gun/ballistic/automatic/pistol/glock18
	name = "\improper Glock-18"
	desc = "Terra Gov burst firing cheap polymer pistol chambered in 9x19mm. Its heavy duty barrel affects firerate."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "glock18"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm/pmag
	can_suppress = FALSE
	fire_sound = 'modular_dripstation/sound/weapons/pistol/shot_alt.ogg'
	burst_size = 3
	fire_delay = 2

/obj/item/gun/ballistic/automatic/pistol/glock18/shelg
	name = "\improper SAP-7 'Lawyer'"
	desc = "Burst firing cheap pocket polymer pistol chambered in 9x19mm manufactured by Shellguard Arms branch. Nicknamed 'Lawyer' by Shellguard security officers."
	icon_state = "shelg_lawyer"
	item_state = "shelg_lawyer"
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/beretta.ogg'
	dry_fire_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_empty.ogg'
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/beretta_rack.ogg'
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 1
	starting_mag_type = /obj/item/ammo_box/magazine/pistolm9mm

/obj/item/gun/ballistic/automatic/pistol/fn45
	name = "\improper FNX-45 Tactical"
	desc = "Tactical modern Terra Gov service pistol. Better, faster, stronger than other service pistols. \
	Do not as iconic as M1911, but reliable and modern. Chambered in .45 caliber. Has a threaded barrel for suppressors."
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	icon_state = "fnx"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	item_state = "colt"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	fire_sound = 'modular_dripstation/sound/weapons/tgmc/colt.ogg'
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/colt_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/colt_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/colt_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/colt_rack.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/fn45
	starting_mag_type = /obj/item/ammo_box/magazine/fn45
	spread = 3
	can_suppress = TRUE
	can_unsuppress = TRUE
	feedback_types = list(
		"fire" = 3
	)

/obj/item/gun/ballistic/automatic/pistol/m1911
	eject_sound = 'modular_dripstation/sound/weapons/tgmc/colt_unload.ogg'
	eject_empty_sound = 'modular_dripstation/sound/weapons/tgmc/colt_unload.ogg'
	load_sound = 'modular_dripstation/sound/weapons/tgmc/colt_reload.ogg'
	rack_sound = 'modular_dripstation/sound/weapons/tgmc/colt_rack.ogg'
	item_state = "colt"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/pistol/m1911/alt
	name = "\improper M1911M"
	desc = "A modern variant of classic .45 handgun with a small magazine capacity."
	icon_state = "m1911b"

/obj/item/gun/ballistic/automatic/pistol/m1911/signature
	name = "\improper M1911 Signature"
	desc = "A rare variant of classic .45 handgun with a small magazine capacity."
	icon_state = "ma_signature1911"

/obj/item/gun/ballistic/automatic/pistol/ntusp
	icon = 'icons/obj/guns/projectile.dmi'


// L6 SAW //

/obj/item/gun/ballistic/automatic/l6_saw
	desc = "A modified 5.56x45mm light machine gun, designated 'L6 SAW'. Has 'Militech Armoury - 2503' engraved on the receiver below the designation."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	item_state = "l6"
	mag_type = /obj/item/ammo_box/magazine/mm556x45_100
	burst_size = 1
	actions_types = list()
	auto_fire_delay = 0.1 SECONDS

/obj/item/gun/ballistic/automatic/l6_saw/update_icon()
	. = ..()
	item_state = "[initial(item_state)][cover_open ? "open" : "closed"][magazine ? "mag" : "nomag"]"
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()

/obj/item/gun/ballistic/automatic/l6_saw/dna
	pin = /obj/item/firing_pin/dna/secure

/obj/item/gun/ballistic/automatic/l6_saw/m60
	name = "\improper L4 GPMG"
	desc = "A general purpose 7.62 machine gun, designated 'L4 GPMG'. Heavyly modified for single combatant usage."
	icon_state = "m60"
	item_state = "m60"
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/guns_righthand.dmi'
	mag_type = /obj/item/ammo_box/magazine/mm712x82
	auto_fire_delay = 0.25 SECONDS

/obj/item/gun/ballistic/automatic/l6_saw/m60/unrestricted
	pin = /obj/item/firing_pin

///Borg L6
/obj/item/gun/energy/printer
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'

///Laser rifle
/obj/item/gun/ballistic/automatic/laser
	name = "\improper energy carbine"

/obj/item/gun/ballistic/automatic/laser/tgmc
	name = "\improper TGM 43"
	desc = "Assault energy carabine, designated 'TGM 43'. This energy rifle is commonly found in the hands of Terra Gov Marines."
	icon = 'modular_dripstation/icons/obj/weapons/48x32.dmi'
	icon_state = "tgm43"
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE


//paintballs
/obj/item/gun/ballistic/automatic/toy/paintball
	name = "red paintball gun"
	desc = "An entry level paintball gun. This one comes in red."
	icon_state = "paintball"
	icon = 'modular_dripstation/icons/obj/weapons/ballistic.dmi'
	mag_type = /obj/item/ammo_box/magazine/toy/paintball
	mag_display = TRUE
	fire_sound = 'modular_dripstation/sound/weapons/paintball.ogg'
	burst_size = 2
	clumsy_check = FALSE

/obj/item/gun/ballistic/automatic/toy/paintball/blue
	name = "blue paintball gun"
	icon_state = "paintball-blue"
	desc = "An entry level paintball gun. This one comes in blue."
	mag_type = /obj/item/ammo_box/magazine/toy/paintball/blue

/obj/item/gun/ballistic/automatic/pistol/pepperball
	name = "\improper Bolt Pepperball AHG"
	desc = "An incredibly mediocre 'firearm' designed to fire soft pepper balls meant to easily subdue targets."
	icon_state = "peppergun"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/pepperball
	can_suppress = FALSE
	fire_sound = 'modular_dripstation/sound/weapons/paintball.ogg'
	//rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	//lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	//bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
	fire_sound_volume = 50
