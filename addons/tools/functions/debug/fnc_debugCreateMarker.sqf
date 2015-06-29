/****************************************************************

Author(s):
	Azroul

File:
	fnc_debugcreatemarker.sqf

Description:


Performance:
	0 ms

Parameter(s):
	0: Array: position
	1: String: Shape (Icon/Rectangle/Ellipse)
	2: String:
		Type
			Icon:
				hd_ambush
				hd_arrow
				hd_destroy
				hd_dot
				hd_end
				hd_objective
				hd_start
				hd_warning
				hd_unknown
				KIA
				Minefield
				MinefieldAP
			Rectangle/Ellipse:
				BDiagonal
				Border
				Cross
				DiagGrid
				FDiagonal
				Grid
				Horizontal
				Solid
				SolidBorder
				SolidFull
				Vertical
	3: String: Color (ColorRed,ColorBlue,ColorBlack,ColorOrange,ColorGreen)
	4: Number or String: size or text for marker (optionnal)

Returns:
	0: Marker object

****************************************************************/
#include "script_component.hpp"

PARAMS_5(_pos,_shape,_type,_color,_size);

private["_pos","_m","_shape","_type","_color","_size"];


_m = createMarker [format["mPos%1%2",(floor(_pos select 0)+(random 80)),(floor(_pos select 1)+(random 80))],_pos];
_m setmarkerColor _color;
_m setMarkerShape _shape;

switch (toupper _shape) do
{
	case "ICON":
	{
		_m setMarkerType _type;
		If (!(IsNil "_size")) then {If ((typename _size) isEqualTo "STRING") then {_m setMarkerText _size;}};
	};

	default
	{
		_size = If (IsNil "_size") then {_m setMarkerText _size;} else {1};
		_m setMarkerSize _size;
		_m setMarkerBrush _type
	};
};

_m