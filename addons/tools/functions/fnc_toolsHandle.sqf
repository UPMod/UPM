/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_toolsHandle.sqf

Description:


Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

PARAMS_1(_mode);

if (_mode == "INIT") exitWith {

	if (isNull (findDisplay 85001)) then {

		createDialog "RscUPM_Tools";

		waitUntil {!(isNull (findDisplay 85001))};

		[(findDisplay 85001)] call FUNC(camera);

	};

};

if (_mode == "EXIT") exitWith {


};