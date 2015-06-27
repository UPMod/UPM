class UnitsSpectator: RscControlsGroup
{
	idc = D_C_CUNITSSPECTATOR;
	text = "";
	x = (0.47 * safezoneW + safezoneX) * (			((safezoneW / safezoneH) min 1.2) / 40);
	y = 0.084 * safezoneH;
	w = 0.7271 * safezoneW;
	h = 0.6425 * safezoneH;
	class controls
	{
		/*class UnitsBackground: RscBackgroundUPM_Window
		{
			idc = -1;
			x = 0;
			y = 0;
			w = 0.7271 * safezoneW;
			h = 0.6425 * safezoneH;
			colorBackground[] = {0.6,0.6,0.6,0.55};
		};*/
		class UnitsList: RscControlsGroup
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
					text = "UNITS";
					idc = D_C_UNITSSPELISTHEADER;
					x = 0;
					y = 0;
					w = 0.28932 * safezoneW;
					h = 0.02 * safezoneH;
					shadow = 0;
				};
				class ListBox: RscIGUIUPM_ListBox
				{
					idc = D_C_UNITSSPELISTBOX;
					text = "";
					x = 0 * safezoneW;
					y = 0.0435 * safezoneH;
					w = 0.2892 * safezoneW;
					h = 0.597 * safezoneH;
					canDrag = 1;
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
					action = QUOTE(GVAR(selectedList) = 'BLUFOR'; [] call FUNC(debugUnitsSelectList));
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
    				action = QUOTE(GVAR(selectedList) = 'OPFOR'; [] call FUNC(debugUnitsSelectList));
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
    				action = QUOTE(GVAR(selectedList) = 'INDEPENDENTS'; [] call FUNC(debugUnitsSelectList));
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
    				action = QUOTE(GVAR(selectedList) = 'CIVILIANS'; [] call FUNC(debugUnitsSelectList));
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
    				action = QUOTE(GVAR(selectedList) = 'PLAYERS'; [] call FUNC(debugUnitsSelectList));
				};
			};
		};
	};
};