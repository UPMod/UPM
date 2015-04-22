// UPM - COMMON
#include "script_component.hpp"

if (!hasInterface && !isDedicated) then {
    diag_log "UPM: ONLY HEADLESS CLIENT";
};

if (isServer) then {
    diag_log "UPM: SERVER OR PLAYER HOST";
};

if(isServer || {!hasInterface && !isDedicated}) then {
     diag_log "UPM: SERVER OR PLAYER HOST AND HEADLESS CLIENT";
};


if (!isServer && hasInterface ) exitWith {};

    diag_log "UPM: SERVER OR PLAYER HOST AND HEADLESS CLIENT AFTER EXITWITH";


