class HeavyVehiclesMenu: RscControlsGroup
{
	idc = -1;
	text = "";
	x = 0;
	y = 0.045 * safezoneH;
	w = 0.72 * safezoneW;
	h = 0.2 * safezoneH;
	class controls
	{
		class GeneralButton: RscButtonUPM_Tools
		{
			idc = -1;
			text = "GENERAL";
			x = ((0.47 * safezoneW + safezoneX) + (7 * 0)) * (			((safezoneW / safezoneH) min 1.2) / 40);
			y = 0;
			w = "1.65 * 			(			((safezoneW / safezoneH) min 1.2) / 10)";
			h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = "GENERAL";
			class TextPos
			{
				left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 15) * 1) * (3/4)";
				top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right = 0.005;
				bottom = 0.0;
			};
			colorFocused[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorBackground[] = {0.6,0.6,0.6,0.55};
			colorBackground2[] = {0.6,0.6,0.6,0.55};
			colorBackgroundFocused[] = {0.6,0.6,0.6,1};
			period = 0;
			periodFocus = 0;
			periodOver = 0;
			sizeEx = (((((2.42424 / 1.81818) min 1.2) / 1.2) / 25) * 0.4);
			action = QUOTE(if !(GVAR(heavyVehiclesGeneral)) then {['OPEN_GENERAL'] call FUNC(debugHeavyVehiclesHandle);});
		};

		class SpectatorButton: RscButtonUPM_Tools
		{
			idc = -1;
			text = "SPECTATOR";
			x = ((0.47 * safezoneW + safezoneX) + (7 * 1)) * (			((safezoneW / safezoneH) min 1.2) / 40);
			y = 0;
			w = "1.65 * 			(			((safezoneW / safezoneH) min 1.2) / 10)";
			h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = "SPECTATOR";
			class TextPos
			{
				left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
				top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right = 0.005;
				bottom = 0.0;
			};
			colorFocused[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorBackground[] = {0.6,0.6,0.6,0.55};
			colorBackground2[] = {0.6,0.6,0.6,0.55};
			colorBackgroundFocused[] = {0.6,0.6,0.6,1};
			period = 0;
			periodFocus = 0;
			periodOver = 0;
			sizeEx = (((((2.42424 / 1.81818) min 1.2) / 1.2) / 25) * 0.4);
			action = QUOTE(if !(GVAR(heavyVehiclesSpectator)) then {['OPEN_SPECTATOR'] call FUNC(debugHeavyVehiclesHandle);});
		};

		class Markers2dButton: RscButtonUPM_Tools
		{
			idc = -1;
			text = "MARKERS 2D";
			x = ((0.47 * safezoneW + safezoneX) + (7 * 2)) * (			((safezoneW / safezoneH) min 1.2) / 40);
			y = 0;
			w = "1.65 * 			(			((safezoneW / safezoneH) min 1.2) / 10)";
			h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = "MARKERS 2D";
			class TextPos
			{
				left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
				top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right = 0.005;
				bottom = 0.0;
			};
			colorFocused[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorBackground[] = {0.6,0.6,0.6,0.55};
			colorBackground2[] = {0.6,0.6,0.6,0.55};
			colorBackgroundFocused[] = {0.6,0.6,0.6,1};
			period = 0;
			periodFocus = 0;
			periodOver = 0;
			action = QUOTE(if !(GVAR(heavyVehiclesMarkers2d)) then {['OPEN_MARKERS2D'] call FUNC(debugHeavyVehiclesHandle);});
		};
		class Markers3dButton: RscButtonUPM_Tools
		{
			idc = -1;
			text = "MARKERS 3D";
			x = ((0.47 * safezoneW + safezoneX) + (7 * 3)) * (			((safezoneW / safezoneH) min 1.2) / 40);
			y = 0;
			w = "1.65 * 			(			((safezoneW / safezoneH) min 1.2) / 10)";
			h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = "MARKERS 3D";
			class TextPos
			{
				left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
				top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right = 0.005;
				bottom = 0.0;
			};
			colorFocused[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorBackground[] = {0.6,0.6,0.6,0.55};
			colorBackground2[] = {0.6,0.6,0.6,0.55};
			colorBackgroundFocused[] = {0.6,0.6,0.6,1};
			period = 0;
			periodFocus = 0;
			periodOver = 0;
			action = QUOTE(if !(GVAR(heavyVehiclesMarkers3d)) then {['OPEN_MARKERS3D'] call FUNC(debugHeavyVehiclesHandle);});
		};
		class UPMInfoButton: RscButtonUPM_Tools
		{
			idc = -1;
			text = "UPM INFO";
			x = ((0.47 * safezoneW + safezoneX) + (7 * 4)) * (			((safezoneW / safezoneH) min 1.2) / 40);
			y = 0;
			w = "1.65 * 			(			((safezoneW / safezoneH) min 1.2) / 10)";
			h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			tooltip = "UPM INFO";
			class TextPos
			{
				left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 16) * 1) * (3/4)";
				top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right = 0.005;
				bottom = 0.0;
			};
			colorFocused[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			colorBackground[] = {0.6,0.6,0.6,0.55};
			colorBackground2[] = {0.6,0.6,0.6,0.55};
			colorBackgroundFocused[] = {0.6,0.6,0.6,1};
			period = 0;
			periodFocus = 0;
			periodOver = 0;
			action = QUOTE(if !(GVAR(heavyVehiclesUPMInfo)) then {['OPEN_UPMINFO'] call FUNC(debugHeavyVehiclesHandle);});
		};
	};
};