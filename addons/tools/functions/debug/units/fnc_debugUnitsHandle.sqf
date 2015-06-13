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

private [
	"_display",
	"_window"
];

_display = GETUVAR(upm_RscTools,displayNull);

switch (_action) do {
    case "OPEN": {

    	["OPEN UNITS",2] call FUNC(debug);

		_window = _display displayCtrl D_C_WUNITS;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WUNITS, true];

		GVAR(unitsWindow) = true;
    };
    case "CLOSE": {

		["CLOSE UNITS",2] call FUNC(debug);

		_window = _display displayCtrl D_C_WUNITS;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WUNITS, false];

		GVAR(unitsWindow) = false;
	};
};