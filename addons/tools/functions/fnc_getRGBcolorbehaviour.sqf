/****************************************************************
Author(s):
	azroul13
File:
	fnc_getRGBcolorbehaviour.sqf
Description:
	Initialize group
Performance:
	0 ms
Parameter(s):
	Behaviour string
Returns:
	RGB Color
****************************************************************/
private ["_color"];

_color = switch (_this) do
{
	case "CARELESS": {[0,0,1,1]};
	case "SAFE": {[0,1,0,1]};
	case "AWARE": {[0.8,0.4,0.05,1]};
	case "COMBAT": {[1,0,0,1]};
	default {[0.6,0.07,0.4,1]};
};

_color
