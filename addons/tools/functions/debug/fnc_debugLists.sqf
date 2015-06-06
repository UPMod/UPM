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
	"_unit","_grp","_rank",
	"_vehicle",
	"_type",
	"_tmpUnits", "_tmpLightVehicles","_tmpHeavyVehicles","_tmpHelis","_tmpPlanes","_tmpNaval","_tmpStatics","_tmpGroups"
];

_tmpUnits = [];
_tmpLightVehicles = [];
_tmpHeavyVehicles = [];
_tmpHelis = [];
_tmpPlanes = [];
_tmpNaval = [];
_tmpStatics = [];
_tmpGroups = [];

{
	// All info
	_unit = _x;
	_grp = group _unit;
	_rank = [rank _unit,"displayNameShort"] call BIS_fnc_rankParams;
	_vehicle = vehicle _unit;

	// Init

	if (_unit == _vehicle && !(_unit in _tmpUnits)) then {

		// Soldiers
		_tmpUnits pushBack _unit;

	} else {

		// Vehicles



	};

	if (!(_grp in _tmpGroups)) then {
		_tmpGroups pushBack _grp;
	};


	//[format["Unit: %1 || Vehicle: %2 || Group: %3 || Rank: %4",_unit, _vehicle, _grp, _rank],2] call FUNC(debug);
	//[format["Type: %1",_type],2] call FUNC(debug);

} forEach allUnits;

["===============================================================================================",2] call FUNC(debug);

[format["Units: %1",_tmpUnits],2] call FUNC(debug);
[format["Groups: %1",_tmpGroups],2] call FUNC(debug);

["===============================================================================================",2] call FUNC(debug);

if !(GVAR(state)) then {
	[_pfh] call CBA_fnc_removePerFrameHandler;
};