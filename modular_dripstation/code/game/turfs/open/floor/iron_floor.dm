/turf/open/floor/iron
	icon_state = "iron"
	base_icon_state = "iron"
	icon = 'modular_dripstation/icons/turf/floors.dmi'
	floor_tile = /obj/item/stack/tile/iron

/turf/open/floor/iron/edge
	icon_state = "iron_edge"
	base_icon_state = "iron_edge"
	floor_tile = /obj/item/stack/tile/iron/edge

/turf/open/floor/iron/half
	icon_state = "iron_half"
	base_icon_state = "iron_half"
	floor_tile = /obj/item/stack/tile/iron/half

/turf/open/floor/iron/corner
	icon_state = "iron_corner"
	base_icon_state = "iron_corner"
	floor_tile = /obj/item/stack/tile/iron/corner

/turf/open/floor/iron/large
	icon_state = "iron_large"
	base_icon_state = "iron_large"
	floor_tile = /obj/item/stack/tile/iron/large

/obj/item/stack/tile/iron
	name = "iron tile"
	singular_name = "floor tile"
	icon_state = "tile_iron"
	icon = 'modular_dripstation/icons/obj/tile.dmi'
	turf_type = /turf/open/floor/iron
	merge_type = /obj/item/stack/tile/iron

/obj/item/stack/tile/iron/edge
	name = "edge iron tile"
	singular_name = "edged iron floor tile"
	icon_state = "tile_iron_edge"
	turf_type = /turf/open/floor/iron/edge
	merge_type = /obj/item/stack/tile/iron/edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/half
	name = "iron half tile"
	singular_name = "halved iron floor tile"
	icon_state = "tile_iron_half"
	turf_type = /turf/open/floor/iron/half
	merge_type = /obj/item/stack/tile/iron/half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/corner
	name = "iron corner tile"
	singular_name = "cornered iron floor tile"
	icon_state = "tile_iron_corner"
	turf_type = /turf/open/floor/iron/corner
	merge_type = /obj/item/stack/tile/iron/corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/large
	name = "iron large tile"
	singular_name = "large iron floor tile"
	icon_state = "tile_iron_large"
	turf_type = /turf/open/floor/iron/large
	merge_type = /obj/item/stack/tile/iron/large
