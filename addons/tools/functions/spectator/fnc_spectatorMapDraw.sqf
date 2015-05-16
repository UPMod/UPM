/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorMapDraw.sqf

Description:
	Spectator Map Draw

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_1(_control);

private [
	"_cam"
];

// missionNamespace getVariable ["upm_tools_camera",objNull];
_cam = GETMVAR(GVAR(camera),objNull);

//[texture, color, position, width, height, angle, text, shadow]
_control drawIcon [
	GVAR(cameraIcon),
	[0,1,1,1],
	position _cam,
	32,
	32,
	direction _cam,
	"",
	1
];