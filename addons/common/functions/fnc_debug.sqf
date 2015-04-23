/****************************************************************

Author(s):
    oscarmolinadev

File:
    fnc_debug.sqf

Description:


Performance:
    0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

PARAMS_2(_msg,_level);

private ["_prefix", "_message"];

if !(IS_NUMBER(_level)) then {
    _level = 2;
};

_prefix = switch (_level) do {
	case 0: { "UPM Info" };
    case 1: { "UPM Warn" };
    case 2: { "UPM Debug" };
    case 3: { "UPM Error" };
    default { "UPM Unknown" };
};

_message = format["[%1] %2",_prefix,_msg];

diag_log text _message;