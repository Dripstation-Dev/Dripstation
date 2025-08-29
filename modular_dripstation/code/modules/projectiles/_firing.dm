/obj/item/ammo_casing/proc/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread, atom/fired_from, cd_override_arg = FALSE)
	distro += variance
	var/targloc = get_turf(target)
	ready_proj(target, user, quiet, zone_override, fired_from)
	var/obj/projectile/thrown_proj
	if(pellets == 1)
		if(distro) //We have to spread a pixel-precision bullet. throw_proj was called before so angles should exist by now...
			if(randomspread)
				spread = round((rand() - 0.5) * distro)
			else //Smart spread
				spread = round(1 - 0.5) * distro
		thrown_proj = throw_proj(target, targloc, user, params, spread, fired_from)
		if(isnull(thrown_proj))
			return FALSE
	else
		if(isnull(projectile_type))
			return FALSE
		AddComponent(/datum/component/pellet_cloud, projectile_type, pellets)

	var/next_delay = click_cooldown_override || CLICK_CD_RANGE
	if(cd_override_arg)
		next_delay = cd_override_arg
	else if(HAS_TRAIT(user, TRAIT_DOUBLE_TAP))
		next_delay = round(next_delay * 0.5)
	user.changeNext_move(next_delay)

	if(!tk_firing(user, fired_from))
		user.newtonian_move(get_dir(target, user))
	else if(ismovable(fired_from))
		var/atom/movable/firer = fired_from
		if(!firer.newtonian_move(get_dir(target, fired_from), instant = TRUE))
			var/throwtarget = get_step(fired_from, get_dir(target, fired_from))
			firer.safe_throw_at(throwtarget, 1, 2)
	update_appearance(UPDATE_ICON)

	SEND_SIGNAL(src, COMSIG_FIRE_CASING, target, user, fired_from, randomspread, spread, zone_override, params, distro, thrown_proj)

	return TRUE

/obj/item/ammo_casing/proc/tk_firing(mob/living/user, atom/fired_from)
	return fired_from != user && !user.contains(fired_from)
