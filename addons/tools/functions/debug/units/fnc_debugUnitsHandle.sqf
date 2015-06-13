/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugUnitsHandle.sqf

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
    	["OPEN UNITS",2] call FUNC(debug);


		_settingsControl = _display displayCtrl D_C_WUNITS;
		_settingsControl ctrlShow true;
		_settingsControl ctrlCommit 0;
		ctrlEnable [D_C_WUNITS, true];

		GVAR(unitsWindow) = true;
    };
    case "CLOSE": {
		["CLOSE UNITS",2] call FUNC(debug);
		GVAR(unitsWindow) = false;
	};
};