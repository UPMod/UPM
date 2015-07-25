/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugNavalSpectatorHandle.sqf

Description:


Performance:
	0 ms

Parameter(s):
	0: STRING - Action

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

disableSerialization;

private [
	"_unit",
	"_list"
];

_list = D_C_NAVALSPELISTBOX;

{
	_unit = _x;

	if ((lbData [_list, lbCurSel _list]) == (str _unit)) exitWith {
		GVAR(spectateUnit) = _unit;
		GVAR(prespective) = GVAR(navalSpectatorPrespective);
		[] call FUNC(spectatorSelectView);
	};

} count GVAR(listNaval) > 0;