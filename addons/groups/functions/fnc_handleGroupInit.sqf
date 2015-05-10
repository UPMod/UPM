/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_handleGroupInit.sqf

Description:
	Build all groups

Performance:
	0 ms

Parameter(s):
	NOTHING

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

private ["_grp"];

{
	_grp = _x;

	_grp call FUNC(groupBuild);

	GVAR(init) = GVAR(init) - [_grp];

} count GVAR(init) > 0;