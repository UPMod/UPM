/****************************************************************
Author(s):
	azroul13
File:
	fnc_getRGBcolorside.sqf
Description:
	Get RGB color relative to the side of the group.
Performance:
	0 ms
Parameter(s):
	Side name
Returns:
	RGB Color
****************************************************************/
private ["_color"];

_color = switch (_this) do
{
	case west: {[0,0,1,1]};
	case east: {[1,0,0,1]};
	case resistance: {[0,1,0,1]};
	default {[1,1,1,1]};
};

_color
