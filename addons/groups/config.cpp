#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "upm_common"
        };
        author[] = {"oscarmolinadev"};
        authorUrl = "https://github.com/upmod/UPM";
        versionDesc = "UPM";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"


