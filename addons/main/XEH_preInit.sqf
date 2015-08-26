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

GVAR(start) = false;

GVAR(listHcs) = [];
GVAR(timeLoopHC) = 1;