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

PARAMS_3(_logic,_units,_activated);

private ["_playersList"];

if !(_activated) exitWith {};

_playersList = call compile (_logic getVariable ["NamePlayers", "[]"]);

if (isNil "_playersList") then {
  _playersList = [];
};

GVAR(listPlayers) = _playersList;

["MODULE [TOOLS] ACTIVATED SUCCESFULLY!",0] call FUNC(debug);