class RscMapControl;
class RscText;
class RscButtonMenu;
class RscControlsGroup;
class RscFrame;

class RscButtonUPM_Tools: RscButtonMenu
{
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,0.8)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1.0)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1.0)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1.0)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1.0)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,0.8)";
	color[] = {1,1,1,1};
	color2[] = {1,1,1,1};
	colorFocused[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	colorBackground[] = {0,0,0,1};
	colorBackground2[] = {0,0,0,1};
	colorBackgroundFocused[] = {0,0,0,1};
	shadow = 0;
	style = 2;
	class ShortcutPos
	{
		left = 0;
		top = 0;
		w = 0;
		h = 0;
	};
};
