/****************************************************************

Author(s):
	UPMTeam

File:
	fnc_debugGetGrpType.sqf

Description:
	Get the type of the group

Performance:
	0 ms

Parameter(s):
	<-group

Returns:
	-> type (string)

****************************************************************/

#include "script_component.hpp"

PARAMS_1(_grp);

private ["_type","_vehicle_checked","_infos","_vehicle","_iscargo","_armor","_canon","_mg_gun","_missiles","_parents","_weapon","_mun"];

_type = "infantry";

_vehicle_checked = [];
_infos = [];

{
	If (!(IsNull _x)) then
	{
		If (alive _x) then
		{
			If (!((vehicle _x) iskindof "CAManBase")) then
			{
			_vehicle = vehicle _x;
			If (!((typeof _vehicle) in _vehicle_checked)) then
			{
				_vehicle_checked pushBack (typeof _vehicle);

				If (getnumber (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "isUav") isequalto 1) then {_infos pushBack [10,"uav"]};
				If (_vehicle iskindof "PLANE") then {_infos pushBack [9,"plane"]};
				If (_vehicle iskindof "Helicopter") then {_infos pushBack [8,"helicopter"]};
				If (_vehicle iskindof "SHIP") then {_infos pushBack [7,"boats"]};

				If (getnumber (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "artilleryScanner") isequalto 1) then {If (!(_vehicle isKindOf "STATICWEAPON")) then {_infos pushBack [6,"artillery"]} else {_infos pushBack [5,"mortar"]}};
				If ((tolower gettext (configFile >> "CfgVehicles" >> typeof _vehicle >> "vehicleClass")) isEqualTo "support") then {_infos pushBack [4,"supply"]};

				If (_vehicle iskindof "car" || _vehicle iskindof "tank") then
				{
					_iscargo  = (getNumber  (configFile >> "CfgVehicles" >> typeof _vehicle >> "transportSoldier")) > 6;
					_armor  = getNumber  (configFile >> "CfgVehicles" >> typeof _vehicle >> "armor");

					_canon = false;
					_mg_gun = false;
					_missiles = false;

					{
						_parents = [(configfile >> "cfgWeapons" >> _x),true] call BIS_fnc_returnParents;
						If ("CannonCore" in _parents) then {_canon = true};
						If ("MGunCore" in _parents) then {_mg_gun = true;};
						If ("LauncherCore" in _parents) then {_missiles = true;};
					} foreach (getarray (configFile >> "cfgVehicles" >> typeOf (_vehicle) >> "Turrets" >> "MainTurret" >> "weapons"));

					If (_canon || _missiles) then
					{
						If (_canon && _armor >= 100) then
						{
							If (_armor >= 500) then
							{
								_main_gun = false;
								If (!(_weapons isEqualTo [])) then {_weapon = _weapons select 0; _mun = (getarray (configFile >> "cfgWeapons" >> _weapon >> "magazines")) select 0;_ammo = tolower gettext (configFile >> "CfgMagazines" >> _mun >> "ammo"); If (_ammo iskindof "ShellBase") then {_main_gun = true}};

								If (_main_gun) then {_infos pushBack [3,"mbt"]} else {_infos pushBack [2,"ifv"]};
							}
							else
							{
								If (_iscargo) then {_infos pushBack [2,"ifv"]} else {_infos pushBack [3,"mbt"]};
							};
						}
						else
						{
							_infos pushBack [0,"imv"];
						}
					}
					else
					{
						If (_mg_gun) then
						{
							If (_iscargo) then {_infos pushBack [1,"apc"]} else {_infos pushBack [0,"imv"]};
						};
					};
				};
			};
			};
		};
	};
} foreach (units _grp);

If (!(_infos isEqualTo [])) then {_infos sort false; _type = (_infos select 0) select 1;};

_type