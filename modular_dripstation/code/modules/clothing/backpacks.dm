/obj/item/storage/backpack
	worn_icon = 'modular_dripstation/icons/mob/clothing/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'
	var/list/species_restricted = list("exclude", "replica")

/obj/item/storage/backpack/equipped(mob/user, slot)
	if(slot == ITEM_SLOT_BACK)
		mouse_opacity = MOUSE_OPACITY_OPAQUE //so it's easier to click when properly equipped.
	..()

/obj/item/storage/backpack/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	..()

/obj/item/storage/backpack/mob_can_equip(M as mob, slot)

	//if we can't equip the item anyway, don't bother with species_restricted (also cuts down on spam)
	if(!..())
		return FALSE

	// Skip species restriction checks on non-equipment slots
	if(slot in list(ITEM_SLOT_LPOCKET, ITEM_SLOT_RPOCKET, ITEM_SLOT_BACKPACK, ITEM_SLOT_SUITSTORE))
		return TRUE

	if(species_restricted && istype(M,/mob/living/carbon/human))

		var/wearable = FALSE
		var/exclusive = FALSE
		var/mob/living/carbon/human/H = M

		if("exclude" in species_restricted)
			exclusive = TRUE

		if(H.dna.species)
			if(exclusive)
				if(!(H.dna.species.id in species_restricted))
					wearable = TRUE
			else
				if(H.dna.species.id in species_restricted)
					wearable = TRUE

			if(!wearable)
				to_chat(M, "<span class='warning'>Your species cannot wear [src].</span>")
				return FALSE

	return TRUE

/obj/item/storage/backpack/head_of_personnel
	name = "head of personnel backpack"
	desc = "A exclusive backpack issued to Nanotrasen's finest second."
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	icon_state = "hop_pack"
	item_state = "hop_pack"

/obj/item/storage/backpack/satchel/head_of_personnel
	name = "head of personnel satchel"
	desc = "A exclusive satchel issued to Nanotrasen's finest second."
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	icon_state = "satchel_hop"
	item_state = "satchel_hop"	

/obj/item/storage/backpack/duffelbag/head_of_personnel
	name = "head of personnel duffelbag"
	desc = "A robust duffelbag issued to Nanotrasen's finest second."
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	icon_state = "duffel_hop"
	item_state = "duffel_hop" 	

/obj/item/storage/backpack/captain
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/vir
	item_state = "satchel-vir"

/obj/item/storage/backpack/satchel/chem
	item_state = "satchel-chem"	

/obj/item/storage/backpack/satchel/leather
	item_state = "satchel"

/obj/item/storage/backpack/medic
	item_state = "medicalpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/med
	item_state = "duffel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/med
	item_state = "satchel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/emt
	name = "emt backpack"
	desc = "A exclusive backpack issued to emergency medical staff."
	icon_state = "emtpack"
	item_state = "medicalpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/emt
	name = "emt satchel"
	desc = "A exclusive satchel issued to emergency medical staff."
	icon_state = "satchel-emt"
	item_state = "satchel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/emt
	name = "emt duffelbag"
	desc = "A robust duffelbag issued to emergency medical staff."
	icon_state = "duffel_emt"
	item_state = "duffel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/bmed
	name = "brig physician backpack"
	desc = "A exclusive backpack issued to security recovery staff."
	icon_state = "bmpack"
	item_state = "medicalpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/bmed
	name = "brig physician satchel"
	desc = "A exclusive satchel issued to security recovery staff."
	icon_state = "satchel-bm"
	item_state = "satchel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/bmed
	name = "brig physician duffelbag"
	desc = "A robust duffelbag issued to security recovery staff."
	icon_state = "duffel-bm"
	item_state = "duffel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/cmo
	name = "Chief Medical Officer`s backpack"
	desc = "A exclusive backpack issued to Chief Medical Officer."
	icon_state = "cmopack"
	item_state = "medicalpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/cmo
	name = "Chief Medical Officer`s satchel"
	desc = "A exclusive satchel issued to Chief of Healing."
	icon_state = "satchel-cmo"
	item_state = "satchel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/cmo
	name = "Chief Medical Officer`s duffelbag"
	desc = "A robust duffelbag issued to the medical mastermind."
	icon_state = "duffel-cmo"
	item_state = "duffel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/eng
	item_state = "satchel-eng"

