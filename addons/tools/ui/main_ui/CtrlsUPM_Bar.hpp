class TabFreeCam: RscButtonUPM_Tools
{
	idc = "1030 + 						1";
	idcx = 1031;
	text = "<img image='\u\upm\addons\tools\data\icons_bar\iconcamera.paa' align='center' size='0.8' />";
	x =  (0.1 * safezoneH + safezoneY) + (1.6 * 1) * ((((safezoneW / safezoneH) min 1.2) ) / 40);
	//y = (0.1 * safezoneH + safezoneY) + (1.6 * 2) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	y = 0.97 * safezoneH + safezoneY;
	w = "1.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	tooltip = "FREECAM";
	class TextPos
	{
		left = 0;
		top = 0.01;
		right = 0;
		bottom = 0;
	};
	action = QUOTE(GVAR(prespective) = 'FREECAM'; [] call FUNC(spectatorSelectView););
};

class TabThirdPerson: RscButtonUPM_Tools
{
	idc = "1030 + 						2";
	idcx = 1032;
	text = "<img image='\u\upm\addons\tools\data\icons_bar\thirdperson.paa' align='center' size='0.8' />";
	x = (0.1 * safezoneH + safezoneY) + (1.6 * 2) * ((((safezoneW / safezoneH) min 1.2) ) / 40);
	y = 0.97 * safezoneH + safezoneY;
	w = "1.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	tooltip = "THIRD PERSON";
	class TextPos
	{
		left = 0;
		top = 0.01;
		right = 0;
		bottom = 0;
	};
	action = QUOTE(GVAR(prespective) = 'THIRDPERSON'; [] call FUNC(spectatorSelectView););
}; 

class TabFirstPerson: RscButtonUPM_Tools
{
	idc = "1030 + 						3";
	idcx = 1033;
	text = "<img image='\u\upm\addons\tools\data\icons_bar\firstperson.paa' align='center' size='0.5' />";
	x = (0.1 * safezoneH + safezoneY) + (1.6 * 3) * ((((safezoneW / safezoneH) min 1.2) ) / 40);
	y = 0.97 * safezoneH + safezoneY;
	w = "1.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	tooltip = "FIRST PERSON";
	class TextPos
	{
		left = 0;
		top = 0.017;
		right = 0;
		bottom = 0;
	};
	action = QUOTE(GVAR(prespective) = 'FIRSTPERSON'; [] call FUNC(spectatorSelectView););
};

class BarBottom: RscControlsGroup
{
	idc = "1030 + 						4";
	idcx = 1034;
	text = "";
	x = (0.1 * safezoneH + safezoneY) + (1.6 * 4) * ((((safezoneW / safezoneH) min 1.2) ) / 40);
	y = 0.97 * safezoneH + safezoneY;
	w = 0.665156 * safezoneW;
	h = 1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
	class controls
	{
		class BackgroundBar
		{
			idc = 79131;
			x = 0 * safezoneW;
			y = 0.000 * safezoneH;
			w = 0.48 * safezoneW;
			h = 1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		  	type = CT_STATIC;
		    style = ST_CENTER;
		    shadow = 0;
		    colorText[] = {1,1,1,1};
		    font = "puristaMedium";
		    sizeEx = 0.02;
	    	colorBackground[] = {0,0,0,0.8};
			colorBackground2[] = {0,0,0,0.8};
		    text = "";
		};

		class SpecatorName: RscText
		{
			idc = 79135;
			x = 0.19 * safezoneW;
			y = 0.00 * safezoneH;
			w = 0.1004437 * safezoneW;
			h = 0.030 * safezoneH;
			text = "";
			tooltip = "";
			linespacing = 1;
			fixedWidth = 0;
			sizeEx = (((((2.42424 / 1.81818) min 1.2) / 1.2) / 25) * 0.8);
		};

		class InfoSpectator: RscCheckbox
		{
			idc = 79142;
			x = 0.46 * safezoneW;
			y = 0.0007 * safezoneH;
			w = 0.0175312 * safezoneW;
			h = 0.030 * safezoneH;
			onCheckedChanged = "";
			tooltip = "SHOW INFO SPECTATOR";
		};
	};
};