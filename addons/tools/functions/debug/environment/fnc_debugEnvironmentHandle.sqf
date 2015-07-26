/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugEnvironmentHandle.sqf

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

		// CLOSE ALL
		['CLOSE'] call FUNC(debugGroupsHandle);
		['CLOSE'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE'] call FUNC(debugHelisHandle);
		['CLOSE'] call FUNC(debugLightVehiclesHandle);
		['CLOSE'] call FUNC(debugNavalHandle);
		['CLOSE'] call FUNC(debugPerformanceHandle);
		['CLOSE'] call FUNC(debugPlanesHandle);
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW ENVIRONMENT
		_window = _display displayCtrl D_C_WENVIRONMENT;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WENVIRONMENT, true];

		GVAR(environmentWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugEnvironmentHandle);

		// START
		['OPEN_GENERAL'] call FUNC(debugEnvironmentHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW ENVIRONMENT
		_window = _display displayCtrl D_C_WENVIRONMENT;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WENVIRONMENT, false];

		GVAR(environmentWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHENVIRONMENT;
		ctrlSetText [D_C_WHENVIRONMENT, "ENVIRONMENT -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CENVIRONMENTGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CENVIRONMENTGENERAL, true];

		GVAR(environmentGeneral) = true;

	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CENVIRONMENTGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CENVIRONMENTGENERAL, false];

		GVAR(environmentGeneral) = false;
	};
};