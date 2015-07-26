/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugHelisHandle.sqf

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
		['CLOSE'] call FUNC(debugLightVehiclesHandle);
		['CLOSE'] call FUNC(debugNavalHandle);
		['CLOSE'] call FUNC(debugPerformanceHandle);
		['CLOSE'] call FUNC(debugPlanesHandle);
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW HELIS
		_window = _display displayCtrl D_C_WHELIS;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WHELIS, true];

		GVAR(helisWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugHelisHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHelisHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHelisHandle);

		// START
		['OPEN_GENERAL'] call FUNC(debugHelisHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW HELIS
		_window = _display displayCtrl D_C_WHELIS;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WHELIS, false];

		GVAR(helisWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHHELIS;
		ctrlSetText [D_C_WHHELIS, "HELIS -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CHELISGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISGENERAL, true];

		GVAR(helisGeneral) = true;

    	// CLEAN CONTENT
		['CLOSE_SPECTATOR'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHelisHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHelisHandle);

	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CHELISGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISGENERAL, false];

		GVAR(helisGeneral) = false;
	};
	case "OPEN_SPECTATOR": {

    	_ctrlText = _display displayCtrl D_C_WHHELIS;
		ctrlSetText [D_C_WHHELIS, "HELIS -  SPECTATOR"];

    	// OPEN CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CHELISSPECTATOR;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISSPECTATOR, true];
		ctrlSetFocus _window;

		GVAR(helisSpectator) = true;

		// CLEAN CONTENT
		['CLOSE_GENERAL'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHelisHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHelisHandle);

		GVAR(selectedList) = 'BLUFOR';
		[] call FUNC(debugHelisSelectList);

	};
	case "CLOSE_SPECTATOR": {

		// CLOSE CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CHELISSPECTATOR;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISSPECTATOR, false];

		GVAR(helisSpectator) = false;
	};
	case "OPEN_MARKERS2D": {

    	_ctrlText = _display displayCtrl D_C_WHHELIS;
		ctrlSetText [D_C_WHHELIS, "HELIS -  MARKERS 2D"];

    	// OPEN CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CHELISMARKERS2D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISMARKERS2D, true];
		ctrlSetFocus _window;

		GVAR(helisMarkers2d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugHelisHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHelisHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHelisHandle);

	};
	case "CLOSE_MARKERS2D": {

		// CLOSE CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CHELISMARKERS2D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISMARKERS2D, false];

		GVAR(helisMarkers2d) = false;
	};
	case "OPEN_MARKERS3D": {

    	_ctrlText = _display displayCtrl D_C_WHHELIS;
		ctrlSetText [D_C_WHHELIS, "HELIS -  MARKERS 3D"];

    	// OPEN CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CHELISMARKERS3D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISMARKERS3D, true];
		ctrlSetFocus _window;

		GVAR(helisMarkers3d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugHelisHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHelisHandle);
		['CLOSE_UPMINFO'] call FUNC(debugHelisHandle);

	};
	case "CLOSE_MARKERS3D": {

		// CLOSE CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CHELISMARKERS3D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISMARKERS3D, false];

		GVAR(helisMarkers3d) = false;
	};
	case "OPEN_UPMINFO": {

    	_ctrlText = _display displayCtrl D_C_WHHELIS;
		ctrlSetText [D_C_WHHELIS, "HELIS -  UPM INFO"];

    	// OPEN CONTENT UPMINFO
		_window = _display displayCtrl D_C_CHELISUPMINFO;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISUPMINFO, true];
		ctrlSetFocus _window;

		GVAR(helisUPMInfo) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugHelisHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugHelisHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugHelisHandle);

	};
	case "CLOSE_UPMINFO": {

		// CLOSE CONTENT UPMINFO
		_window = _display displayCtrl D_C_CHELISUPMINFO;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CHELISUPMINFO, false];

		GVAR(helisUPMInfo) = false;
	};
};