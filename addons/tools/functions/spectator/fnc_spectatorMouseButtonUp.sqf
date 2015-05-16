/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorMouseButtonUp.sqf

Description:
	Spectator Mouse Button Up

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_7(_control,_button,_mX,_mY,_shift,_ctrl,_alt);

private [
	"_cam"
];

// missionNamespace getVariable ["upm_tools_camera",objNull];
_cam = GETMVAR(GVAR(camera),objNull);

if (_button > 0) then {
	GVAR(RMB) = false;
	GVAR(RMBclick) = [0,0];
} else {
	GVAR(LMB) = false;
	GVAR(LMBclick) = [0,0];
};

GVAR(cameraPitchBank) = _cam call BIS_fnc_getPitchBank;