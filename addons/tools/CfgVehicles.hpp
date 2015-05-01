class CfgVehicles {
  class Module_F;
  class UPM_ModuleActivateTools: Module_F {
    author = "$STR_UPM_Tools_Authors";
    category = "UPM";
    displayName = "Activate Tools";
    function = QFUNC(moduleActivateTools);
    scope = 2;
    isGlobal = 1;
    //icon = QUOTE(PATHTOF(UI\Icon_Module_CheckPBO_ca.paa));
    class Arguments {
      class NamePlayers {
        displayName = "Name players";
        description = "The list of players must be in the following format (Array): [player1,player2,...]";
        typeName = "STRING";
        class values {
            default = "[]";
        };
      };
    };
  };
};