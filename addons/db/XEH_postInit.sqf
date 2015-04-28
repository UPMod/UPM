/****************************************************************

Author(s):
	oscarmolinadev

File:
	XEH_postInit.sqf

Description:
	Init global variables

Performance:
	0 ms

Parameter(s):
	NOTHING

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

//[QUOTE(PATHTOF(ui\ButtonTools.hpp)),2] call FUNC(debug);

_configs = "diag_log configName _x; true" configClasses (configFile >> "UPM_Cities_Altis");



//[getText(configFile >> "UPM_Cities" >> "upm_city_test1" >> "name"),0] call FUNC(debug);