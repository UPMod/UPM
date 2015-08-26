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

_hcList = call compile (_logic getVariable ["ListHCs", "[]"]);
_hcTimeLoop = _logic getVariable ["TimeHCs", 1];

if (isNil "_hcList") then {
  _hcList = [];
};

GVAR(listHcs) = _hcList;

if (isNil "_hcTimeLoop") then {
  _hcTimeLoop = 1;
};

GVAR(timeLoopHC) = _hcTimeLoop;

GVAR(start) = true;

["MODULE [RUN] ACTIVATED SUCCESFULLY!",0] call FUNC(debug);