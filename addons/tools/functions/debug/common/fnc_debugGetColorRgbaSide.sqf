/****************************************************************

Author(s):
	Azroul

File:
	fnc_getColorRgbaSide.sqf

Description:
	Get RGBA color relative to the side of the group.

Performance:
	0 ms

Parameter(s):
	Side name

Returns:
	RGBA Color

****************************************************************/

#include "script_component.hpp"

PARAMS_1(_side);

private ["_color"];

_color = switch (_side) do {
	case west: {[0,0,1,1]};
	case east: {[1,0,0,1]};
	case resistance: {[0,1,0,1]};
	default {[1,1,1,1]};
};

_color