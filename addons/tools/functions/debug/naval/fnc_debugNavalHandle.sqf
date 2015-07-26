/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugNavalHandle.sqf

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
		['CLOSE'] call FUNC(debugPerformanceHandle);
		['CLOSE'] call FUNC(debugPlanesHandle);
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW NAVAL
		_window = _display displayCtrl D_C_WNAVAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WNAVAL, true];

		GVAR(navalWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugNavalHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugNavalHandle);
		['CLOSE_UPMINFO'] call FUNC(debugNavalHandle);

		// START
		['OPEN_GENERAL'] call FUNC(debugNavalHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW NAVAL
		_window = _display displayCtrl D_C_WNAVAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WNAVAL, false];

		GVAR(navalWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHNAVAL;
		ctrlSetText [D_C_WHNAVAL, "NAVAL -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CNAVALGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALGENERAL, true];

		GVAR(navalGeneral) = true;

    	// CLEAN CONTENT
		['CLOSE_SPECTATOR'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugNavalHandle);
		['CLOSE_UPMINFO'] call FUNC(debugNavalHandle);

	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CNAVALGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALGENERAL, false];

		GVAR(navalGeneral) = false;
	};
	case "OPEN_SPECTATOR": {

    	_ctrlText = _display displayCtrl D_C_WHNAVAL;
		ctrlSetText [D_C_WHNAVAL, "NAVAL -  SPECTATOR"];

    	// OPEN CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CNAVALSPECTATOR;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALSPECTATOR, true];
		ctrlSetFocus _window;

		GVAR(navalSpectator) = true;

		// CLEAN CONTENT
		['CLOSE_GENERAL'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugNavalHandle);
		['CLOSE_UPMINFO'] call FUNC(debugNavalHandle);

		GVAR(selectedList) = 'BLUFOR';
		[] call FUNC(debugNavalSelectList);

	};
	case "CLOSE_SPECTATOR": {

		// CLOSE CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CNAVALSPECTATOR;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALSPECTATOR, false];

		GVAR(navalSpectator) = false;
	};
	case "OPEN_MARKERS2D": {

    	_ctrlText = _display displayCtrl D_C_WHNAVAL;
		ctrlSetText [D_C_WHNAVAL, "NAVAL -  MARKERS 2D"];

    	// OPEN CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CNAVALMARKERS2D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALMARKERS2D, true];
		ctrlSetFocus _window;

		GVAR(navalMarkers2d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugNavalHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugNavalHandle);
		['CLOSE_UPMINFO'] call FUNC(debugNavalHandle);

	};
	case "CLOSE_MARKERS2D": {

		// CLOSE CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CNAVALMARKERS2D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALMARKERS2D, false];

		GVAR(navalMarkers2d) = false;
	};
	case "OPEN_MARKERS3D": {

    	_ctrlText = _display displayCtrl D_C_WHNAVAL;
		ctrlSetText [D_C_WHNAVAL, "NAVAL -  MARKERS 3D"];

    	// OPEN CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CNAVALMARKERS3D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALMARKERS3D, true];
		ctrlSetFocus _window;

		GVAR(navalMarkers3d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugNavalHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugNavalHandle);
		['CLOSE_UPMINFO'] call FUNC(debugNavalHandle);

	};
	case "CLOSE_MARKERS3D": {

		// CLOSE CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CNAVALMARKERS3D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALMARKERS3D, false];

		GVAR(navalMarkers3d) = false;
	};
	case "OPEN_UPMINFO": {

    	_ctrlText = _display displayCtrl D_C_WHNAVAL;
		ctrlSetText [D_C_WHNAVAL, "NAVAL -  UPM INFO"];

    	// OPEN CONTENT UPMINFO
		_window = _display displayCtrl D_C_CNAVALUPMINFO;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALUPMINFO, true];
		ctrlSetFocus _window;

		GVAR(navalUPMInfo) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugNavalHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugNavalHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugNavalHandle);

	};
	case "CLOSE_UPMINFO": {

		// CLOSE CONTENT UPMINFO
		_window = _display displayCtrl D_C_CNAVALUPMINFO;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CNAVALUPMINFO, false];

		GVAR(navalUPMInfo) = false;
	};
};