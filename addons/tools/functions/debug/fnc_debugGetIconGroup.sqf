/****************************************************************

Author(s):
	UPMTeam

File:
	fnc_debugGetIconGroup.sqf

Description:
	Get icon relative to the type of the group.

Performance:
	0 ms

Parameter(s):
	group
	side

Returns:
	icon.paa

****************************************************************/

#include "script_component.hpp"

PARAMS_2(_grp,_side);

private ["_icon","_array"];


_icon = switch ([_grp] call FUNC(debugGetTypeofGrp)) do {
	case "plane": {"b_plane"};
	case "helicopter": {"b_air"};
	case "boats": {"b_naval"};
	case "artillery": {"b_art"};
	case "mortar": {"b_mortar"};
	case "supply": {"b_support"};
	case "mbt": {"b_armor"};
	case "ifv": {"b_mech_inf"};
	case "apc": {"b_motor_inf"};
	case "imv": {"b_recon"};
	case "uav": {"b_uav"};
	default {"b_infantry"};
};

switch (_side) do {
	case EAST: {_array = toArray _icon;_array set [0,110];_icon = toString _array;};
	case resistance: {_array = toArray _icon;_array set [0,111];_icon = toString _array;};
	default {};
};

_icon = (configfile >> "CfgMarkers" >> _icon >> "icon");

_icon
