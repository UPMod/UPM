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
		['CLOSE'] call FUNC(debugPerformanceHandle);
		['CLOSE'] call FUNC(debugPlanesHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW SETTINGS
		_window = _display displayCtrl D_C_WSETTINGS;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WSETTINGS, true];

		GVAR(settingsWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugSettingsHandle);


		// START
		['OPEN_GENERAL'] call FUNC(debugSettingsHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW SETTINGS
		_window = _display displayCtrl D_C_WSETTINGS;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WSETTINGS, false];

		GVAR(settingsWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHSETTINGS;
		ctrlSetText [D_C_WHSETTINGS, "SETTINGS -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CSETTINGSGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSETTINGSGENERAL, true];

		GVAR(settingsGeneral) = true;

    	// CLEAN CONTENT


	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CSETTINGSGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSETTINGSGENERAL, false];

		GVAR(settingsGeneral) = false;
	};
};