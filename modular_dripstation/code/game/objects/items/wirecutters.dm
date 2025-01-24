/obj/item/wirecutters
	/// Used on Initialize, how much time to cut cable restraints and zipties.
	var/snap_time_weak_handcuffs = 0 SECONDS
	/// Used on Initialize, how much time to cut real handcuffs. Null means it can't.
	var/snap_time_strong_handcuffs = 1 SECONDS

/obj/item/wirecutters/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/cuffsnapping, snap_time_weak_handcuffs, snap_time_strong_handcuffs)
