#include "script_component.hpp"
/*
 * Author: johnb43
 * Reposition the Info Panel.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_repositionDisplay;
 *
 * Public: No
 */

if (GVAR(reposmap)) then {
	if (GVAR(isOpen)) then {
		// Close any other moving dialogs.
		MOVEME closeDisplay 0;
		createDialog "Drone_Info_MovingDialog";
	};
} else {
	if (GVAR(isOpen)) then {
		systemChat "Repositioning Drone Info Panel is disabled in mission config.";
	};
};
