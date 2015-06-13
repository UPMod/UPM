class RscMapControl;
class RscText;
class RscButtonMenu;
class RscControlsGroup;
class RscFrame;
class RscCheckbox;

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

class RscHeaderUPM_Window
{
    access = 0;
    type = CT_STATIC;
    linespacing = 1;
    idc = -1;
    style = ST_LEFT;
    colorBackground[] = {0.071,0.278,0.071,0.7};
    colorText[] = {1,1,1,1};
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
    shadow = 2;
    font = "puristaMedium";
    sizeEx = (((((2.42424 / 1.81818) min 1.2) / 1.2) / 25) * 0.7876);
};

class RscBackgroundUPM_Window
{
    type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    shadow = 2;
    colorText[] = {1,1,1,1};
    font = "puristaMedium";
    sizeEx = 0.02;
    colorBackground[] = { 0.2,0.23,0.2, 0.7 };
    text = "";
};