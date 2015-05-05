/****************************************************************

Author(s):
	oscarmolinadev

File:
	XEH_preInit.sqf

Description:
	Init global variables

Performance:
	0 ms

Parameter(s):
	NOTHING

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

if (!isServer && hasInterface ) exitWith {};
/*
[{


//diag_log text "addPerFrame loop 1";


}, 5] call CBA_fnc_addPerFrameHandler;


[{


//diag_log text "addPerFrame loop 2";


}, 5] call CBA_fnc_addPerFrameHandler;*/