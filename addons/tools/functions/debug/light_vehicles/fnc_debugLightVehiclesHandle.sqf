/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugLightVehiclesHandle.sqf

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
		['CLOSE'] call FUNC(debugNavalHandle);
		['CLOSE'] call FUNC(debugPerformanceHandle);
		['CLOSE'] call FUNC(debugPlanesHandle);
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW LIGHTVEHICLES
		_window = _display displayCtrl D_C_WLIGHTVEHICLES;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WLIGHTVEHICLES, true];

		GVAR(lightVehiclesWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugLightVehiclesHandle);

		// START
		['OPEN_GENERAL'] call FUNC(debugLightVehiclesHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW LIGHTVEHICLES
		_window = _display displayCtrl D_C_WLIGHTVEHICLES;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WLIGHTVEHICLES, false];

		GVAR(lightVehiclesWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHLIGHTVEHICLES;
		ctrlSetText [D_C_WHLIGHTVEHICLES, "LIGHT VEHICLES -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CLIGHTVEHICLESGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESGENERAL, true];

		GVAR(lightVehiclesGeneral) = true;

    	// CLEAN CONTENT
		['CLOSE_SPECTATOR'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugLightVehiclesHandle);

	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CLIGHTVEHICLESGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESGENERAL, false];

		GVAR(lightVehiclesGeneral) = false;
	};
	case "OPEN_SPECTATOR": {

    	_ctrlText = _display displayCtrl D_C_WHLIGHTVEHICLES;
		ctrlSetText [D_C_WHLIGHTVEHICLES, "LIGHT VEHICLES -  SPECTATOR"];

    	// OPEN CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CLIGHTVEHICLESSPECTATOR;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESSPECTATOR, true];
		ctrlSetFocus _window;

		GVAR(lightVehiclesSpectator) = true;

		// CLEAN CONTENT
		['CLOSE_GENERAL'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugLightVehiclesHandle);

		GVAR(selectedList) = 'BLUFOR';
		[] call FUNC(debugLightVehiclesSelectList);

	};
	case "CLOSE_SPECTATOR": {

		// CLOSE CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CLIGHTVEHICLESSPECTATOR;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESSPECTATOR, false];

		GVAR(lightVehiclesSpectator) = false;
	};
	case "OPEN_MARKERS2D": {

    	_ctrlText = _display displayCtrl D_C_WHLIGHTVEHICLES;
		ctrlSetText [D_C_WHLIGHTVEHICLES, "LIGHT VEHICLES -  MARKERS 2D"];

    	// OPEN CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CLIGHTVEHICLESMARKERS2D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESMARKERS2D, true];
		ctrlSetFocus _window;

		GVAR(lightVehiclesMarkers2d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugLightVehiclesHandle);

	};
	case "CLOSE_MARKERS2D": {

		// CLOSE CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CLIGHTVEHICLESMARKERS2D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESMARKERS2D, false];

		GVAR(lightVehiclesMarkers2d) = false;
	};
	case "OPEN_MARKERS3D": {

    	_ctrlText = _display displayCtrl D_C_WHLIGHTVEHICLES;
		ctrlSetText [D_C_WHLIGHTVEHICLES, "LIGHT VEHICLES -  MARKERS 3D"];

    	// OPEN CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CLIGHTVEHICLESMARKERS3D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESMARKERS3D, true];
		ctrlSetFocus _window;

		GVAR(lightVehiclesMarkers3d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugLightVehiclesHandle);

	};
	case "CLOSE_MARKERS3D": {

		// CLOSE CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CLIGHTVEHICLESMARKERS3D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESMARKERS3D, false];

		GVAR(lightVehiclesMarkers3d) = false;
	};
	case "OPEN_UPMINFO": {

    	_ctrlText = _display displayCtrl D_C_WHLIGHTVEHICLES;
		ctrlSetText [D_C_WHLIGHTVEHICLES, "LIGHT VEHICLES -  UPM INFO"];

    	// OPEN CONTENT UPMINFO
		_window = _display displayCtrl D_C_CLIGHTVEHICLESUPMINFO;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESUPMINFO, true];
		ctrlSetFocus _window;

		GVAR(lightVehiclesUPMInfo) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugLightVehiclesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugLightVehiclesHandle);

	};
	case "CLOSE_UPMINFO": {

		// CLOSE CONTENT UPMINFO
		_window = _display displayCtrl D_C_CLIGHTVEHICLESUPMINFO;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CLIGHTVEHICLESUPMINFO, false];

		GVAR(lightVehiclesUPMInfo) = false;
	};
};