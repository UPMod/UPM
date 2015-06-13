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

// Global
GVAR(state) = true;

// Lists
GVAR(listUnits) = [];
GVAR(listLightVehicles) = [];
GVAR(listHeavyVehicles) = [];
GVAR(listHelis) = [];
GVAR(listPlanes) = [];
GVAR(listNaval) = [];
GVAR(listStatics) = [];
GVAR(listGroups) = [];

// Markers: Groups
GVAR(markerGroups) = false;

// Markers: Groups
GVAR(unitsWindow) = false;