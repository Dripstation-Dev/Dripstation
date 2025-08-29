#define ui_combo "CENTER+4:24,SOUTH+1:7" //combo meter for martial arts
//#define ui_fov "WEST+4,SOUTH+1"

#define EXPLOITABLE_DEFAULT_TEXT "Used by antagonists. DO NOT PUT SEXUAL THINGS IN HERE. This is where you put flaws that can be exploited in any way. This will be viewable by antagonists if you modify this string, but only if there's anything at all in this box."

/*
// ~field of vision
///from base of client/change_view(): (client, old_view, view)
#define COMSIG_MOB_CLIENT_CHANGE_VIEW "mob_client_change_view"
///from base of mob/reset_perspective(): (atom/target)
#define COMSIG_MOB_RESET_PERSPECTIVE "mob_reset_perspective"
///from base of atom/ShiftClick(): (atom/A) - for return values, see COMSIG_CLICK_SHIFT
#define COMSIG_MOB_CLICKED_SHIFT "mob_shift_click_on"
///from base of mob/visible_atoms(): (list/visible_atoms)

#define COMSIG_MOB_FOV_VIEW "mob_visible_atoms"
	#define COMPONENT_NO_EXAMINATE (1<<0) //cancels examinate completely
	#define COMPONENT_EXAMINATE_BLIND (1<<1) //outputs the "something is there but you can't see it" message.
///from base of get_actual_viewers(): (atom/center, depth, viewers_list)
#define COMSIG_MOB_FOV_VIEWER "mob_is_viewer"
///from base of atom/visible_message(): (atom/A, msg, range, ignored_mobs)
#define COMSIG_MOB_VISIBLE_MESSAGE "mob_get_visible_message"
	#define COMPONENT_NO_VISIBLE_MESSAGE (1<<0) //cancels visible message completely
	#define COMPONENT_VISIBLE_MESSAGE_BLIND (1<<1) //outputs blind message instead
///from base of mob/alt_click_on_secodary(): (atom/A)
#define COMSIG_MOB_ALTCLICKON_TERTIARY "mob_altclickon_tertiary"
///from base of datum/component/field_of_vision/proc/hide_fov()
#define COMSIG_FOV_HIDE "fov_hide"
///from base of datum/component/field_of_vision/proc/show_fovv()
#define COMSIG_FOV_SHOW "fov_show"


#define FOV_90_DEGREES	"90"
#define FOV_180_DEGREES	"180"
#define FOV_180PLUS45_DEGREES "180_45"
#define FOV_180MINUS45_DEGREES "180_315"
#define FOV_270_DEGREES	"270_45"

/proc/get_fov_angle(shadow_angle = FOV_90_DEGREES)
	switch(shadow_angle)
		if(FOV_90_DEGREES, FOV_180_DEGREES, FOV_270_DEGREES)
			return 0
		if(FOV_180MINUS45_DEGREES)
			return -45
		if(FOV_180PLUS45_DEGREES)
			return 45

//viewers() but with a signal, for blacklisting otherwise capable of viewing atoms
/proc/fov_viewers(depth = world.view, atom/center)
	if(!center)
		return
	. = viewers(depth, center)
	for(var/mob/viewer as anything in .)
		SEND_SIGNAL(viewer, COMSIG_MOB_FOV_VIEWER, center, depth, .)

//view() but with a signal, to allow blacklisting some of the otherwise visible atoms.
/proc/fov_view(dist = world.view, atom/center)
	. = view(dist, center)
	SEND_SIGNAL(center, COMSIG_MOB_FOV_VIEW, center, dist, .)
*/

/// Field of vision defines.
#define FOV_90_DEGREES 90
#define FOV_180_DEGREES 180
#define FOV_270_DEGREES 270

/// Base mask dimensions. They're like a client's view, only change them if you modify the mask to different dimensions.
#define BASE_FOV_MASK_X_DIMENSION 15
#define BASE_FOV_MASK_Y_DIMENSION 15

/// Range at which FOV effects treat nearsightness as blind and play
#define NEARSIGHTNESS_FOV_BLINDNESS 2

//Fullscreen overlay resolution in tiles for the clients view.
/// The fullscreen overlay in tiles for x axis
#define FULLSCREEN_OVERLAY_RESOLUTION_X 15
/// The fullscreen overlay in tiles for y axis
#define FULLSCREEN_OVERLAY_RESOLUTION_Y 15

///from base of atom/visible_message(): (atom/A, msg, range, ignored_mobs)
#define COMSIG_MOB_VISIBLE_MESSAGE "mob_get_visible_message"
	#define COMPONENT_NO_VISIBLE_MESSAGE (1<<0) //cancels visible message completely
	#define COMPONENT_VISIBLE_MESSAGE_BLIND (1<<1) //outputs blind message instead
