#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "upm_common"
        };
        author[] = {"UPM Team"};
        authorUrl = "https://github.com/upmod/UPM";
        versionDesc = "UPM";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"

// DATA ALTIS
#include <data\altis\UPM_Cities.hpp>

// DATA STRATIS
#include <data\stratis\UPM_Cities.hpp>