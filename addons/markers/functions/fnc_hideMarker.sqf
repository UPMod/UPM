/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_hideMarker.sqf

Description:
	Hide marker

Performance:
	0 ms

Parameter(s):
	OBJECT - Marker

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp";

PARAMS_1(_marker);

_marker setmarkerAlpha 0;