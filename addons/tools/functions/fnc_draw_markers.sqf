/****************************************************************
Author(s):
	azroul13
File:
	fnc_draw_markers.sqf
Description:
	Create 2D markers for groups
Performance:
	0 ms
Parameter(s):
	
Returns:
	NOTHING
****************************************************************/

private ["_grpid","_grp","_leader","_units","_rankshort","_lastname","_markercolor","_grptype","_drawicon","_text","_waypoints","_wppos","_behaviourcolor","_attackpos","_unit"];

{
	If (UPM_Debug) then
	{
	  If (!IsNull _x) then
	  {
		  If (alive (leader _x)) then
	  	{
			  If (_x getvariable ["UPM_grp_debug_markers",true]) then
			  {
				  _grpid = _x getvariable ["UPM_grpid",0];
				  _grp = _x;

				  _leader = leader _grp;
				  _units = (units _grp) - [_leader];

				  _rankshort = [rank _leader,"displayNameShort"] call BIS_fnc_rankparams;
				  _lastname = name _leader;

				  _markercolor = (side _leader) call FUNC(GetRGBcolorside);
				  _grptype = _grp getvariable ["UPM_typeofgrp","ISMAN"];
				  _drawicon = gettext ([_grptype,side _leader] call FUNC(geticonfromgrptype));
				  _text = format ["Grp:%1: %2. %3 %4",_grpid,_rankshort, _lastname,_grp getvariable ["UPM_GrpMission",""]];

				  (_this select 0) drawIcon [_drawicon,_markercolor,visiblePosition _leader,0.5/ctrlMapScale (_this select 0),0.5/ctrlMapScale (_this select 0),direction _leader,_text];

				  If (_grp getvariable ["UPM_grp_wp_debug_markers",true]) then
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
									  (_this select 0) drawIcon [gettext (configfile >> "CfgMarkers" >> "waypoint" >> "icon"),_markercolor,_wppos,0.5/ctrlMapScale (_this select 0),0.5/ctrlMapScale (_this select 0),0,_text];
								  };
							  };
						  } foreach _waypoints;

						  _wppos = waypointPosition [_grp,currentwaypoint _grp];

						  If (!(_wppos isequalto [0,0,0])) then
						  {
							  _behaviourcolor =  (behaviour _leader) call FUNC(GetRGBcolorbehaviour);
							  (_this select 0) drawArrow [visiblePosition _leader,_wppos,_behaviourcolor];
						  };
					  };
				  };

				  If (!(_units isEqualTo [])) then
				  {
					  {
						  _unit = _x;
						  If (alive _unit) then
						  {
							  If (_unit getvariable ["UPM_unit_debug_markers",true]) then
							  {
								  If ((effectiveCommander (vehicle _unit)) isequalto _unit) then
								  {
									  _text = format ["%1 %2",currentCommand _unit];
									  _drawicon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _unit) >> "Icon");
									  (_this select 0) drawIcon [_drawicon,_markercolor,visiblePosition _unit,0.2/ctrlMapScale (_this select 0),0.2/ctrlMapScale (_this select 0),direction (driver (vehicle _unit)),_text];
								  }
							  }
						  }
					  } foreach _units;
			  	};
			  };
		  };
	  };
	};
} foreach allgrps;
