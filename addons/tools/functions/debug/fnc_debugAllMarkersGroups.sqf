/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugAllMarkersGroups.sqf

Description:
	Activate o Deactivate debug marker

Performance:
	0 ms

Parameter(s):
	0: Number 0 (hidden) or 1 (visible)

Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_1(_bool);

{
	_grp = _x;
	SETVAR(_grp,GVAR(debugMarker),_bool);
} count GVAR(listGroups) > 0;