/obj/item/storage/backpack/genetics
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/cultpack
	item_state = "trophyrack"		

/obj/item/shared_storage
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'
	item_state = "trophyrack"

/obj/item/storage/backpack/satchel
	item_state = "satchel-norm"

/obj/item/storage/backpack/satchel/tox
	item_state = "satchel-tox"

/obj/item/storage/backpack/satchel/sec
	item_state = "satchel-sec"

/obj/item/storage/backpack/satchel/hyd
	item_state = "satchel-hyd"

/obj/item/storage/backpack/satchel/explorer
	item_state = "satchel-explorer"

/obj/item/storage/backpack/satchel/cap
	item_state = "satchel-cap"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/captain
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/science/rd
	name = "research director`s backpack"
	desc = "A sleek, industrial-strength backpack issued to research and development high rank personnel. Smells like real science."
	icon_state = "rdpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/satchel/tox/rd
	name = "research director`s satchel"
	desc = "A sleek, industrial-strength satchel issued to research and development high rank personnel. Smells like real science."
	icon_state = "satchel-rd"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/science/rd
	name = "research director`s duffel bag"
	desc = "A large duffel bag for holding extra scientific components. Smells like real science."
	icon_state = "duffel-rd"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/flat
	item_state = "satchel-flat"

/obj/item/storage/backpack/satchel/gen
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	
	item_state = "satchel-gen"

/obj/item/storage/backpack/duffelbag/syndie/med
	item_state = "duffel-syndimed"

/obj/item/storage/backpack/duffelbag/syndie/ammo
	item_state = "duffel-syndiammo"

/obj/item/storage/backpack/duffelbag/syndie/ammo/dark_gygax/PopulateContents()
	new /obj/item/mecha_ammo/incendiarylmg(src)
	new /obj/item/mecha_ammo/incendiarylmg(src)
	new /obj/item/mecha_ammo/incendiarylmg(src)
	new /obj/item/mecha_ammo/flashbang(src)
	new /obj/item/mecha_ammo/flashbang(src)
	new /obj/item/mecha_ammo/flashbang(src)

/obj/item/storage/backpack/duffelbag/syndie/ammo/mauler/PopulateContents()
	new /obj/item/mecha_ammo/hmg(src)
	new /obj/item/mecha_ammo/hmg(src)
	new /obj/item/mecha_ammo/hmg(src)
	new /obj/item/mecha_ammo/syndieshot(src)
	new /obj/item/mecha_ammo/syndieshot(src)
	new /obj/item/mecha_ammo/syndieshot(src)
	new /obj/item/mecha_ammo/missiles_he(src)
	new /obj/item/mecha_ammo/missiles_he(src)
	new /obj/item/mecha_ammo/missiles_he(src)

/obj/item/storage/backpack/duffelbag/syndie/hitman
	item_state = "duffel-syndiammo"

