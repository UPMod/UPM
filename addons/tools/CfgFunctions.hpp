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
			// Debug ==================================
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
			// Common =================================
			// ========================================
			// upm_fnc_debugLists
			class debugLists
			{
				file = PATHF_SUB(debug\common,debugLists);
			};
			// upm_fnc_debugDraw2dMakers
			class debugDraw2dMarkers
			{
				file = PATHF_SUB(debug\common,debugDraw2dMarkers);
			};
			// upm_fnc_debugGetColorRgbaSide
			class debugGetColorRgbaSide
			{
				file = PATHF_SUB(debug\common,debugGetColorRgbaSide);
			};
			// upm_fnc_debugGetColorRgbaBehaviour
			class debugGetColorRgbaBehaviour
			{
				file = PATHF_SUB(debug\common,debugGetColorRgbaBehaviour);
			};
			// Environment ============================
			// ========================================
			// upm_fnc_debugEnvironmentHandle
			class debugEnvironmentHandle
			{
				file = PATHF_SUB(debug\environment,debugEnvironmentHandle);
			};
			// Groups =================================
			// ========================================
			// upm_fnc_debugGroupsHandle
			class debugGroupsHandle
			{
				file = PATHF_SUB(debug\groups,debugGroupsHandle);
			};
			// upm_fnc_debugGetTypeGroup
			class debugGetTypeGroup
			{
				file = PATHF_SUB(debug\groups,debugGetTypeGroup);
			};
			// upm_fnc_debugGeticonGroup
			class debugGeticonGroup
			{
				file = PATHF_SUB(debug\groups,debugGeticonGroup);
			};
			// upm_fnc_debugAllMarkersGroups
			class debugAllMarkersGroups
			{
				file = PATHF_SUB(debug\groups,debugAllMarkersGroups);
			};
						// upm_fnc_debugUnitsSelectList
			class debugUnitsSelectList
			{
				file = PATHF_SUB(debug\units,debugUnitsSelectList);
			};
			// upm_fnc_debugUnitsSpectatorHandle
			class debugUnitsSpectatorHandle
			{
				file = PATHF_SUB(debug\units,debugUnitsSpectatorHandle);
			};
			// Heavy Vehicles =========================
			// ========================================
			// upm_fnc_debugHeavyVehiclesHandle
			class debugHeavyVehiclesHandle
			{
				file = PATHF_SUB(debug\heavy_vehicles,debugHeavyVehiclesHandle);
			};
						// upm_fnc_debugUnitsSelectList
			class debugUnitsSelectList
			{
				file = PATHF_SUB(debug\units,debugUnitsSelectList);
			};
			// upm_fnc_debugUnitsSpectatorHandle
			class debugUnitsSpectatorHandle
			{
				file = PATHF_SUB(debug\units,debugUnitsSpectatorHandle);
			};
			// Helis ==================================
			// ========================================
			// upm_fnc_debugHelisHandle
			class debugHelisHandle
			{
				file = PATHF_SUB(debug\helis,debugHelisHandle);
			};
						// upm_fnc_debugUnitsSelectList
			class debugUnitsSelectList
			{
				file = PATHF_SUB(debug\units,debugUnitsSelectList);
			};
			// upm_fnc_debugUnitsSpectatorHandle
			class debugUnitsSpectatorHandle
			{
				file = PATHF_SUB(debug\units,debugUnitsSpectatorHandle);
			};
			// Light Vehicles ==================================
			// ========================================
			// upm_fnc_debugLightVehiclesHandle
			class debugLightVehiclesHandle
			{
				file = PATHF_SUB(debug\light_vehicles,debugLightVehiclesHandle);
			};
						// upm_fnc_debugUnitsSelectList
			class debugUnitsSelectList
			{
				file = PATHF_SUB(debug\units,debugUnitsSelectList);
			};
			// upm_fnc_debugUnitsSpectatorHandle
			class debugUnitsSpectatorHandle
			{
				file = PATHF_SUB(debug\units,debugUnitsSpectatorHandle);
			};
			// Naval ==================================
			// ========================================
			// upm_fnc_debugNavalHandle
			class debugNavalHandle
			{
				file = PATHF_SUB(debug\naval,debugNavalHandle);
			};
						// upm_fnc_debugUnitsSelectList
			class debugUnitsSelectList
			{
				file = PATHF_SUB(debug\units,debugUnitsSelectList);
			};
			// upm_fnc_debugUnitsSpectatorHandle
			class debugUnitsSpectatorHandle
			{
				file = PATHF_SUB(debug\units,debugUnitsSpectatorHandle);
			};
			// Performance ==================================
			// ========================================
			// upm_fnc_debugPerformanceHandle
			class debugPerformanceHandle
			{
				file = PATHF_SUB(debug\performance,debugPerformanceHandle);
			};

			// Planes ==================================
			// ========================================
			// upm_fnc_debugPlanesHandle
			class debugPlanesHandle
			{
				file = PATHF_SUB(debug\planes,debugPlanesHandle);
			};
			// upm_fnc_debugUnitsSelectList
			class debugUnitsSelectList
			{
				file = PATHF_SUB(debug\units,debugUnitsSelectList);
			};
			// upm_fnc_debugUnitsSpectatorHandle
			class debugUnitsSpectatorHandle
			{
				file = PATHF_SUB(debug\units,debugUnitsSpectatorHandle);
			};
			// Settings ==================================
			// ========================================
			// upm_fnc_debugSettingsHandle
			class debugSettingsHandle
			{
				file = PATHF_SUB(debug\settings,debugSettingsHandle);
			};
			// Statics ==================================
			// ========================================
			// upm_fnc_debugStaticsHandle
			class debugStaticsHandle
			{
				file = PATHF_SUB(debug\statics,debugStaticsHandle);
			};
			// upm_fnc_debugStaticsSelectList
			class debugStaticsSelectList
			{
				file = PATHF_SUB(debug\units,debugStaticsSelectList);
			};
			// upm_fnc_debugStaticsSpectatorHandle
			class debugStaticsSpectatorHandle
			{
				file = PATHF_SUB(debug\units,debugStaticsSpectatorHandle);
			};
			// Units ==================================
			// ========================================
			// upm_fnc_debugUnitsHandle
			class debugUnitsHandle
			{
				file = PATHF_SUB(debug\units,debugUnitsHandle);
			};
			// upm_fnc_debugUnitsSelectList
			class debugUnitsSelectList
			{
				file = PATHF_SUB(debug\units,debugUnitsSelectList);
			};
			// upm_fnc_debugUnitsSpectatorHandle
			class debugUnitsSpectatorHandle
			{
				file = PATHF_SUB(debug\units,debugUnitsSpectatorHandle);
			};
		};
	};
};