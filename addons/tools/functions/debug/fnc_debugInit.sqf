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
GVAR(exitTools) = true;

// Lists
GVAR(listUnits) = [];
GVAR(listLightVehicles) = [];
GVAR(listHeavyVehicles) = [];
GVAR(listHelis) = [];
GVAR(listPlanes) = [];
GVAR(listNaval) = [];
GVAR(listStatics) = [];
GVAR(listGroups) = [];


// ENVIRONMENT
GVAR(environmentWindow) = false;
// -- CONTENT
GVAR(environmentGeneral) = false;


// GROUPS
GVAR(groupsWindow) = false;
// -- CONTENT
GVAR(groupsGeneral) = false;
GVAR(groupsSpectator) = false;
GVAR(groupsMarkers2d) = false;
GVAR(groupsMarkers3d) = false;
GVAR(groupsUPMInfo) = false;
// -- MARKERS
GVAR(markerGroups) = false;


// HEAVY VEHICLES
GVAR(heavyVehiclesWindow) = false;
// -- CONTENT
GVAR(heavyVehiclesGeneral) = false;
GVAR(heavyVehiclesSpectator) = false;
GVAR(heavyVehiclesMarkers2d) = false;
GVAR(heavyVehiclesMarkers3d) = false;
GVAR(heavyVehiclesUPMInfo) = false;


// HELIS
GVAR(helisWindow) = false;
// -- CONTENT
GVAR(helisGeneral) = false;
GVAR(helisSpectator) = false;
GVAR(helisMarkers2d) = false;
GVAR(helisMarkers3d) = false;
GVAR(helisUPMInfo) = false;


// LIGHT VEHICLES
GVAR(lightVehiclesWindow) = false;
// -- CONTENT
GVAR(lightVehiclesGeneral) = false;
GVAR(lightVehiclesSpectator) = false;
GVAR(lightVehiclesMarkers2d) = false;
GVAR(lightVehiclesMarkers3d) = false;
GVAR(lightVehiclesUPMInfo) = false;


// NAVAL
GVAR(navalWindow) = false;
// -- CONTENT
GVAR(navalGeneral) = false;
GVAR(navalSpectator) = false;
GVAR(navalMarkers2d) = false;
GVAR(navalMarkers3d) = false;
GVAR(navalUPMInfo) = false;


// PERFORMANCE
GVAR(performanceWindow) = false;
// -- CONTENT
GVAR(performanceGeneral) = false;


// PLANES
GVAR(planesWindow) = false;
// -- CONTENT
GVAR(planesGeneral) = false;
GVAR(planesSpectator) = false;
GVAR(planesMarkers2d) = false;
GVAR(planesMarkers3d) = false;
GVAR(planesUPMInfo) = false;


// SETTINGS
GVAR(settingsWindow) = false;
// -- CONTENT
GVAR(settingsGeneral) = false;


// STATICS
GVAR(staticsWindow) = false;
// -- CONTENT
GVAR(staticsGeneral) = false;
GVAR(staticsSpectator) = false;
GVAR(staticsMarkers2d) = false;
GVAR(staticsMarkers3d) = false;
GVAR(staticsUPMInfo) = false;


// UNITS
GVAR(unitsWindow) = false;
// -- CONTENT
GVAR(unitsGeneral) = false;
GVAR(unitsSpectator) = false;
GVAR(unitsMarkers2d) = false;
GVAR(unitsMarkers3d) = false;
GVAR(unitsUPMInfo) = false;