/obj/item/storage/backpack/duffelbag/hydroponics
	name = "hydroponic's duffel bag"
	desc = "A large duffel bag for holding extra gardening tools."
	icon_state = "duffel-hydroponics"
	item_state = "duffel-hydroponics"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/duffelbag/science
	name = "scientist's duffel bag"
	desc = "A large duffel bag for holding extra scientific components."
	icon_state = "duffel-tox"
	item_state = "duffel-tox"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/duffelbag/mime
	name = "Sac de marin chagrin"
	desc =  "A large duffel bag for holding extra invisible items."
	icon_state = "duffelmime"
	item_state = "duffelmime"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/satchel/mime
	name = "Parcel Parobust"
	desc = "A silent satchel made for those silent workers. Silence Co."
	icon_state = "satchel-mime"
	item_state = "satchel-mime"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/satchel/clown
	name = "Giggles Von Robuston"
	desc = "It's a satchel made by Honk! Co."
	icon_state = "satchel-clown"
	item_state = "satchel-clown"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/emt
	name = "EMT duffel bag"
	desc = "A large duffel bag for holding extra emergency medicine."
	icon_state = "duffel_emt"
	item_state = "duffel_emt"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/science/robo
	name = "robotics backpack"
	desc = "A sleek, industrial-strength backpack issued to robotics personnel. Smells faintly of oil."
	icon_state = "robopack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/satchel/tox/robo
	name = "robotics satchel"
	desc = "A sleek, industrial-strength satchel issued to robotics personnel. Smells faintly of oil."
	icon_state = "satchel-robo"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/duffelbag/science/robo
	name = "robotics duffelbag"
	desc = "A sleek, industrial-strength duffelbag issued to robotics personnel. Smells faintly of oil."
	icon_state = "duffel-robo"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/satchel/atmos
	name = "atmospherics satchel"
	desc = "A fireproof satchel for keeping gear safe."
	icon_state = "satchel-atmos"
	item_state = "satchel-atmos"	
	resistance_flags = FIRE_PROOF	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/industrial/atmos
	name = "atmospherics backpack"
	desc = "It's a fireproof backpack for Atmospherics Staff."
	icon_state = "atmospack"
	item_state = "atmospack"
	resistance_flags = FIRE_PROOF	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/engineering/atmos
	name = "atmospherics duffelbag"
	desc = "A duffelbag designed to hold tools. This one is specially designed for atmospherics."
	icon_state = "duffel-atmos"
	item_state = "duffel-atmos"
	resistance_flags = FIRE_PROOF
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/satchel/signal
	name = "network admin`s satchel"
	desc = "An industrial satchel for keeping gear safe."
	icon_state = "satchel-signal"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/industrial/signal
	name = "network admin`s backpack"
	desc = "It's an industrial backpack for Signal Staff."
	icon_state = "signalpack"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/engineering/signal
	name = "network admin`s duffelbag"
	desc = "A duffelbag designed to hold tools. This one is specially designed for signal engineer."
	icon_state = "duffel-signal"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/ce
	name = "chief engineer`s satchel"
	desc = "A fireproof satchel for keeping gear safe."
	icon_state = "satchel-ce"	
	resistance_flags = FIRE_PROOF	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/industrial/ce
	name = "chief engineer`s backpack"
	desc = "It's a fireproof backpack for Engi Chief."
	icon_state = "cepack"
	resistance_flags = FIRE_PROOF	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/engineering/ce
	name = "chief engineer`s duffelbag"
	desc = "A duffelbag designed to hold tools. This one is specially designed for superior engineer."
	icon_state = "duffel-ce"
	resistance_flags = FIRE_PROOF
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/explorer
	name = "explorer duffel bag"
	desc = "A large duffel bag for holding extra exotic treasures."
	icon_state = "duffel-explorer"
	item_state = "duffel-explorer"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/sec/detective
	name = "forensic satchel"
	desc = "For every man, who at the bottom of his heart believes that he is a born detective."
	icon_state = "satchel-detective"
	item_state = "satchel-detective"	
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi' 

/obj/item/storage/backpack/duffelbag/sec/surgery
	icon_state = "duffel-bm"
	item_state = "duffel-med"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/box/barrier_grenades
	name = "box of barrier grenades"
	desc = "<B>WARNING: These devices deploy barriers.</B>"
	icon_state = "secbox"
	item_state = "secbox"	
	illustration = "grenade"

/obj/item/storage/box/barrier_grenades/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/grenade/barrier(src)

/obj/item/storage/backpack/duffelbag/sec/armorygrenades
	name = "grenade duffel bag"
	desc = "A large duffel bag for holding extra armory supplies - this one has a material inlay with space for boxes with police grade grenades."

/obj/item/storage/backpack/duffelbag/sec/armorygrenades/PopulateContents()
	new /obj/item/storage/box/flashes(src)
	new /obj/item/storage/box/barrier_grenades(src)
	new /obj/item/storage/box/teargas(src)
	new /obj/item/storage/box/handcuffs(src)

/obj/item/storage/backpack/duffelbag/sec/nonlethalshots
	name = "rubber 12 gauge duffel bag"
	desc = "A large duffel bag for holding extra armory supplies - this one has a material inlay with space for boxes with rubber shots."

/obj/item/storage/backpack/duffelbag/sec/nonlethalshots/PopulateContents()
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)
	new /obj/item/storage/box/rubbershot(src)

/obj/item/storage/backpack/duffelbag/sec/nonlethalwt
	name = "spare rubber WT magazines duffel bag"
	desc = "A large duffel bag for holding extra armory supplies - this one has a material inlay with space for spare magazines with rubber WT ammo."

