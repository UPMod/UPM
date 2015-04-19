#include "script_component.hpp";

if (!isServer && hasInterface ) exitWith {};

private ["_test"];

_test = _this call FUNC(getArguments);

diag_log format["UPM: %1",count(_test)];

