class UnitsWindow: RscControlsGroup
{
	idc = D_C_WUNITS;
	text = "";
	x = 5.44616e-005 * safezoneW + safezoneX + 0.05;
	y = (0.1 * safezoneH + safezoneY) + (1.6 * 1) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	w = 0.738 * safezoneW;
	h = 0.8 * safezoneH;
	class controls
	{
		class UnitsHeader: RscHeaderUPM_Window
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 0.738 * safezoneW;
			h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "UNITS";
		};
		class UnitsBackground: RscBackgroundUPM_Window
		{
			idc = -1;
			x = 0;
			y = 0.035 * safezoneH;
			w = 0.738 * safezoneW;
			h = 0.7 * safezoneH;
		};
	};
};