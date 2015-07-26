/****************************************************************

Author(s):
	oscarmolinadev

File:
	XEH_postInit.sqf

Description:
	Run

Performance:
	0 ms

Parameter(s):
	NOTHING

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

if (!isServer && hasInterface ) exitWith {};

if !(GVAR(start)) exitWith{};

// INIT ALL GROUPS
[] call FUNC(groupsHandleInit);