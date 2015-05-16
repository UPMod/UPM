/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorMapClick.sqf

Description:
	Spectator MapClick

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_7(_control,_button,_posX,_posY,_shift,_ctrl,_alt);

private [
	"_cam",
	"_worldPos"
];

if (_button == 0) then {

	// missionNamespace getVariable ["upm_tools_camera",objNull];
	_cam = GETMVAR(GVAR(camera),objNull);

	_worldPos = _control ctrlMapScreenToWorld [_posX,_posY];

	_cam setPos [
		_worldPos select 0,
		_worldPos select 1,
		getPosATL _cam select 2
	];

};