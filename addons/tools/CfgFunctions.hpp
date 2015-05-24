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
			// upm_fnc_spectatorExit
			class spectatorExit
			{
				file = PATHF_SUB(spectator,spectatorExit);
			};
			// upm_fnc_spectatorInit
			class spectatorInit
			{
				file = PATHF_SUB(spectator,spectatorInit);
			};
			// upm_fnc_spectatorKeyDown
			class spectatorKeyDown
			{
				file = PATHF_SUB(spectator,spectatorKeyDown);
			};
			// upm_fnc_spectatorKeyUp
			class spectatorKeyUp
			{
				file = PATHF_SUB(spectator,spectatorKeyUp);
			};
			// upm_fnc_spectatorMapClick
			class spectatorMapClick
			{
				file = PATHF_SUB(spectator,spectatorMapClick);
			};
			// upm_fnc_spectatorMapDraw
			class spectatorMapDraw
			{
				file = PATHF_SUB(spectator,spectatorMapDraw);
			};
			// upm_fnc_spectatorMouse
			class spectatorMouse
			{
				file = PATHF_SUB(spectator,spectatorMouse);
			};
			// upm_fnc_spectatorMouseButtonDown
			class spectatorMouseButtonDown
			{
				file = PATHF_SUB(spectator,spectatorMouseButtonDown);
			};
			// upm_fnc_spectatorMouseButtonUp
			class spectatorMouseButtonUp
			{
				file = PATHF_SUB(spectator,spectatorMouseButtonUp);
			};
			// upm_fnc_spectatorMouseZChanged
			class spectatorMouseZChanged
			{
				file = PATHF_SUB(spectator,spectatorMouseZChanged);
			};
			// upm_fnc_spectatorMove
			class spectatorMove
			{
				file = PATHF_SUB(spectator,spectatorMove);
			};
			// upm_fnc_spectatorRotate
			class spectatorRotate
			{
				file = PATHF_SUB(spectator,spectatorRotate);
			};
			// upm_fnc_spectatorSelectView
			class spectatorSelectView
			{
				file = PATHF_SUB(spectator,spectatorSelectView);
			};
			// ========================================
			// upm_fnc_debugInit
			class debugInit
			{
				file = PATHF_SUB(debug,debugInit);
			};
			// upm_fnc_debugUpdate
			class debugUpdate
			{
				file = PATHF_SUB(debug,debugUpdate);
			};
			// upm_fnc_debugListUnits
			class debugListUnits
			{
				file = PATHF_SUB(debug,debugListUnits);
			};
		};
	};
};