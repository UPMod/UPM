/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorMouseButtonDown.sqf

Description:
	Spectator Mouse Button Down

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
	GVAR(RMB) = true;
	GVAR(RMBclick) = [_mX,_mY];
} else {
	GVAR(LMB) = true;
	GVAR(LMBclick) = [_mX,_mY];
};

GVAR(cameraPitchBank) = _cam call BIS_fnc_getPitchBank;