/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorKeyDown.sqf

Description:
	Spectator Key Down

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_5(_display,_key,_shift,_ctrl,_alt);

disableSerialization;

private [
	"_return",
	"_cam","_camPos","_camDir",
	"_ctrlMouseArea","_ctrlMap","_ctrlMapPos",
	"_vision"
];

_return = false;

// upm_tools_keys
GVAR(keys) set [_key,true];

// missionNamespace getVariable ["upm_tools_camera",objNull];
_cam = GETMVAR(GVAR(camera),objNull);

switch (_key) do {

	case (DIK_NUMPAD5): {
	// Reset
		GVAR(cameraPitchBank) = [0,0];
		[0,0] call FUNC(spectatorRotate);
		GVAR(cameraFov) = 0.7;
		_camPos = position _cam;
		_camDir = direction _cam;
		_cam setDir _camDir;
		_cam camPrepareFov GVAR(cameraFov);
		_cam camCommitPrepared 0;

	};

	case (DIK_M): {
	// Map
		_ctrlMouseArea = _display displayCtrl D_CB_MOUSEAREA;
		_ctrlMap = _display displayCtrl D_CB_MAP;

		if (ctrlEnabled _ctrlMap) then {
			_ctrlMouseArea ctrlEnable true;
			_ctrlMap ctrlEnable false;
			ctrlSetFocus _ctrlMap;
			_ctrlMap ctrlSetPosition [-10,-10,0.8 * safezoneW,0.8 * safezoneH];
			_ctrlMap ctrlCommit 0;
		} else {
			_ctrlMouseArea ctrlEnable false;
			_ctrlMap ctrlEnable true;
			ctrlSetFocus _ctrlMap;
			_ctrlMapPos = [
				safezoneX + 0.05 * safezoneW,
				safezoneY + 0.05 * safezoneH,
				0.898 * safezoneW,
				0.88 * safezoneH
			];
			_ctrlMap ctrlSetPosition _ctrlMapPos;
			_ctrlMap ctrlSetFade 0;
			_ctrlMap ctrlCommit 0;
			_ctrlMap ctrlMapAnimAdd [0,0.1,position _cam];
			ctrlMapAnimCommit _ctrlMap;
		};

	};

	case (DIK_H): {
	// Overlays
		/*_ctrlOverlays = [

		];
		if (UPM_Tools_visibleHUD) then {
			{_x ctrlsetfade 1;} foreach _ctrlOverlays;
			(_display displayctrl D_CB_OVERLAY) ctrlenable false;
			cameraEffectEnableHUD false;
		} else {
			{_x ctrlsetfade 0;} foreach _ctrlOverlays;
			(_display displayctrl D_CB_OVERLAY) ctrlenable true;
			cameraEffectEnableHUD true;
		};
		UPM_Tools_visibleHUD = !UPM_Tools_visibleHUD;
		{_x ctrlcommit 0.1} foreach _ctrlOverlays;*/

	};

	case (DIK_N): {
	// Night/Termal.. vision
		GVAR(cameraVision) = GVAR(cameraVision) + 1;
		_vision = GVAR(cameraVision) % 4;

		switch (_vision) do {

			case 0: {
				camUseNVG false;
				false SetCamUseTi 0;
			};

			case 1: {
				camUseNVG true;
				false SetCamUseTi 0;
			};

			case 2: {
				camUseNVG false;
				true SetCamUseTi 0;
			};

			case 3: {
				camUseNVG false;
				true SetCamUseTi 1;
			};
		};

	};

	case (DIK_ESCAPE): {

		_return = true;

		switch (true) do
		{
			case (GVAR(environmentWindow)):
			{
				['CLOSE'] call FUNC(debugEnvironmentHandle);
			};
			case (GVAR(groupsWindow)):
			{
				['CLOSE'] call FUNC(debugGroupsHandle);
			};
			case (GVAR(heavyVehiclesWindow)):
			{
				['CLOSE'] call FUNC(debugHeavyVehiclesHandle);
			};
			case (GVAR(helisWindow)):
			{
				['CLOSE'] call FUNC(debugHelisHandle);
			};
			case (GVAR(lightVehiclesWindow)):
			{
				['CLOSE'] call FUNC(debugLightVehiclesHandle);
			};
			case (GVAR(navalWindow)):
			{
				['CLOSE'] call FUNC(debugNavalHandle);
			};
			case (GVAR(performanceWindow)):
			{
				['CLOSE'] call FUNC(debugPerformanceHandle);
			};
			case (GVAR(planesWindow)):
			{
				['CLOSE'] call FUNC(debugPlanesHandle);
			};
			case (GVAR(settingsWindow)):
			{
				['CLOSE'] call FUNC(debugSettingsHandle);
			};
			case (GVAR(staticsWindow)):
			{
				['CLOSE'] call FUNC(debugStaticsHandle);
			};
			case (GVAR(unitsWindow)):
			{
				['CLOSE'] call FUNC(debugUnitsHandle);
			};

			default
			{
				// Exit spectator
				_this spawn {
					disableSerialization;
					_display = _this select 0;
					_message = [
						"Do you really want to quit?",
						"UPM Debug/Spectator",
						nil,
						true,
						_display
					] call BIS_fnc_guiMessage;

					if (_message) then {
						_display closeDisplay 2;
					};
				};
			};
		};

	};

	default {};
};

_return