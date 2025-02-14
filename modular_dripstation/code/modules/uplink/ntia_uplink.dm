////////////NT Internal Affairs Agent/////////////


////////////Nanotrasen & Nonsyndicate Production/////////////
/datum/uplink_item/dangerous/mini_egun
	name = "Spec Ops Miniature E-Gun"
	desc = "Visually standart energy gun. Has three modes, overcharged combat energy projectiles and specops battery onboard."
	item = /obj/item/gun/energy/e_gun/mini/specops
	cost = 4
	surplus = 0
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/iongun
	name = "Ion pistol"
	desc = "The NT-I3 Prototype Ion Projector is a compact ion pistol, built for personal defense. \
	The serial number of this gun has been erased."
	item = /obj/item/gun/energy/ionrifle/pistol/stealth
	cost = 3
	surplus = 0
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/revolver
	name = "Mateba Revolver"
	desc = "A brutally simple retro, high-powered autorevolver that fires .44 Magnum rounds and has 6 chambers."
	item = /obj/item/gun/ballistic/revolver/mateba
	cost = 10
	surplus = 0
	illegal_tech = FALSE
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/revolverammo
	name = ".44 Speed Loader"
	desc = "A .44 speed loader. This speed loader contain six .44 rounds each; usable with the Mateba revolver."
	item = /obj/item/ammo_box/m44
	cost = 1
	surplus = 0
	illegal_tech = FALSE
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/hardlightbow
	name = "Hardlight Bow"
	desc = "A modern bow that can fabricate hardlight arrows, designed for silent takedowns of targets."
	item = /obj/item/gun/ballistic/bow/energy/ntia
	cost = 6
	surplus = 0
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/obj/item/gun/ballistic/bow/energy/ntia
	mag_type = /obj/item/ammo_box/magazine/internal/bow/energy/ntia
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 5
	pin = /obj/item/firing_pin/implant/centcom_mindshield
	fire_sound = null
	draw_sound = null
	can_fold = TRUE

/obj/item/ammo_box/magazine/internal/bow/energy/ntia
	selectable_types = list(/obj/item/ammo_casing/reusable/arrow/energy, /obj/item/ammo_casing/reusable/arrow/energy/disabler, /obj/item/ammo_casing/reusable/arrow/energy/xray)

/datum/uplink_item/dangerous/esword
	name = "Energy Sword"
	desc = "The energy sword is an edged weapon with a blade of pure energy. The sword is small enough to be \
			pocketed when inactive."
	item = /obj/item/melee/transforming/energy/sword/saber
	cost = 8
	surplus = 0
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/canesword
	name = "Cane blade"
	desc = "Stored in sheath that looks like a cane. Elegant, but not so stealth and effective. It`s capable of hurting unarmored targets badly."
	item = /obj/item/storage/belt/sabre/cane
	cost = 2
	surplus = 0
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/eknife
	name = "Energy Knife"
	desc = "A knife made of energy that looks and functions as a pen when off."
	item = /obj/item/pen/red/edagger/nt
	cost = 2
	surplus = 0
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/militechmantisblade
	name = "H.E.P.H.A.E.S.T.U.S. Mantis Blades"
	desc = "One H.E.P.H.A.E.S.T.U.S. Mantis blade implant able to be retracted inside your body at will for easy storage and concealing. Two blades can be used at once."
	item = /obj/item/autosurgeon/nt_mantis/stealth
	cost = 5
	surplus = 0
	illegal_tech = FALSE
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/obj/item/autosurgeon/nt_mantis/stealth
	starting_organ = /obj/item/organ/cyberimp/arm/nt_mantis/stealth

/obj/item/organ/cyberimp/arm/nt_mantis/stealth
	desc = "Stealth mosification of H.E.P.H.A.E.S.T.U.S. retractable arm-blade implant. Wielding two will let you double-attack."
	syndicate_implant = TRUE

/datum/uplink_item/stealthy_weapons/combatglovesplus
	name = "Combat Gloves Plus"
	desc = "A pair of gloves that are fireproof and shock resistant, however unlike the regular Combat Gloves this one uses nanotechnology \
			to learn the abilities of krav maga to the wearer."
	item = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	cost = 5
	surplus = 0
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/implants/ntradio
	name = "Internal Nanotrasen Radio Implant"
	desc = "An implant injected into the body, allowing the use of an internal Centcom radio. \
			Used just like a regular headset, but can be disabled to use external headsets normally and to avoid detection."
	item = /obj/item/storage/box/syndie_kit/imp_ntiaa_radio
	cost = 4
	surplus = 0
	illegal_tech = FALSE
	manufacturer = /datum/corporation/nanotrasen
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/obj/item/storage/box/syndie_kit/imp_ntiaa_radio
	real_name = "implant box"
	illustration = "implant"

/obj/item/storage/box/syndie_kit/imp_ntiaa_radio/PopulateContents()
	new /obj/item/implanter/radio/ntiaa(src)

