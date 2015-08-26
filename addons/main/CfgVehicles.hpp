class CfgVehicles {
  class Module_F;
  class UPM_ModuleRun: Module_F {
    author = "$STR_UPM_Run_Authors";
    category = "UPM";
    displayName = "Run UPM";
    function = QFUNC(moduleRun);
    scope = 2;
    isGlobal = 1;
    //icon = "";
    class Arguments {
      class ListHCs {
        displayName = "Headless Clients";
        description = "The list of headless clients must be in the following format (Array): [NAME1,NAME2,...]";
        typeName = "STRING";
        class values {
            default = "[]";
        };
      };
      class TimeHCs {
        displayName = "Time(s) Loop HC";
        description = "Default: 1 - Time in seconds";
        typeName = "NUMBER";
        defaultValue = 1;
      };
    };
  };
};