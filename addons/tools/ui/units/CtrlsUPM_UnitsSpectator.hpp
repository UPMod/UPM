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
			w = 0.3 * safezoneW;
			h = 0.6425 * safezoneH;
			class controls
			{
				class ListHeader: RscHeaderUPM_List
				{
					text = "UNITS";
					idc = 79121;
					x = 0;
					y = 0;
					w = 0.3 * safezoneW;
					h = 0.02 * safezoneH;
				};
				class ListBox: RscIGUIUPM_ListBox
				{
					idc = 79124;
					text = "";
					x = 0 * safezoneW;
					y = 0.0435 * safezoneH;
					w = 0.3 * safezoneW;
					h = 0.597 * safezoneH;
					canDrag = 1;
					onLBSelChanged = "";
					onLBDrag = "";
				};
				class BluforTab: RscButton
				{
					idc = 79126;
					text = "";
					x = 0;
					y = 0.02 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "BLUFOR";
					action = "hint 'blufor';";
				    colorBackground[] = {0,0.2,0.4,0.6};
    				colorBackgroundActive[] = {0,0.2,0.4,1};
				};
				class OpforTab: RscButton
				{
					idc = 79127;
					text = "";
					x = 0.03733334 * safezoneW;
					y = 0.02 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "OPFOR";
					action = "hint 'opfor';";
				    colorBackground[] = {0.502,0,0,0.6};
    				colorBackgroundActive[] = {0.502,0,0,1};
				};
				class IndependentTab: RscButton
				{
					idc = 79128;
					text = "";
					x = 0.05600001 * safezoneW;
					y = 0.02 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "Independent";
					action = "hint 'ind'; ";
				    colorBackground[] = {0.071,0.278,0.071,0.6};
   					colorBackgroundActive[] = {0.071,0.278,0.071,1};
				};
				class CivilianTab: RscButton
				{
					idc = 79129;
					text = "";
					x = 0.07479668 * safezoneW;
					y = 0.02 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "CIVILIAN";
					action = "hint 'civ';";
				    colorBackground[] = {0.373,0.016,0.706,0.6};
    				colorBackgroundActive[] = {0.373,0.016,0.706,1};
				};
				class PlayersTab: RscButton
				{
					idc = 791210;
					text = "";
					x = 0.09356335 * safezoneW;
					y = 0.02 * safezoneH;
					w = 0.01866667 * safezoneW;
					h = 0.020 * safezoneH;
					tooltip = "Players";
					action = "hint 'players';";
				    colorBackground[] = {0.682,0.447,0.216,0.6};
    				colorBackgroundActive[] = {0.682,0.447,0.216,1};
				};
			};
		};
	};
};