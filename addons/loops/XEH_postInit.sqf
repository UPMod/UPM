// UPM - LOOPS
#include "script_component.hpp"

[{


diag_log text "addPerFrame loop 1";


}, 5] call CBA_fnc_addPerFrameHandler;


[{


diag_log text "addPerFrame loop 2";


}, 5] call CBA_fnc_addPerFrameHandler;