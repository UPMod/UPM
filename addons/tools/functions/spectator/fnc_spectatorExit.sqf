/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorExit.sqf

Description:
	Spectator Exit

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

// EFFECTS ------------------------------------------------------ //
//----------------------------------------------------------------//

// Underwater PP effects.
_null = [] spawn {
	//suffocating
	BIS_SuffCC = ppEffectCreate ["ColorCorrections", 1610];

	// init PP to avoid artefacts after going under water.
	BIS_SuffCC ppEffectAdjust [1,1,0,[0, 0, 0, 0 ],[1, 1, 1, 1],[0,0,0,0], [-1, -1, 0, 0, 0, 0.001, 0.5]];

	BIS_SuffRadialBlur = ppEffectCreate ["RadialBlur", 270];
	BIS_SuffBlur = ppEffectCreate ["DynamicBlur", 170];
};


// RADIO -------------------------------------------------------- //
//----------------------------------------------------------------//

enableRadio true;

// CAMERA ------------------------------------------------------- //
//----------------------------------------------------------------//

camUseNVG false;
false SetCamUseTi 0;

with missionnamespace do {

	// missionNamespace getVariable ["upm_tools_camera",objNull];
	_cam = GETMVAR(GVAR(camera),objNull);
	_cam cameraEffect ["TERMINATE","BACK"];
	camDestroy _cam;

	GVAR(camera) = nil;
	BIS_fnc_camera_target = nil;

};

// DESTROY: GLOBAL VARIABLES ------------------------------------ //
//----------------------------------------------------------------//

// upm_tools_LMB
GVAR(LMB) = nil;
// upm_tools_LMBclick
GVAR(LMBclick) = nil;

// upm_tools_RMB
GVAR(RMB) = nil;
// upm_tools_RMBclick
GVAR(RMBclick) = nil;

// upm_tools_keys
GVAR(keys) = nil;

// upm_tools_cameraPitchBank
GVAR(cameraPitchBank) = nil;
// upm_tools_cameraFov
GVAR(cameraFov) = nil;
// upm_tools_cameraIcon
GVAR(cameraIcon) = nil;
// upm_tools_cameraVision
GVAR(cameraVision) = nil;

// upm_tools_visibleHUD
GVAR(visibleHUD) = nil;

// upm_tools_prespective
GVAR(prespective) = nil;

//uiNameSpace setVariable ["upm_RscTools",(findDisplay D_TOOLS)];
SETUVAR(upm_RscTools,nil);

//  DISPLAYS / CONTROLS ----------------------------------------- //
//----------------------------------------------------------------//

((findDisplay 49) displayCtrl 1010) ctrlEnable true;

//  RESET ------------------------------------------------------- //
//----------------------------------------------------------------//

player switchCamera "INTERNAL";

//  DEBUG ------------------------------------------------------- //
//----------------------------------------------------------------//

GVAR(state) = false;