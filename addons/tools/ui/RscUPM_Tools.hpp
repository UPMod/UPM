class RscMapControl;
class RscControlsGroup;
class VScrollbar;
class HScrollbar;
class RscText;
class Header;
class RscFrame;
class LineHorizontalTop;

class RscUPM_Tools
{
	onLoad = "";
	onUnload = "['EXIT'] spawn upm_fnc_toolsHandle;";
	idd=85001;
	movingEnable=0;
	iconCamera = "\A3\ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa";
	onKeyDown = "['KeyDown',_this] call upm_fnc_camera;";
	onKeyUp = "['KeyUp',_this] call upm_fnc_camera;";
	onMouseButtonDown = "['MouseButtonDown',_this] call upm_fnc_camera;";
	onMouseButtonUp = "['MouseButtonUp',_this] call upm_fnc_camera;";

	class ControlsBackground {
		class Map: RscMapControl
		{
			idc = 3141;
			x = -10;
			y = -10;
			w = "0.8 * safezoneW";
			h = "0.8 * safezoneH";
		};
		class Overlay: RscControlsGroup
		{
			idc = 3142;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
			class VScrollbar: VScrollbar
			{
				width = 0;
			};
			class HScrollbar: HScrollbar
			{
				height = 0;
			};
			class Controls
			{
				class Header: RscText
				{
					colorText[] = {1,1,1,1};
					colorBackground[] = {0,0,0,0};
					x = 0;
					y = 0;
					w = "safezoneW";
					h = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					text = "$STR_A3_RscDisplayCamera_Header";
					font = "PuristaLight";
					sizeEx = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					shadow = 1;
				};
				class SubHeader: Header
				{
					x = 0;
					y = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "safezoneW";
					h = "14 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					text = "$STR_A3_RscDisplayCamera_SubHeader";
					sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					style = 16;
				};
				class Debug: Header
				{
					idc = 31420;
					x = 0;
					y = "safezoneH - 8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					h = "8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					text = "";
					sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					shadow = 1;
					style = 16;
				};
				class Positions: Header
				{
					idc = 31422;
					x = "safezoneW - 0.2";
					y = 0;
					h = "10 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = 0.2;
					text = "";
					sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					shadow = 1;
					style = 16;
				};
				class Unit: RscFrame
				{
					colorText[] = {1,1,1,1};
					idc = 31421;
					x = -10;
					y = -10;
					w = 0;
					h = 0;
				};
				class LineHorizontalTop: RscText
				{
					colorBackground[] = {0.75,0.75,0.75,0.75};
					x = 0;
					y = "0.33 * safezoneH";
					w = "safezoneW";
					h = "0.001 * safezoneH";
				};
				class LineHorizontalBottom: LineHorizontalTop
				{
					x = 0;
					y = "0.66 * safezoneH";
					w = "safezoneW";
					h = "0.001 * safezoneH";
				};
				class LineVerticalLeft: LineHorizontalTop
				{
					x = "0.66 * safezoneW";
					y = 0;
					w = "0.001 * safezoneH";
					h = "safezoneH";
				};
				class LineVerticalRight: LineHorizontalTop
				{
					x = "0.33 * safezoneW";
					y = 0;
					w = "0.001 * safezoneH";
					h = "safezoneH";
				};
				class CrossHorizontal: LineHorizontalTop
				{
					x = "(safezoneW / 2) - (0.1 / 2)";
					y = "(safezoneH / 2)";
					w = 0.1;
					h = "0.001 * safezoneH";
				};
				class CrossVertical: LineHorizontalTop
				{
					x = "(safezoneW / 2)";
					y = "(safezoneH / 2) - (0.1 / 2)";
					w = "0.001 * safezoneH";
					h = 0.1;
				};
			};
		};
		class MouseArea: RscText
		{
			idc = 3140;
			style = 16;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
			onMouseMoving = "['Mouse',_this] call upm_fnc_camera;";
			onMouseHolding = "['Mouse',_this] call upm_fnc_camera;";
			onMouseZchanged = "['MouseZChanged',_this] call upm_fnc_camera;";
		};
	};
	class Controls {

	}		
};