class StaticsWindow: RscControlsGroup
{
	idc = D_C_WSTATICS;
	text = "";
	x = 5.44616e-005 * safezoneW + safezoneX + 0.05;
	y = (0.1 * safezoneH + safezoneY) + (1.6 * 1) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	w = 0.738 * safezoneW;
	h = 0.736 * safezoneH;
	class controls
	{
		// WINDOW
		class StaticsHeader: RscHeaderUPM_Window
		{
			idc = D_C_WHSTATICS;
			x = 0;
			y = 0;
			w = 0.738 * safezoneW;
			h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "STATICS";
		};
		class StaticsBackground: RscBackgroundUPM_Window
		{
			idc = -1;
			x = 0;
			y = 0.035 * safezoneH;
			w = 0.738 * safezoneW;
			h = 0.7 * safezoneH;
		};
		// MENU
		#include <CtrlsUPM_StaticsMenu.hpp>
		// CONTENT
		#include <CtrlsUPM_StaticsGeneral.hpp>
		#include <CtrlsUPM_StaticsSpectator.hpp>
		#include <CtrlsUPM_StaticsMarkers2d.hpp>
		#include <CtrlsUPM_StaticsMarkers3d.hpp>
		#include <CtrlsUPM_StaticsUPMInfo.hpp>
	};
};