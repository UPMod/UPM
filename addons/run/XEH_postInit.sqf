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

// Loop for init all groups every time needed
[FUNC(handleGroupInit), 20] call CBA_fnc_addPerFrameHandler;