/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorInit.sqf

Description:
	Init tools

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
	"_ctrlMouseArea",
	"_ctrlMap",
	"_displayMission", "_overlay","_layers"
];

// EFFECTS ------------------------------------------------------ //
//----------------------------------------------------------------//

// Disable underwater PP effects
ppEffectDestroy [BIS_SuffRadialBlur, BIS_SuffBlur, BIS_SuffCC];

// Disable menu chromatic aberration
[] call bis_fnc_guiEffectTiles;

// OVERLAYS ----------------------------------------------------- //
//----------------------------------------------------------------//

// Remove mission overlay
_displayMission = [] call (uiNamespace getVariable "bis_fnc_displayMission");
_overlay = _displayMission displayCtrl 11400;
_overlay ctrlSetFade 1;
_overlay ctrlCommit 0;

// Remove overlays
cutText ["","plain"];
titleText ["","plain"];
_layers = missionNamespace getVariable ["bis_fnc_rscLayer_list",[]];

for "_l" from 1 to (count _layers - 1) step 2 do {
	(_layers select _l) cutText ["","plain"];
};

// RADIO -------------------------------------------------------- //
//----------------------------------------------------------------//

clearRadio;
enableRadio false;

// INIT / GLOBAL VARIABLES -------------------------------------- //
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
GVAR(cameraIcon) = getText (configfile >> "RscUPM_Tools" >> "iconCamera");
// upm_tools_cameraVision
GVAR(cameraVision) = 0;

// upm_tools_visibleHUD
GVAR(visibleHUD) = true;

// upm_tools_prespective
GVAR(prespective) = "FREECAM";

// INIT UNIT ---------------------------------------------------- //
//----------------------------------------------------------------//

player allowDamage false;

// upm_tools_spectateUnit
GVAR(spectateUnit) = player;

// CAMERA ------------------------------------------------------- //
//----------------------------------------------------------------//

_camPos = [
	(position cameraOn select 0),
	(position cameraOn select 1),
	(position cameraOn select 2) + 2
];

_cam = "camera" camCreate _camPos;

// missionNamespace setVariable ["upm_tools_camera",_cam];
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
_ctrlMap ctrlAddEventHandler ["Draw","_this call upm_fnc_spectatorMapDraw;"];
_ctrlMap ctrlAddEventHandler ["MouseButtonClick","_this call upm_fnc_spectatorMapClick;"];

// SELECT VIEW -------------------------------------------------- //
//----------------------------------------------------------------//

[] call FUNC(debugUpdate);

[] call FUNC(spectatorSelectView);