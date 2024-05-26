/obj/machinery/rnd/production/techfab/department
	name = "department techfab"
	desc = "An advanced fabricator designed to print out the latest prototypes and circuits researched from Science. Contains hardware to sync to research networks. This one is department-locked and only possesses a limited set of decryption keys."
	icon_state = "protolathe"
	icon = 'modular_dripstation/icons/obj/machines/techfab.dmi'
	circuit = /obj/item/circuitboard/machine/techfab/department
	material_insertion_animation = "protolathe_"
	var/stripe_icon

/obj/machinery/rnd/production/techfab/department/update_overlays()
	. = ..()
	if(stripe_icon)
		var/mutable_appearance/stripe = mutable_appearance('modular_dripstation/icons/obj/machines/techfab.dmi', stripe_icon)
		. += stripe

	if(!(stat & BROKEN) && powered())
		. += emissive_appearance(icon, "protolathe_ightmask", src)

/obj/machinery/rnd/production/techfab/department/engineering
	name = "department techfab (Engineering)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_ENGINEERING
	department_tag = "Engineering"
	circuit = /obj/item/circuitboard/machine/techfab/department/engineering
	stripe_icon = "stripe_engi"

/obj/machinery/rnd/production/techfab/department/service
	name = "department techfab (Service)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_SERVICE
	department_tag = "Service"
	circuit = /obj/item/circuitboard/machine/techfab/department/service
	stripe_icon = "stripe_service"

/obj/machinery/rnd/production/techfab/department/medical
	name = "department techfab (Medical)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_MEDICAL
	department_tag = "Medical"
	circuit = /obj/item/circuitboard/machine/techfab/department/medical
	stripe_icon = "stripe_medical"

/obj/machinery/rnd/production/techfab/department/cargo
	name = "department techfab (Cargo)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_CARGO
	department_tag = "Cargo"
	circuit = /obj/item/circuitboard/machine/techfab/department/cargo
	stripe_icon = "stripe_cargo"

/obj/machinery/rnd/production/techfab/department/science
	name = "department techfab (Science)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_SCIENCE
	department_tag = "Science"
	circuit = /obj/item/circuitboard/machine/techfab/department/science
	stripe_icon = "stripe_rnd"

/obj/machinery/rnd/production/techfab/department/security
	name = "department techfab (Security)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_SECURITY
	department_tag = "Security"
	circuit = /obj/item/circuitboard/machine/techfab/department/security
	stripe_icon = "stripe_sec"

/obj/machinery/rnd/production/techfab/department/armory
	name = "department techfab (Armory)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_SECURITY|DEPARTMENTAL_FLAG_ARMORY
	department_tag = "Armory"
	circuit = /obj/item/circuitboard/machine/techfab/department/armory
	stripe_icon = "stripe_ammo"
