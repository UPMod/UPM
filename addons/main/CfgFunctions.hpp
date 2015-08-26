class CfgFunctions
{
	class PREFIX
	{
		class ADDON
		{
			// upm_fnc_moduleRun
			class moduleRun
			{
				file = PATHF(moduleRun);
			};
			// ========================================
			// upm_fnc_hcInit
			class hcInit
			{
				file = PATHF_SUB(hc,hcInit);
			};
			// upm_fnc_hcHandleGroups
			class hcHandleGroups
			{
				file = PATHF_SUB(hc,hcHandleGroups);
			};
		};
	};
};