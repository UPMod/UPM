/****************************************************************

Author(s):
	Karel Moricky
	oscarmolinadev

File:
	fnc_camera.sqf

Description:
	Camera

Performance:
	0 ms

Parameter(s):


Returns:


****************************************************************/

#include "script_component.hpp"
#include "dik_codes.hpp"

disableserialization;
_mode = [_this,0,"Init",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;

switch _mode do {

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Init": {
		upm_fnc_camera_draw3D = addmissioneventhandler ["draw3d","with (uinamespace) do {['Draw3D',_this] call upm_fnc_camera;};"];

		//--- Create camera
		_camPos = [
			(position cameraon select 0),
			(position cameraon select 1),
			(position cameraon select 2) + 2
		];
		_cam = missionnamespace getvariable ["upm_fnc_camera_cam","camera" camcreate _camPos];
		_cam cameraeffect ["internal","back"];
		//_cam campreparefov 0.7;
		//_cam camcommitprepared 0;
		showcinemaborder false;
		cameraEffectEnableHUD true;
		vehicle cameraon switchcamera cameraview;

		//--- Declare variables
		missionnamespace setvariable ["upm_fnc_camera_cam",_cam];

		upm_fnc_camera_LMB = false;
		upm_fnc_camera_RMB = false;
		upm_fnc_camera_keys = [];
		upm_fnc_camera_LMBclick = [0,0];
		upm_fnc_camera_RMBclick = [0,0];
		upm_fnc_camera_pitchbank = [0,0];
		upm_fnc_camera_fov = 0.7;
		upm_fnc_camera_iconCamera = gettext (configfile >> "RscDisplayCamera" >> "iconCamera");
		upm_fnc_camera_vision = 0;
		upm_fnc_camera_visibleHUD = true;
		upm_fnc_camera_cameraView = cameraview;

		cameraon switchcamera "internal";

		_DIKcodes = true call bis_fnc_keyCode;
		_DIKlast = _DIKcodes select (count _DIKcodes - 1);
		for "_k" from 0 to (_DIKlast - 1) do {
			upm_fnc_camera_keys set [_k,false];
		};

		_display = _this select 0;
		upm_fnc_camera_display = _display;
		_display displayaddeventhandler ["keydown","with (uinamespace) do {['KeyDown',_this] call upm_fnc_camera;};"];
		_display displayaddeventhandler ["keyup","with (uinamespace) do {['KeyUp',_this] call upm_fnc_camera;};"];
		_display displayaddeventhandler ["mousebuttondown","with (uinamespace) do {['MouseButtonDown',_this] call upm_fnc_camera;};"];
		_display displayaddeventhandler ["mousebuttonup","with (uinamespace) do {['MouseButtonUp',_this] call upm_fnc_camera;};"];
		_display displayaddeventhandler ["mousezchanged","with (uinamespace) do {['MouseZChanged',_this] call upm_fnc_camera;};"];

	/*	_ctrlMouseArea = _display displayctrl 3140;
		_ctrlMouseArea ctrladdeventhandler ["mousemoving","with (uinamespace) do {['Mouse',_this] call upm_fnc_camera;};"];
		_ctrlMouseArea ctrladdeventhandler ["mouseholding","with (uinamespace) do {['Mouse',_this] call upm_fnc_camera;};"];
		ctrlsetfocus _ctrlMouseArea;

		_ctrlMap = _display displayctrl 3141;
		_ctrlMap ctrlenable false;
		_ctrlMap ctrladdeventhandler ["draw","with (uinamespace) do {['MapDraw',_this] call upm_fnc_camera;};"];
		_ctrlMap ctrladdeventhandler ["mousebuttonclick","with (uinamespace) do {['MapClick',_this] call upm_fnc_camera;};"];

		_ctrlOverlay = _display displayctrl 3142;
		_ctrlOverlay ctrlenable false;

		_positions = profilenamespace getvariable ["upm_fnc_camera_positions",[]];
		_positions resize 10;
		profilenamespace setvariable ["upm_fnc_camera_positions",_positions];
		_ctrlPositions = _display displayctrl 31422;
		_ctrlPositions ctrlsettext "1:\n2:\n3:\n4:\n5:\n6:\n7:\n8:\n9:\n0";

		_ctrlSliderFocus = _display displayctrl 31430;
		_ctrlSliderFocus ctrladdeventhandler ["sliderposchanged","with (uinamespace) do {['SliderFocus',_this] call upm_fnc_camera;};"];
		_ctrlSliderFocus slidersetposition 0;
		["SliderFocus",[_ctrlSliderFocus,sliderposition _ctrlSliderFocus]] call upm_fnc_camera;

		_ctrlSliderAperture = _display displayctrl 31432;
		_ctrlSliderAperture ctrladdeventhandler ["sliderposchanged","with (uinamespace) do {['SliderAperture',_this] call upm_fnc_camera;};"];
		_ctrlSliderAperture slidersetposition 0;
		_ctrlSliderAperture ctrlsettooltip "Aperture changes takes some time and cannot be achieved when game is paused.";
		["SliderAperture",[_ctrlSliderAperture,sliderposition _ctrlSliderAperture]] call upm_fnc_camera;

		_ctrlSliderDaytime = _display displayctrl 31434;
		_ctrlSliderDaytime slidersetrange [0,24 * 60];
		_ctrlSliderDaytime ctrladdeventhandler ["sliderposchanged","with (uinamespace) do {['SliderDaytime',_this] call upm_fnc_camera;};"];
		_ctrlSliderDaytime slidersetposition (daytime * 60);
		["SliderDaytime",[_ctrlSliderDaytime,sliderposition _ctrlSliderDaytime]] call upm_fnc_camera;

		_ctrlSliderOvercast = _display displayctrl 31436;
		_ctrlSliderOvercast slidersetrange [0,1];
		_ctrlSliderOvercast ctrladdeventhandler ["sliderposchanged","with (uinamespace) do {['SliderOvercast',_this] call upm_fnc_camera;};"];
		_ctrlSliderOvercast slidersetposition overcast;
		_ctrlSliderOvercast ctrlsettooltip "In order for changes to take effect, you have to modify daytime as well.";
		["SliderOvercast",[_ctrlSliderOvercast,sliderposition _ctrlSliderOvercast]] call upm_fnc_camera;

		_ctrlSliderAcctime = _display displayctrl 31438;
		_ctrlSliderAcctime slidersetrange [0,1];
		_ctrlSliderAcctime ctrladdeventhandler ["sliderposchanged","with (uinamespace) do {['SliderAcctime',_this] call upm_fnc_camera;};"];
		_ctrlSliderAcctime slidersetposition 0;
		["SliderAcctime",[_ctrlSliderOvercast,sliderposition _ctrlSliderAcctime]] call upm_fnc_camera;*/

		upm_fnc_camera_showPositions = {
			disableserialization;
			_display = _this;
			_ctrlPositions = _display displayctrl 31422;
			_text = "";
			{
				_text = _text + str _foreachindex + ": ";
				if (isnil "_x") then {
					_text = _text + format ["[ Ctrl + %1 ]",_foreachindex];
				} else {
					_params = _positions select _foreachindex;
					_text = _text + format [
						"%1",
						mapgridposition (_params select 1)
						//[(_params select 5),"HH:MM:SS"] call bis_fnc_timetostring
					]
				};
				_text = _text + "\n";
			} foreach _positions;
			_ctrlPositions ctrlsettext _text;
		};
		_display call upm_fnc_camera_showPositions;

		//--- Disable menu chromatic aberration
		[] call bis_fnc_guiEffectTiles;

		//--- Remove mission overlay
		_displayMission = [] call (uinamespace getvariable "bis_fnc_displayMission");
		_control = _displayMission displayctrl 11400;
		_control ctrlsetfade 1;
		_control ctrlcommit 0;

		//--- Remove overlays
		cuttext ["","plain"];
		titletext ["","plain"];
		_layers = missionnamespace getvariable ["bis_fnc_rscLayer_list",[]];

		for "_l" from 1 to (count _layers - 1) step 2 do {
			(_layers select _l) cuttext ["","plain"];
		};
		clearradio;
		enableradio false;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Mouse": {
		_display = ctrlparent (_this select 0);
		_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
		_pitchbank = upm_fnc_camera_pitchbank;
		_pitch = _pitchbank select 0;
		_bank = _pitchbank select 1;

		//--- Camera movement
		if (upm_fnc_camera_LMB || upm_fnc_camera_RMB) then {
			_mX = _this select 1;
			_mY = _this select 2;

			if (upm_fnc_camera_LMB) then {

				_defX = upm_fnc_camera_LMBclick select 0;
				_defY = upm_fnc_camera_LMBclick select 1;

				_camZ = (getposatl _cam select 2) max 1 min 256;
				_dX = (_mX - _defX) * _camZ / 2;
				_dY = -(_mY - _defY) * _camZ / 2;

				_camPos = getposasl _cam;
				_camPos = [_camPos,_dY,direction _cam] call bis_fnc_relpos;
				_camPos = [_camPos,_dX,direction _cam + 90] call bis_fnc_relpos;
				_cam setposasl _camPos;
			//};
			//if (upm_fnc_camera_RMB) then  {
			} else {

				_defX = upm_fnc_camera_RMBclick select 0;
				_defY = upm_fnc_camera_RMBclick select 1;

				_dX = (_mX - _defX) * 180;
				_dY = -(_mY - _defY) * 180;

				if (upm_fnc_camera_keys select DIK_LCONTROL) then {
					_bank = (_bank + _dX * 0.1) max -180 min +180;
					upm_fnc_camera_pitchbank set [1,_bank];
				} else {
					_cam setdir (direction _cam + _dX);
					_pitch = (_pitch + _dY) max -90 min +90;
				};
				[
					_cam,
					_pitch,
					_bank
				] call bis_fnc_setpitchbank;
				upm_fnc_camera_RMBclick = [_mX,_defY];
			};

		};

		//--- Cursortarget
		_pos = screentoworld [0.5,0.5];
		_intersectCam = getposasl _cam;
		_intersectTarget = [_pos select 0,_pos select 1,getterrainheightasl _pos];
		_objects = lineIntersectswith [
			_intersectCam,
			_intersectTarget,
			objnull,
			objnull,
			true
		];
		_ctrlFrame = _display displayctrl 31421;
		_object = objnull;
		if (count _objects > 0) then {
			_ctrlOverlay = _display displayctrl 3142;
			_object = _objects select (count _objects - 1);
			missionnamespace setvariable ["upm_fnc_camera_target",_object];

			_objectBbox = boundingbox _object;
			_objectBboxZ = (abs((_objectBbox select 0) select 2) + abs((_objectBbox select 1) select 2)) / 2;
			_objectPos = worldtoscreen [position _object select 0,position _object select 1,(getposatl _object select 2) + _objectBboxZ / 2];
			if (count _objectPos > 0) then {
				//_objectSize = sizeof typeof _object;
				_objectSize =
					abs((_objectBbox select 0) select 0) + abs((_objectBbox select 1) select 0)
					max
					abs((_objectBbox select 0) select 1) + abs((_objectBbox select 1) select 1)
					max
					abs((_objectBbox select 0) select 2) + abs((_objectBbox select 1) select 2);
				_objectDis = _cam distance _object;

				_ctrlFrameSize = (_objectSize / _objectDis / 2) max 0.1;
				_ctrlFrame ctrlsetposition [
					(_objectPos select 0) - safezoneX - ((_ctrlFrameSize / 2) * 3/4),
					(_objectPos select 1) - safezoneY - (_ctrlFrameSize / 2),
					_ctrlFrameSize * 3/4,
					_ctrlFrameSize
				];
			} else {
				missionnamespace setvariable ["upm_fnc_camera_target",objnull];
				_ctrlFrame ctrlsetposition [-10,-10,0,0];
			};
		} else {
			missionnamespace setvariable ["upm_fnc_camera_target",objnull];
			_ctrlFrame ctrlsetposition [-10,-10,0,0];
		};
		_ctrlFrame ctrlcommit 0;

		_camDir = direction _cam;
		_cardinalDir = round (_camDir / 45);
		_cardinalDirText = [
			"str_move_n",
			"str_move_ne",
			"str_move_e",
			"str_move_se",
			"str_move_s",
			"str_move_sw",
			"str_move_w",
			"str_move_nw"
		] select _cardinalDir;
		_cardinalDirText = localize _cardinalDirText;

		//--- Debug text
		_ctrlDebug = _display displayctrl 31420;
		_ctrlDebug ctrlsettext (
			"\n\n" +
			"X = " + str(position _cam select 0) + "\n" +
			"Y = " + str(position _cam select 1) + "\n" +
			"Z = " + str(position _cam select 2) + "\n" +
			"FOV = " + str(upm_fnc_camera_fov) + "\n" +
			"Dir = " + str(round _camDir) + "° (" + _cardinalDirText + ")\n" +
			"Pitch = " + str(round (_pitch)) + "°\n" +
			"Bank = " + str(round (_bank) % 360) + "°\n" +
			"upm_fnc_camera_target = " + str(_object) + "\n"
		);

		//--- Nelson's solution for key lag
		_camMove = {
			_dX = _this select 0;
			_dY = _this select 1;
			_dZ = _this select 2;
			_pos = getposasl _cam;
			_dir = (direction _cam) + _dX * 90;
			_camPos = [
				(_pos select 0) + ((sin _dir) * _coef * _dY),
				(_pos select 1) + ((cos _dir) * _coef * _dY),
				(_pos select 2) + _dZ * _coef
			];
			_camPos set [2,(_camPos select 2) max (getterrainheightasl _camPos)];
			_cam setposasl _camPos;
		};
		_camRotate = {
			_dX = _this select 0;
			_dY = _this select 1;
			_pitchbank = _cam call bis_fnc_getpitchbank;
			_cam setdir (direction _cam + _dX);
			[
				_cam,
				(_pitchbank select 0) + _dY,
				0
			] call bis_fnc_setpitchbank;
		};

		_coef = 0.1;
		if (upm_fnc_camera_keys select DIK_LMENU) then {_coef = _coef * 100;};
		if (upm_fnc_camera_keys select DIK_LSHIFT) then {_coef = _coef * 10;};
		if (upm_fnc_camera_keys select DIK_RSHIFT) then {_coef = _coef / 10;};

		if (upm_fnc_camera_keys select DIK_W) then {[0,1,0] call _camMove;};
		if (upm_fnc_camera_keys select DIK_S) then {[0,-1,0] call _camMove;};
		if (upm_fnc_camera_keys select DIK_A) then {[-1,1,0] call _camMove;};
		if (upm_fnc_camera_keys select DIK_D) then {[1,1,0] call _camMove;};

		if (upm_fnc_camera_keys select DIK_Q) then {[0,0,1] call _camMove;};
		if (upm_fnc_camera_keys select DIK_Z) then {[0,0,-1] call _camMove;};

		if (upm_fnc_camera_keys select DIK_NUMPAD1) then {[-1,-1] call _camRotate;};
		if (upm_fnc_camera_keys select DIK_NUMPAD1) then {[-1,-1] call _camRotate;};
		if (upm_fnc_camera_keys select DIK_NUMPAD2) then {[+0,-1] call _camRotate;};
		if (upm_fnc_camera_keys select DIK_NUMPAD3) then {[+1,-1] call _camRotate;};
		if (upm_fnc_camera_keys select DIK_NUMPAD4) then {[-1,+0] call _camRotate;};
		if (upm_fnc_camera_keys select DIK_NUMPAD6) then {[+1,+0] call _camRotate;};
		if (upm_fnc_camera_keys select DIK_NUMPAD7) then {[-1,+1] call _camRotate;};
		if (upm_fnc_camera_keys select DIK_NUMPAD8) then {[+0,+1] call _camRotate;};
		if (upm_fnc_camera_keys select DIK_NUMPAD9) then {[+1,+1] call _camRotate;};

		if (upm_fnc_camera_keys select DIK_ADD) then {
			upm_fnc_camera_fov = (upm_fnc_camera_fov - 0.01) max 0.01;
			_cam campreparefov upm_fnc_camera_fov;
			_cam camcommitprepared 0;
		};
		if (upm_fnc_camera_keys select DIK_SUBTRACT) then {
			upm_fnc_camera_fov = (upm_fnc_camera_fov + 0.01) min 1;
			_cam campreparefov upm_fnc_camera_fov;
			_cam camcommitprepared 0;
		};
	};


	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonDown": {
		_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
		_button = _this select 1;
		_mX = _this select 2;
		_mY = _this select 3;
		_shift = _this select 4;
		_ctrl = _this select 5;
		_alt = _this select 6;

		if (_button > 0) then {
			upm_fnc_camera_RMB = true;
			upm_fnc_camera_RMBclick = [_mX,_mY];
		} else {
			upm_fnc_camera_LMB = true;
			upm_fnc_camera_LMBclick = [_mX,_mY];
		};
		upm_fnc_camera_pitchbank = _cam call bis_fnc_getpitchbank;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonUp": {
		_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
		_button = _this select 1;
		if (_button > 0) then {
			upm_fnc_camera_RMB = false;
			upm_fnc_camera_RMBclick = [0,0];
		} else {
			upm_fnc_camera_LMB = false;
			upm_fnc_camera_LMBclick = [0,0];
		};

		upm_fnc_camera_pitchbank = _cam call bis_fnc_getpitchbank;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseZChanged": {
		_display = _this select 0;
		_ctrlMap = _display displayctrl 3141;
		if !(ctrlenabled _ctrlMap) then {

			_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
			_camVector = vectordir _cam;

			_dZ = (_this select 1) * 10;
			_vX = (_camVector select 0) * _dZ;
			_vY = (_camVector select 1) * _dZ;
			_vZ = (_camVector select 2) * _dZ;

			_camPos = getposasl _cam;
			_camPos = [
				(_camPos select 0) + _vX,
				(_camPos select 1) + _vY,
				(_camPos select 2) + _vZ
			];
			_camPos set [2,(_camPos select 2) max (getterrainheightasl _camPos)];
			_cam setposasl _camPos;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "KeyDown": {
		//_this call bis_fnc_log;
		_display = _this select 0;
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		_return = false;

		upm_fnc_camera_keys set [_key,true];

		_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
		_camSave = {
			_positions = profilenamespace getvariable ["upm_fnc_camera_positions",[]];
			if (_ctrl) then {
				_positions set [
					_this,
					_camParams
				];
				profilenamespace setvariable ["upm_fnc_camera_positions",_positions];
				saveprofilenamespace;

				_display call upm_fnc_camera_showPositions;
			} else {
				_params = _positions select _this;
				if !(isnil "_params") then {
					["Paste",_params] call upm_fnc_camera;
				};
			};
			_return = true;
		};
		_camParams = [
			worldname,
			position _cam,
			direction _cam,
			upm_fnc_camera_fov,
			upm_fnc_camera_pitchbank,
			sliderposition (_display displayctrl 31430),
			sliderposition (_display displayctrl 31432),
			sliderposition (_display displayctrl 31434),
			sliderposition (_display displayctrl 31436),
			sliderposition (_display displayctrl 31438)
		];

		switch (_key) do {

			case (DIK_1): {1 call _camSave;};
			case (DIK_2): {2 call _camSave;};
			case (DIK_3): {3 call _camSave;};
			case (DIK_4): {4 call _camSave;};
			case (DIK_5): {5 call _camSave;};
			case (DIK_6): {6 call _camSave;};
			case (DIK_7): {7 call _camSave;};
			case (DIK_8): {8 call _camSave;};
			case (DIK_9): {9 call _camSave;};
			case (DIK_0): {0 call _camSave;};

			case (DIK_F1): {
				_display createdisplay "RscDisplayDebugPublic";
				_result = true;
			};
/*
			case (DIK_F2);
			case (DIK_F3);
			case (DIK_F4);
			case (DIK_F5);
			case (DIK_F6);
			case (DIK_F7);
			case (DIK_F8);
			case (DIK_F9);
			case (DIK_F10);
			case (DIK_F11);
			case (DIK_F12): {_return = true;};
*/

			case (DIK_NUMPAD5): {
				upm_fnc_camera_pitchbank = [0,0];
				[0,0] call _camRotate;
				upm_fnc_camera_fov = 0.7;
				_camPos = position _cam;
				_camDir = direction _cam;
				_cam cameraeffect ["terminate","back"];
				camdestroy _cam;
				_cam = "camera" camcreate _camPos;
				_cam cameraeffect ["internal","back"];
				_cam setdir _camDir;
				missionnamespace setvariable ["upm_fnc_camera_cam",_cam];
			};

			case (DIK_M): {
				_ctrlMouseArea = _display displayctrl 3140;
				_ctrlMap = _display displayctrl 3141;
				if (ctrlenabled _ctrlMap) then {
					_ctrlMouseArea ctrlenable true;
					_ctrlMap ctrlenable false;
					ctrlsetfocus _ctrlMap;
					_ctrlMap ctrlsetposition [-10,-10,0.8 * safezoneW,0.8 * safezoneH];
					_ctrlMap ctrlcommit 0;
				} else {
					_ctrlMouseArea ctrlenable false;
					_ctrlMap ctrlenable true;
					ctrlsetfocus _ctrlMap;
					_ctrlMapPos = [
						safezoneX + 0.1 * safezoneW,
						safezoneY + 0.1 * safezoneH,
						0.8 * safezoneW,
						0.8 * safezoneH
					];
					_ctrlMap ctrlsetposition _ctrlMapPos;
					_ctrlMap ctrlcommit 0;
					_ctrlMap ctrlmapanimadd [0,0.1,position _cam];
					ctrlmapanimcommit _ctrlMap;
					{player reveal [_x,4]} foreach allunits;
				};
			};

			case (DIK_H);
			case (DIK_L): {
				_ctrlOverlays = [_display displayctrl 3142,_display displayctrl 3143];
				if (upm_fnc_camera_visibleHUD) then {
					{_x ctrlsetfade 1;} foreach _ctrlOverlays;
					(_display displayctrl 3142) ctrlenable false;
					cameraEffectEnableHUD false;
				} else {
					{_x ctrlsetfade 0;} foreach _ctrlOverlays;
					(_display displayctrl 3142) ctrlenable true;
					cameraEffectEnableHUD true;
				};
				upm_fnc_camera_visibleHUD = !upm_fnc_camera_visibleHUD;
				{_x ctrlcommit 0.1} foreach _ctrlOverlays;
			};

			case (DIK_X): {
				if (_ctrl) then {
					[
						"Paste",
						_camParams
					] spawn {
						copytoclipboard format ["%1 call upm_fnc_camera;",_this];
					};
				};
			};
			case (DIK_C): {
				if (_ctrl) then {
					_camParams spawn {
						copytoclipboard format ["%1",_this];
					};
				};
			};
			case (DIK_V): {
				if (_ctrl) then {
					_clipboard = call compile copyfromclipboard;
					if (typename _clipboard == typename []) then {
						_clipboard = [[_clipboard],0,[],[[]],[10]] call bis_fnc_paramIn;
						if (count _clipboard == 10) then {
							["Paste",_clipboard] call upm_fnc_camera;
						} else {
							["Wrong format of camera params (""%1"")",copyfromclipboard] call bis_fnc_error;
						};
					};
				};
			};

			case (DIK_N): {
				upm_fnc_camera_vision = upm_fnc_camera_vision + 1;
				_vision = upm_fnc_camera_vision % 4;
				switch (_vision) do {
					case 0: {
						camusenvg false;
						false SetCamUseTi 0;
					};
					case 1: {
						camusenvg true;
						false SetCamUseTi 0;
					};
					case 2: {
						camusenvg false;
						true SetCamUseTi 0;
					};
					case 3: {
						camusenvg false;
						true SetCamUseTi 1;
					};
				};
			};

			case (DIK_P): {
				if (_ctrl) then {
					if (cheatsenabled) then {
						_filename = format (["SplendidCamera\%1_['%2',%3,%4,%5,%6,%7,%8,%9,%10,%11].png",profilename] + _camParams);
						_filename call compile "diag_screenshot _this;";
					};
				};
			};

			case (DIK_SPACE): {
				_vehicle = vehicle player;
				_worldPos = screentoworld [0.5,0.5];
				_vehicle setposatl [_worldPos select 0,_worldPos select 1,getposatl _vehicle select 2];
				_vehicle setvelocity [0,0,0];
			};

			case (DIK_ESCAPE): {
				_return = true;
				_this spawn {
					disableserialization;
					_display = _this select 0;
					_message = [
						"Do you really want to quit?",
						"SPLENDID CAMERA",
						nil,
						true,
						_display
					] call bis_fnc_guimessage;
					if (_message) then {
						_display closedisplay 2;
					};
				};
			};
			default {};
		};
		_return
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "KeyUp": {
		upm_fnc_camera_keys set [_this select 1,false];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Draw3D": {
		if (upm_fnc_camera_visibleHUD) then {
			_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
			_locations = nearestlocations [position _cam,["nameVillage","nameCity","nameCityCapital"],2000];
			{
				_pos = locationposition _x;
				_pos set [2,0];
				drawicon3d [
					"#(argb,8,8,3)color(0,0,0,0)",
					[1,1,1,1],
					_pos,
					0,
					0,
					0,
					text _x,
					1
				];
			} foreach _locations;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapDraw": {
		_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
		_ctrlMap = _this select 0;
		_ctrlMap drawIcon [
			upm_fnc_camera_iconCamera,
			[0,1,1,1],
			position _cam,
			32,
			32,
			direction _cam,
			"",
			1
		];
		//[texture, color, position, width, height, angle, text, shadow]
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapClick": {
		_ctrlMap = _this select 0;
		_button = _this select 1;
		_posX = _this select 2;
		_posY = _this select 3;
		if (_button == 0) then {
			_worldPos = _ctrlMap ctrlmapscreentoworld [_posX,_posY];
			_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
			_cam setpos [
				_worldPos select 0,
				_worldPos select 1,
				getposatl _cam select 2
			];
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SliderFocus": {
		private ["_display"];
		_display = ctrlparent (_this select 0);
		_value = _this select 1;
		_value = _value^2;
		_focus = 1;
		_text = str (round (_value * 1000) / 1000) + " m";
		if (_value == 0) then {_value = -1; _text = "AUTO";};
		if (_value == 100) then {_value = -1; _focus = -1; _text = "DISABLED";};

		_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
		_cam campreparefocus [_value,_focus];
		_cam camcommitprepared 0;

		_ctrlValue = _display displayctrl 31431;
		_ctrlValue ctrlsettext _text;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SliderAperture": {
		private ["_display"];
		_display = ctrlparent (_this select 0);
		_value = _this select 1;
		_value = _value^2;
		_text = str (round (_value * 100) / 100);
		if (_value == 0) then {_value = -1; _text = "AUTO";};

		setaperture _value;

		_ctrlValue = _display displayctrl 31433;
		_ctrlValue ctrlsettext _text;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SliderDaytime": {
		private ["_display"];
		_display = ctrlparent (_this select 0);
		_value = _this select 1;
		_text = [_value / 60,"HH:MM:SS"] call bis_fnc_timetostring;

		0 setovercast (sliderposition (_display displayctrl 31436));

		_date = date;
		_date set [3,0];
		_date set [4,_value];
		setdate _date;

		_ctrlValue = _display displayctrl 31435;
		_ctrlValue ctrlsettext _text;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SliderOvercast": {
		private ["_display"];
		_display = ctrlparent (_this select 0);
		_value = _this select 1;
		_text = str (round (_value * 100) / 100);

		0 setovercast _value;
		forceweatherchange;

		_ctrlValue = _display displayctrl 31437;
		_ctrlValue ctrlsettext _text;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SliderAcctime": {
		private ["_display"];
		_display = ctrlparent (_this select 0);
		_value = _this select 1;
		_text = str (round (_value * 100) / 100);

		setacctime _value;

		_ctrlValue = _display displayctrl 31439;
		_ctrlValue ctrlsettext _text;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Paste": {
		_this spawn {
			disableserialization;
			[] call upm_fnc_camera;
			waituntil {!isnil {uinamespace getvariable "upm_fnc_camera_display"}};
			with uinamespace do {
				_worldname =	[_this,0,"",[""]] call bis_fnc_paramIn;
				if (_worldname != worldname) exitwith {["Camera params are for world ""%1"", you're currently on ""%2""",_worldname,worldname] call bis_fnc_error;};
				_pos =		[_this,1,position player,[[]],[3]] call bis_fnc_paramIn;
				_dir =		[_this,2,direction player,[0]] call bis_fnc_paramIn;
				_fov =		[_this,3,upm_fnc_camera_fov,[0]] call bis_fnc_paramIn;
				_pitchbank =	[_this,4,[0,0],[[]],[2]] call bis_fnc_paramIn;
				_focus =	[_this,5,0,[0]] call bis_fnc_paramIn;
				_aperture =	[_this,6,0,[0]] call bis_fnc_paramIn;
				_daytime =	[_this,7,daytime,[0]] call bis_fnc_paramIn;
				_overcast =	[_this,8,overcast,[0]] call bis_fnc_paramIn;
				_acctime =	[_this,9,0,[0]] call bis_fnc_paramIn;

				_pitch =	[_pitchbank,0,0,[0]] call bis_fnc_paramIn;
				_bank =		[_pitchbank,1,0,[0]] call bis_fnc_paramIn;

				_display = uinamespace getvariable ["upm_fnc_camera_display",displaynull];
				_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
				_cam setpos _pos;
				_cam setdir _dir;
				upm_fnc_camera_fov = _fov;
				[
					_cam,
					_pitch,
					_bank
				] call bis_fnc_setpitchbank;

				_cam campreparefov upm_fnc_camera_fov;
				_cam camcommitprepared 0;
				upm_fnc_camera_pitchbank = _pitchbank;
				(_display displayctrl 31430) slidersetposition _focus;
				(_display displayctrl 31432) slidersetposition _aperture;
				(_display displayctrl 31434) slidersetposition _daytime ;
				(_display displayctrl 31436) slidersetposition _overcast;
				(_display displayctrl 31438) slidersetposition _acctime;
				["SliderFocus",		[(_display displayctrl 31430),_focus]] call upm_fnc_camera;
				["SliderAperture",	[(_display displayctrl 31432),_aperture]] call upm_fnc_camera;
				["SliderDaytime",	[(_display displayctrl 31434),_daytime]] call upm_fnc_camera;
				["SliderOvercast",	[(_display displayctrl 31436),_overcast]] call upm_fnc_camera;
				["SliderAcctime",	[(_display displayctrl 31438),_acctime]] call upm_fnc_camera;
			};
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Exit": {
		with missionnamespace do {
			_cam = missionnamespace getvariable ["upm_fnc_camera_cam",objnull];
			_cam cameraeffect ["terminate","back"];
			camdestroy _cam;

			upm_fnc_camera_cam = nil;
			upm_fnc_camera_target = nil;
		};

		cameraon switchcamera upm_fnc_camera_cameraView;

		upm_fnc_camera_display = nil;
		upm_fnc_camera_LMB = nil;
		upm_fnc_camera_RMB = nil;
		upm_fnc_camera_keys = nil;
		upm_fnc_camera_LMBclick = nil;
		upm_fnc_camera_RMBclick = nil;
		upm_fnc_camera_pitchbank = nil;
		upm_fnc_camera_fov = nil;
		upm_fnc_camera_iconCamera = nil;
		upm_fnc_camera_vision = nil;
		upm_fnc_camera_visibleHUD = nil;
		upm_fnc_camera_cameraView = nil;

		removemissioneventhandler ["draw3d",upm_fnc_camera_draw3D];
		upm_fnc_camera_draw3D = nil;

		camusenvg false;
		false SetCamUseTi 0;

		setacctime 1;
		setaperture -1;
		enableradio true;

		if ((productVersion select 4) == "Development") then {
			_displayMission = [] call (uinamespace getvariable "bis_fnc_displayMission");
			_control = _displayMission displayctrl 11400;
			_control ctrlsetfade 0;
			_control ctrlcommit 0;
		};
	};
};