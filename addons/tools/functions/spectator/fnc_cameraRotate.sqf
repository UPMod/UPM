private ["_cam","_dX","_dY","_pitchbank"];

_cam = missionnamespace getvariable "UPM_Tools_Camera";
_dX = _this select 0;
_dY = _this select 1;

_pitchbank = _cam call bis_fnc_getpitchbank;

_cam setdir (direction _cam + _dX);

[
	_cam,
	(_pitchbank select 0) + _dY,
	0
] call bis_fnc_setpitchbank;