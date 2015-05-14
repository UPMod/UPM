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
	"_cam", "_camPos","_vector", "_objectLocation","_angle"
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

SETMVAR(GVAR(camera),_cam);

// VIEWS -------------------------------------------------------- //
//----------------------------------------------------------------//

switch (GVAR(prespective)) do {
    case "FREECAM": {

		_camPos = _unit modelToWorld [0,-3.5,2.5];

		_cam setPos _camPos;

		_vector = ((((getPos vehicle _unit select 0) - (getPos _cam select 0)) atan2 ((getPos vehicle _unit select 1) - (getPos _cam select 1))) + 360) % 360;
		_cam setDir _vector;

		_objectLocation = (getPosASL _cam) vectorDiff (getPosASL _unit);

		_angle = 90 - (atan (sqrt((((_objectLocation select 0)^2)+((_objectLocation select 1)^2)) / (_objectLocation select 2))));

		[+0,-_angle] call upm_fnc_cameraRotate;


		vehicle _unit switchCamera "Internal";
		_cam cameraeffect ["INTERNAL","BACK"];

    	cameraEffectEnableHUD true;
    };
    case "FIRSTPERSON": {

    	cameraEffectEnableHUD true;
    };
    case "THIRDPERSON": {

    	cameraEffectEnableHUD true;
    };
};