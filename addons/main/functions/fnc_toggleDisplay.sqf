#include "script_component.hpp"
/*
 * Author: johnb43
 * Toggle the drone info panel.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_toggleDisplay;
 *
 * Public: No
 */

if (GVAR(enableDroneInfo) && {!isNull(getConnectedUAV player)}) then {
    if (!GVAR(isOpen)) then {
        call FUNC(openDroneInfo);
    } else {
        GVAR(doShow) = false;
    };
};
