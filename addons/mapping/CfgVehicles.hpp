class CfgVehicles {
  class Module_F;
  class UPM_ModuleExportMapping: Module_F {
    author = "$STR_UPM_Mapping_Authors";
    category = "UPM";
    displayName = "Export Mapping";
    function = QFUNC(moduleExportMapping);
    scope = 2;
    isGlobal = 1;
    //icon = "";
    class Arguments {};
  };
};