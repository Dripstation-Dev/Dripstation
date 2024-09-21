// Hey! Listen! Update \config\iceruinblacklist.txt with your new ruins!

/datum/map_template/ruin/icemoon
	prefix = "_maps/RandomRuins/IceRuins/"
	allow_duplicates = FALSE
	cost = 5
	ruin_type = ZTRAIT_ICE_RUINS
	default_area = /area/icemoon/surface/outdoors/unexplored
	has_ceiling = TRUE
	ceiling_turf = /turf/closed/mineral/snowmountain/do_not_chasm
	ceiling_baseturfs = list(/turf/open/floor/plating/asteroid/snow/icemoon/do_not_chasm)

// above ground only

/datum/map_template/ruin/icemoon/transitshuttle
	name = "Transit Shuttle"
	id = "transitshuttle"
	description = "How did that get here?"
	suffix = "icemoon_surface_shuttle_transit.dmm"

/datum/map_template/ruin/icemoon/icemoon_hermit
	name = "Icemoon Hermit"
	id = "ice_hermit"
	description = "The home of a hermit in the ice and snow, you can't possibly imagine who'd want to live here."
	suffix = "icemoon_surface_hermit.dmm"

/datum/map_template/ruin/icemoon/lust
	name = "Ruin of Lust"
	id = "lust"
	description = "Not exactly what you expected."
	suffix = "icemoon_surface_lust.dmm"

/datum/map_template/ruin/icemoon/asteroid
	name = "Asteroid Site"
	id = "asteroidsite"
	description = "Surprised to see us here?"
	suffix = "icemoon_surface_asteroid.dmm"

/datum/map_template/ruin/icemoon/hotsprings
	name = "Hot Springs"
	id = "hotsprings"
	description = "Just relax and take a dip, nothing will go wrong, I swear!"
	suffix = "icemoon_surface_hotsprings.dmm"

/datum/map_template/ruin/icemoon/icemoon_underground_abandoned_village
	name = "Inn"
	id = "inn"
	description = "A small wooden inn with food, drinks, and a place to rest, all maintained by the innkeeper."
	suffix = "icemoon_surface_inn.dmm"

/datum/map_template/ruin/icemoon/syndicate_icemoon
	name = "Syndicate Icemoon Research Outpost"
	id = "synd_research"
	description = "A small Syndicate research outpost in the icy wastes, sealed off from the outside."
	/* Dripstation edit
	suffix = "icemoon_surface_syndicate.dmm"
	*/
	suffix = "icemoon_surface_syndicate_new.dmm"	// Dripstation edit

/datum/map_template/ruin/icemoon/seed_vault
	name = "Seed Vault"
	id = "seed-vault"
	description = "The creators of these vaults were a highly advanced and benevolent race, and launched many into the stars, hoping to aid fledgling civilizations. However, all the inhabitants seem to do is grow drugs and guns."
	suffix = "lavaland_surface_seed_vault.dmm"
	allow_duplicates = FALSE

/datum/map_template/ruin/icemoon/walker_village
	name = "Walker Village"
	id = "walkervillage"
	always_place = TRUE	// Dripstation edit
	description = "A town populated by strange, sapient zombies."
	suffix = "icemoon_surface_walkervillage.dmm"

//Dripstation edit bellow
/datum/map_template/ruin/icemoon/syndicatepod
	name = "Syndicate Pod"
	id = "syndicatepod"
	description = "The Syndicate would pay handsomely for its contents"
	suffix = "icemoon_surface_syndicatepod.dmm"

/datum/map_template/ruin/icemoon/dead_ratvar
	name = "Dead Ratvar"
	id = "dead_ratvar"
	description = "The god himself"
	suffix = "icemoon_surface_dead_ratvar.dmm"
	cost = 10
	allow_duplicates = FALSE

/datum/map_template/ruin/icemoon/engioutpost
	name = "Engi Outpost"
	id = "engioutpost"
	description = "Engioutposting"
	suffix = "icemoon_surface_engioutpost.dmm"
	cost = 10
	allow_duplicates = FALSE

/datum/map_template/ruin/icemoon/newcops
	name = "Abandoned Nuclear Operatives base"
	id = "nukiebaseabandoned"
	description = "Who knows what lies within?"
	suffix = "icemoon_surface_abandoned_newcops.dmm.dmm"
	cost = 20
	allow_duplicates = FALSE

