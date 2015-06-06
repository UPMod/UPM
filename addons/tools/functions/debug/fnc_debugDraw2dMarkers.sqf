/****************************************************************

Author(s):
	Azroul13

File:
	fnc_debugDraw2dMkrs.sqf

Description:
	Draw all markers relative to groups.

Performance:
	0 ms

Parameter(s):
	0: Control (Map)

Returns:


****************************************************************/

#include "script_component.hpp";

PARAMS_1(_control);

private [
	"_unit",
	"_vehicle"
];

{
	_unit = _x;

	if (!isNull _unit) then {
		if (alive _unit) then {
			_text = "";
			_drawIcon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _unit) >> "Icon");
			_markerColor = [side _unit] call FUNC(debugGetColorRgbaSide);
			_control drawIcon [
				_drawIcon,
				_markerColor,
				visiblePosition _unit,
				0.8 / ctrlMapScale _control,
				0.8 / ctrlMapScale _control,
				direction (vehicle _unit),
				_text
			];
		};
	};

} count GVAR(listUnits) > 0;

{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
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

} count GVAR(listLightVehicles) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
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

} count GVAR(listHeavyVehicles) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
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

} count GVAR(listHelis) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
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

} count GVAR(listPlanes) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
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

} count GVAR(listNaval) > 0;


{
	_vehicle = _x;

	if (!isNull _vehicle) then {
		if (alive _vehicle) then {
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

} count GVAR(listStatics) > 0;

/*{
	_unit = _x;

	if (!isNull _unit) then {
		if (alive _unit) then {
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

} count GVAR(listGroups) > 0;*/


/*private ["_grpid","_grp","_leader","_units","_rankshort","_lastname","_markercolor","_drawicon","_text","_waypoints","_wppos","_behaviourcolor","_unit"];

{
	If (!IsNull _x) then
	{
		If (alive (leader _x)) then
		{
			If (_x getvariable ["UPM_activate_grp_mkr",true]) then
			{
				_grpid = _x getvariable ["UPM_grpid",0];
				_grp = _x;

				_leader = leader _grp;
				_units = (units _grp) - [_leader];

				_rankshort = [rank _leader,"displayNameShort"] call BIS_fnc_rankparams;
				_lastname = name _leader;

				_markercolor = [side _leader] call FUNC(debugGetColorRgbaSide);
				_drawicon = [_grp,side _leader] call FUNC(debugGetIconGroup);
				_text = format ["Grp:%1: %2. %3 %4",_grpid,_rankshort, _lastname,_grp getvariable ["UPM_GrpMission",""]];

				_Control drawIcon [_drawicon,_markercolor,visiblePosition _leader,0.5/ctrlMapScale _Control,0.5/ctrlMapScale _Control,direction _leader,_text];

				If (_grp getvariable ["UPM_activate_wp_mkr",true]) then
				{
					_waypoints = waypoints _grp;
					If (!(_waypoints isequalto [])) then
					{
						{
							If ((_x select 1) >= currentwaypoint _grp) then
							{
								_wppos = waypointPosition _x;
								If (!(_wppos isequalto [0,0,0])) then
								{
									_text = format ["Grp:%1: %2",_grpid,waypointType _x];

									_Control drawIcon [gettext (configfile >> "CfgMarkers" >> "waypoint" >> "icon"),_markercolor,_wppos,0.5/ctrlMapScale _Control,0.5/ctrlMapScale _Control,0,_text];
								};
							};
						} foreach _waypoints;

						_wppos = waypointPosition [_grp,currentwaypoint _grp];

						If (!(_wppos isequalto [0,0,0])) then
						{
							_behaviourcolor =  [side _leader] call FUNC(debugGetColorRgbaBehaviour);
							_Control drawArrow [visiblePosition _leader,_wppos,_behaviourcolor];
						};
					};
				};

				If (!(_units isEqualTo [])) then
				{
					{
						_unit = _x;
						If (alive _unit) then
						{
							If (_unit getvariable ["UPM_activate_unit_mkr",true]) then
							{
								If ((effectiveCommander (vehicle _unit)) isequalto _unit) then
								{
									_text = format ["%1 %2",currentCommand _unit];
									_drawicon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _unit) >> "Icon");
									_Control drawIcon [_drawicon,_markercolor,visiblePosition _unit,0.2/ctrlMapScale _Control,0.2/ctrlMapScale _Control,direction (driver (vehicle _unit)),_text];
								}
							}
						}
					} foreach _units;
				};
			};
		};
	};

} foreach allGroups;*/