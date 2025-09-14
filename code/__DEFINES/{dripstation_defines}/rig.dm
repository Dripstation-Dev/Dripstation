/// Default value for the max_complexity var on MODsuits
#define DEFAULT_MAX_COMPLEXITY 15
#define PLUS_ONE_MAX_COMPLEXITY 16
#define PLUS_TWO_MAX_COMPLEXITY 17

/// Default cell drain per process on MODsuits
#define DEFAULT_CHARGE_DRAIN 5

#define MODULE_PASSIVE "passive"
#define MODULE_ACTIVE "active"
#define MODULE_TOGGLE "toggle"
#define MODULE_USABLE "usable"

/// This module can be used during phaseout
#define MODULE_ALLOW_PHASEOUT (1<<0)
/// This module can be used while incapacitated
#define MODULE_ALLOW_INCAPACITATED (1<<1)
/// This module can be used while the suit is off
#define MODULE_ALLOW_INACTIVE (1<<2)
