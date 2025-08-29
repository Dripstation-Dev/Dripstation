/// Throw modes, defines whether or not to turn off throw mode after
#define THROW_MODE_DISABLED 0
#define THROW_MODE_TOGGLE 1
#define THROW_MODE_HOLD 2

/// Returns whether or not the given mob can succumb
#define CAN_SUCCUMB(target) (HAS_TRAIT(target, TRAIT_CRITICAL_CONDITION) && !HAS_TRAIT(target, TRAIT_NODEATH))
//#define CAN_SUCCUMB(target) (target.InFullCritical() && !HAS_TRAIT(target, TRAIT_NODEATH))

#define NORMAL_MOB_SHADOW "shadow"
#define LYING_MOB_SHADOW "shadow_lying"

#define MODULE_PASSIVE "passive"
#define MODULE_CAN_ACTIVATE "active"
#define MODULE_USABLE "usable"
#define SEALED_RIG_TRAIT "sealed-rig"
#define COMSIG_RIG_MODULE_SELECTED "module-rig-selected"
#define COMSIG_MODULE_USED "module-used"
