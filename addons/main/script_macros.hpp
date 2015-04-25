/****************************************************************
	
CBA

****************************************************************/

#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

/****************************************************************
	
UPM

****************************************************************/

/*
	VERSIONING
*/

// DEFAULT VERSIONING LEVEL
#define DEFAULT_VERSIONING_LEVEL 2

/*
	PATHS
*/

// PATH ROOT FUNCTIONS FOLDER "\functions\fnc_yourfunction.sqf"
#define PATHF(fncName) QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf)) 

// PATH ROOT FUNCTION WITH SUBFOLDER "\functions\subfolder\fnc_yourfunction.sqf"
#define PATHF_SUB(subFolder,fncName) QUOTE(PATHTOF(functions\subFolder\DOUBLES(fnc,fncName).sqf))

/*
	VARIABLES
*/

// GLOBAL VARIABLE: INTERNAL upm_currentmodule_var1
// GVAR(var)	

// GLOBAL VARIABLE: QUOTED INTERNAL "upm_currentmodule_var1"
// QGVAR(var)	

// GLOBAL VARIABLE: EXTERNAL MODULE upm_common_var1
#define EGVAR(module,var) TRIPLES(PREFIX,module,var)

// GLOBAL VARIABLE: QUOTED EXTERNAL MODULE "upm_common_var1"
#define QEGVAR(module,var) QUOTE(EGVAR(module,var))


#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(var1),var2)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(var1),var2,true)]

#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)
#define GETUVAR(var1,var2) uiNamespace GETVAR_SYS(var1,var2)
#define GETPRVAR(var1,var2) profileNamespace GETVAR_SYS(var1,var2)
#define GETPAVAR(var1,var2) parsingNamespace GETVAR_SYS(var1,var2)

#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define SETUVAR(var1,var2) uiNamespace SETVAR_SYS(var1,var2)
#define SETPRVAR(var1,var2) profileNamespace SETVAR_SYS(var1,var2)
#define SETPAVAR(var1,var2) parsingNamespace SETVAR_SYS(var1,var2)


#define GETGVAR(var1,var2) GETMVAR(GVAR(var1),var2)
#define GETEGVAR(var1,var2,var3) GETMVAR(EGVAR(var1,var2),var3)

/*
	FUNCTIONS
*/

// NAME FUNCTION upm_fnc_yourfunction
#define FUNC(var1) TRIPLES(PREFIX,fnc,var1)

// NAME FUNCTION QUOTED "upm_fnc_yourfunction"
#define QFUNC(var1) QUOTE(TRIPLES(PREFIX,fnc,var1))

/*
	ARRAYS
*/

#define ARR_SELECT(ARRAY,INDEX,DEFAULT) if (count ARRAY > INDEX) then {ARRAY select INDEX} else {DEFAULT}


/****************************************************************
	
DEBUG

****************************************************************/

#define DGVAR(varName)    if(isNil "UPM_DEBUG_NAMESPACE") then { UPM_DEBUG_NAMESPACE = []; }; if(!(QUOTE(GVAR(varName)) in UPM_DEBUG_NAMESPACE)) then { PUSH(UPM_DEBUG_NAMESPACE, QUOTE(GVAR(varName))); }; GVAR(varName)
#define DVAR(varName)     if(isNil "UPM_DEBUG_NAMESPACE") then { UPM_DEBUG_NAMESPACE = []; }; if(!(QUOTE(varName) in UPM_DEBUG_NAMESPACE)) then { PUSH(UPM_DEBUG_NAMESPACE, QUOTE(varName)); }; varName

#include "script_debug.hpp"