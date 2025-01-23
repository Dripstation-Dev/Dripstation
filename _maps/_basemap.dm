//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

/* Dripstation edit
#include "map_files\generic\CentCom.dmm"
*/
#include "map_files\generic_drip\DripCentCom.dmm"	//dripstation edit

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\mining\Lavaland.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "map_files\YogStation\Yogstation.dmm"
		#include "map_files\IceMeta\IceMeta.dmm"
		#include "map_files\IceMeta_drip\IceMeta_drip.dmm"
		#include "map_files\GaxStation\GaxStation.dmm"
		#include "map_files\AsteroidStation\AsteroidStation.dmm"
		#include "map_files\DonutStation\DonutStation.dmm"
		#ifdef TRAVISBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
