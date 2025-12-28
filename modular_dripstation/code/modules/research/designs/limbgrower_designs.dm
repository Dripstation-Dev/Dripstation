/datum/design/replica_heart
	name = "Replica Heart"
	id = "replicaheart"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/heart/replica
	category = list("replica")

/datum/design/replica_eyes
	name = "augmented vision biocomponent"
	id = "replicaeyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/eyes/robotic/preternis/replica
	category = list("replica")

/datum/design/replica_ears
	name = "auditory biocomponents"
	id = "replicaears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/ears/replica
	category = list("replica")

/datum/design/replica_tongue
	name = "speach biocomponent"
	id = "replicatongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/replica
	category = list("replica")

/datum/design/replica_lungs
	name = "advanced air oxidation biocomponent"
	id = "replicalungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/lungs/replica
	category = list("replica")

/obj/item/disk/design_disk/limbs/replica
	name = "Replica Limb Design Disk"
	limb_designs = list(/datum/design/replica_heart, /datum/design/replica_eyes, /datum/design/replica_ears, /datum/design/replica_tongue, /datum/design/replica_lungs)

/datum/design/limb_disk/replica
	name = "Replica Limb Design Disk"
	desc = "Contains designs for replica organs for the limbgrower."
	id = "limbdesign_replica"
	build_path = /obj/item/disk/design_disk/limbs/replica
