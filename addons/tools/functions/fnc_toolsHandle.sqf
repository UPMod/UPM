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

	if (isNull (findDisplay D_TOOLS)) then {

		createDialog "RscUPM_Tools";

		waitUntil {!(isNull (findDisplay D_TOOLS))};

		['Init'] call FUNC(camera);

	};

};

if (_mode == "EXIT") exitWith {

	if (!isNull (findDisplay D_TOOLS)) then {closeDialog 0};

	if (!isNil {UPM_Tools_LMB}) then {
		['Exit'] call FUNC(camera);
	}
};