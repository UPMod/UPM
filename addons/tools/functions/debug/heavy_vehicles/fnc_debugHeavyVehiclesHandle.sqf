/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugHeavyVehiclesHandle.sqf

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
		['CLOSE'] call FUNC(debugHelisHandle);
		['CLOSE'] call FUNC(debugLightVehiclesHandle);
		['CLOSE'] call FUNC(debugNavalHandle);
		['CLOSE'] call FUNC(debugPerformanceHandle);
		['CLOSE'] call FUNC(debugPlanesHandle);
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW HEAVYVEHICLES
		_window = _display displayCtrl D_C_WHEAVYVEHICLES;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WHEAVYVEHICLES, true];

		GVAR(heavyVehiclesWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHeavyVehiclesHandle);

		// START
		['OPEN_GENERAL'] call FUNC(debugHeavyVehiclesHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW HEAVYVEHICLES
		_window = _display displayCtrl D_C_WHEAVYVEHICLES;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WHEAVYVEHICLES, false];

		GVAR(heavyVehiclesWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHHEAVYVEHICLES;
		ctrlSetText [D_C_WHHEAVYVEHICLES, "HEAVY VEHICLES -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CHEAVYVEHICLESGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESGENERAL, true];

		GVAR(heavyVehiclesGeneral) = true;

    	// CLEAN CONTENT
		['CLOSE_SPECTATOR'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHeavyVehiclesHandle);

	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CHEAVYVEHICLESGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESGENERAL, false];

		GVAR(heavyVehiclesGeneral) = false;
	};
	case "OPEN_SPECTATOR": {

    	_ctrlText = _display displayCtrl D_C_WHHEAVYVEHICLES;
		ctrlSetText [D_C_WHHEAVYVEHICLES, "HEAVY VEHICLES -  SPECTATOR"];

    	// OPEN CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CHEAVYVEHICLESSPECTATOR;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESSPECTATOR, true];
		ctrlSetFocus _window;

		GVAR(heavyVehiclesSpectator) = true;

		// CLEAN CONTENT
		['CLOSE_GENERAL'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHeavyVehiclesHandle);

		GVAR(selectedList) = 'BLUFOR';
		[] call FUNC(debugHeavyVehiclesSelectList);

	};
	case "CLOSE_SPECTATOR": {

		// CLOSE CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CHEAVYVEHICLESSPECTATOR;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESSPECTATOR, false];

		GVAR(heavyVehiclesSpectator) = false;
	};
	case "OPEN_MARKERS2D": {

    	_ctrlText = _display displayCtrl D_C_WHHEAVYVEHICLES;
		ctrlSetText [D_C_WHHEAVYVEHICLES, "HEAVY VEHICLES -  MARKERS 2D"];

    	// OPEN CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CHEAVYVEHICLESMARKERS2D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESMARKERS2D, true];
		ctrlSetFocus _window;

		GVAR(heavyVehiclesMarkers2d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHeavyVehiclesHandle);

	};
	case "CLOSE_MARKERS2D": {

		// CLOSE CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CHEAVYVEHICLESMARKERS2D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESMARKERS2D, false];

		GVAR(heavyVehiclesMarkers2d) = false;
	};
	case "OPEN_MARKERS3D": {

    	_ctrlText = _display displayCtrl D_C_WHHEAVYVEHICLES;
		ctrlSetText [D_C_WHHEAVYVEHICLES, "HEAVY VEHICLES -  MARKERS 3D"];

    	// OPEN CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CHEAVYVEHICLESMARKERS3D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESMARKERS3D, true];
		ctrlSetFocus _window;

		GVAR(heavyVehiclesMarkers3d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHeavyVehiclesHandle);

	};
	case "CLOSE_MARKERS3D": {

		// CLOSE CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CHEAVYVEHICLESMARKERS3D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESMARKERS3D, false];

		GVAR(heavyVehiclesMarkers3d) = false;
	};
	case "OPEN_UPMINFO": {

    	_ctrlText = _display displayCtrl D_C_WHHEAVYVEHICLES;
		ctrlSetText [D_C_WHHEAVYVEHICLES, "HEAVY VEHICLES -  UPM INFO"];

    	// OPEN CONTENT UPMINFO
		_window = _display displayCtrl D_C_CHEAVYVEHICLESUPMINFO;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESUPMINFO, true];
		ctrlSetFocus _window;

		GVAR(heavyVehiclesUPMInfo) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHeavyVehiclesHandle);

	};
	case "CLOSE_UPMINFO": {

		// CLOSE CONTENT UPMINFO
		_window = _display displayCtrl D_C_CHEAVYVEHICLESUPMINFO;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHEAVYVEHICLESUPMINFO, false];

		GVAR(heavyVehiclesUPMInfo) = false;
	};
};