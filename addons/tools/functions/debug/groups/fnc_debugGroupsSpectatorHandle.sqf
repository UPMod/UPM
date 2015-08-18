/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugGroupsSpectatorHandle.sqf

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
	"_grp",
	"_list"
];

_list = D_C_GROUPSSPELISTBOX;

{
	_grp = _x;
	_grpLeader = leader _grp;

	if ((lbData [_list, lbCurSel _list]) == (str _grpLeader)) exitWith {
		GVAR(spectateUnit) = _grpLeader;
		GVAR(prespective) = GVAR(groupSpectatorPrespective);
		[] call FUNC(spectatorSelectView);
	};

} count GVAR(listGroups) > 0;