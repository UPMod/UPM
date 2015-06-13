/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugSettingsHandle.sqf

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
    	["OPEN SETTINGS",2] call FUNC(debug);
		GVAR(settingsWindow) = true;
    };
    case "CLOSE": {
		["CLOSE SETTINGS",2] call FUNC(debug);
		GVAR(settingsWindow) = false;
	};
};