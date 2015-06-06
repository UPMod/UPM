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
		switch (true) do {
		    case (_vehicle isKindOf "Car" && !(_vehicle isKindOf "Tank")): {
		    	if(!(_vehicle in _tmpLightVehicles)) then {
		    		_tmpLightVehicles pushBack _vehicle;
		    	};
		    };
		    case (_vehicle isKindOf "Tank"): {
		    	if(!(_vehicle in _tmpHeavyVehicles)) then {
		    		_tmpHeavyVehicles pushBack _vehicle;
		    	};
		    };
		    case (_vehicle isKindOf "Helicopter"): {
		    	if(!(_vehicle in _tmpHelis)) then {
		    		_tmpHelis pushBack _vehicle;
		    	};
		    };
		    case (_vehicle isKindOf "Plane"): {
		    	if(!(_vehicle in _tmpPlanes)) then {
		    		_tmpPlanes pushBack _vehicle;
		    	};
		    };
		    case (_vehicle isKindOf "Ship"): {
		    	if(!(_vehicle in _tmpNaval)) then {
		    		_tmpNaval pushBack _vehicle;
		    	};
		    };
		    case (_vehicle isKindOf "StaticWeapon"): {
		    	if(!(_vehicle in _tmpStatics)) then {
		    		_tmpStatics pushBack _vehicle;
		    	};
		    };
		};

	};

	if (!(_grp in _tmpGroups)) then {
		_tmpGroups pushBack _grp;
	};

} forEach allUnits;

["===============================================================================================",2] call FUNC(debug);

[format["Units: %1",_tmpUnits],2] call FUNC(debug);
[format["Light Vehicles: %1",_tmpLightVehicles],2] call FUNC(debug);
[format["Heavy Vehicles: %1",_tmpHeavyVehicles],2] call FUNC(debug);
[format["Helicopters: %1",_tmpHelis],2] call FUNC(debug);
[format["Planes: %1",_tmpPlanes],2] call FUNC(debug);
[format["Naval: %1",_tmpNaval],2] call FUNC(debug);
[format["Static Weapon: %1",_tmpStatics],2] call FUNC(debug);
[format["Groups: %1",_tmpGroups],2] call FUNC(debug);

["===============================================================================================",2] call FUNC(debug);

if !(GVAR(state)) then {
	[_pfh] call CBA_fnc_removePerFrameHandler;
};