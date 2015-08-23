/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugTmpInit.sqf

Description:
	Tests purposes

Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

PARAMS_2(_args,_pfh);

// TEST MARKERS 2D
{
	_unit = _x;

	SETVAR(_unit,GVAR(debugMarker),true);

} count GVAR(listUnits) > 0;

{
	_lightVehicle = _x;

	SETVAR(_lightVehicle,GVAR(debugMarker),true);

} count GVAR(listLightVehicles) > 0;


{
	_heavyVehicle = _x;

	SETVAR(_heavyVehicle,GVAR(debugMarker),true);

} count GVAR(listHeavyVehicles) > 0;

{
	_heli = _x;

	SETVAR(_heli,GVAR(debugMarker),true);

} count GVAR(listHelis) > 0;

{
	_plane = _x;

	SETVAR(_plane,GVAR(debugMarker),true);

} count GVAR(listPlanes) > 0;

{
	_naval = _x;

	SETVAR(_naval,GVAR(debugMarker),true);

} count GVAR(listNaval) > 0;

{
	_static = _x;

	SETVAR(_static,GVAR(debugMarker),true);

} count GVAR(listStatics) > 0;

{
	_grp = _x;

	SETVAR(_grp,GVAR(debugMarker),true);
	SETVAR(_grp,GVAR(debugWaypoints),true);

} count GVAR(listGroups) > 0;


[_pfh] call CBA_fnc_removePerFrameHandler;