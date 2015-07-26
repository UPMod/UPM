/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugStaticsHandle.sqf

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
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW STATICS
		_window = _display displayCtrl D_C_WSTATICS;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WSTATICS, true];

		GVAR(staticsWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugStaticsHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugStaticsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugStaticsHandle);

		// START
		['OPEN_GENERAL'] call FUNC(debugStaticsHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW STATICS
		_window = _display displayCtrl D_C_WSTATICS;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WSTATICS, false];

		GVAR(staticsWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHSTATICS;
		ctrlSetText [D_C_WHSTATICS, "STATICS -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CSTATICSGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSGENERAL, true];

		GVAR(staticsGeneral) = true;

    	// CLEAN CONTENT
		['CLOSE_SPECTATOR'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugStaticsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugStaticsHandle);

	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CSTATICSGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSGENERAL, false];

		GVAR(staticsGeneral) = false;
	};
	case "OPEN_SPECTATOR": {

    	_ctrlText = _display displayCtrl D_C_WHSTATICS;
		ctrlSetText [D_C_WHSTATICS, "STATICS -  SPECTATOR"];

    	// OPEN CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CSTATICSSPECTATOR;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSSPECTATOR, true];
		ctrlSetFocus _window;

		GVAR(staticsSpectator) = true;

		// CLEAN CONTENT
		['CLOSE_GENERAL'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugStaticsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugStaticsHandle);

		GVAR(selectedList) = 'BLUFOR';
		[] call FUNC(debugStaticsSelectList);

	};
	case "CLOSE_SPECTATOR": {

		// CLOSE CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CSTATICSSPECTATOR;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSSPECTATOR, false];

		GVAR(staticsSpectator) = false;
	};
	case "OPEN_MARKERS2D": {

    	_ctrlText = _display displayCtrl D_C_WHSTATICS;
		ctrlSetText [D_C_WHSTATICS, "STATICS -  MARKERS 2D"];

    	// OPEN CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CSTATICSMARKERS2D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSMARKERS2D, true];
		ctrlSetFocus _window;

		GVAR(staticsMarkers2d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugStaticsHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugStaticsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugStaticsHandle);

	};
	case "CLOSE_MARKERS2D": {

		// CLOSE CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CSTATICSMARKERS2D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSMARKERS2D, false];

		GVAR(staticsMarkers2d) = false;
	};
	case "OPEN_MARKERS3D": {

    	_ctrlText = _display displayCtrl D_C_WHSTATICS;
		ctrlSetText [D_C_WHSTATICS, "STATICS -  MARKERS 3D"];

    	// OPEN CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CSTATICSMARKERS3D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSMARKERS3D, true];
		ctrlSetFocus _window;

		GVAR(staticsMarkers3d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugStaticsHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugStaticsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugStaticsHandle);

	};
	case "CLOSE_MARKERS3D": {

		// CLOSE CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CSTATICSMARKERS3D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSMARKERS3D, false];

		GVAR(staticsMarkers3d) = false;
	};
	case "OPEN_UPMINFO": {

    	_ctrlText = _display displayCtrl D_C_WHSTATICS;
		ctrlSetText [D_C_WHSTATICS, "STATICS -  UPM INFO"];

    	// OPEN CONTENT UPMINFO
		_window = _display displayCtrl D_C_CSTATICSUPMINFO;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSUPMINFO, true];
		ctrlSetFocus _window;

		GVAR(staticsUPMInfo) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugStaticsHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugStaticsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugStaticsHandle);

	};
	case "CLOSE_UPMINFO": {

		// CLOSE CONTENT UPMINFO
		_window = _display displayCtrl D_C_CSTATICSUPMINFO;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CSTATICSUPMINFO, false];

		GVAR(staticsUPMInfo) = false;
	};
};