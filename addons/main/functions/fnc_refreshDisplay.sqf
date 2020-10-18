#include "script_component.hpp"
/*
 * Author: johnb43
 * Open and closes the map to refresh the interface.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_refreshDisplay;
 *
 * Public: No
 */

call FUNC(toggleDisplay);
[{call FUNC(toggleDisplay)}, [], 0.1] call CBA_fnc_waitAndExecute;
