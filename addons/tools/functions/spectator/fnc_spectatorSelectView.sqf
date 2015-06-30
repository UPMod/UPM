/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_spectatorSelectView.sqf

Description:
	Select view spectator, free cam, firs person, third person

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

disableSerialization;

private [
	"_unit",
	"_cam", "_camPos",
	"_bbr","_p1","_p2","_vehLength","_vehHeight","_lenghtSpacing","_heightSpacing",
	"_role"
];

// If not exist main display (tools).
if (isNull (findDisplay D_TOOLS)) exitWith {};

// DETERMINE UNIT ----------------------------------------------- //
//----------------------------------------------------------------//

if (isNull GVAR(spectateUnit) || {!alive  GVAR(spectateUnit)}) exitWith {
	//
};

_unit = GVAR(spectateUnit);

// CAMERA ------------------------------------------------------- //
//----------------------------------------------------------------//

_cam = GETMVAR(GVAR(camera),objNull);

if (!isNull _cam) then {
	camDestroy _cam;
};

_cam = "camera" camcreate getPos _unit;
_cam camSetFocus [50, 0];
_cam camCommit 0;

showCinemaBorder false;

// missionNamespace setVariable ["upm_tools_camera",_cam];
SETMVAR(GVAR(camera),_cam);

// VIEWS -------------------------------------------------------- //
//----------------------------------------------------------------//

switch (GVAR(prespective)) do {

    case "FREECAM": {

	    if(vehicle _unit != _unit) then {

	    	_bbr = boundingBoxReal vehicle _unit;
			_p1 = _bbr select 0;
			_p2 = _bbr select 1;
			_vehLength = abs ((_p2 select 1) - (_p1 select 1));
			_vehHeight = abs ((_p2 select 2) - (_p1 select 2));
			_lenghtSpacing = _vehLength;
			_heightSpacing = _vehHeight / 1.5;

			_camPos = vehicle _unit modelToWorld [0,-_lenghtSpacing,_heightSpacing];

	    } else {
			_camPos = _unit modelToWorld [0,-3.5,2.5];
		};

		// Position
		_cam setPos _camPos;

		// Direction
		_vector = ((((getPos vehicle _unit select 0) - (getPos _cam select 0)) atan2 ((getPos vehicle _unit select 1) - (getPos _cam select 1))) + 360) % 360;
		_cam setDir _vector;

		// Angle
		_objectLocation = (getPosASL _cam) vectorDiff (getPosASL _unit);
		_angle = 90 - (atan (sqrt((((_objectLocation select 0)^2)+((_objectLocation select 1)^2)) / (_objectLocation select 2))));
		[+0,-_angle] call FUNC(spectatorRotate);

		vehicle _unit switchCamera "INTERNAL";
		_cam cameraEffect ["INTERNAL","BACK"];
    	cameraEffectEnableHUD true;
    };

    case "FIRSTPERSON": {

		_cam attachTo [_unit,[0,0,0]];
		_cam cameraEffect ["TERMINATE","BACK"];
		cameraEffectEnableHUD true;

		if (vehicle _unit != _unit) then {

			_role = (assignedVehicleRole _unit) select 0;

			switch (_role) do {
			    case "Driver": {
					vehicle _unit switchCamera "INTERNAL";
			    };
			    case "Gunner": {
					vehicle _unit switchCamera "GUNNER";
				};
			    case "Turret": {
			    	_unit switchCamera "INTERNAL";
				};
			    case "Cargo": {
					_unit switchCamera "INTERNAL";
				};
			    case "Commander": {
			    	vehicle _unit switchCamera "Internal";
				};
			};

		} else {
			_unit switchCamera "INTERNAL";
		};

    };

    case "THIRDPERSON": {

		_cam cameraeffect ["INTERNAL","BACK"];
		cameraEffectEnableHUD true;
		_cam camSetTarget vehicle _unit;
		_cam camCommit 0;

    	_bbr = boundingBoxReal vehicle _unit;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_vehLength = abs ((_p2 select 1) - (_p1 select 1));
		_vehHeight = abs ((_p2 select 2) - (_p1 select 2));
		_lenghtSpacing = _vehLength / 0.5;
		_heightSpacing = _vehHeight / 0.8;

		_cam attachTo [vehicle _unit, [0, -_lenghtSpacing, _heightSpacing]];

    };
};

_ctrlText = _display displayCtrl D_C_BAR_C_SPECTATORNAME;
ctrlSetText [D_C_BAR_C_SPECTATORNAME, name GVAR(spectateUnit)];