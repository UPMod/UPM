/****************************************************************

Author(s):
	Karel Moricky - Bohemia Interactive
	oscarmolinadev

File:
	fnc_spectatorKeyUp.sqf

Description:
	Spectator Key Up

Performance:
	0 ms

Parameter(s):


Returns:
	Nothing

****************************************************************/

#include "script_component.hpp"

PARAMS_5(_display,_key,_shift,_ctrl,_alt);

GVAR(keys) set [_key,false];