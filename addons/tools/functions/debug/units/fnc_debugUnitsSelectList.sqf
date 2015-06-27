/****************************************************************

Author(s):
	oscarmolinadev

File:
	fnc_debugUnitsSelectList.sqf

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
_list = D_C_UNITSSPELISTBOX;

lbClear _list;

{
	_unit = _x;

	if(alive _unit) then {

		_side = side _unit;

		switch (_selectedList) do {
			case "BLUFOR": {
				if(_side == west) then {
					//_color = [_side] call FUNC(debugGetColorRgbaSide);
					_color = [0.227,0.341,0.584,1];
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};

			case "OPFOR" : {
				if(_side == east) then {
					_color = [_side] call FUNC(debugGetColorRgbaSide);
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};

			case "INDEPENDENTS" : {
				if(_side == independent) then {
					_color = [_side] call FUNC(debugGetColorRgbaSide);
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};

			case "CILVILIANS" : {
				if(_side == civilian) then {
					_color = [_side] call FUNC(debugGetColorRgbaSide);
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};

			case "PLAYERS" : {
				if(isPlayer _unit) then {
					_color = [_side] call FUNC(debugGetColorRgbaSide);
					_index = lbAdd [_list, name _unit];
					lbSetData [_list, _index, str _unit];
					lbSetColor [_list, _index, _color];
				};
			};
		};

	};

} count GVAR(listUnits) > 0;