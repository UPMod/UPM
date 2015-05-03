class RscMapControl;
class RscText;

class RscUPM_Tools
{
	onLoad = "";
	onUnload = "['EXIT',objNull] spawn upm_toolsHandle";
	idd = D_TOOLS; //314
	movingEnable = 0;
	enableSimulation = 1;
	iconCamera = "\A3\ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa";
	onKeyDown = "['KeyDown',_this] call upm_fnc_camera;";
	onKeyUp = "['KeyUp',_this] call upm_fnc_camera;";
	onMouseButtonDown = "['MouseButtonDown',_this] call upm_fnc_camera;";
	onMouseButtonUp = "['MouseButtonUp',_this] call upm_fnc_camera;";

	class ControlsBackground
	{
		class MouseArea: RscText
		{
			idc = D_CB_MOUSEAREA; //3140
			style = 16;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
			onMouseMoving = "['Mouse',_this] call upm_fnc_camera;";
			onMouseHolding = "['Mouse',_this] call upm_fnc_camera;";
			onMouseZchanged = "['MouseZChanged',_this] call upm_fnc_camera;";
		};
		class Map: RscMapControl
		{
			idc = D_CB_MAP; //3141
			x = -10;
			y = -10;
			w = "0.8 * safezoneW";
			h = "0.8 * safezoneH";
		};
	};
	class Controls
	{

	};
};