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

// Initialize the dialog; This calls FUNC(onLoadDialog)
GVAR(droneInfoRscLayer) cutRsc [QGVAR(droneInfo), "PLAIN"];
GVAR(isOpen) = true;
GVAR(doShow) = true;

[{
    private _player = call CBA_fnc_currentUnit;
    private _uav = getConnectedUAV _player;

    if !(GVAR(enableDroneInfo) && {GVAR(doShow)} && {alive _player} && {alive _uav}) exitWith {
        (_this select 1) call CBA_fnc_removePerFrameHandler;

        // Close display
        GVAR(droneInfoRscLayer) cutText ["", "PLAIN"];
        GVAR(isOpen) = false;
    };

    (_this select 0) params ["_droneInfo", "_cfgMagazines"];

    (_droneInfo displayCtrl IDC_DRONENAME) ctrlSetText ([configOf _uav] call BIS_fnc_displayName);
    (_droneInfo displayCtrl IDC_DRONEFUEL) ctrlSetText (format ["Fuel: %1%2", round (100 * fuel _uav), "%"]);
    (_droneInfo displayCtrl IDC_DRONESPEED) ctrlSetText (format ["Speed: %1 km/h", round speed _uav]);
    (_droneInfo displayCtrl IDC_DRONEALT) ctrlSetText (format ["Altitude: %1m", round (getPos _uav select 2)]);
    (_droneInfo displayCtrl IDC_DRONEDIR) ctrlSetText (format ["Direction: %1°", round getDir _uav]);
    (_droneInfo displayCtrl IDC_DRONEPOS) ctrlSetText (format ["Gridref: %1", mapGridPosition _uav]);
    (_droneInfo displayCtrl IDC_DRONEHEALTH) ctrlSetText (format ["Health: %1%2", round (100 * (1 - damage _uav)), "%"]);

    private _ammoStatus = [];
    private _magazine = "";

    // Get all percentages for all turrets
    {
        _magazine = _x select 0;

        // Exclude batteries because they don't get used up quickly
        if (_magazine == "Laserbatteries") then {
            continue;
        };

        _ammoStatus pushBack ((_x select 2) / (getNumber (_cfgMagazines >> _magazine >> "count")));
    } forEach magazinesAllTurrets _uav;

    // Display "-" if nothing present
    (_droneInfo displayCtrl IDC_DRONEAMMO) ctrlSetText (if (_ammoStatus isEqualTo []) then {"Ammo: -"} else {format ["Ammo: %1%2", round (100 * (_ammoStatus call BIS_fnc_arithmeticMean)), "%"]});
}, 0, [GETUVAR(GVAR(droneInfo),displayNull), configFile >> "CfgMagazines"]] call CBA_fnc_addPerFrameHandler;
