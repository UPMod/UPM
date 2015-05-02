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

if (!hasInterface) exitWith{};

["RUN INIT TOOLS",0] call FUNC(debug);

if !(player in GVAR(listPlayers)) exitWith {

	[player] spawn { sleep 0.5; "UPM Debug/Spectator" hintC format["%1 not have permissions for run debug/spectator tools",_this select 0];};

	[format["%1",player],3] call FUNC(debug);
};

["INIT"] spawn FUNC(toolsHandle);

[format["%1",player],2] call FUNC(debug);