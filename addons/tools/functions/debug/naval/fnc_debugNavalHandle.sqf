/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_toolsHandle.sqf

Description:


Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

PARAMS_1(_action);

switch (_action) do {
    case "OPEN": {
    	["OPEN NAVAL",2] call FUNC(debug);
		GVAR(navalWindow) = true;
    };
    case "CLOSE": {
		["CLOSE NAVAL",2] call FUNC(debug);
		GVAR(navalWindow) = false;
	};
};