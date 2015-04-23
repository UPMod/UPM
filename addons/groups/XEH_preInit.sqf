/****************************************************************

Author(s):
	oscarmolinadev

File:
	XEH_preInit.sqf

Description:
	Init global variables

Performance:
	0 ms

Parameter(s):
	NOTHING

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

if (!isServer && hasInterface ) exitWith {};

// upm_groups_all - Global variable of groups
GVAR(all) = [];
publicVariable QGVAR(all);

// upm_group_qtt - Global variable quantity
GVAR(qtt) = 0;
publicVariable QGVAR(qtt);