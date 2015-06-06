/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugInit.sqf

Description:


Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"

// GLOBAL VARIABLES --------------------------------------------- //
//----------------------------------------------------------------//

GVAR(state) = true;

GVAR(listUnits) = [];
GVAR(listLightVehicles) = [];
GVAR(listHeavyVehicles) = [];
GVAR(listHelis) = [];
GVAR(listPlanes) = [];
GVAR(listNaval) = [];
GVAR(listStatics) = [];
GVAR(listGroups) = [];

GVAR(markerGroups) = false;