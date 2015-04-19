/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_arrStrToUpper.sqf

Description:
	Convert all strings in array to uppercase.

Performance:
	0 ms

Parameter(s):
	ARRAY

Returns:
	ARRAY

****************************************************************/

#include "script_component.hpp";

private ["_args"];

_args = [];

PARAMS_1(_params);

for [{ _i = 0 },{ _i < count _params },{ _i = _i + 1 }] do {
	_e =_params select _i;
	if (IS_STRING(_e)) then {_e = toUpper(_e)};
	_args set [_i,_e];
};

_args;