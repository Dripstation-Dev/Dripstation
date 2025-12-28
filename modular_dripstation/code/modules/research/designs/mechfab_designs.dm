

/datum/design/rig_shell
	name = "RIG Basic hell"
	desc = "A basic shell."
	id = "rig_shell"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 700, /datum/material/glass = 50, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/dualmode_construction/shell
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/rig_helmet
	name = "RIG Basic helmet"
	desc = "A basic helmet."
	id = "rig_helmet"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 700, /datum/material/glass = 50, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/dualmode_construction/helmet
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/rig_chestplate
	name = "RIG Basic chestplate"
	desc = "A basic chestplate."
	id = "rig_chestplate"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 700, /datum/material/glass = 50, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/dualmode_construction/chestplate
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/rig_gauntlets
	name = "RIG Basic gauntlets"
	desc = "A basic gauntlets."
	id = "rig_gauntlets"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 700, /datum/material/glass = 50, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/dualmode_construction/gauntlets
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/rig_boots
	name = "RIG Basic boots"
	desc = "A basic boots."
	id = "rig_boots"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 700, /datum/material/glass = 50, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/dualmode_construction/boots
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/rig_plating
	name = "RIG Basic plating"
	desc = "A basic plating."
	id = "rig_plating"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 700, /datum/material/glass = 50, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/dualmode_construction/plating
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/rig_plating_engineering
	name = "RIG Engineering plating"
	desc = "A engineering plating."
	id = "rig_plating_engineering"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 500, /datum/material/gold = 200, /datum/material/diamond = 10, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/dualmode_construction/plating/engineering
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rig_plating_security
	name = "RIG Security plating"
	desc = "A security plating."
	id = "rig_plating_security"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 400, /datum/material/uranium = 100, /datum/material/diamond = 50, /datum/material/titanium = 700)
	construction_time = 12 SECONDS
	build_path = /obj/item/dualmode_construction/plating/security
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	
/datum/design/digitagrade_module
	name = "RIG Digitagrade Module"
	desc = "A basic module that can converse basic RIG into unathi-fitted one."
	id = "digitagrade_module"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 700, /datum/material/glass = 50, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/digitagrade
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SECURITY

/datum/design/storage_module
	name = "RIG Basic Storage Module"
	desc = "A basic module that can converse free space in RIG into storage."
	id = "storage_module"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 700, /datum/material/glass = 50, /datum/material/titanium = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/storage
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/pepper_shoulders
	name = "RIG Pepper Shoulders Module"
	desc = "A basic security module."
	id = "pepper_shoulders"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 400, /datum/material/glass = 300)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/pepper_shoulders
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/holster_mod
	name = "RIG Holster Module"
	desc = "A basic security module."
	id = "holster_mod"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 400, /datum/material/uranium = 100, /datum/material/titanium = 600)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/holster
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/megaphone
	name = "RIG Megaphone Module"
	desc = "A basic security module."
	id = "megaphone"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 500, /datum/material/glass = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/megaphone
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/active_sonar
	name = "RIG Active Sonar Module"
	desc = "An active sonar module."
	id = "active_sonar"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/iron = 400, /datum/material/uranium = 100, /datum/material/gold = 50)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/active_sonar
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/projectile_dampener
	name = "RIG Projectile Dampener Module"
	desc = "A basic security module."
	id = "projectile_dampener"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/diamond = 200, /datum/material/uranium = 300, /datum/material/gold = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/projectile_dampener
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/stealth_mod
	name = "RIG Stealth Module"
	desc = "A stealth module."
	id = "stealth_mod"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/diamond = 200, /datum/material/uranium = 300, /datum/material/gold = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/stealth
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE 

/datum/design/speed_booster_civilian
	name = "RIG Civilian Speed Booster Module"
	desc = "A civilian speed booster module."
	id = "speed_booster_civilian"
	build_type = PROTOLATHE|MECHFAB
	materials = list(/datum/material/diamond = 100, /datum/material/uranium = 300, /datum/material/gold = 200, /datum/material/bluespace = 200)
	construction_time = 12 SECONDS
	build_path = /obj/item/module/speed_booster/civilian
	category = list("RIG and RIG Modules","RIG Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE 