#include "script_component.hpp"
/*
 * Author: johnb43
 * Opens the drone info panel and monitors it until receiving a signal to close (GVAR(doShow) == false).
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
GVAR(droneInfoRscLayer) cutRsc [QGVAR(droneInfo),"PLAIN", 0];
GVAR(doShow) = true;

[{
    params ["", "_handleID"];

    private _uav = getConnectedUAV player;

    if !(GVAR(doShow) && {alive player} && {alive _uav}) exitWith {
        [_handleID] call CBA_fnc_removePerFrameHandler;
        GVAR(droneInfoRscLayer) cutText ["", "PLAIN"];
        GVAR(doShow) = false;
        GVAR(isOpen) = false;
    };

    (DRONEINFO displayCtrl DRONENAME) ctrlSetText ([configOf _uav] call BIS_fnc_displayName);
    (DRONEINFO displayCtrl DRONEFUEL) ctrlSetText (format ["Fuel: %1%2", round (100 * fuel _uav), "%"]);
    (DRONEINFO displayCtrl DRONESPEED) ctrlSetText (format ["Speed: %1 km/h", round (speed _uav)]);
    (DRONEINFO displayCtrl DRONEALT) ctrlSetText (format ["Altitude: %1m", round ((getPos _uav) select 2)]);
    (DRONEINFO displayCtrl DRONEDIR) ctrlSetText (format ["Direction: %1°", round (getDir _uav)]);
    (DRONEINFO displayCtrl DRONEPOS) ctrlSetText (format ["Gridref: %1", mapGridPosition _uav]);
}, 0] call CBA_fnc_addPerFrameHandler;
