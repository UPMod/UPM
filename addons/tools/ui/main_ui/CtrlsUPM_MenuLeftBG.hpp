class TabLogo: RscButtonUPM_Tools
{
	idc = "930 + 						0";
	idcx = 930;
	text = "<img image='\u\upm\addons\tools\data\icons_menu\iconupm.paa' align='center' size='1.1' />";
	x = 5.44616e-005 * safezoneW + safezoneX;
	y = (0.1 * safezoneH + safezoneY) + (1.58 * 1) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	w = "1.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	tooltip = "";
	class TextPos
	{
		left = 0;
		top = 0.007;
		right = 0;
		bottom = 0;
	};
	colorBackground[] = {0.227,0.341,0.584,1};
	colorBackground2[] = {0.227,0.341,0.584,1};
	colorBackgroundFocused[] = {0.227,0.341,0.584,1};
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
};