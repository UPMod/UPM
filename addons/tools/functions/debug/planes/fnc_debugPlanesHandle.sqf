/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugPlanesHandle.sqf

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
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW PLANES
		_window = _display displayCtrl D_C_WPLANES;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WPLANES, true];

		GVAR(planesWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugPlanesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugPlanesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugPlanesHandle);

		// START
		['OPEN_GENERAL'] call FUNC(debugPlanesHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW PLANES
		_window = _display displayCtrl D_C_WPLANES;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WPLANES, false];

		GVAR(planesWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHPLANES;
		ctrlSetText [D_C_WHPLANES, "PLANES -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CPLANESGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESGENERAL, true];

		GVAR(planesGeneral) = true;

    	// CLEAN CONTENT
		['CLOSE_SPECTATOR'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugPlanesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugPlanesHandle);

	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CPLANESGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESGENERAL, false];

		GVAR(planesGeneral) = false;
	};
	case "OPEN_SPECTATOR": {

    	_ctrlText = _display displayCtrl D_C_WHPLANES;
		ctrlSetText [D_C_WHPLANES, "PLANES -  SPECTATOR"];

    	// OPEN CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CPLANESSPECTATOR;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESSPECTATOR, true];
		ctrlSetFocus _window;

		GVAR(planesSpectator) = true;

		// CLEAN CONTENT
		['CLOSE_GENERAL'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugPlanesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugPlanesHandle);

		GVAR(selectedList) = 'BLUFOR';
		[] call FUNC(debugPlanesSelectList);

	};
	case "CLOSE_SPECTATOR": {

		// CLOSE CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CPLANESSPECTATOR;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESSPECTATOR, false];

		GVAR(planesSpectator) = false;
	};
	case "OPEN_MARKERS2D": {

    	_ctrlText = _display displayCtrl D_C_WHPLANES;
		ctrlSetText [D_C_WHPLANES, "PLANES -  MARKERS 2D"];

    	// OPEN CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CPLANESMARKERS2D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESMARKERS2D, true];
		ctrlSetFocus _window;

		GVAR(planesMarkers2d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugPlanesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugPlanesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugPlanesHandle);

	};
	case "CLOSE_MARKERS2D": {

		// CLOSE CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CPLANESMARKERS2D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESMARKERS2D, false];

		GVAR(planesMarkers2d) = false;
	};
	case "OPEN_MARKERS3D": {

    	_ctrlText = _display displayCtrl D_C_WHPLANES;
		ctrlSetText [D_C_WHPLANES, "PLANES -  MARKERS 3D"];

    	// OPEN CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CPLANESMARKERS3D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESMARKERS3D, true];
		ctrlSetFocus _window;

		GVAR(planesMarkers3d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugPlanesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugPlanesHandle);
		['CLOSE_UPMINFO'] call FUNC(debugPlanesHandle);

	};
	case "CLOSE_MARKERS3D": {

		// CLOSE CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CPLANESMARKERS3D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESMARKERS3D, false];

		GVAR(planesMarkers3d) = false;
	};
	case "OPEN_UPMINFO": {

    	_ctrlText = _display displayCtrl D_C_WHPLANES;
		ctrlSetText [D_C_WHPLANES, "PLANES -  UPM INFO"];

    	// OPEN CONTENT UPMINFO
		_window = _display displayCtrl D_C_CPLANESUPMINFO;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESUPMINFO, true];
		ctrlSetFocus _window;

		GVAR(planesUPMInfo) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugPlanesHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugPlanesHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugPlanesHandle);

	};
	case "CLOSE_UPMINFO": {

		// CLOSE CONTENT UPMINFO
		_window = _display displayCtrl D_C_CPLANESUPMINFO;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CPLANESUPMINFO, false];

		GVAR(planesUPMInfo) = false;
	};
};