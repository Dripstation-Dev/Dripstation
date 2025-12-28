/obj/item/disk/design_disk/illegal_ammo
	name = "Ammo Design Disk"
	desc = "A disk containing designs for both standard and non-standard bullet designs."
	icon_state = "datadisk1"
	var/list/ammo_types = list(/datum/design/shotgun_slug, /datum/design/buckshot_shell, /datum/design/shotgun_dart, /datum/design/incendiary_slug, /datum/design/breaching_slug, /datum/design/a357, /datum/design/a357/ironfeather, 
								/datum/design/c10mm, /datum/design/c10mm/ap, /datum/design/c10mm/hp, /datum/design/c10mm/inc, /datum/design/c10mm/emp, /datum/design/c9mm, /datum/design/c45, /datum/design/box_a357, /datum/design/box_a357/nutcracker, /datum/design/box_a357/metalshock, /datum/design/box_a357/heartpiercer, /datum/design/box_a357/wallstake)

/obj/item/disk/design_disk/illegal_ammo/Initialize(mapload)
	. = ..()
	max_blueprints = ammo_types.len
	for(var/design in ammo_types)
		var/datum/design/new_design = design
		blueprints += new new_design

/obj/item/disk/design_disk/illegal_ammo/on_upload(datum/techweb/stored_research)
	for(var/datum/design/found_design in blueprints)
		stored_research.add_design(found_design)
	return

/datum/design/c38_sec
	name = ".38 Rubber Bullet"
	desc = "Designed to reload .38 revolvers."
	id = "sec_38"
	build_type = PROTOLATHE
	build_path = /obj/item/ammo_casing/c38/rubber
	materials = list(/datum/material/iron = 1500)
	reagents_list = list(/datum/reagent/gunpowder = 2)
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c38_sec/lethal
	name = ".38 Lethal Bullet"
	desc = "Designed to reload .38 revolvers."
	id = "sec_38_lethal"
	build_path = /obj/item/ammo_casing/c38
	departmental_flags = DEPARTMENTAL_FLAG_ARMORY

/datum/design/beanbag_slug
	name = "Beanbag Slug"
	id = "sec_beanbag_slug"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1800, /datum/material/glass = 200)
	reagents_list = list(/datum/reagent/gunpowder = 3)
	build_path = /obj/item/ammo_casing/shotgun/beanbag
	category = list("Ammo")

/datum/design/rubbershot
	name = "Rubber Shot"
	id = "sec_rshot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200, /datum/material/glass = 800)
	reagents_list = list(/datum/reagent/gunpowder = 3)
	build_path = /obj/item/ammo_casing/shotgun/rubbershot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_CARGO

/datum/design/shotgun_slug
	name = "Shotgun Slug"
	id = "shotgun_slug"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 800, /datum/material/titanium = 20)
	reagents_list = list(/datum/reagent/gunpowder = 3)
	build_path = /obj/item/ammo_casing/shotgun
	category = list("Ammo")

/datum/design/buckshot_shell
	name = "Buckshot Shell"
	id = "buckshot_shell"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200, /datum/material/glass = 800)
	reagents_list = list(/datum/reagent/gunpowder = 4)
	build_path = /obj/item/ammo_casing/shotgun/buckshot
	category = list("Ammo")

/datum/design/shotgun_dart
	name = "Shotgun Dart"
	id = "shotgun_dart"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	reagents_list = list(/datum/reagent/gunpowder = 3)
	build_path = /obj/item/ammo_casing/shotgun/dart
	category = list("Ammo")

/datum/design/incendiary_slug
	name = "Incendiary Slug"
	id = "incendiary_slug"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500, /datum/material/plasma = 20)
	reagents_list = list(/datum/reagent/gunpowder = 4)
	build_path = /obj/item/ammo_casing/shotgun/incendiary
	category = list("Ammo")

/datum/design/breaching_slug
	name = "Breaching Slug"
	desc = "A 12 gauge anti-material slug. Great for breaching airlocks and windows with minimal shots."
	id = "brslug"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/titanium = 20)
	reagents_list = list(/datum/reagent/gunpowder = 3)
	build_path = /obj/item/ammo_casing/shotgun/breacher
	category = list("Ammo")

/datum/design/a357
	name = ".357 Bullet"
	id = "a357"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/titanium = 20)
	reagents_list = list(/datum/reagent/gunpowder = 3)
	build_path = /obj/item/ammo_casing/a357
	category = list("Ammo")

/datum/design/a357/ironfeather
	name = ".357 Ironfeather Bullet"
	id = "a357_ironfeather"
	build_path = /obj/item/ammo_casing/a357/ironfeather

/datum/design/c10mm
	name = "Ammo Box (10mm)"
	id = "c10mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 30000, /datum/material/titanium = 200)
	reagents_list = list(/datum/reagent/gunpowder = 50)
	build_path = /obj/item/ammo_box/c10mm
	category = list("Ammo")

/datum/design/c10mm/cs
	name = "Ammo Box (10mm caseless)"
	id = "c10mm_cs"
	build_path = /obj/item/ammo_box/c10mm/cs

