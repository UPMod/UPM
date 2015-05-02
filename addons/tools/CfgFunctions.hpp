class CfgFunctions
{
	class PREFIX
	{
		class ADDON
		{
			// upm_fnc_moduleActivateTools
			class moduleActivateTools
			{
				file = PATHF(moduleActivateTools);
			};
			// upm_fnc_toolsInit
			class toolsInit
			{
				file = PATHF(toolsInit);
			};
			// upm_fnc_toolsHandle
			class toolsHandle
			{
				file = PATHF(toolsHandle);
			};
			// ========================================
			// upm_fnc_camera
			class camera
			{
				file = PATHF_SUB(spectator,camera);
			};
		};
	};
};