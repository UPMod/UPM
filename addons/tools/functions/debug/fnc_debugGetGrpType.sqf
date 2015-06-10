/****************************************************************

Author(s):
	Azroul
	oscarmolinadev

File:
	fnc_debugGetGrpType.sqf

Description:
	Get the type of the group

Performance:
	0 ms

Parameter(s):
	0: Group

Returns:
	STRING: Type

****************************************************************/

#include "script_component.hpp"

PARAMS_1(_grp);

//private ["_type","_vehicle_checked","_infos","_vehicle","_iscargo","_armor","_canon","_mg_gun","_missiles","_parents","_weapon","_mun"];
private [
	"_unit","_vehicle",
	"_type","_vehChecked","_typesGrp",
	"_isCargo","_armor","_canon","_mgGun","_missiles",
	"_turrets","_weapons","_weapon","_mun"
];


_type = "infantry";
_vehChecked = [];
_typesGrp = [];

{

	_unit = _x;
	_vehicle = vehicle _unit;
	_vehType = typeOf _vehicle;

	if (!(isNull _unit)) then {

		if (alive _unit) then {

			if (!(_vehicle isKindOf "CAManBase")) then {

				if (!(_vehType in _vehChecked)) then {

					_vehChecked pushBack _vehType;

					switch (true) do {
						// UAV
					    case (getNumber (configFile >> "cfgVehicles" >> _vehType >> "isUav") isEqualTo 1): {
							_typesGrp pushBack [10,"uav"];
					    };
					    // PLANES
					    case (_vehicle isKindOf "Plane"): {
					    	_typesGrp pushBack [9,"plane"];
						};
					    // HELICOPTERS
					    case (_vehicle isKindOf "Helicopter"): {
					    	_typesGrp pushBack [8,"helicopter"];
						};
					    // NAVAL / BOATS
					    case (_vehicle isKindOf "Ship"): {
					    	_typesGrp pushBack [7,"boats"];
						};
					    // ARTILLERY
					    case (
				          getNumber (configFile >> "cfgVehicles" >> _vehType >> "artilleryScanner") isEqualTo 1 &&
				          !(_vehicle isKindOf "StaticWeapon")
				        ): {
					    	_typesGrp pushBack [6,"artillery"];
						};
						 // MORTAR
					    case (
				          getNumber (configFile >> "cfgVehicles" >> _vehType >> "artilleryScanner") isEqualTo 1 &&
				          (_vehicle isKindOf "StaticWeapon")
					    ): {
					    	_typesGrp pushBack [5,"mortar"];
						};
						// SUPPORT
					    case ((toLower getText (configFile >> "CfgVehicles" >> _vehType >> "vehicleClass")) isEqualTo "support"): {
					    	_typesGrp pushBack [4,"supply"];
						};
						// LIGHT / HEAVY LAND VEHICLE
					    case (_vehicle isKindOf "Car" || _vehicle isKindOf "Tank"): {

							_isCargo = (getNumber (configFile >> "CfgVehicles" >> _vehType >> "transportSoldier")) > 6;
							_armor = getNumber (configFile >> "CfgVehicles" >> _vehType >> "armor");
							_turrets = getArray (configFile >> "cfgVehicles" >> _vehType >> "Turrets" >> "MainTurret" >> "weapons");

							_canon = false;
							_mgGun = false;
							_missiles = false;

							{
								_weapons = [(configfile >> "cfgWeapons" >> _x),true] call BIS_fnc_returnParents;

								switch (true) do {
								    case ("CannonCore" in _weapons): {
								    	_canon = true;
								    };
								    case ("MGunCore" in _weapons): {
								    	_mgGun = true;
									};
									case ("LauncherCore" in _weapons): {
										_missiles = true;
									};
								};

							} forEach _turrets;

							if (_canon || _missiles) then {

								if (_canon && _armor >= 100) then {

									if (_armor >= 500) then {

										if (!(_weapons isEqualTo [])) then {
											_weapon = _weapons select 0;
											_mun = (getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines")) select 0;
											_ammo = toLower getText (configFile >> "CfgMagazines" >> _mun >> "ammo");

											if (_ammo iskindof "ShellBase") then { _typesGrp pushBack [3,"mbt"]; } else { _typesGrp pushBack [2,"ifv"]; };
										};

									} else {
										if (_isCargo) then { _typesGrp pushBack [2,"ifv"]} else {_typesGrp pushBack [3,"mbt"]};
									};
								} else {
									_typesGrp pushBack [0,"imv"];
								}
							} else {
								if (_mgGun && _isCargo) then { _typesGrp pushBack [1,"apc"]; } else { _typesGrp pushBack [0,"imv"]; };
							};

						};
					};

				};

			};

		};

	};

} forEach (units _grp);

if (!(_typesGrp isEqualTo [])) then {_typesGrp sort DESC; _type = (_typesGrp select 0) select 1;};

_type