/obj/item/storage/backpack/duffelbag/sec/nonlethalwt/PopulateContents()
	new /obj/item/ammo_box/magazine/wt550m9/wtr(src)
	new /obj/item/ammo_box/magazine/wt550m9/wtr(src)
	new /obj/item/ammo_box/magazine/wt550m9/wtr(src)
	new /obj/item/ammo_box/magazine/wt550m9/wtr(src)

/obj/item/storage/backpack/duffelbag/genetics
	name = "geneticist duffelbag"
	desc = "A duffelbag designed to hold gibbering monkies."
	icon_state = "duffel-gene"
	item_state = "duffel-gene"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/duffelbag/virology
	name = "virologist's duffel bag"
	desc = "A large duffel bag for holding extra viral bottles."
	icon_state = "duffel-virology"
	item_state = "duffel-virology"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'	

/obj/item/storage/backpack/duffelbag/chemistry
	name = "chemist duffelbag"
	desc = "A duffelbag designed to hold corrosive substances."
	icon_state = "duffel-chemistry"
	item_state = "duffel-chemistry"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'


/obj/item/storage/backpack/cargo
	name = "cargo backpack"
	desc = "For corporate cargoman usage."
	icon_state = "backpack-cargo"
	item_state = "backpack-cargo"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/cargo/tactical
	name = "cargo tactical backpack"
	desc = "UNITE WE STAND! Beware of the shitsecs..."
	icon_state = "backpack-cargo_tactiical"
	item_state = "backpack-cargo_tactiical"
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/satchel/cargo
	name = "cargo satchel"
	desc = "For those whose burden is heavy."
	icon_state = "satchel-cargo"
	item_state = "satchel-cargo"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/duffelbag/cargo
	name = "cargo duffelbag"
	desc = "A duffelbag designed to hold cargo. Heavy cargo."
	icon_state = "duffel-cargo"
	item_state = "duffel-cargo"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/syndie
	name = "suspicious backpack"
	desc = "Stand by for your task, operative."
	icon_state = "syndicate_pack_combat"
	item_state = "syndicate_pack_combat"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/satchel/syndie
	name = "suspicious satchel"
	desc = "For operatives, who operating operatively and overthrow monopolists."
	icon_state = "satchel_syndie"
	item_state = "satchel_syndie"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'

/obj/item/storage/backpack/blueshield
	name = "blueshield`s backpack"
	desc = "A robust backpack issued to Nanotrasen Protector`s finest."
	icon_state = "blueshieldpack"
	item_state = "blueshieldpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/satchel/blueshield
	name = "blueshield`s satchel"
	desc = "Your objective is simple, agent: Defend local executives at any cost."
	icon_state = "satchel-blueshield"
	item_state = "satchel-blueshield"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/duffelbag/blueshield
	name = "blueshield`s duffelbag"
	desc = "A robust backpack issued to Nanotrasen Protector`s finest. Now with extra space!"
	icon_state = "duffel-blueshield"
	item_state = "duffel-blueshield"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/unknown
	name = "unknown backpack"
	desc = "Unknown backpack."
	icon_state = "unknownpack"
	item_state = "unknownpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/satchel/unknown
	name = "unknown satchel"
	desc = "Unknown satchel."
	icon_state = "satchel-unknown"
	item_state = "unknownpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/duffelbag/unknown
	name = "unknown duffelbag"
	desc = "Unknown duffelbag."
	icon_state = "duffel-unknown"
	item_state = "unknownpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/centcom
	name = "centcom backpack"
	desc = "Centcom backpack."
	icon_state = "centcompack"
	item_state = "unknownpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/satchel/centcom
	name = "centcom satchel"
	desc = "Centcom satchel."
	icon_state = "satchel-centcom"
	item_state = "unknownpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'

/obj/item/storage/backpack/duffelbag/centcom
	name = "centcom duffelbag"
	desc = "Centcom duffelbag."
	icon_state = "duffel-centcom"
	item_state = "unknownpack"
	icon = 'modular_dripstation/icons/obj/storage/backpacks.dmi'
	lefthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_dripstation/icons/mob/inhands/clothing/backpack_righthand.dmi'
