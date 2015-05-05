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

		//--- Create camera
		_camPos = [
			(position cameraon select 0),
			(position cameraon select 1),
			(position cameraon select 2) + 2
		];

		_cam = "camera" camcreate _camPos;

		missionnamespace setvariable ["UPM_Tools_Camera",_cam];

		UPM_Tools_LMB = false;
		UPM_Tools_RMB = false;
		UPM_Tools_keys = [];
		UPM_Tools_LMBclick = [0,0];
		UPM_Tools_RMBclick = [0,0];
		UPM_Tools_pitchbank = [0,0];
		UPM_Tools_fov = 0.7;
		UPM_Tools_iconCamera = gettext (configfile >> "RscUPM_Tools" >> "iconCamera");
		UPM_Tools_vision = 0;
		UPM_Tools_visibleHUD = true;

		uinamespace setVariable ["BIS_fnc_guiMessage_status",false];
		uiNameSpace setVariable ["UPM_RscTools",(findDisplay D_TOOLS)];

		_DIKcodes = true call bis_fnc_keyCode;
		_DIKlast = _DIKcodes select (count _DIKcodes - 1);
		for "_k" from 0 to (_DIKlast - 1) do {
			UPM_Tools_keys set [_k,false];
		};

		_display = uiNameSpace getVariable 'UPM_RscTools';

		_ctrlMouseArea = _display displayctrl D_CB_MOUSEAREA;
		ctrlsetfocus _ctrlMouseArea;

		_ctrlMap = _display displayctrl D_CB_MAP;
		_ctrlMap ctrlenable false;
		_ctrlMap ctrladdeventhandler ["draw","['MapDraw',_this] call upm_fnc_camera;"];
		_ctrlMap ctrladdeventhandler ["mousebuttonclick","['MapClick',_this] call upm_fnc_camera;"];

		ppEffectDestroy [BIS_SuffRadialBlur, BIS_SuffBlur, BIS_SuffCC];

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

		[] call upm_fnc_cameraSelectView;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Mouse": {
		_display = ctrlparent (_this select 0);
		_cam = missionnamespace getvariable ["UPM_Tools_Camera",objnull];
		_pitchbank = UPM_Tools_pitchbank;
		_pitch = _pitchbank select 0;
		_bank = _pitchbank select 1;

		//--- Camera movement
		if (UPM_Tools_LMB || UPM_Tools_RMB) then {
			_mX = _this select 1;
			_mY = _this select 2;

			if (UPM_Tools_LMB) then {

				_defX = UPM_Tools_LMBclick select 0;
				_defY = UPM_Tools_LMBclick select 1;

				_camZ = (getposatl _cam select 2) max 1 min 256;
				_dX = (_mX - _defX) * _camZ / 2;
				_dY = -(_mY - _defY) * _camZ / 2;

				_camPos = getposasl _cam;
				_camPos = [_camPos,_dY,direction _cam] call bis_fnc_relpos;
				_camPos = [_camPos,_dX,direction _cam + 90] call bis_fnc_relpos;
				_cam setposasl _camPos;
			//};
			//if (UPM_Tools_RMB) then  {
			} else {

				_defX = UPM_Tools_RMBclick select 0;
				_defY = UPM_Tools_RMBclick select 1;

				_dX = (_mX - _defX) * 180;
				_dY = -(_mY - _defY) * 180;

				if (UPM_Tools_keys select DIK_LCONTROL) then {
					_bank = (_bank + _dX * 0.1) max -180 min +180;
					UPM_Tools_pitchbank set [1,_bank];
				} else {
					_cam setdir (direction _cam + _dX);
					_pitch = (_pitch + _dY) max -90 min +90;
				};
				[
					_cam,
					_pitch,
					_bank
				] call bis_fnc_setpitchbank;
				UPM_Tools_RMBclick = [_mX,_defY];
			};

		};

		_coef = 0.1;
		if (UPM_Tools_keys select DIK_LMENU) then {_coef = _coef * 100;};
		if (UPM_Tools_keys select DIK_LSHIFT) then {_coef = _coef * 10;};
		if (UPM_Tools_keys select DIK_RSHIFT) then {_coef = _coef / 10;};

		if (UPM_Tools_keys select DIK_W) then {[0,1,0,_coef] call upm_fnc_cameraMove;};
		if (UPM_Tools_keys select DIK_S) then {[0,-1,0,_coef] call upm_fnc_cameraMove;};
		if (UPM_Tools_keys select DIK_A) then {[-1,1,0,_coef] call upm_fnc_cameraMove;};
		if (UPM_Tools_keys select DIK_D) then {[1,1,0,_coef] call upm_fnc_cameraMove;};

		if (UPM_Tools_keys select DIK_Q) then {[0,0,1,_coef] call upm_fnc_cameraMove;};
		if (UPM_Tools_keys select DIK_Z) then {[0,0,-1,_coef] call upm_fnc_cameraMove;};

		if (UPM_Tools_keys select DIK_NUMPAD1) then {[-1,-1] call upm_fnc_cameraRotate;};
		if (UPM_Tools_keys select DIK_NUMPAD1) then {[-1,-1] call upm_fnc_cameraRotate;};
		if (UPM_Tools_keys select DIK_NUMPAD2) then {[+0,-1] call upm_fnc_cameraRotate;};
		if (UPM_Tools_keys select DIK_NUMPAD3) then {[+1,-1] call upm_fnc_cameraRotate;};
		if (UPM_Tools_keys select DIK_NUMPAD4) then {[-1,+0] call upm_fnc_cameraRotate;};
		if (UPM_Tools_keys select DIK_NUMPAD6) then {[+1,+0] call upm_fnc_cameraRotate;};
		if (UPM_Tools_keys select DIK_NUMPAD7) then {[-1,+1] call upm_fnc_cameraRotate;};
		if (UPM_Tools_keys select DIK_NUMPAD8) then {[+0,+1] call upm_fnc_cameraRotate;};
		if (UPM_Tools_keys select DIK_NUMPAD9) then {[+1,+1] call upm_fnc_cameraRotate;};

		if (UPM_Tools_keys select DIK_ADD) then {
			UPM_Tools_fov = (UPM_Tools_fov - 0.01) max 0.01;
			_cam campreparefov UPM_Tools_fov;
			_cam camcommitprepared 0;
		};
		if (UPM_Tools_keys select DIK_SUBTRACT) then {
			UPM_Tools_fov = (UPM_Tools_fov + 0.01) min 1;
			_cam campreparefov UPM_Tools_fov;
			_cam camcommitprepared 0;
		};
	};


	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonDown": {
		_cam = missionnamespace getvariable ["UPM_Tools_Camera",objnull];
		_button = _this select 1;
		_mX = _this select 2;
		_mY = _this select 3;
		_shift = _this select 4;
		_ctrl = _this select 5;
		_alt = _this select 6;

		if (_button > 0) then {
			UPM_Tools_RMB = true;
			UPM_Tools_RMBclick = [_mX,_mY];
		} else {
			UPM_Tools_LMB = true;
			UPM_Tools_LMBclick = [_mX,_mY];
		};
		UPM_Tools_pitchbank = _cam call bis_fnc_getpitchbank;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonUp": {
		_cam = missionnamespace getvariable ["UPM_Tools_Camera",objnull];
		_button = _this select 1;
		if (_button > 0) then {
			UPM_Tools_RMB = false;
			UPM_Tools_RMBclick = [0,0];
		} else {
			UPM_Tools_LMB = false;
			UPM_Tools_LMBclick = [0,0];
		};

		UPM_Tools_pitchbank = _cam call bis_fnc_getpitchbank;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseZChanged": {

		_display = uiNameSpace getVariable 'UPM_RscTools';

		_ctrlMap = _display displayctrl D_CB_MAP;

		if !(ctrlenabled _ctrlMap) then {

			_cam = missionnamespace getvariable ["UPM_Tools_Camera",objnull];
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

		UPM_Tools_keys set [_key,true];

		_cam = missionnamespace getvariable ["UPM_Tools_Camera",objnull];

		switch (_key) do {

			case (DIK_NUMPAD5): {
				_cam = missionnamespace getvariable "UPM_Tools_Camera";
				UPM_Tools_pitchbank = [0,0];
				[0,0] call upm_fnc_cameraRotate;
				UPM_Tools_fov = 0.7;
				_camPos = position _cam;
				_camDir = direction _cam;
				_cam setdir _camDir;
				_cam campreparefov UPM_Tools_fov;
				_cam camcommitprepared 0;
			};

			case (DIK_M): {
				_ctrlMouseArea = _display displayctrl D_CB_MOUSEAREA;
				_ctrlMap = _display displayctrl D_CB_MAP;
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
					_ctrlMap ctrlSetFade 0;
					_ctrlMap ctrlcommit 0;
					_ctrlMap ctrlmapanimadd [0,0.1,position _cam];
					ctrlmapanimcommit _ctrlMap;
					{player reveal [_x,4]} foreach allunits;
				};
			};

			case (DIK_H);
			case (DIK_L): {
				/*_ctrlOverlays = [

				];
				if (UPM_Tools_visibleHUD) then {
					{_x ctrlsetfade 1;} foreach _ctrlOverlays;
					(_display displayctrl D_CB_OVERLAY) ctrlenable false;
					cameraEffectEnableHUD false;
				} else {
					{_x ctrlsetfade 0;} foreach _ctrlOverlays;
					(_display displayctrl D_CB_OVERLAY) ctrlenable true;
					cameraEffectEnableHUD true;
				};
				UPM_Tools_visibleHUD = !UPM_Tools_visibleHUD;
				{_x ctrlcommit 0.1} foreach _ctrlOverlays;*/
			};


			case (DIK_N): {
				UPM_Tools_vision = UPM_Tools_vision + 1;
				_vision = UPM_Tools_vision % 4;
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

			/*case (DIK_SPACE): {
				_vehicle = vehicle player;
				_worldPos = screentoworld [0.5,0.5];
				_vehicle setposatl [_worldPos select 0,_worldPos select 1,getposatl _vehicle select 2];
				_vehicle setvelocity [0,0,0];
			};*/

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
		UPM_Tools_keys set [_this select 1,false];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapDraw": {
		_cam = missionnamespace getvariable ["UPM_Tools_Camera",objnull];
		_ctrlMap = _this select 0;
		_ctrlMap drawIcon [
			UPM_Tools_iconCamera,
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
			_cam = missionnamespace getvariable ["UPM_Tools_Camera",objnull];

			_cam setpos [
				_worldPos select 0,
				_worldPos select 1,
				getposatl _cam select 2
			];

		};

	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Exit": {

		((findDisplay 49) displayCtrl 1010) ctrlEnable true;

		with missionnamespace do {
			_cam = missionnamespace getvariable ["UPM_Tools_Camera",objnull];
			_cam cameraeffect ["terminate","back"];
			camdestroy _cam;

			UPM_Tools_Camera = nil;
			BIS_fnc_camera_target = nil;
		};

		uiNameSpace setVariable ['UPM_RscTools',nil];

		UPM_Tools_LMB = nil;
		UPM_Tools_RMB = nil;
		UPM_Tools_keys = nil;
		UPM_Tools_LMBclick = nil;
		UPM_Tools_RMBclick = nil;
		UPM_Tools_pitchbank = nil;
		UPM_Tools_fov = nil;
		UPM_Tools_iconCamera = nil;
		UPM_Tools_vision = nil;
		UPM_Tools_visibleHUD = nil;
		UPM_Tools_cameraView = nil;

		//Reapply underwater PP effects.
		_null = [] spawn {
			//suffocating
			BIS_SuffCC = ppEffectCreate ["ColorCorrections", 1610];

			// init PP to avoid artefacts after going under water.
			BIS_SuffCC ppEffectAdjust [1,1,0,[0, 0, 0, 0 ],[1, 1, 1, 1],[0,0,0,0], [-1, -1, 0, 0, 0, 0.001, 0.5]];

			BIS_SuffRadialBlur = ppEffectCreate ["RadialBlur", 270];
			BIS_SuffBlur = ppEffectCreate ["DynamicBlur", 170];
		};

		camusenvg false;
		false SetCamUseTi 0;

		enableradio true;

		player switchCamera "Internal";

		["DENTRO EXIT",2] call FUNC(debug);

	};
};