/datum/map_template/ruin/icemoon/underground/arctic_station
	name = "Abandoned Arctic Station"
	id = "arctic_station"
	description = "Who knows what lies within?"
	suffix = "icemoon_underground_oldstation.dmm"
	cost = 15
	allow_duplicates = FALSE

/datum/map_template/ruin/icemoon/underground/ufo_crash
	name = "UFO Crash"
	id = "ufo-crash"
	description = "Turns out that keeping your abductees unconscious is really important. Who knew?"
	suffix = "icemoon_underground_ufo_crash.dmm"

/datum/map_template/ruin/icemoon/underground/abandonedhydrolab
	name = "Abandoned Hydroponics Lab"
	id = "hydroponicslab"
	description = "Who knows what lies within?"
	suffix = "icemoon_underground_hydroponics_lab.dmm"
	cost = 10
	allow_duplicates = FALSE

/datum/map_template/ruin/icemoon/underground/slimelab
	name = "Abandoned Slime Laboratory"
	id = "slimelab"
	description = "Who knows what lies within?"
	suffix = "icemoon_underground_slimelab.dmm"
	cost = 15
	allow_duplicates = FALSE

// above and below ground together

/datum/map_template/ruin/icemoon/mining_site
	name = "Mining Site"
	id = "miningsite"
	description = "Ruins of a site where people once mined with primitive tools for ore."
	suffix = "icemoon_surface_mining_site.dmm"
	always_place = TRUE
	always_spawn_with = list(/datum/map_template/ruin/icemoon/underground/mining_site_below = PLACE_BELOW)

/datum/map_template/ruin/icemoon/underground/mining_site_below
	name = "Mining Site Underground"
	id = "miningsite-underground"
	description = "Who knew ladders could be so useful?"
/*
	suffix = "icemoon_underground_mining_site.dmm"
*/
	suffix = "icemoon_underground_mining_site_drip.dmm"
	unpickable = TRUE

// below ground only

/datum/map_template/ruin/icemoon/underground
	name = "underground ruin"
	ruin_type = ZTRAIT_ICE_RUINS_UNDERGROUND
	default_area = /area/icemoon/underground/unexplored

/* Dripstation edit, remap
/datum/map_template/ruin/icemoon/underground/abandonedvillage
	name = "Abandoned Village"
	id = "abandonedvillage"
	description = "Who knows what lies within?"
	suffix = "icemoon_underground_abandoned_village.dmm"
*/

/datum/map_template/ruin/icemoon/underground/library
	name = "Buried Library"
	id = "buriedlibrary"
	description = "A once grand library, now lost to the confines of the Ice Moon."
/*	dripstation edit
	suffix = "icemoon_underground_library.dmm"
*/
	suffix = "icemoon_underground_library_drip.dmm"	//dripstation edit

/datum/map_template/ruin/icemoon/underground/wrath
	name = "Ruin of Wrath"
	id = "wrath"
	description = "You'll fight and fight and just keep fighting."
/*	dripstation edit
	suffix = "icemoon_underground_wrath.dmm"
*/
	suffix = "icemoon_underground_wrath_drip.dmm"	//dripstation edit

/* Dripstation edit
/datum/map_template/ruin/icemoon/underground/lavaland
	name = "Lavaland Site"
	id = "lavalandsite"
	description = "I guess we never really left you huh?"
	suffix = "icemoon_underground_lavaland.dmm"
*/

/datum/map_template/ruin/icemoon/underground/puzzle
	name = "Ancient Puzzle"
	id = "puzzle"
	description = "Mystery to be solved."
	suffix = "icemoon_underground_puzzle.dmm"

/datum/map_template/ruin/icemoon/underground/bathhouse
	name = "Bath House"
	id = "bathhouse"
	description = "A taste of paradise, locked in the hell of the Ice Moon."
/*	dripstation edit
	suffix = "icemoon_underground_bathhouse.dmm"
*/
	suffix = "icemoon_underground_bathhouse_drip.dmm"	//dripstation edit

/* Cringe, dripstation edit
/datum/map_template/ruin/icemoon/underground/wampacave
	name = "Wampa Cave"
	id = "wampacave"
	description = "A cave inhabited by a strange monster, with an unfortunate hero..."
	suffix = "icemoon_underground_wampacave.dmm"
*/
