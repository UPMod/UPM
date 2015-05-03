/****************************************************************

Author(s):
	oscarmolinadev

File:
	XEH_preInit.sqf

Description:
	Init global variables

Performance:
	0 ms

Parameter(s):
	NOTHING

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

GVAR(listPlayers) = [];


UPM_Tools_LMB = false;
UPM_Tools_RMB = false;
UPM_Tools_keys = [];
UPM_Tools_LMBclick = [0,0];
UPM_Tools_RMBclick = [0,0];
UPM_Tools_pitchbank = [0,0];
UPM_Tools_fov = 0.7;
UPM_Tools_iconCamera = "";
UPM_Tools_vision = 0;
UPM_Tools_visibleHUD = true;
UPM_Tools_placeHolder = objNull;