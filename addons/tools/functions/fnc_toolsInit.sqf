/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_toolsInit.sqf

Description:


Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

if (!hasInterface) exitWith{};

if !(player in GVAR(listPlayers)) exitWith {
	0 spawn { sleep 0.01; ["You not have permissions for run debug/spectator tools", "UPM Debug/Spectator", true, false] call BIS_fnc_guiMessage;};
};

[] call FUNC(debugInit);

["INIT"] call FUNC(toolsHandle);