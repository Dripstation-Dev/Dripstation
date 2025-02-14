/obj/item/proc/get_gun_permit_iconstate()
	var/obj/item/card/id/id_card = GetID()

	if(!id_card)
		return null
	if(ACCESS_WEAPONS in id_card.GetAccess())
		return "hud_permit"
	return null

/obj/item/card/id/departmental_budget
	icon = 'modular_dripstation/icons/obj/card.dmi'
	icon_state = "budgetcard"

/obj/item/card/id/departmental_budget/car
	icon_state = "car_budget"

/obj/item/card/id/departmental_budget/syndibase
	icon_state = "syndibase_budget"
	department_ID = ACCOUNT_SYNDIBASE
	department_name = ACCOUNT_SYNDIBASE_NAME

/obj/item/card/id/departmental_budget/sec
	icon_state = "sec_budget"

/obj/item/card/emag
	icon = 'modular_dripstation/icons/obj/card.dmi'
	icon_state = "emag"

/obj/item/card/emag/improvised
	icon_state = "emag_shitty"

/obj/item/card/cmag
	icon = 'modular_dripstation/icons/obj/card.dmi'
	icon_state = "cmag"

/obj/item/card/id/syndicate/nuke
	name = "operative card"
	registered_name = "operative"
	assignment = "Nuclear Squad Operative"
	originalassignment = "Nuclear Squad Operative"
	has_fluff = TRUE
	registered_age = null
	forged = TRUE
	anyone = TRUE
	registered_age = null
	icon_state = "syndie"

/obj/item/card/id/syndicate/nuke_leader
	name = "squad leader card"
	registered_name = "leader"
	assignment = "Nuclear Squad Leader"
	originalassignment = "Nuclear Squad Leader"
	has_fluff = TRUE
	registered_age = null
	forged = TRUE
	anyone = TRUE
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_SYNDICATE, ACCESS_SYNDICATE_LEADER)
	registered_age = null
	icon_state = "syndie_com"

/obj/item/card/id/syndicate_command
	icon_state = "commander"

/obj/item/card/id/syndicate/syndibase
	name = "operative card"
	registered_name = "operative"
	assignment = "SRB Team"
	originalassignment = "SRB Team"
	has_fluff = TRUE
	registered_age = null
	forged = TRUE
	anyone = TRUE
	registered_age = null
	icon_state = "syndie_alt"

/obj/item/card/id/syndicate/syndibase_commander
	name = "team leader card"
	registered_name = "leader"
	assignment = "SRB Team Leader"
	originalassignment = "SRB Team Leader"
	has_fluff = TRUE
	registered_age = null
	forged = TRUE
	anyone = TRUE
	registered_age = null
	icon_state = "commander_alt"

/obj/item/card/id
	icon = 'modular_dripstation/icons/obj/card.dmi'
	var/has_fluff
	var/iff_signal = NONE

/obj/item/card/id/proc/ID_fluff()
	var/job = originalassignment
	var/static/list/idfluff = list(
		"Assistant" = list("civillian","green"),
		"Captain" = list("captain","gold"),
		"Head of Personnel" = list("civillian","silver"),
		"Head of Security" = list("HOS","HOS_id"),
		"Chief Engineer" = list("CE","CE_id"),
		"Research Director" = list("RD","RD_id"),
		"Chief Medical Officer" = list("CMO","CMO_id"),
		"Quartermaster" = list("QM","QM_id"),
		"Station Engineer" = list("engineering","yellow"),
		"Atmospheric Technician" = list("engineering","white"),
		"Network Admin" = list("engineering","green"),
		"Medical Doctor" = list("medical","blue"),
		"Geneticist" = list("medical","purple"),
		"Virologist" = list("medical","green"),
		"Chemist" = list("medical","brown"),
		"Paramedic" = list("medical","white"),
		"Psychiatrist" = list("medical","dark_brown"),
		"Scientist" = list("science","purple"),
		"Roboticist" = list("science","black"),
		"Cargo Technician" = list("cargo","dark_brown"),
		"Shaft Miner" = list("cargo","black"),
		"Mining Medic" = list("cargo","blue"),
		"Bartender" = list("civillian","black"),
		"Botanist" = list("civillian","blue"),
		"Cook" = list("civillian","white"),
		"Janitor" = list("civillian","purple"),
		"Curator" = list("civillian","purple"),
		"Chaplain" = list("civillian","black"),
		"Clown" = list("clown","rainbow"),
		"Mime" = list("mime","white"),
		"Artist" = list("civillian","yellow"),
		"Clerk" = list("civillian","blue"),
		"Tourist" = list("civillian","yellow"),
		"Warden" = list("security","black"),
		"Security Officer" = list("security","red"),
		"Detective" = list("security","brown"),
		"Brig Physician" = list("security","blue"),
		"Lawyer" = list("security","purple"),
		"Blueshield" = list("blueshield","nt_id"),
		"Magistrate" = list("nanotrasen","red"),
		"Nanotrasen Representative" = list("nanotrasen","gold"),
		"Explorer" = list("cargo","purple"),
		"Corrections Officer" = list("security","white"),
		"Repair Worker Replika" = list("nanotrasen","silver"),
		"Customs Agent" = list("cargo","red"),
		"Security Consultant" = list("security","silver"),
		"Bridge Assistant" = list("civillian","green"),
	)
	var/static/list/fluffblacklist = list(
		"Deathsquad Officer",
		"SpecOps Officer",
		"CentCom Official",
		"Emergency Response Team Officer",
		"Amber Task Force",
		"Gamma Task Force",
		"Occupying Operative",
		"Emergency Response Team Member",
		"Security Response Operative",
		"Engineer Response Operative",
		"Medical Response Operative",
		"Religious Response Operative",
		"Janitorial Response Operative",
		"Fun Response Operative",
		"Nuclear Squad Operative",
		"Nuclear Squad Leader",
		"Syndicate Overlord",
		"SRB Team",
		"SRB Team Leader",
		"TerraGov Infantryman",
		"TerraGov Military",
		"TerraGov Military Officer",
		"Shellguard Mercenary",
	)
	if(job in idfluff)
		has_fluff = TRUE
	else if(!job || job in fluffblacklist)
		return
	else
		if(has_fluff)
			return
		else
			job = "Assistant" //Loads up the basic green ID
	overlays.Cut()
	overlays += idfluff[job][1]
	overlays += idfluff[job][2]

