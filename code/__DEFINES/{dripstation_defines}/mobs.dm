/// Throw modes, defines whether or not to turn off throw mode after
#define THROW_MODE_DISABLED 0
#define THROW_MODE_TOGGLE 1
#define THROW_MODE_HOLD 2

/// Returns whether or not the given mob can succumb
#define CAN_SUCCUMB(target) (HAS_TRAIT(target, TRAIT_CRITICAL_CONDITION) && !HAS_TRAIT(target, TRAIT_NODEATH))
//#define CAN_SUCCUMB(target) (target.InFullCritical() && !HAS_TRAIT(target, TRAIT_NODEATH))

#define NORMAL_MOB_SHADOW "shadow"
#define LYING_MOB_SHADOW "shadow_lying"

#define COMSIG_REAGENT_EXPOSE_MOB "reagent_expose_mob"
#define COMSIG_HUMAN_ADJUSTED_NUTRIATION "human_gain_nutriation"

/// Checking flags for [/mob/proc/can_read()]
#define READING_CHECK_LITERACY (1<<0)
#define READING_CHECK_LIGHT (1<<1)

///
#define COMSIG_LIVING_GRABRESIST "living_grabresist"