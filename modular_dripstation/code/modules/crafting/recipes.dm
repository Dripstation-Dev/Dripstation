/datum/crafting_recipe/ashtray
	name = "Plastic ashtray"
	result = /obj/item/ashtray
	time = 2 SECONDS
	reqs = list (
		/obj/item/stack/sheet/plastic = 3
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/ashtray_brown
	name = "Brown iron ashtray"
	result = /obj/item/ashtray/bronze
	time = 2 SECONDS
	reqs = list (
		/obj/item/stack/sheet/metal = 3
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/ashtray_glass
	name = "Glass ashtray"
	result = /obj/item/ashtray/bronze
	time = 2 SECONDS
	reqs = list (
		/obj/item/ashtray/glass = 3
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/ashtray_black
	name = "Black iron ashtray"
	result = /obj/item/ashtray/black
	time = 2 SECONDS
	reqs = list (
		/obj/item/stack/sheet/metal = 3
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/ashtray_black_small
	name = "Small black iron ashtray"
	result = /obj/item/ashtray/black
	time = 2 SECONDS
	reqs = list (
		/obj/item/stack/sheet/metal = 2
	)
	tool_paths = list(/obj/item/weldingtool)
	category = CAT_STRUCTURES

/datum/crafting_recipe/wreath
	name = "Watcher Wreath"
	result = /obj/item/clothing/neck/wreath
	time = 2 SECONDS
	reqs = list(
		/obj/item/stack/sheet/bone = 2,
		/obj/item/stack/sheet/sinew = 2,
		/obj/item/stack/ore/diamond = 2,
		/obj/item/crusher_trophy/watcher_wing = 1,
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/icewreath
	name = "Icewing Wreath"
	result = /obj/item/clothing/neck/wreath/icewing
	time = 2 SECONDS
	reqs = list(
		/obj/item/stack/sheet/bone = 1,
		/obj/item/stack/sheet/sinew = 1,
		/obj/item/stack/ore/diamond = 2,
		/obj/item/crusher_trophy/watcher_wing/ice_wing = 1,
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/bonetalisman
	name = "Bone Talisman"
	result = /obj/item/clothing/accessory/talisman
	time = 2 SECONDS
	reqs = list(
		/obj/item/stack/sheet/bone = 2,
		/obj/item/stack/sheet/sinew = 1,
	)
	category = CAT_CLOTHING
