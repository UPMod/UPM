/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_init.sqf

Description:
	Pre initialize group

Performance:
	0 ms

Parameter(s):
	ARRAY

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp";

if (!isServer && hasInterface ) exitWith {};

GVAR(init) pushBack [_this];