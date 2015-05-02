class RscUPM_Tools
{
	onLoad = "";
	onUnload = "['EXIT'] spawn upm_fnc_toolsHandle;";
	idd=85001;
	movingEnable=0;
	iconCamera = "\A3\ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa";
	onKeyDown = "['KeyDown',_this] call upm_fnc_camera;";
	onKeyUp = "['KeyUp',_this] call upm_fnc_camera;";
	class ControlsBackground {

	};
	class Controls {

	};
};