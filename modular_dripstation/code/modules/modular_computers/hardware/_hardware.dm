/obj/item/computer_hardware
	/// If the hardware can be "hotswapped" (ejected when another is installed)
	var/hotswap = FALSE

/obj/item/computer_hardware/hard_drive/proc/process_pre_attack(atom/target, mob/living/user, params)
	return TRUE
