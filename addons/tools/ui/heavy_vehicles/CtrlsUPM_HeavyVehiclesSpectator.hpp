class HeavyVehiclesSpectator: RscControlsGroup
{
	idc = D_C_CHEAVYVEHICLESSPECTATOR;
	text = "";
	x = (0.47 * safezoneW + safezoneX) * (			((safezoneW / safezoneH) min 1.2) / 40);
	y = 0.084 * safezoneH;
	w = 0.7271 * safezoneW;
	h = 0.6425 * safezoneH;
	class controls
	{
		/*class HeavyVehiclesBackground: RscBackgroundUPM_Window
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 0.7271 * safezoneW;
			h = 0.6425 * safezoneH;
			colorBackground[] = {0.6,0.6,0.6,0.55};
		};*/
		class HeavyVehiclesList: RscControlsGroup
		{
			idc = 7912;
			text = "";
			x = 0;
			y = 0;
			w = 0.29 * safezoneW;
			h = 0.6425 * safezoneH;
			class controls
			{
				class ListHeader: RscHeaderUPM_List
				{
					text = "HeavyVehicles";
					idc = D_C_HEAVYVEHICLESSPELISTHEADER;
					x = 0;
					y = 0;
					w = 0.289447 * safezoneW;
					h = 0.02 * safezoneH;
					shadow = 0;
				};
				class ListBox: RscIGUIUPM_ListBox
				{
					idc = D_C_HEAVYVEHICLESSPELISTBOX;
					text = "";
					x = 0 * safezoneW;
					y = 0.0435 * safezoneH;
					w = 0.2892 * safezoneW;
					h = 0.597 * safezoneH;
					canDrag = 0;
					onLBSelChanged = "";
					onLBDrag = "";
				};
				class BluforTab: RscButton
				{
					idc = -1;
					text = "BLUFOR";
					x = 0;
					y = 0.02 * safezoneH;
					w = 0.058 * safezoneW;
					h = 0.023 * safezoneH;
					tooltip = "BLUFOR";
				    colorBackground[] = {0,0.2,0.4,0.7};
    				colorBackgroundActive[] = {0,0.2,0.4,1};
    				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
    				shadow = 0;
    				style = ST_CENTER;
    				font = "puristaMedium";
					action = QUOTE(GVAR(selectedList) = 'BLUFOR'; [] call FUNC(debugHeavyVehiclesSelectList));
				};
				class OpforTab: RscButton
				{
					idc = -1;
					text = "OPFOR";
					x = 0.058 * safezoneW;
					y = 0.02 * safezoneH;
					w = 0.058 * safezoneW;
					h = 0.023 * safezoneH;
					tooltip = "OPFOR";
				    colorBackground[] = {0.502,0,0,0.7};
    				colorBackgroundActive[] = {0.502,0,0,1};
    				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
    				shadow = 0;
    				style = ST_CENTER;
    				font = "puristaMedium";
    				action = QUOTE(GVAR(selectedList) = 'OPFOR'; [] call FUNC(debugHeavyVehiclesSelectList));
				};
				class IndependentsTab: RscButton
				{
					idc = -1;
					text = "INDEPENDENTS";
					x = 0.116 * safezoneW;
					y = 0.02 * safezoneH;
					w = 0.058 * safezoneW;
					h = 0.023 * safezoneH;
					tooltip = "INDEPENDENTS";
				    colorBackground[] = {0.071,0.278,0.071,0.7};
   					colorBackgroundActive[] = {0.071,0.278,0.071,1};
    				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
    				shadow = 0;
    				style = ST_CENTER;
    				font = "puristaMedium";
    				action = QUOTE(GVAR(selectedList) = 'INDEPENDENTS'; [] call FUNC(debugHeavyVehiclesSelectList));
				};
				class CivilianTab: RscButton
				{
					idc = -1;
					text = "CIVILIANS";
					x = 0.174 * safezoneW;
					y = 0.02 * safezoneH;
					w = 0.058 * safezoneW;
					h = 0.023 * safezoneH;
					tooltip = "CIVILIAN";
				    colorBackground[] = {0.373,0.016,0.706,0.7};
    				colorBackgroundActive[] = {0.373,0.016,0.706,1};
    				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
    				shadow = 0;
    				style = ST_CENTER;
    				font = "puristaMedium";
    				action = QUOTE(GVAR(selectedList) = 'CIVILIANS'; [] call FUNC(debugHeavyVehiclesSelectList));
				};
				class PlayersTab: RscButton
				{
					idc = -1;
					text = "PLAYERS";
					x = 0.232 * safezoneW;
					y = 0.02 * safezoneH;
					w = 0.058 * safezoneW;
					h = 0.023 * safezoneH;
					tooltip = "PLAYERS";
				    colorBackground[] = {0.682,0.447,0.216,0.7};
    				colorBackgroundActive[] = {0.682,0.447,0.216,1};
    				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
    				shadow = 0;
    				style = ST_CENTER;
    				font = "puristaMedium";
    				action = QUOTE(GVAR(selectedList) = 'PLAYERS'; [] call FUNC(debugHeavyVehiclesSelectList));
				};
			};
		};
		class HeavyVehiclesMap: RscControlsGroup
		{
			idc = 79130;
			text = "";
			x = 0.2945 * safezoneW;
			y = 0;
			w = 0.4325 * safezoneW;
			h = 0.6425 * safezoneH;
			class controls
			{
				class MapHeader: RscHeaderUPM_List
				{
					text = "PREVIEW";
					idc = -1;
					x = 0;
					y = 0;
					w = 0.4323 * safezoneW;
					h = 0.02 * safezoneH;
					shadow = 0;
				};
				class ButtonFreeCam: RscButtonUPM_Tools
				{
					idc = -1;
					text = "<img image='\u\upm\addons\tools\data\icons_bar\iconcamera.paa' align='center' size='0.8' />";
					x =  0.401 * safezoneW;
					y = (0.02105 + (0.03195 * 0)) * safezoneH;
					w = "2.53 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "FREECAM";
					class TextPos
					{
						left = 0;
						top = 0.01;
						right = 0;
						bottom = 0;
					};
					colorBackground[] = {0.6,0.6,0.6,0.55};
					colorBackground2[] = {0.6,0.6,0.6,0.55};
					colorBackgroundFocused[] = {0.6,0.6,0.6,1};
					action = QUOTE(GVAR(heavyVehicleSpectatorPrespective) = 'FREECAM'; [] call FUNC(debugHeavyVehiclesSpectatorHandle));
				};
				class ButtonThirdPerson: RscButtonUPM_Tools
				{
					idc = -1;
					text = "<img image='\u\upm\addons\tools\data\icons_bar\thirdperson.paa' align='center' size='0.8' />";
					x =  0.401 * safezoneW;
					y = (0.02105 + (0.03195 * 1)) * safezoneH;
					w = "2.53 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "THIRD PERSON";
					class TextPos
					{
						left = 0;
						top = 0.01;
						right = 0;
						bottom = 0;
					};
					colorBackground[] = {0.6,0.6,0.6,0.55};
					colorBackground2[] = {0.6,0.6,0.6,0.55};
					colorBackgroundFocused[] = {0.6,0.6,0.6,1};
					action = QUOTE(GVAR(heavyVehicleSpectatorPrespective) = 'THIRDPERSON'; [] call FUNC(debugHeavyVehiclesSpectatorHandle));
				};
				class ButtonFirstPerson: RscButtonUPM_Tools
				{
					idc = -1;
					text = "<img image='\u\upm\addons\tools\data\icons_bar\firstperson.paa' align='center' size='0.5' />";
					x =  0.401 * safezoneW;
					y = (0.02105 + (0.03195 * 2)) * safezoneH;
					w = "2.53 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					tooltip = "FIRST PERSON";
					class TextPos
					{
						left = 0;
						top = 0.017;
						right = 0;
						bottom = 0;
					};
					colorBackground[] = {0.6,0.6,0.6,0.55};
					colorBackground2[] = {0.6,0.6,0.6,0.55};
					colorBackgroundFocused[] = {0.6,0.6,0.6,1};
					action = QUOTE(GVAR(heavyVehicleSpectatorPrespective) = 'FIRSTPERSON'; [] call FUNC(debugHeavyVehiclesSpectatorHandle));
				};
			};
		};
	};
};