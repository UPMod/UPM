/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	Nelson - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorMove.sqf

Description:
	Spectator move - Nelson's solution for key lag

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_4(_dX,_dY,_dZ,_coef);

private ["_cam","_dir","_camPos"];

// missionNamespace setVariable ["upm_tools_camera",_cam];
_cam = GETMVAR(GVAR(camera),objNull);

_pos = getPosASL _cam;
_dir = (direction _cam) + _dX * 90;

_camPos = [
	(_pos select 0) + ((sin _dir) * _coef * _dY),
	(_pos select 1) + ((cos _dir) * _coef * _dY),
	(_pos select 2) + _dZ * _coef
];

_camPos set [2,(_camPos select 2) max (getTerrainHeightASL _camPos)];
_cam setPosASL _camPos;