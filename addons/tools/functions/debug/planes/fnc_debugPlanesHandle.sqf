/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugPlanesHandle.sqf

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
    	["OPEN PLANES",2] call FUNC(debug);
		GVAR(planesWindow) = true;
    };
    case "CLOSE": {
		["CLOSE PLANES",2] call FUNC(debug);
		GVAR(planesWindow) = false;
	};
};