class StaticsGeneral: RscControlsGroup
{
	idc = D_C_CSTATICSGENERAL;
	text = "";
	x = (0.47 * safezoneW + safezoneX) * (			((safezoneW / safezoneH) min 1.2) / 40);
	y = 0.084 * safezoneH;
	w = 0.7271 * safezoneW;
	h = 0.6425 * safezoneH;
	class controls
	{
		class StaticsBackground: RscBackgroundUPM_Window
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 0.7271 * safezoneW;
			h = 0.6425 * safezoneH;
			colorBackground[] = {0.1,0.6,0.4,0.55};
		};
	};
};