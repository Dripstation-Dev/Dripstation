// "Geothermal Tap" for relatively hands off power in ruins.
// Mapped ones will delete their circuit to keep them from getting salvaged. Otherwise try to not hand them out willy nilly.
// try and toss these near lava for more fun

/obj/machinery/power/rtg/geothermal
	name = "Geothermal Power Tap"
	desc = "A complex machine that drills into the soil below it to gather thermal power."
	power_gen = 2500
	circuit = /obj/item/circuitboard/machine/rtg/geothermal
	irradiate = FALSE //I don't think the lava is radioactive, if your lava is, well. Then it is.


/obj/machinery/power/rtg/geothermal/Initialize(mapload)
	. = ..()
	if(mapload)
		component_parts -= circuit
		QDEL_NULL(circuit)

/obj/item/circuitboard/machine/rtg/geothermal
	name = "Geothermal Power Tap"
	build_path = /obj/machinery/power/rtg/geothermal
	req_components = list(
	/obj/item/pickaxe/drill = 1,
	/obj/item/stack/cable_coil = 10,
	/obj/item/stock_parts/capacitor = 2,
	/obj/item/stock_parts/micro_laser = 1,
	/obj/item/stock_parts/manipulator = 4)