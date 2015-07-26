/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugGroupsSelectList.sqf

Description:


Performance:
	0 ms

Parameter(s):
	0: STRING - Action

Returns:
	NOTHING

****************************************************************/

#include "script_component.hpp"

disableserialization;

private [
	"_selectedList", "_list","_index",
	"_unit", "_side","_color"
];

if (isNil {GVAR(selectedList)}) exitWith {};

_selectedList = GVAR(selectedList);
_list = D_C_GROUPSSPELISTBOX;

lbClear _list;

{
	_unit = _x;

	if(alive _unit) then {

		_side = side _unit;

		switch (_selectedList) do {
			case "BLUFOR": {
				if(_side == west) then {
					_color = [0,0.2,0.4,0.7];
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};

			case "OPFOR" : {
				if(_side == east) then {
					_color = [0.502,0,0,0.7];
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};

			case "INDEPENDENTS" : {
				if(_side == independent) then {
					_color = [0.071,0.278,0.071,0.7];
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};

			case "CIVILIANS" : {
				if(_side == civilian) then {
					_color = [0.373,0.016,0.706,0.7];
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};

			case "PLAYERS" : {
				if(isPlayer _unit) then {
					_color = [0.682,0.447,0.216,0.7];
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};
		};

	};

} count GVAR(listGroups) > 0;