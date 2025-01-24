/turf/open/floor/plating/asteroid/icerock
	gender = PLURAL
	name = "icy rock"
	desc = "The coarse rock that covers the surface."
	icon = 'modular_dripstation/icons/turf/snow.dmi'
	damaged_dmi = 'modular_dripstation/icons/turf/snow.dmi'
	baseturfs = /turf/open/floor/plating/asteroid/icerock
	icon_state = "icemoon_ground_coarse"
	icon_plating = "icemoon_ground_coarse"
	initial_gas_mix = FROZEN_ATMOS
	slowdown = 0
	base_icon_state = "icemoon_ground_coarse"
	environment_type = "icemoon_ground_coarse"
	flags_1 = NONE
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	planetary_atmos = TRUE
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	digResult = /obj/item/stack/sheet/mineral/snow
	floor_variance = 80
	max_icon_states = 7
	dug = TRUE

/turf/open/floor/plating/asteroid/icerock/lit
	light_range = 2
	light_power = 1

/turf/open/floor/plating/asteroid/icerock/cracked
	floor_variance = 0
	icon_state = "icemoon_ground_cracked"
	base_icon_state = "icemoon_ground_cracked"

/turf/open/floor/plating/asteroid/icerock/smooth
	floor_variance = 0
	icon_state = "icemoon_ground_smooth"
	base_icon_state = "icemoon_ground_smooth"

/turf/open/floor/plating/asteroid/iceberg
	gender = PLURAL
	name = "cracked ice floor"
	desc = "A sheet of solid ice. It seems too cracked to be slippery anymore."
	icon = 'modular_dripstation/icons/turf/snow.dmi'
	damaged_dmi = 'modular_dripstation/icons/turf/snow.dmi'
	baseturfs = /turf/open/floor/plating/asteroid/iceberg
	icon_state = "iceberg"
	icon_plating = "iceberg"
	initial_gas_mix = FROZEN_ATMOS
	slowdown = 0
	base_icon_state = "iceberg"
	environment_type = "iceberg"
	flags_1 = NONE
	planetary_atmos = TRUE
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	floor_variance = 40
	max_icon_states = 7
	flammability = -5

/turf/open/floor/plating/asteroid/iceberg/lit
	light_range = 2
	light_power = 1

/turf/open/floor/plating/ice/deep
	icon_state = "ice"
	icon = 'modular_dripstation/icons/turf/snow.dmi'
	damaged_dmi = 'modular_dripstation/icons/turf/snow.dmi'

/turf/open/floor/plating/ice/deep/iceberg
	name = "cracked ice floor"
	desc = "A sheet of solid ice. It looks cracked, yet still slippery."
	icon_state = "ice1"
	icon = 'modular_dripstation/icons/turf/snow.dmi'
	damaged_dmi = 'modular_dripstation/icons/turf/snow.dmi'

/turf/open/floor/plating/ice/deep/iceberg/Initialize(mapload, inherited_virtual_z)
	. = ..()
	icon_state = "ice[rand(1,8)]"

/turf/open/floor/plating/ice/deep/iceberg/lit
	light_range = 2
	light_power = 1

/turf/open/lava/plasma
	baseturfs = /turf/open/lava/plasma
	icon = 'modular_dripstation/icons/turf/liquidplasma.dmi'
	mask_icon = 'icons/turf/floors/lava_mask.dmi'
	icon_state = "liquidplasma-255"
	mask_state = "liquidplasma-255"
	base_icon_state = "liquidplasma"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_LAVA
	canSmoothWith = SMOOTH_GROUP_FLOOR_LAVA

/turf/open/lava/plasma/ice_moon/deep
	initial_gas_mix = FROZEN_ATMOS

// Chasms for Ice moon, with planetary atmos and glow
/turf/open/chasm/icemoon
	icon = 'icons/turf/floors/icechasms.dmi'
	icon_state = "icechasms-255"
	base_icon_state = "icechasms"
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/chasm/icemoon
	light_range = 1.9
	light_power = 0.65
	light_color = LIGHT_COLOR_PURPLE

/turf/open/chasm/icemoon/deep
	initial_gas_mix = FROZEN_ATMOS