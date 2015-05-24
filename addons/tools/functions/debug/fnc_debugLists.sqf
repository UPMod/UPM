/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugLists.sqf

Description:
	Get all list, units, vehicles etc by side.

Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

PARAMS_2(_args,_pfh);

private [
	"_unit",
	"_vehicle"
];

{
	_unit = _x;

	if (alive _unit) then {

		_vehicle = vehicle _unit;

	};

} count(allUnits);

if !(GVAR(state)) then {
	[_pfh] call CBA_fnc_removePerFrameHandler;
};