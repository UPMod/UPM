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

// Windows
GVAR(environmentWindow) = false;
GVAR(groupsWindow) = false;
GVAR(heavyVehiclesWindow) = false;
GVAR(helisWindow) = false;
GVAR(lightVehiclesWindow) = false;
GVAR(navalWindow) = false;
GVAR(performanceWindow) = false;
GVAR(planesWindow) = false;
GVAR(settingsWindow) = false;
GVAR(staticsWindow) = false;

// UNITS
GVAR(unitsWindow) = false;
// -- CONTENT
GVAR(unitsGeneral) = false;
GVAR(unitsSpectator) = false;
GVAR(unitsMarkers2d) = false;
GVAR(unitsMarkers3d) = false;
GVAR(unitsUPMInfo) = false;