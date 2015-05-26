/****************************************************************

Author(s):
	UPMTeam

File:
	fnc_debugGetTypeofGrp.sqf

Description:


Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

PARAMS_1(_grp);

private ["_type","_vehicle_checked","_vehicle","_iscargo","_armor","_canon","_mg_gun","_missiles","_parents","_weapon","_mun"];

_type = "infantry";

_vehicle_checked = [];

{
	If (!(IsNull _x)) then
	{
		If (alive _x) then
		{
			If (!((vehicle _x) iskindof "CAManBase")) then
			{
			_vehicle = vehicle _x;
			If (!(_vehicle in _vehicle_checked)) then
			{
				_vehicle_checked pushBack _vehicle;

				If (getnumber (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "isUav") isequalto 1) exitwith {_type = "uav"};
				If (_vehicle iskindof "AIR") exitWith {_type = If (_vehicle iskindof "PLANE") then {"plane"} else {"helicopter"}};
				If (_vehicle iskindof "SHIP") exitWith {_type = "boats"};

				If (getnumber (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "artilleryScanner") isequalto 1) exitwith {_type =If (!(_vehicle isKindOf "STATICWEAPON")) then {"artillery"} else {"mortar"}};
				If ((tolower gettext (configFile >> "CfgVehicles" >> typeof _vehicle >> "vehicleClass")) isEqualTo "support") exitwith {_type = "supply"};

				If (_vehicle iskindof "car" || _vehicle iskindof "tank") exitWith
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

								_type = If (_main_gun) then {"mbt"} else {"ifv"};
							}
							else
							{
								_type = If (_iscargo) then {"ifv"} else {"mbt"};
							};
						}
						else
						{
							_type = "imv";
						}
					}
					else
					{
						If (_mg_gun) then
						{
							_type = If (_iscargo) then {"apc"} else {"imv"};
						};
					};
				};
			};
			};
		};
	};
} foreach (units _grp);

_type
