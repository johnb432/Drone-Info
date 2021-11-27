#include "script_component.hpp"
/*
 * Author: johnb43
 * Opens the drone info panel and monitors it until receiving a signal to close.
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

if (GVAR(isOpen) || {!alive player}) exitWith {};

// Initialize the dialog; This calls FUNC(onLoadDialog)
GVAR(droneInfoRscLayer) cutRsc [QGVAR(droneInfo), "PLAIN"];
GVAR(isOpen) = true;
GVAR(doShow) = true;

[{
    private _uav = getConnectedUAV player;

    if !(GVAR(doShow) && {alive player} && {alive _uav}) exitWith {
        (_this select 1) call CBA_fnc_removePerFrameHandler;

        // Close display
        GVAR(droneInfoRscLayer) cutText ["", "PLAIN"];
        GVAR(isOpen) = false;
    };

    private _droneInfo = GETUVAR(GVAR(droneInfo),displayNull);

    (_droneInfo displayCtrl IDC_DRONENAME) ctrlSetText ([configOf _uav] call BIS_fnc_displayName);
    (_droneInfo displayCtrl IDC_DRONEFUEL) ctrlSetText (format ["Fuel: %1%2", round (100 * fuel _uav), "%"]);
    (_droneInfo displayCtrl IDC_DRONESPEED) ctrlSetText (format ["Speed: %1 km/h", round speed _uav]);
    (_droneInfo displayCtrl IDC_DRONEALT) ctrlSetText (format ["Altitude: %1m", round (getPos _uav select 2)]);
    (_droneInfo displayCtrl IDC_DRONEDIR) ctrlSetText (format ["Direction: %1°", round getDir _uav]);
    (_droneInfo displayCtrl IDC_DRONEPOS) ctrlSetText (format ["Gridref: %1", mapGridPosition _uav]);
}, 0] call CBA_fnc_addPerFrameHandler;
