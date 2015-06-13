


/*		
	GUIDE

class CSSA3_settingsControl: RscControlsGroup
		{
			idc = 7914;
			text = "";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.4048 * safezoneH;
			class controls
			{
				class CSSA3_settingsHeader: RscCSSA3HeaderText
				{
					idc = -1;
					x = 0;
					y = 0;
					w = 0.351661 * safezoneW;
					h = 0.02 * safezoneH;
					text = "$STR_CSSA3_CSSA3Settings";
				};
				class CSSA3_settingsBack: CSSA3RscTransparentBack1
				{
					idc = -1;
					x = -0.00103095 * safezoneW;
					y = 0.02220002 * safezoneH;
					w = 0.351661 * safezoneW;
					h = 0.3803 * safezoneH;
				};
				class CSSA3_settingsFrame: RscFrame
				{
					idc = 79141;
					x = 0.00020 * safezoneW;
					y = 0.0004 * safezoneH;
					w = 0.350841 * safezoneW;
					h = 0.4040 * safezoneH;
				};
				class CSSA3_cbUnitNames: RscCheckbox
				{
					idc = 79142;
					x = 0.0051565 * safezoneW;
					y = 0.033 * safezoneH;
					w = 0.0175312 * safezoneW;
					h = 0.0308 * safezoneH;
					onCheckedChanged = "['showUnitNames',_this] spawn CSSA3_fnc_settingsHandler;";
					tooltip = "$STR_CSSA3_ShowUnitNames_Tooltip";
				};
				class CSSA3_cbUnitTags: RscCheckbox
				{
					idc = 79143;
					x = 0.00515602 * safezoneW;
					y = 0.066 * safezoneH;
					w = 0.0175312 * safezoneW;
					h = 0.0308 * safezoneH;
					onCheckedChanged = "['showUnitTags',_this] spawn CSSA3_fnc_settingsHandler;";
					tooltip = "$STR_CSSA3_ShowUnitTags_Tooltip";
				};
				class CSSA3_cbClickToInteract: RscCheckbox
				{
					idc = 79144;
					x = 0.00515602 * safezoneW;
					y = 0.099 * safezoneH;
					w = 0.0175312 * safezoneW;
					h = 0.0308 * safezoneH;
					onCheckedChanged = "['enableClickToInteract',_this] spawn CSSA3_fnc_settingsHandler;";
					tooltip = "$STR_CSSA3_ClickToInteract_Tooltip";
				};
				class CSSA3_viewDistanceSlider: RscCSSA3XSliderH
				{
					idc = 79145;
					x = 0.015469 * safezoneW;
					y = 0.3200 * safezoneH;
					w = 0.319688 * safezoneW;
					h = 0.023 * safezoneH;
					onSliderPosChanged = "['distanceSliderChanged',_this] spawn CSSA3_fnc_settingsHandler;";
				};
				class CSSA3_viewdistanceText: RscText
				{
					idc = 791451;
					text = "$STR_CSSA3_ViewDistance";
					x = 0.0309377 * safezoneW;
					y = 0.302 * safezoneH;
					w = 0.0973437 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_unitNamesCbText: RscText
				{
					idc = -1;
					text = "$STR_CSSA3_ShowUnitNames";
					x = 0.0206252 * safezoneW;
					y = 0.0396 * safezoneH;
					w = 0.1546873 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_unitTagsCbText: RscText
				{
					idc = -1;
					text = "$STR_CSSA3_ShowUnitTags";
					x = 0.0206252 * safezoneW;
					y = 0.0726 * safezoneH;
					w = 0.1546873 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_clickToInteractCbText: RscText
				{
					idc = -1;
					text = "$STR_CSSA3_ClickToInteract";
					x = 0.0206252 * safezoneW;
					y = 0.1056 * safezoneH;
					w = 0.1546873 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_preloadCameraCbText: RscText
				{
					idc = -1;
					text = "$STR_CSSA3_PreloadCamera";
					x = 0.0206252 * safezoneW;
					y = 0.1386 * safezoneH;
					w = 0.1546873 * safezoneW;
					h = 0.0176 * safezoneH;
				};
				class CSSA3_cbPreloadCamera: RscCheckbox
				{
					idc = 79147;
					x = 0.00515602 * safezoneW;
					y = 0.132 * safezoneH;
					w = 0.0175312 * safezoneW;
					h = 0.0308 * safezoneH;
					onCheckedChanged = "['preloadCamera',_this] spawn CSSA3_fnc_settingsHandler;";
					tooltip = "$STR_CSSA3_PreloadCamera_tooltip";
				};
				class CSSA3_btnCloseSettings: RscButton
				{
					idc = 79148;
					text = "$STR_CSSA3_Close";
					x = 0.268125 * safezoneW;
					y = 0.363 * safezoneH;
					w = 0.0721875 * safezoneW;
					h = 0.033 * safezoneH;
					action = "['closeSettings','save'] spawn CSSA3_fnc_settingsHandler;";
				};
			};
		};
	*/