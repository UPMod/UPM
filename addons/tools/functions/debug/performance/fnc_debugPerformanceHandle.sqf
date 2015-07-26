/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugPerformanceHandle.sqf

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
		['CLOSE'] call FUNC(debugEnvironmentHandle);
		['CLOSE'] call FUNC(debugGroupsHandle);
		['CLOSE'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE'] call FUNC(debugHelisHandle);
		['CLOSE'] call FUNC(debugLightVehiclesHandle);
		['CLOSE'] call FUNC(debugNavalHandle);
		['CLOSE'] call FUNC(debugPlanesHandle);
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW PERFORMANCE
		_window = _display displayCtrl D_C_WPERFORMANCE;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WPERFORMANCE, true];

		GVAR(performanceWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugPerformanceHandle);


		// START
		['OPEN_GENERAL'] call FUNC(debugPerformanceHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW PERFORMANCE
		_window = _display displayCtrl D_C_WPERFORMANCE;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WPERFORMANCE, false];

		GVAR(performanceWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHPERFORMANCE;
		ctrlSetText [D_C_WHPERFORMANCE, "PERFORMANCE -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CPERFORMANCEGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPERFORMANCEGENERAL, true];

		GVAR(performanceGeneral) = true;

    	// CLEAN CONTENT


	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CPERFORMANCEGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPERFORMANCEGENERAL, false];

		GVAR(performanceGeneral) = false;
	};
};