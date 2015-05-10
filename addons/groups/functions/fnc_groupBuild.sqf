/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_init.sqf

Description:
	Initialize group

Performance:
	0 ms

Parameter(s):
	ARRAY

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp";

PARAMS_1(_arrParams);

private [
		"_params","_object",
		"_grpLeader","_grp","_grpName","_grpMembers","_grpId","_grpPosition","_grpDirection","_grpBeh", "_grpSpeed","_grpForm","_grpType","_grpCopyMembers",
		"_marker","_shape",
	 	"_random","_delete","_radioRange"
	 ];

// INIT AND CHECK ----------------------------------------------- //
//----------------------------------------------------------------//

//Get params and convert all string parameters to uppercase
_params = [_arrParams] call FUNC(arrStrToUpper);

// Check if exist min 2 parameters on init leader of group
if ((count _params)<2) exitWith {
	["Group/Unit and marker name have to be defined!",3] call FUNC(debug);
};

// Get group/unit
_object = _params select 0;

// Get leader
_grpLeader = leader(_object);

// Check if is alive leader(group or unit)
if !(alive _grpLeader) exitWith {
	["This object isn't alive group or unit!",3] call FUNC(debug);
};

//TODO oscarmolinadev: Temporary! Future patrols have more one marker.
//Get marker and check if exist
_marker = toLower(_params select 1);
if(markerType _marker == "") exitWith {
	["Marker not exist!",3] call FUNC(debug);
};

[format["%1 minimum init successfully!",_grpLeader],0] call FUNC(debug);

// INFORMATION GROUP -------------------------------------------- //
//----------------------------------------------------------------//

//
_grp = group _grpLeader;

//
_grpPosition = getPosATL _grpLeader;

//
_grpDirection = getDir _grpLeader;




// INFORMATION MARKER ------------------------------------------- //
//----------------------------------------------------------------//