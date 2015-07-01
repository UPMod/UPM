class LightVehiclesWindow: RscControlsGroup
{
	idc = D_C_WLIGHTVEHICLES;
	text = "";
	x = 5.44616e-005 * safezoneW + safezoneX + 0.05;
	y = (0.1 * safezoneH + safezoneY) + (1.6 * 1) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	w = 0.738 * safezoneW;
	h = 0.736 * safezoneH;
	class controls
	{
		// WINDOW
		class LightVehiclesHeader: RscHeaderUPM_Window
		{
			idc = D_C_WHLIGHTVEHICLES;
			x = 0;
			y = 0;
			w = 0.738 * safezoneW;
			h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "LIGHT VEHICLES";
		};
		class LightVehiclesBackground: RscBackgroundUPM_Window
		{
			idc = -1;
			x = 0;
			y = 0.035 * safezoneH;
			w = 0.738 * safezoneW;
			h = 0.7 * safezoneH;
		};
		// MENU
		#include <CtrlsUPM_LightVehiclesMenu.hpp>
		// CONTENT
		#include <CtrlsUPM_LightVehiclesGeneral.hpp>
		#include <CtrlsUPM_LightVehiclesSpectator.hpp>
		#include <CtrlsUPM_LightVehiclesMarkers2d.hpp>
		#include <CtrlsUPM_LightVehiclesMarkers3d.hpp>
		#include <CtrlsUPM_LightVehiclesUPMInfo.hpp>
	};
};