/obj/item/card/id/nanotrasen
	icon_state = "id_nanotrasen"
	iff_signal = NANOTRASEN_IFF | SPEARHEAD_IFF

/obj/item/card/id/head
	icon_state = "id_head"

/obj/item/card/id/gold/captain
	iff_signal = SPEARHEAD_IFF

/obj/item/card/id/spearhead
	desc = "A card that allows access across the station. Also has Security IFF signal."
	icon_state = "id_spearhead"
	iff_signal = SPEARHEAD_IFF

/obj/item/card/id/head/synthetic
	name = "replika identification card"
	desc = "A card that allows synthetic units access across the station."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/card/id/head/synthetic/GetAccess()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.mind)
			return GLOB.synthetic_base_access + GLOB.synthetic_added_access
	return list()

/obj/item/card/id/mime
	icon_state = "id_mime"

/obj/item/card/id/idtags
	name = "dog ID-tag"
	desc = "A terragov dog tag."
	icon_state = "dogtag"
	item_state = "dogtag"
	has_fluff = TRUE
	//registered_name = "TerraGov Militant"
	assignment = "TerraGov Military"
	originalassignment = "TerraGov Military"
	resistance_flags = UNACIDABLE | ACID_PROOF	//xenos scum
	iff_signal = TERRAGOV_IFF

/obj/item/card/id/idtags/ID_fluff()
	return

/obj/item/card/id/idtags/update_label(newname, newjob)
	if(newname || newjob)
		name = "[(!newname)	? "dog ID-tag"	: "[newname]'s Dog ID-tag"][(!newjob) ? "" : " ([newjob])"]"
		return

	name = "[(!registered_name)	? "dog ID-tag"	: "[registered_name]'s Dog ID-tag"][(!assignment) ? "" : " ([assignment])"]"

//a card that can't register a bank account IC
/obj/item/card/id/idtags/AltClick(mob/living/user)
	return FALSE

/obj/item/card/id/idtags/shellguard
	desc = "A shellguard dog tag."
	//registered_name = "Shellguard Mercenary"
	assignment = "Shellguard Mercenary"
	originalassignment = "Shellguard"
	iff_signal = SHELLGUARD_IFF

/obj/item/card/id/idtags/militech
	desc = "A militech dog tag."
	//registered_name = "Militech Operative"
	assignment = "Militech Operative"
	originalassignment = "Militech"
	iff_signal = HEPHAESTUS_IFF

/obj/item/card/id/hephaestus
	desc = "An ID straight from Hephaestus Industries."
	icon_state = "hephaestus"
	has_fluff = TRUE
	assignment = "Hephaestus Tech"
	originalassignment = "Hephaestus"
	iff_signal = HEPHAESTUS_IFF

/obj/item/card/id/deathsquad
	name = "\improper BlackOps ID"
	desc = "An ID straight from Nanotrasen SpecOps Division."
	icon_state = "deathsquad"
	has_fluff = TRUE
	registered_name = "BlackOps Operative"
	assignment = "Death Commando"
	originalassignment = "Death Commando"
	registered_age = null
	iff_signal = NANOTRASEN_IFF | DEATHSQUAD_IFF

obj/item/card/id/centcom
	icon_state = "centcom"
	originalassignment = "CentCom"
	has_fluff = TRUE
	iff_signal = NANOTRASEN_IFF

