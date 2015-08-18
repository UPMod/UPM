/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_moduleRun.sqf

Description:


Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

GVAR(start) = true;

["MODULE [RUN] ACTIVATED SUCCESFULLY!",0] call FUNC(debug);