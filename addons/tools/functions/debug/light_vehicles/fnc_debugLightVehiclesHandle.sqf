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
    	["OPEN LIGHT VEHICLES",2] call FUNC(debug);
		GVAR(lightVehiclesWindow) = true;
    };
    case "CLOSE": {
		["CLOSE LIGHT VEHICLES",2] call FUNC(debug);
		GVAR(lightVehiclesWindow) = false;
	};
};