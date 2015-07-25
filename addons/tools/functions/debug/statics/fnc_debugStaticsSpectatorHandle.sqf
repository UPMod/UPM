/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugUnitsSpectatorHandle.sqf

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

_list = D_C_STATICSSPELISTBOX;

{
	_unit = _x;

	if ((lbData [_list, lbCurSel _list]) == (str _unit)) exitWith {
		GVAR(spectateUnit) = _unit;
		GVAR(prespective) = GVAR(staticSpectatorPrespective);
		[] call FUNC(spectatorSelectView);
	};

} count GVAR(listStatics) > 0;