#include "script_component.hpp"

// Get a rsc layer from the BI system
GVAR(droneInfoRscLayer) = [QGVAR(layer)] call BIS_fnc_rscLayer;

GVAR(isOpen) = false;

// Move old data to new position name; To be deleted after a while
if (!isNil {GETPRVAR(GVAR(displayPosX),nil)}) then {
    private _posX = GETPRVAR(GVAR(displayPosX),nil);
    SETPRVAR(igui_grid_drone_info_x,_posX);
    SETPRVAR(GVAR(displayPosX),nil);
};

if (!isNil {GETPRVAR(GVAR(displayPosY),nil)}) then {
    private _posY = GETPRVAR(GVAR(displayPosY),nil);
    SETPRVAR(igui_grid_drone_info_y,_posY);
    SETPRVAR(GVAR(displayPosY),nil);
};
// Old data finished

// This triggers when exiting both "Game" and "Addon Options"
[missionNamespace, "OnGameOptionsExited", {
    // Doesn't work if not done in missionnamespace
    with missionNamespace do {
        if (GVAR(enableDroneInfo) && {GVAR(isOpen)}) then {
            call FUNC(refreshDisplay);
        };
    };
}] call BIS_fnc_addScriptedEventHandler;
