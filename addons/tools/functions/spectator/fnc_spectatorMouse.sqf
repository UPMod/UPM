/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorMouse.sqf

Description:
	Spectator Mouse

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_4(_ctrlDisp,_mX,_mY,_dPosMouseO);

private [
	"_cam",
	"_camPos","_defX","_defY","_dX","_dY","_camZ",
	"_pitchBank", "_pitch","_bank",
	"_coef"
];

_display = ctrlParent (_ctrlDisp);

// missionNamespace getVariable ["upm_tools_camera",objNull];
_cam = GETMVAR(GVAR(camera),objNull);

_pitchBank = GVAR(cameraPitchBank);
_pitch = _pitchBank select 0;
_bank = _pitchBank select 1;

// Camera movement
if (GVAR(LMB) || GVAR(RMB)) then {

	if (GVAR(LMB)) then {

		_defX = GVAR(LMBclick) select 0;
		_defY = GVAR(LMBclick) select 1;

		_camZ = (getPosATL _cam select 2) max 1 min 256;
		_dX = (_mX - _defX) * _camZ / 2;
		_dY = -(_mY - _defY) * _camZ / 2;

		_camPos = getPosASL _cam;
		_camPos = [_camPos,_dY,direction _cam] call BIS_fnc_relPos;
		_camPos = [_camPos,_dX,direction _cam + 90] call BIS_fnc_relPos;
		_cam setPosASL _camPos;

	} else {

		_defX = GVAR(RMBclick) select 0;
		_defY = GVAR(RMBclick) select 1;

		_dX = (_mX - _defX) * 180;
		_dY = -(_mY - _defY) * 180;

		if (GVAR(keys) select DIK_LCONTROL) then {
			_bank = (_bank + _dX * 0.1) max -180 min +180;
			GVAR(cameraPitchBank) set [1,_bank];
		} else {
			_cam setDir (direction _cam + _dX);
			_pitch = (_pitch + _dY) max -90 min +90;
		};

		[
			_cam,
			_pitch,
			_bank
		] call BIS_fnc_setPitchBank;

		GVAR(RMBclick) = [_mX,_defY];
	};

};

_coef = 0.1;

if (GVAR(keys) select DIK_LMENU) then {_coef = _coef * 100;};
if (GVAR(keys) select DIK_LSHIFT) then {_coef = _coef * 10;};
if (GVAR(keys) select DIK_RSHIFT) then {_coef = _coef / 10;};

if (GVAR(keys) select DIK_W) then {[0,1,0,_coef] call FUNC(spectatorMove);};
if (GVAR(keys) select DIK_S) then {[0,-1,0,_coef] call FUNC(spectatorMove);};
if (GVAR(keys) select DIK_A) then {[-1,1,0,_coef] call FUNC(spectatorMove);};
if (GVAR(keys) select DIK_D) then {[1,1,0,_coef] call FUNC(spectatorMove);};

if (GVAR(keys) select DIK_Q) then {[0,0,1,_coef] call FUNC(spectatorMove);};
if (GVAR(keys) select DIK_Z) then {[0,0,-1,_coef] call FUNC(spectatorMove);};

if (GVAR(keys) select DIK_NUMPAD1) then {[-1,-1] call FUNC(spectatorRotate);};
if (GVAR(keys) select DIK_NUMPAD1) then {[-1,-1] call FUNC(spectatorRotate);};
if (GVAR(keys) select DIK_NUMPAD2) then {[+0,-1] call FUNC(spectatorRotate);};
if (GVAR(keys) select DIK_NUMPAD3) then {[+1,-1] call FUNC(spectatorRotate);};
if (GVAR(keys) select DIK_NUMPAD4) then {[-1,+0] call FUNC(spectatorRotate);};
if (GVAR(keys) select DIK_NUMPAD6) then {[+1,+0] call FUNC(spectatorRotate);};
if (GVAR(keys) select DIK_NUMPAD7) then {[-1,+1] call FUNC(spectatorRotate);};
if (GVAR(keys) select DIK_NUMPAD8) then {[+0,+1] call FUNC(spectatorRotate);};
if (GVAR(keys) select DIK_NUMPAD9) then {[+1,+1] call FUNC(spectatorRotate);};

if (GVAR(keys) select DIK_ADD) then {
	GVAR(cameraFov) = (GVAR(cameraFov) - 0.01) max 0.01;
	_cam camPrepareFov GVAR(cameraFov);
	_cam camCommitPrepared 0;
};

if (GVAR(keys) select DIK_SUBTRACT) then {
	GVAR(cameraFov) = (GVAR(cameraFov) + 0.01) min 1;
	_cam camPrepareFov GVAR(cameraFov);
	_cam camCommitPrepared 0;
};