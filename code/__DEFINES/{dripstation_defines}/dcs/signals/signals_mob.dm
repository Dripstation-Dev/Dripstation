/// from /mob/proc/key_down(): (key, client/client, full_key)


#define COMSIG_MOB_KEYDOWN "mob_key_down"

/// Called when an organ gets surgically removed (mob/living/user, mob/living/carbon/old_owner, target_zone, obj/item/tool)
#define COMSIG_ORGAN_SURGICALLY_REMOVED "organ_surgically_removed"


////RIG SIGNALS
/// Rigmod activation signal
#define COMSIG_RIG_TRIGGER_POWER "rig_trigger_power"

/// Called when a RIG activation is called from toggle_activate(mob/user)
#define COMSIG_RIG_ACTIVATE "mod_activate"
	/// Cancels the suit's activation
	#define RIG_CANCEL_ACTIVATE (1 << 0)

#define COMSIG_RIG_MODULE_REMOVAL "mod_module_removal"
	/// Cancels the removal of modules
	#define RIG_CANCEL_REMOVAL (1 << 0)

/// Called when the RIG wearer is set.
#define COMSIG_RIG_WEARER_SET "mod_wearer_set"
/// Called when the RIG wearer is unset.
#define COMSIG_RIG_WEARER_UNSET "mod_wearer_unset"

#define COMSIG_MODULE_ACTIVATED "module-rig-activated"
#define COMSIG_MODULE_DEACTIVATED "module-rig-deactivated"
#define COMSIG_MODULE_TRIGGERED "module-rig-triggered"
#define COMSIG_MODULE_USED "module-used"
/// Called when a projectile dampener captures an object.
#define COMSIG_DAMPENER_CAPTURE "dampener_capture"
/// Called when a projectile dampener releases an object.
#define COMSIG_DAMPENER_RELEASE "dampener_release"

#define COMSIG_RIG_REFLECT "rig_reflect"
	/// Reflects proj
	#define RIG_REFLECT (1 << 0)

#define COMSIG_POSTER_PLACED "place_poster"
