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
    class Arguments {};
  };
};