/obj/item/card/id/centcom/Initialize(mapload)
	access = get_centcom_access("CentCom Official")
	access += ACCESS_WEAPONS
	access += ACCESS_HEADS
	. = ..()

/obj/item/card/id/centcom/silver/Initialize(mapload)
	access += get_centcom_access("Research Officer")
	. = ..()

/obj/item/card/id/centcom/gold/Initialize(mapload)
	access = get_all_accesses()
	access += get_centcom_access("CentCom Commander")
	. = ..()

/obj/item/card/id/centcom/silver
	name = "\improper silver CentCom ID"
	desc = "A silver ID straight from Central Command."
	icon_state = "centcom_silver"
	originalassignment = "CentCom Officer"
	iff_signal = NANOTRASEN_IFF | DEATHSQUAD_IFF

/obj/item/card/id/centcom/gold
	name = "\improper gold CentCom ID"
	desc = "A gold ID straight from Central Command."
	icon_state = "centcom_gold"
	originalassignment = "CentCom Officer"
	iff_signal = NANOTRASEN_IFF | DEATHSQUAD_IFF

/obj/item/card/id/ert
	icon_state = "ERT_empty"
	assignment = "Emergency Response Operative"
	originalassignment = "CentCom"
	iff_signal = NANOTRASEN_IFF

/obj/item/card/id/ert/Initialize(mapload)
	access += get_region_accesses(1)
	access = list(ACCESS_SECURITY,ACCESS_BRIG,ACCESS_WEAPONS,ACCESS_SEC_DOORS,ACCESS_MAINT_TUNNELS, ACCESS_HEADS, ACCESS_MEDICAL, ACCESS_MORGUE)
	access += get_centcom_access("VIP Guest")
	. = ..()

/obj/item/card/id/ert/amber
	icon_state = "ERT_amber"
	assignment = "Amber Soldier"
	originalassignment = "Amber Task Force"
	has_fluff = TRUE

/obj/item/card/id/ert/gamma
	name = "\improper SpecOps ID"
	desc = "An ID straight from Nanotrasen SpecOps Division."
	icon_state = "ERT_gamma"
	has_fluff = TRUE
	registered_name = "SpecOps Operative"
	assignment = "SpecOps Officer"
	originalassignment = "Gamma Task Force"

/obj/item/card/id/ert/gamma/Initialize(mapload)
	access = get_all_accesses()+get_ert_access("commander")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/occupying
	icon_state = "ERT_occ"
	assignment = "Peacekeeping Operative"
	originalassignment = "Occupying Operative"
	has_fluff = TRUE

/obj/item/card/id/ert/leader
	icon_state = "ERT_leader"
	assignment = "Emergency Response Team Officer"
	originalassignment = "Centcom Officer"
	has_fluff = TRUE

/obj/item/card/id/ert/leader/Initialize(mapload)
	access = get_all_accesses()+get_ert_access("commander")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/Security
	icon_state = "ERT_security"
	assignment = "Detaining Response Specialist"
	assignment = "Centcom"
	has_fluff = TRUE

/obj/item/card/id/ert/Security/Initialize(mapload)
	access += get_ert_access("sec")
	. = ..()

/obj/item/card/id/ert/Engineer
	icon_state = "ERT_engineering"
	originalassignment = "Engineer Response Specialist"
	originalassignment = "Centcom Engineer"
	has_fluff = TRUE

/obj/item/card/id/ert/Engineer/Initialize(mapload)
	access += get_region_accesses(5)
	access += get_ert_access("engi")
	. = ..()

/obj/item/card/id/ert/Medical
	icon_state = "ERT_medical"
	originalassignment = "Medical Response Specialist"
	originalassignment = "Centcom Medic"
	has_fluff = TRUE

/obj/item/card/id/ert/Medical/Initialize(mapload)
	access += get_region_accesses(3)
	access += get_ert_access("med")
	. = ..()

/obj/item/card/id/ert/chaplain
	icon_state = "ERT_chaplain"
	originalassignment = "Religious Response Specialist"
	originalassignment = "Centcom Chap"
	has_fluff = TRUE

/obj/item/card/id/ert/chaplain/Initialize(mapload)
	access += get_ert_access("sec")
	. = ..()

/obj/item/card/id/ert/Janitor
	icon_state = "ERT_janitorial"
	originalassignment = "Janitorial Response Specialist"
	originalassignment = "Centcom Janitor"
	has_fluff = TRUE

/obj/item/card/id/ert/Janitor/Initialize(mapload)
	access += get_region_accesses(1)
	access += get_ert_access("engi")
	. = ..()

/obj/item/card/id/ert/clown
	icon_state = "ERT_clown"
	originalassignment = "Fun Response Specialist"
	originalassignment = "Centcom Clown"
	has_fluff = TRUE

/obj/item/card/id/makeshift
	icon = 'modular_dripstation/icons/obj/card.dmi'
