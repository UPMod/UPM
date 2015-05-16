/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorMouseZChanged.sqf

Description:
	Spectator Mouse Z Changed

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_2(_control,_scrBarZ);

private [
	"_display",
	"_ctrlMap",
	"_cam",
	"_camPos","_camVector","_vX","_vY","_vZ","_dZ"
];

//uiNameSpace getVariable ["upm_RscTools",displayNull];
_display = GETUVAR(upm_RscTools,displayNull);

_ctrlMap = _display displayCtrl D_CB_MAP;

if !(ctrlEnabled _ctrlMap) then {

	// missionNamespace getVariable ["upm_tools_camera",objNull];
	_cam = GETMVAR(GVAR(camera),objNull);

	_camVector = vectorDir _cam;

	_dZ = (_scrBarZ) * 10;
	_vX = (_camVector select 0) * _dZ;
	_vY = (_camVector select 1) * _dZ;
	_vZ = (_camVector select 2) * _dZ;

	_camPos = getPosASL _cam;

	_camPos = [
		(_camPos select 0) + _vX,
		(_camPos select 1) + _vY,
		(_camPos select 2) + _vZ
	];
	_camPos set [2,(_camPos select 2) max (getTerrainHeightASL _camPos)];

	_cam setPosASL _camPos;
};