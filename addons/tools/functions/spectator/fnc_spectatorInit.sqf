/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_cameraInit.sqf

Description:
	Camera Key Up

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

disableserialization;

private [
	"_cam","_camPos",
	"_DIKcodes","_DIKlast",
	"_display",
	"_ctrlMouseArea"
];

// GLOBAL VARIABLES --------------------------------------------- //
//----------------------------------------------------------------//

// upm_tools_LMB
GVAR(LMB) = false;
// upm_tools_LMBclick
GVAR(LMBclick) = [0,0];

// upm_tools_RMB
GVAR(RMB) = false;
// upm_tools_RMBclick
GVAR(RMBclick) = [0,0];

// upm_tools_keys
GVAR(keys) = [];

// upm_tools_cameraPitchBank
GVAR(cameraPitchBank) = [0,0];
// upm_tools_cameraFov
GVAR(cameraFov) = 0.7;
// upm_tools_cameraIcon
GVAR(cameraIcon) = gettext (configfile >> "RscUPM_Tools" >> "iconCamera");
// upm_tools_cameraVision
GVAR(cameraVision) = 0;

// upm_tools_visibleHUD
GVAR(visibleHUD) = true;

// CAMERA ------------------------------------------------------- //
//----------------------------------------------------------------//

_camPos = [
	(position cameraOn select 0),
	(position cameraOn select 1),
	(position cameraOn select 2) + 2
];

_cam = "camera" camCreate _camPos;

// missionnamespace setvariable ["upm_tools_camera",_cam];
SETMVAR(GVAR(camera),_cam);

// MAP KEYS ----------------------------------------------------- //
//----------------------------------------------------------------//

_DIKcodes = true call BIS_fnc_keyCode;
_DIKlast = _DIKcodes select (count _DIKcodes - 1);

for "_k" from 0 to (_DIKlast - 1) do {
	GVAR(keys) set [_k,false];
};

// DISPLAY: MAIN ------------------------------------------------ //
//----------------------------------------------------------------//

//uiNameSpace setVariable ["upm_RscTools",(findDisplay D_TOOLS)];
SETUVAR(upm_RscTools,(findDisplay D_TOOLS));
//uiNameSpace getVariable ["upm_RscTools",displayNull];
_display = GETUVAR(upm_RscTools,displayNull);

// CONTROL: MOUSE AREA ------------------------------------------ //
//----------------------------------------------------------------//

_ctrlMouseArea = _display displayCtrl D_CB_MOUSEAREA;
ctrlSetFocus _ctrlMouseArea;

// CONTROL: MAP ------------------------------------------------- //
//----------------------------------------------------------------//

_ctrlMap = _display displayCtrl D_CB_MAP;
_ctrlMap ctrlEnable false;
_ctrlMap ctrlAddEventHandler ["draw","['MapDraw',_this] call upm_fnc_camera;"];
_ctrlMap ctrlAddEventHandler ["mousebuttonclick","['MapClick',_this] call upm_fnc_camera;"];