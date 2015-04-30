/****************************************************************
Author(s):
	azroul13
File:
	fnc_init.sqf
Description:
	Get NATO icon relative to the type of group and shape relative to the group side
Performance:
	0 ms
Parameter(s):
	ARRAY
	  <-- Type of group (string)
	  <-- Side of group
Returns:
	icon text
****************************************************************/
private ["_icontype","_icon","_array"];

_icontype = switch (_this select 0) do
{
	case "diving_grp": {"b_naval"};
	case "diving_at_grp": {"b_naval"};
	case "diving_aa_grp": {"b_naval"};
	case "diving_mg_grp": {"b_naval"};
	case "diving_snp_grp": {"b_naval"};
	case "transportboat_squadron": {"b_naval"};
	case "combatboat_squadron": {"b_naval"};
	case "patrolboat_squadron": {"b_naval"};
	case "mbt_squadron": {"b_armor"};
	case "lt_squadron": {"b_mech_inf"};
	case "ifv_squadron": {"b_mech_inf"};
	case "apc_squadron": {"b_motor_inf"};
	case "imv_squadron": {"b_recon"};
	case "ah_flight": {"b_air"};
	case "th_flight": {"b_air"};
	case "uh_flight": {"b_air"};
	case "fighters_flight": {"b_plane"};
	case "transport_flight": {"b_plane"};
	case "spa_battery": {"b_art"};
	case "mrl_battery": {"b_art"};
	case "mortar_battery": {"b_art"};
	case "static_battery": {"b_art"};
	case "uav_flight": {"b_uav"};
	case "ugv_grp": {"b_uav"};
	case "supply_grp": {"b_support"};
	default {"b_inf"};
};

switch (_this select 1) do
{
	default {};
	case EAST: {_array = toarray _icontype; _array set [0,111]; _icontype = toString _array};
	case resistance: {_array = toarray _icontype; _array set [0,110]; _icontype = toString _array};
};

_icon = configfile >> "CfgMarkers" >> _icontype >> "icon";
_icon