/obj/item/implanter/radio/ntiaa
	name = "implanter"
	imp_type = /obj/item/implant/radio/ntiaa

/obj/item/implant/radio/ntiaa
	desc = "Are you there God? It's me, Internal Affairs Agent."
	radio_key = /obj/item/encryptionkey/headset_cent
	subspace_transmission = TRUE

/datum/uplink_item/implants/reviver
	name = "Reviver Implant"
	desc = "This implant will attempt to revive and heal you if you are critically injured. Comes with an autosurgeon."
	item = /obj/item/autosurgeon/reviver/stealth
	manufacturer = /datum/corporation/nanotrasen
	cost = 8
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/obj/item/autosurgeon/reviver/stealth
	starting_organ = /obj/item/organ/cyberimp/chest/reviver/stealth

/obj/item/organ/cyberimp/chest/reviver/stealth
	syndicate_implant = TRUE

/datum/uplink_item/explosives/nt_minibomb
	name = "Nanotrasen Minibomb"
	desc = "The minibomb is a grenade with a five-second fuse. Upon detonation, it will create a small hull breach \
			in addition to dealing high amounts of damage to nearby personnel."
	item = /obj/item/grenade/syndieminibomb/nt
	manufacturer = /datum/corporation/nanotrasen
	cost = 6
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/obj/item/grenade/syndieminibomb/nt
	name = "\improper nanotrasen minibomb"
	desc = "A nanotrasen manufactured explosive used to sow destruction and chaos."
	icon = 'modular_dripstation/icons/obj/weapons/grenade.dmi'
	icon_state = "nanotrasen"

/datum/uplink_item/explosives/teargas
	name = "Teargas Grenade"
	desc = "A teargas grenades."
	item = /obj/item/grenade/chem_grenade/teargas
	cost = 1
	surplus = 0
	illegal_tech = FALSE
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/variag
	name = "Varyag Militech Forsing Tool"
	desc = "Smash stuff. Pry open doors. Kill enemies."
	item = /obj/item/melee/emergency_forcing_tool/varyag
	cost = 6
	surplus = 0
	illegal_tech = FALSE
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/nt_bodybag
	name = "Nanotrasen Bluespace Transport Bag"
	desc = "A folded bluespace body bag designed for the storage and transportation."
	item = /obj/item/bodybag/bluespace
	cost = 1
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/suits/oldspacesuit
	name = "Old Style Spacesuit"
	desc = "A box of modern spacesuit disguised into \"Old Style\"."
	item = /datum/market_item/clothing/full_spacesuit_set
	cost = 1
	surplus = 0
	illegal_tech = FALSE
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/obj/item/storage/box/full_spacesuit_set
	name = "Spacesuit Box"
	desc = "It has no logo on it."

/obj/item/storage/box/full_spacesuit_set/PopulateContents()
	new /obj/item/clothing/suit/space(src)
	new /obj/item/clothing/head/helmet/space(src)

/datum/uplink_item/suits/mercrig
	name = "Merk RIG"
	desc = "The feared suit of a free mercenary unit. Toggling the suit in and out of \
			combat mode will allow you all the mobility of a loose fitting uniform without sacrificing armoring. \
			Additionally the suit is collapsible, making it small enough to fit within a backpack."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/merk
	cost = 8
	surplus = 0
	illegal_tech = FALSE
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

////////////Syndicate stuff/////////////
/datum/uplink_item/dangerous/throwingweapons/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/sword/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/backstab/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/bostaff/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/powerfist/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/dangerous/watergun/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/cqc/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/dart_pistol/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/derringer/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/origami_kit/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/traitor_chem_bottle/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/sleepy_pen/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_weapons/suppressor/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/explosives/c4/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/explosives/ntx4
	name = "Composition X-4"
	desc = "A variety of plastic explosive with a stronger explosive charge. It is both safer to use and is capable of breaching even the most secure areas."
	item = /obj/item/grenade/plastic/x4
	cost = 3
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/explosives/detomatix/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)
	restricted = FALSE

/datum/uplink_item/explosives/door_charge/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/explosives/trap_disk/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/agent_card/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/shadowcloak/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/syndireverse/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/chameleon/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/chameleon_proj/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/syndigaloshes/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/emplight/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/mulligan/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/smugglersatchel/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/stealthy_tools/armorpolish/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/cutouts/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/binary/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/briefcase_launchpad/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/camera_bug/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/frame/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/failsafe/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/tactical_gloves/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/stimpack/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/thermal/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/holo_sight/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/vert_grip/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/laser_sight/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/device_tools/mechpilotguide/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/implants/antistun/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/implants/freedom/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/implants/stealthimplant/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)

/datum/uplink_item/implants/storage/nt
	surplus = 0
	include_uplinks = list("NTUplink")
	restricted_roles = list(NT_SPY)
