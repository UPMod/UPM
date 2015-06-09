/****************************************************************

Author(s):
	oscarmolinadev
	Azroul

File:
	fnc_debugDraw2dMarkers.sqf

Description:
	Draw all markers relative to groups.

Performance:
	0 ms

Parameter(s):
	0: Control (Map)

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp";

PARAMS_1(_control);

private [
	"_unit",
	"_vehicle",
	"_grp","_leader","_waypoints","_wpPos","_wp","_wpOrder","_behaviourColor"
];

{
	_unit = _x;

	if (!isNull _unit) then {
		if (alive _unit) then {
			if (GETVAR(_unit,GVAR(debugMarker),false)) then {
				_text = "";
				_drawIcon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _unit) >> "Icon");
				_markerColor = [side _unit] call FUNC(debugGetColorRgbaSide);
				_control drawIcon [
					_drawIcon,
					_markerColor,
					visiblePosition _unit,
					0.5 / ctrlMapScale _control,
					0.5 / ctrlMapScale _control,
					direction (vehicle _unit),
					_text
				];
			};
		};
	};

} count GVAR(listUnits) > 0;

{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
			if (GETVAR(_vehicle,GVAR(debugMarker),false)) then {
				_text = "";
				_drawIcon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _vehicle) >> "Icon");
				_markerColor = [side _vehicle] call FUNC(debugGetColorRgbaSide);
				_control drawIcon [
					_drawIcon,
					_markerColor,
					visiblePosition _vehicle,
					0.8 / ctrlMapScale _control,
					0.8 / ctrlMapScale _control,
					direction (vehicle _vehicle),
					_text
				];
			};
		};
	};

} count GVAR(listLightVehicles) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
			if (GETVAR(_vehicle,GVAR(debugMarker),false)) then {
				_text = "";
				_drawIcon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _vehicle) >> "Icon");
				_markerColor = [side _vehicle] call FUNC(debugGetColorRgbaSide);
				_control drawIcon [
					_drawIcon,
					_markerColor,
					visiblePosition _vehicle,
					0.8 / ctrlMapScale _control,
					0.8 / ctrlMapScale _control,
					direction (vehicle _vehicle),
					_text
				];
			};
		};
	};

} count GVAR(listHeavyVehicles) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
			if (GETVAR(_vehicle,GVAR(debugMarker),false)) then {
				_text = "";
				_drawIcon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _vehicle) >> "Icon");
				_markerColor = [side _vehicle] call FUNC(debugGetColorRgbaSide);
				_control drawIcon [
					_drawIcon,
					_markerColor,
					visiblePosition _vehicle,
					0.8 / ctrlMapScale _control,
					0.8 / ctrlMapScale _control,
					direction (vehicle _vehicle),
					_text
				];
			};
		};
	};

} count GVAR(listHelis) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
			if (GETVAR(_vehicle,GVAR(debugMarker),false)) then {
				_text = "";
				_drawIcon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _vehicle) >> "Icon");
				_markerColor = [side _vehicle] call FUNC(debugGetColorRgbaSide);
				_control drawIcon [
					_drawIcon,
					_markerColor,
					visiblePosition _vehicle,
					0.8 / ctrlMapScale _control,
					0.8 / ctrlMapScale _control,
					direction (vehicle _vehicle),
					_text
				];
			};
		};
	};

} count GVAR(listPlanes) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
			if (GETVAR(_vehicle,GVAR(debugMarker),false)) then {
				_text = "";
				_drawIcon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _vehicle) >> "Icon");
				_markerColor = [side _vehicle] call FUNC(debugGetColorRgbaSide);
				_control drawIcon [
					_drawIcon,
					_markerColor,
					visiblePosition _vehicle,
					0.8 / ctrlMapScale _control,
					0.8 / ctrlMapScale _control,
					direction (vehicle _vehicle),
					_text
				];
			};
		};
	};

} count GVAR(listNaval) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
			if (GETVAR(_vehicle,GVAR(debugMarker),false)) then {
				_text = "";
				_drawIcon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _vehicle) >> "Icon");
				_markerColor = [side _vehicle] call FUNC(debugGetColorRgbaSide);
				_control drawIcon [
					_drawIcon,
					_markerColor,
					visiblePosition _vehicle,
					0.8 / ctrlMapScale _control,
					0.8 / ctrlMapScale _control,
					direction (vehicle _vehicle),
					_text
				];
			};
		};
	};

} count GVAR(listStatics) > 0;

{
	_grp = _x;
	_leader = leader _grp;

	if (!isNull _grp) then {
		if (alive _leader) then {
			// Markers
			if (GETVAR(_grp,GVAR(debugMarker),false)) then {
				_text = format["GRP: %1",_grp];
				_drawIcon = [_grp,side _leader] call FUNC(debugGetIconGroup);
				_markerColor = [side _grp] call FUNC(debugGetColorRgbaSide);
				_control drawIcon [
					_drawIcon,
					_markerColor,
					visiblePosition _leader,
					0.8 / ctrlMapScale _control,
					0.8 / ctrlMapScale _control,
					direction (vehicle _leader),
					_text,
					false,
					0.03,
					"TahomaB",
					"left"
				];
			};
			// Waypoints
			if (GETVAR(_grp,GVAR(debugWaypoints),false)) then {
				_waypoints = waypoints _grp;
				if (!(_waypoints isEqualTo [])) then {
					{
						_wp = _x;
						_wpOrder = _wp select 1;
						if ((_wpOrder) >= currentWaypoint _grp) then {
							_wpPos = waypointPosition _wp;
							if (!(_wpPos isEqualTo [0,0,0])) then {
								_text = format["WP: %1 GRP: %2",_wpOrder,_grp];
								_drawIcon = getText (configFile >> "CfgMarkers" >> "waypoint" >> "icon");
								_markerColor = [side _grp] call FUNC(debugGetColorRgbaSide);
								_control drawIcon [
									_drawIcon,
									_markerColor,
									_wpPos,
									0.8 / ctrlMapScale _control,
									0.8 / ctrlMapScale _control,
									0,
									_text,
									false,
									0.025,
									"TahomaB",
									"right"
								];
							};
						};
					} forEach _waypoints;
					if (GETVAR(_grp,GVAR(debugMarker),false) || GETVAR(_leader,GVAR(debugMarker),false)) then {
						_wpPos = waypointPosition [_grp,currentWaypoint _grp];
						if (!(_wpPos isEqualTo [0,0,0])) then {
							_behaviourColor =  [side _leader] call FUNC(debugGetColorRgbaBehaviour);
							_control drawArrow [visiblePosition _leader,_wpPos,_behaviourColor];
						};
					}
				};
			};
		};
	};

} count GVAR(listGroups) > 0;