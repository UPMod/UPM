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
};

["INIT"] spawn FUNC(toolsHandle);