/datum/design/c10mm/sp
	name = "Ammo Box (10mm soporific)"
	id = "c10mm_sp"
	build_path = /obj/item/ammo_box/c10mm/sp

/datum/design/c10mm/ap
	name = "Ammo Box (10mm armor-piercing)"
	id = "c10mm_ap"
	materials = list(/datum/material/iron = 45000, /datum/material/titanium = 200, /datum/material/uranium = 300)
	build_path = /obj/item/ammo_box/c10mm/ap
	category = list("Ammo")

/datum/design/c10mm/hp
	name = "Ammo Box (10mm hollow-point)"
	id = "c10mm_hp"
	materials = list(/datum/material/iron = 40000, /datum/material/glass = 5000)
	reagents_list = list(/datum/reagent/gunpowder = 60)
	build_path = /obj/item/ammo_box/c10mm/hp
	category = list("Ammo")

/datum/design/c10mm/inc
	name = "Ammo Box (10mm incendiary)"
	id = "c10mm_inc"
	materials = list(/datum/material/iron = 40000, /datum/material/glass = 5000, /datum/material/plasma = 300)
	build_path = /obj/item/ammo_box/c10mm/inc
	category = list("Ammo")

/datum/design/c10mm/emp
	name = "Ammo Box (10mm EMP)"
	id = "c10mm_emp"
	materials = list(/datum/material/iron = 40000, /datum/material/glass = 5000, /datum/material/uranium = 300)
	build_path = /obj/item/ammo_box/c10mm/emp
	category = list("Ammo")

/datum/design/c45
	name = "Ammo Box (.45)"
	id = "c45"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 30000, /datum/material/titanium = 200)
	reagents_list = list(/datum/reagent/gunpowder = 50)
	build_path = /obj/item/ammo_box/c45
	category = list("Ammo")

/datum/design/c45/ap
	name = "Ammo Box (.45 armor-piercing)"
	id = "c45ap"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 45000, /datum/material/titanium = 300)
	build_path = /obj/item/ammo_box/c45/ap

/datum/design/c9mm
	name = "Ammo Box (9mm)"
	id = "c9mm"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 30000, /datum/material/titanium = 200)
	reagents_list = list(/datum/reagent/gunpowder = 50)
	build_path = /obj/item/ammo_box/c9mm
	category = list("Ammo")

/datum/design/box_a357
	name = "Ammo Box (.357)"
	id = "box_a357"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 40000, /datum/material/titanium = 400)
	reagents_list = list(/datum/reagent/gunpowder = 70)
	build_path = /obj/item/ammo_box/no_direct/a357
	category = list("Ammo")

/datum/design/box_a357/ironfeather
	name = "Ammo Box (.357 Ironfeather)"
	id = "box_a357_ironfeather"
	build_path = /obj/item/ammo_box/no_direct/a357/ironfeather

/datum/design/box_a357/nutcracker
	name = "Ammo Box (.357 Nutcracker)"
	id = "box_a357_nutcracker"
	materials = list (/datum/material/iron = 60000, /datum/material/titanium = 600)
	build_path = /obj/item/ammo_box/no_direct/a357/nutcracker
	category = list("Ammo")

/datum/design/box_a357/metalshock
	name = "Ammo Box (.357 Metalshock)"
	id = "box_a357_metalshock"
	materials = list (/datum/material/iron = 60000, /datum/material/titanium = 600)
	build_path = /obj/item/ammo_box/no_direct/a357/metalshock
	category = list("Ammo")

/datum/design/box_a357/heartpiercer
	name = "Ammo Box (.357 Heartpiercer)"
	id = "box_a357_heartpiercer"
	materials = list (/datum/material/iron = 60000, /datum/material/titanium = 600)
	build_path = /obj/item/ammo_box/no_direct/a357/heartpiercer
	category = list("Ammo")

/datum/design/box_a357/wallstake
	name = "Ammo Box (.357 Wallstake)"
	id = "box_a357_wallstake"
	materials = list (/datum/material/iron = 60000, /datum/material/titanium = 600)
	build_path = /obj/item/ammo_box/no_direct/a357/wallstake
	category = list("Ammo")

/datum/design/mag_oldsmg
	reagents_list = list(/datum/reagent/gunpowder = 50)

/datum/design/mag_v38
	reagents_list = list(/datum/reagent/gunpowder = 30)

/datum/design/stunshell
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 500, /datum/material/uranium = 100)
	reagents_list = list(/datum/reagent/gunpowder = 4)
	
/datum/design/techshell
	materials = list(/datum/material/iron = 1200, /datum/material/glass = 800, /datum/material/gold = 300)
	reagents_list = list(/datum/reagent/gunpowder = 4)

/*	autolathe
/datum/design/c38_rubber
	name = ".38 Rubber Bullet"
	id = "c38_rubber"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/ammo_casing/c38/rubber
	category = list("initial", "Security")

/datum/design/c38
	name = ".38 Lethal Bullet"
	id = "c38"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/ammo_casing/c38
	category = list("hacked", "Security")
*/
