/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugGroupsHandle.sqf

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
		['CLOSE'] call FUNC(debugHeavyVehiclesHandle);
		['CLOSE'] call FUNC(debugHelisHandle);
		['CLOSE'] call FUNC(debugLightVehiclesHandle);
		['CLOSE'] call FUNC(debugNavalHandle);
		['CLOSE'] call FUNC(debugPerformanceHandle);
		['CLOSE'] call FUNC(debugPlanesHandle);
		['CLOSE'] call FUNC(debugSettingsHandle);
		['CLOSE'] call FUNC(debugStaticsHandle);
		['CLOSE'] call FUNC(debugUnitsHandle);

    	// OPEN MAIN WINDOW GROUPS
		_window = _display displayCtrl D_C_WGROUPS;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WGROUPS, true];

		GVAR(groupsWindow) = true;

    	// CLOSE ALL
    	['CLOSE_GENERAL'] call FUNC(debugGroupsHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugGroupsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugGroupsHandle);

		// START
		['OPEN_GENERAL'] call FUNC(debugGroupsHandle);

    };
    case "CLOSE": {

		// CLOSE MAIN WINDOW GROUPS
		_window = _display displayCtrl D_C_WGROUPS;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_WGROUPS, false];

		GVAR(groupsWindow) = false;

	};
	case "OPEN_GENERAL": {

    	_ctrlText = _display displayCtrl D_C_WHGROUPS;
		ctrlSetText [D_C_WHGROUPS, "GROUPS -  GENERAL"];

    	// OPEN CONTENT GENERAL
		_window = _display displayCtrl D_C_CGROUPSGENERAL;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSGENERAL, true];

		GVAR(groupsGeneral) = true;

    	// CLEAN CONTENT
		['CLOSE_SPECTATOR'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugGroupsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugGroupsHandle);

	};
	case "CLOSE_GENERAL": {

		// CLOSE CONTENT GENERAL
		_window = _display displayCtrl D_C_CGROUPSGENERAL;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSGENERAL, false];

		GVAR(groupsGeneral) = false;
	};
	case "OPEN_SPECTATOR": {

    	_ctrlText = _display displayCtrl D_C_WHGROUPS;
		ctrlSetText [D_C_WHGROUPS, "GROUPS -  SPECTATOR"];

    	// OPEN CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CGROUPSSPECTATOR;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSSPECTATOR, true];
		ctrlSetFocus _window;

		GVAR(groupsSpectator) = true;

		// CLEAN CONTENT
		['CLOSE_GENERAL'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugGroupsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugGroupsHandle);

		GVAR(selectedList) = 'BLUFOR';
		[] call FUNC(debugGroupsSelectList);

	};
	case "CLOSE_SPECTATOR": {

		// CLOSE CONTENT SPECTATOR
		_window = _display displayCtrl D_C_CGROUPSSPECTATOR;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSSPECTATOR, false];

		GVAR(groupsSpectator) = false;
	};
	case "OPEN_MARKERS2D": {

    	_ctrlText = _display displayCtrl D_C_WHGROUPS;
		ctrlSetText [D_C_WHGROUPS, "GROUPS -  MARKERS 2D"];

    	// OPEN CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CGROUPSMARKERS2D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSMARKERS2D, true];
		ctrlSetFocus _window;

		GVAR(groupsMarkers2d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugGroupsHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugGroupsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugGroupsHandle);

	};
	case "CLOSE_MARKERS2D": {

		// CLOSE CONTENT MARKERS2D
		_window = _display displayCtrl D_C_CGROUPSMARKERS2D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSMARKERS2D, false];

		GVAR(groupsMarkers2d) = false;
	};
	case "OPEN_MARKERS3D": {

    	_ctrlText = _display displayCtrl D_C_WHGROUPS;
		ctrlSetText [D_C_WHGROUPS, "GROUPS -  MARKERS 3D"];

    	// OPEN CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CGROUPSMARKERS3D;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSMARKERS3D, true];
		ctrlSetFocus _window;

		GVAR(groupsMarkers3d) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugGroupsHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugGroupsHandle);
		['CLOSE_UPMINFO'] call FUNC(debugGroupsHandle);

	};
	case "CLOSE_MARKERS3D": {

		// CLOSE CONTENT MARKERS3D
		_window = _display displayCtrl D_C_CGROUPSMARKERS3D;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSMARKERS3D, false];

		GVAR(groupsMarkers3d) = false;
	};
	case "OPEN_UPMINFO": {

    	_ctrlText = _display displayCtrl D_C_WHGROUPS;
		ctrlSetText [D_C_WHGROUPS, "GROUPS -  UPM INFO"];

    	// OPEN CONTENT UPMINFO
		_window = _display displayCtrl D_C_CGROUPSUPMINFO;
		_window ctrlShow true;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSUPMINFO, true];
		ctrlSetFocus _window;

		GVAR(groupsUPMInfo) = true;

		// CLEAN CONTENT
    	['CLOSE_GENERAL'] call FUNC(debugGroupsHandle);
		['CLOSE_SPECTATOR'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS2D'] call FUNC(debugGroupsHandle);
		['CLOSE_MARKERS3D'] call FUNC(debugGroupsHandle);

	};
	case "CLOSE_UPMINFO": {

		// CLOSE CONTENT UPMINFO
		_window = _display displayCtrl D_C_CGROUPSUPMINFO;
		_window ctrlShow false;
		_window ctrlCommit 0;
		ctrlEnable [D_C_CGROUPSUPMINFO, false];

		GVAR(groupsUPMInfo) = false;
	};
};