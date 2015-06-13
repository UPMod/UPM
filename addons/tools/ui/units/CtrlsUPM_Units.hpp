class UnitsWindow: RscControlsGroup
{
	idc = D_C_WUNITS;
	text = "";
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.350625 * safezoneW;
	h = 0.4048 * safezoneH;
	class controls
	{
		class UnitsHeader: RscCSSA3HeaderText
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 0.351661 * safezoneW;
			h = 0.02 * safezoneH;
			text = "$STR_CSSA3_CSSA3Settings";
		};
		class UnitsBackground: RscBackgroundUPM_Window
		{
			idc = -1;
			x = -0.00103095 * safezoneW;
			y = 0.02220002 * safezoneH;
			w = 0.351661 * safezoneW;
			h = 0.3803 * safezoneH;
		};
		class UnitsFrame: RscFrame
		{
			idc = 79141;
			x = 0.00020 * safezoneW;
			y = 0.0004 * safezoneH;
			w = 0.350841 * safezoneW;
			h = 0.4040 * safezoneH;
		};
	};
};