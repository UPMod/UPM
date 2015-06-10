class RscUPM_Tools
{
	onLoad = "";
	onUnload = "['EXIT'] spawn upm_fnc_toolsHandle";
	idd = D_TOOLS; //314
	movingEnable = 0;
	enableSimulation = 1;
	iconCamera = "\A3\ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa";
	onKeyDown = "_this call upm_fnc_spectatorKeyDown;";
	onKeyUp = "_this call upm_fnc_spectatorKeyUp;";
	onMouseButtonDown = "_this call upm_fnc_spectatorMouseButtonDown;";
	onMouseButtonUp = "_this call upm_fnc_spectatorMouseButtonUp;";
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
			onMouseMoving = "_this call upm_fnc_spectatorMouse;";
			onMouseHolding = "_this call upm_fnc_spectatorMouse;";
			onMouseZchanged = "_this call upm_fnc_spectatorMouseZChanged;";
		};

		class Map: RscMapControl
		{
			idc = D_CB_MAP; //3141
			x = -10;
			y = -10;
			w = "0.8 * safezoneW";
			h = "0.8 * safezoneH";
		};
		
		#include <main_ui\CtrlsUPM_MenuLeftBG.hpp>
	};
	class Controls
	{
		#include <main_ui\CtrlsUPM_MenuLeft.hpp>
		#include <main_ui\CtrlsUPM_Bar.hpp>
	};
};