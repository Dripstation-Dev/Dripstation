/obj/machinery/rnd/production/circuit_imprinter/department
	name = "department circuit imprinter"
	desc = "A special circuit imprinter with a built in interface meant for departmental usage, with built in ExoSync receivers allowing it to print designs researched that match its ROM-encoded department type."
	icon_state = "circuit_imprinter"
	circuit = /obj/item/circuitboard/machine/circuit_imprinter/department
	requires_console = FALSE

/obj/machinery/rnd/production/circuit_imprinter/department/science
	name = "department circuit imprinter (Science)"
	circuit = /obj/item/circuitboard/machine/circuit_imprinter/department/science
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_SCIENCE
	department_tag = "Science"

/obj/machinery/rnd/production/circuit_imprinter/department/netmin
	name = "hardware printer"
	desc = "Exclusively manufactures hardware for the Network Admin."
	circuit = /obj/item/circuitboard/machine/circuit_imprinter/department/netmin
	categories = list("Computer Parts")
	allowed_department_flags = DEPARTMENTAL_FLAG_NETMIN
	department_tag = "Network Administration"
