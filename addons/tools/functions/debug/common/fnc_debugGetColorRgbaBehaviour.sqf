/****************************************************************

Author(s):
	Azroul

File:
	fnc_getColorRgbaBehaviour.sqf

Description:
	Initialize group

Performance:
	0 ms

Parameter(s):
	Behaviour string

Returns:
	RGBA Color

****************************************************************/

#include "script_component.hpp"

PARAMS_1(_behaviour);

private ["_color"];

_color = switch (_behaviour) do {
	case "CARELESS": {[0,0,1,1]};
	case "SAFE": {[0,1,0,1]};
	case "AWARE": {[0.8,0.4,0.05,1]};
	case "COMBAT": {[1,0,0,1]};
	default {[0.6,0.07,0.4,1]};
};

_color