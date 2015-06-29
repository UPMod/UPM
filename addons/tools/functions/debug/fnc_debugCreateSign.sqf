/****************************************************************

Author(s):
	Azroul

File:
	fnc_debugCreateSign.sqf

Description:


Performance:
	0 ms

Parameter(s):
	0: Array/Object: position or object
	1: String:
		Type
			Sign_Arrow_Direction_F
			Sign_Arrow_Blue_F
			Sign_Pointer_F
			Sign_Sphere10cm_F
			Sign_Sphere100cm_F
			Sign_Sphere200cm_F
			Sign_Sphere25cm_F
	2: Texture (optionnal)
		'#(argb,8,8,3)color(0.5,0.5,1,0.25)'
Returns:
	0: object

****************************************************************/
#include "script_component.hpp"

PARAMS_3(_pos,_type,_texture);

private["_pos","_sign","_type","_texture"];

_sign = _type createvehicle [0,0,0];

If (!((typeName _pos) isEqualTo "ARRAY")) then {_pos = getpos _pos;};
_sign setPos _pos;

If (!IsNil "_texture") then {_sign setObjectTexture [0,_texture];};

_sign