/****************************************************************

Author(s):
	Karel Moricky
	oscarmolinadev

File:
	fnc_spectatorRotate.sqf

Description:
	Spectator Rotate

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_2(_dX,_dY);

private ["_cam","_pitchBank"];

// missionNamespace setVariable ["upm_tools_camera",_cam];
_cam = GETMVAR(GVAR(camera),objNull);

_pitchBank = _cam call BIS_fnc_getPitchBank;

_cam setDir (direction _cam + _dX);

[
	_cam,
	(_pitchBank select 0) + _dY,
	0
] call BIS_fnc_setPitchBank;