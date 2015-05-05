/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	Nelson - Bohemia Interactive
	oscarmolinadev

File:
	fnc_cameraMove.sqf

Description:
	Camera move - Nelson's solution for key lag

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

private ["_dX","_dY","_dZ","_coef","_cam","_dir","_camPos"];

_dX = _this select 0;
_dY = _this select 1;
_dZ = _this select 2;
_coef = _this select 3;

_cam = missionnamespace getvariable "UPM_Tools_Camera";

_pos = getposasl _cam;
_dir = (direction _cam) + _dX * 90;

_camPos = [
	(_pos select 0) + ((sin _dir) * _coef * _dY),
	(_pos select 1) + ((cos _dir) * _coef * _dY),
	(_pos select 2) + _dZ * _coef
];

_camPos set [2,(_camPos select 2) max (getterrainheightasl _camPos)];
_cam setposasl _camPos;