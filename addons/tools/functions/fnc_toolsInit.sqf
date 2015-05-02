/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_moduleActivateTools.sqf

Description:


Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

["RUN INIT TOOLS",0] call FUNC(debug);

if !(player in GVAR(listPlayers)) exitWith{};

[format["%1",player],2] call FUNC(debug);
