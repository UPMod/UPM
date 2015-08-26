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

// INIT HEADLESS CLIENT
[] call FUNC(hcInit);

[format["%1",GVAR(timeLoopHC)],2] call FUNC(debug);

// HANDLE HEADLESS CLIENT
[FUNC(hcHandleGroups),1] call CBA_fnc_addPerFrameHandler;

// INIT ALL GROUPS
[] call FUNC(groupsHandleInit);