/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugStaticsHandle.sqf

Description:


Performance:
	0 ms

Parameter(s):
	0: STRING - Action

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

PARAMS_1(_action);

switch (_action) do {
    case "OPEN": {
    	["OPEN STATICS",2] call FUNC(debug);
		GVAR(staticsWindow) = true;
    };
    case "CLOSE": {
		["CLOSE STATICS",2] call FUNC(debug);
		GVAR(staticsWindow) = false;
	};
};