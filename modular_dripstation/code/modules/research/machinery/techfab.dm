
/obj/machinery/rnd/production/techfab/department/security/Initialize(mapload)
	. = ..()
	if(mapload)
		reagents.add_reagent(/datum/reagent/gunpowder, 40)

/obj/machinery/rnd/production/techfab/department/armory/Initialize(mapload)
	. = ..()
	if(mapload)
		reagents.add_reagent(/datum/reagent/gunpowder, 40)
