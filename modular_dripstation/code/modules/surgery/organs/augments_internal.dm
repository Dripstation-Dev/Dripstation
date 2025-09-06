
/obj/item/organ/cyberimp
	var/status = FALSE
	var/complexyty = 1


//[[[[NEURAL]]]]

/obj/item/organ/cyberimp/neural_link
	name = "basic neural link"
	desc = "Neural link is critical for linking cybernetics to the central nervous system. Uses nanotech to establish an interface between the module and the nervous system in the body."
	icon_state = "brain_implant"
	implant_overlay = "brain_implant_overlay"
	slot = ORGAN_SLOT_NEURALWARE
	zone = BODY_ZONE_HEAD
	w_class = WEIGHT_CLASS_TINY
	complexyty = 0
	var/complexyty_holding = 5

/obj/item/organ/cyberimp/neural_link/emp_act(severity)
	. = ..()
	if(!owner || . & EMP_PROTECT_SELF)
		return
	switch severity
		if(1)
			owner.apply_damage(10, STAMINA)
			owner.adjust_confusion(rand(2 SECONDS, 3 SECONDS))
		if(2)
			owner.flash_act()
			owner.apply_damage(20, STAMINA)
			owner.adjust_confusion(rand(4 SECONDS, 6 SECONDS))
