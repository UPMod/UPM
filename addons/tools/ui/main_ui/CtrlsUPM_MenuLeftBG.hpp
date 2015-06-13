class TabLogoBG: RscLogoUPM_Tab
{
	idc = -1;
	text = "";
	x = 5.44616e-005 * safezoneW + safezoneX;
	y = (0.1 * safezoneH + safezoneY) + (1.58 * 1) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	w = "1.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	colorBackground[] = {0.227,0.341,0.584,1};
};

class PictureLogo: RscLogoUPM_Tab
{
	idc = -1;
	text = "\u\upm\addons\tools\data\icons_menu\iconupm.paa";
	x = 5.44616e-005 * safezoneW + safezoneX + 0.003;
	y = (0.1 * safezoneH + safezoneY) + (1.58 * 1) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 23);
	w = "1.4 * 			(			((safezoneW / safezoneH) min 1.2) / 45)";
	h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 28)";
	sizeEx = 0.005;
	colorBackground[] = {0.227,0.341,0.584,1};
	style = 48;
};
