#include "script_component.hpp"
/*
 * Author: johnb43
 * Move the drone info panel to the position of the moving dialog and save the result.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tao_rewrite_main_fnc_confirmMove;
 *
 * Public: No
 */

ctrlPosition (MOVEME displayCtrl 10) params ["_posX", "_posY"];

MOVEME closeDisplay 0;

// Make sure new positions are reasonable.
if (_posX > safeZoneXAbs && {_posY > safeZoneY} && {_posX < safeZoneWAbs} && {_posY < safeZoneH}) then {
    call FUNC(refreshDisplay);

    // Save to profile namespace.
    DISPLAY_XPOS_SET(_posX);
    DISPLAY_YPOS_SET(_posY);
} else {
    systemChat "Invalid position.";
};
