////////////////////////B.E.P.I.S. Locked Techs////////////////////////
/datum/techweb_node/light_apps
	id = "light_apps"
	display_name = "Illumination Applications"
	description = "Applications of lighting and vision technology not originally thought to be commercially viable."
	prereq_ids = list("base")
	design_ids = list("bright_helmet", "rld_mini")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/spec_eng
	id = "spec_eng"
	display_name = "Specialized Engineering"
	description = "Conventional wisdom has deemed these engineering products 'technically' safe, but far too dangerous to traditionally condone."
	prereq_ids = list("base")
	design_ids = list("eng_gloves", "lava_rods")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/aus_security
	id = "aus_security"
	display_name = "Australicus Security Protocols"
	description = "It is said that security in the Australicus sector is tight, so we took some pointers from their equipment. Thankfully, our sector lacks any signs of these, 'dropbears'."
	prereq_ids = list("base")
	design_ids = list("pin_explorer", "stun_boomerang")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/interrogation
	id = "interrogation"
	display_name = "Enhanced Interrogation Technology"
	description = "By cross-referencing several declassified documents from past dictatorial regimes, we were able to develop an incredibly effective interrogation device. \
	Ethical concerns about loss of free will do not apply to criminals, according to galactic law."
	prereq_ids = list("base")
	design_ids = list("hypnochair")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3500)
	hidden = TRUE
	experimental = TRUE

/datum/techweb_node/tackle_advanced
	id = "tackle_advanced"
	display_name = "Advanced Grapple Technology"
	description = "Nanotrasen would like to remind its researching staff that it is never acceptable to \"glomp\" your coworkers, and further \"scientific trials\" on the subject will no longer be accepted in its academic journals."
	design_ids = list(/*"tackle_dolphin", "tackle_rocket",*/"tackle_tactical")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	hidden = TRUE
	experimental = TRUE

/////////////////////////Biotech/////////////////////////
/datum/techweb_node/biotech
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000, TECHWEB_POINT_TYPE_MEDICAL = 500)

/datum/techweb_node/adv_biotech
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000, TECHWEB_POINT_TYPE_MEDICAL = 500)

/datum/techweb_node/xenoorgan_biotech
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000, TECHWEB_POINT_TYPE_MEDICAL = 500)

/datum/techweb_node/bio_process
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000, TECHWEB_POINT_TYPE_MEDICAL = 500)

/datum/techweb_node/xenology
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000, TECHWEB_POINT_TYPE_MEDICAL = 2000)

/////////////////////////Advanced Surgery/////////////////////////
/datum/techweb_node/imp_wt_surgery
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 500, TECHWEB_POINT_TYPE_MEDICAL = 500)

/datum/techweb_node/adv_surgery
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000, TECHWEB_POINT_TYPE_MEDICAL = 1500)

/datum/techweb_node/exp_surgery
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000, TECHWEB_POINT_TYPE_MEDICAL = 2000)


////////////////////////mech technology////////////////////////
/datum/techweb_node/adv_mecha
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/gygax
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/durand
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/phazon
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/sidewinder
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/med_mech_tools
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_modules
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_scattershot
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_carbine
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_ion
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_tesla
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_bfg
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_laser
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_laser_heavy
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_xray
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_disabler
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_grenade_launcher
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_missile_rack
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/clusterbang_launcher
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_lmg
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_rocket_fist
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_shortsword
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_katana
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_batong
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_trogdor
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_maul
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)

/datum/techweb_node/mech_spear
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 1500)


/////////////////////////weaponry tech/////////////////////////
/datum/techweb_node/weaponry
	design_ids = list("pin_testing", "tele_shield", "platingmkii", "platingmkiii", "vert_grip", "laser_sight", "infra_sight")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 4000, TECHWEB_POINT_TYPE_MEDICAL = 1000, TECHWEB_POINT_TYPE_WEAPONRY = 2000)

/datum/techweb_node/adv_weaponry
	design_ids = list("platingmki", "platingmkiv", "holo_sight")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7000, TECHWEB_POINT_TYPE_MEDICAL = 1000, TECHWEB_POINT_TYPE_WEAPONRY = 2000)

/datum/techweb_node/electric_weapons
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/hardlight_weapons
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/radioactive_weapons
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_MEDICAL = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/medical_weapons
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500, TECHWEB_POINT_TYPE_MEDICAL = 1500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/beam_weapons
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/adv_beam_weapons
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/explosive_weapons
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/ballistic_weapons
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/exotic_ammo
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/gravity_gun
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)

/datum/techweb_node/experimental_ammo
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 500)


/datum/techweb_node/cloning
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_MEDICAL = 2500)

/datum/techweb_node/cryotech
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000, TECHWEB_POINT_TYPE_MEDICAL = 2000)

/datum/techweb_node/subdermal_implants
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_MEDICAL = 2500)

/datum/techweb_node/cyber_organs
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000, TECHWEB_POINT_TYPE_MEDICAL = 1000)

datum/techweb_node/cyber_organs/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 500)

/datum/techweb_node/cyber_organs_upgraded
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000, TECHWEB_POINT_TYPE_MEDICAL = 1500)

/datum/techweb_node/cyber_organs_upgraded/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000, TECHWEB_POINT_TYPE_MEDICAL = 750)

/datum/techweb_node/ipc_organs
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000, TECHWEB_POINT_TYPE_MEDICAL = 1500)

/datum/techweb_node/cyber_implants
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500, TECHWEB_POINT_TYPE_MEDICAL = 2500)

/datum/techweb_node/cyber_implants/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1250, TECHWEB_POINT_TYPE_MEDICAL = 1250)

/datum/techweb_node/adv_cyber_implants
	research_costs = list(TECHWEB_POINT_TYPE_MEDICAL = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 2000)

/datum/techweb_node/adv_cyber_implants/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		research_costs = list(TECHWEB_POINT_TYPE_MEDICAL = 1250, TECHWEB_POINT_TYPE_WEAPONRY = 1000)

/datum/techweb_node/combat_cyber_implants
	research_costs = list(TECHWEB_POINT_TYPE_MEDICAL = 2500, TECHWEB_POINT_TYPE_WEAPONRY = 2000)

/datum/techweb_node/combat_cyber_implants/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		research_costs = list(TECHWEB_POINT_TYPE_MEDICAL = 1250, TECHWEB_POINT_TYPE_WEAPONRY = 1000)

/datum/techweb_node/illegal_cyber_implants
	design_ids = list("ci-noslipwater")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000, TECHWEB_POINT_TYPE_WEAPONRY = 2000, TECHWEB_POINT_TYPE_MEDICAL = 2000)

/datum/techweb_node/illegal_cyber_implants/New()
	..()
	if(HAS_TRAIT(SSstation, STATION_TRAIT_CYBERNETIC_REVOLUTION))
		research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000, TECHWEB_POINT_TYPE_WEAPONRY = 1000, TECHWEB_POINT_TYPE_MEDICAL = 1000)



/datum/techweb_node/alien_surgery
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000, TECHWEB_POINT_TYPE_MEDICAL = 2000)

/datum/techweb_node/alien_bio
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000, TECHWEB_POINT_TYPE_MEDICAL = 2000)


/datum/techweb_node/syndicate_basic
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 4000, TECHWEB_POINT_TYPE_WEAPONRY = 6000)
