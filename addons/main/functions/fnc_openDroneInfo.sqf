#include "script_component.hpp"
/*
 * Author: johnb43
 * Opens the Info Panel and monitors it until receiving a signal to close (GVAR(doShow) == false).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_openDroneInfo;
 *
 * Public: No
 */

if (GVAR(isOpen) || {!(alive player)}) exitWith {};

// Initialize the dialog.
GVAR(isOpen) = true;
GVAR(droneInfoRscLayer) cutRsc ["Drone_Info","PLAIN", 0];
GVAR(doShow) = true;

(DRONEINFO displayCtrl DRONEFUEL) ctrlShow GVAR(showFuel);
(DRONEINFO displayCtrl DRONESPEED) ctrlShow GVAR(showSpeed);
(DRONEINFO displayCtrl DRONEALT) ctrlShow GVAR(showAltitude);
(DRONEINFO displayCtrl DRONEDIR) ctrlShow GVAR(showDirection);
(DRONEINFO displayCtrl DRONEPOS) ctrlShow GVAR(showPosition);

private _uav = getConnectedUAV player;

[{
    params ["_uav", "_handleid"];

	if !(GVAR(doShow) && {alive player} && {alive _uav}) exitWith {
		[_handleid] call CBA_fnc_removePerFrameHandler;
		GVAR(droneInfoRscLayer) cutText ["", "PLAIN"];
        GVAR(doShow) = false;
		GVAR(isOpen) = false;
	};

	(DRONEINFO displayCtrl DRONEFUEL) ctrlSetText (format ["Fuel: %1%", round (100 * fuel _uav)]);
    (DRONEINFO displayCtrl DRONESPEED) ctrlSetText (format ["Speed: %1 km/h", round (speed _uav)]);
    (DRONEINFO displayCtrl DRONEALT) ctrlSetText (format ["Altitude: %1m", round ((getPos _uav) select 2)]);
    (DRONEINFO displayCtrl DRONEDIR) ctrlSetText (format ["Direction: %1°", round (getDir _uav)]);
    (DRONEINFO displayCtrl DRONEPOS) ctrlSetText (format ["Gridref: %1", mapGridPosition _uav]);
}, 0, _uav] call CBA_fnc_addPerFrameHandler;
