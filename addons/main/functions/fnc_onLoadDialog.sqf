#include "script_component.hpp"
/*
 * Author: johnb43
 * onLoad function for drone info dialog.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_onLoadDialog;
 *
 * Public: No
 */

private _actuallyShow = [];

{
    if (_x) then {
        _actuallyShow pushBack _forEachIndex;
    };
} forEach [GVAR(showName), GVAR(showFuel), GVAR(showSpeed), GVAR(showAltitude), GVAR(showDirection), GVAR(showPosition)];

private _num = count _actuallyShow;

if (_num > 0) then {
    private _posX = DISPLAY_XPOS;
    private _posY = DISPLAY_YPOS;
    private _displays = [DRONENAME, DRONEFUEL, DRONESPEED, DRONEALT, DRONEDIR, DRONEPOS];

    (DRONEINFO displayCtrl BACKGROUND) ctrlSetPosition [_posX, _posY, safeZoneW * 0.066, safeZoneH * 0.016 * _num];
    (DRONEINFO displayCtrl BACKGROUND) ctrlCommit 0;

    {
        (DRONEINFO displayCtrl (_displays select _x)) ctrlSetPosition [_posX, _posY + (_forEachIndex * safeZoneH * 0.016)];
        (DRONEINFO displayCtrl (_displays select _x)) ctrlCommit 0;
    } forEach _actuallyShow;
};

(DRONEINFO displayCtrl DRONENAME) ctrlShow GVAR(showName);
(DRONEINFO displayCtrl DRONEFUEL) ctrlShow GVAR(showFuel);
(DRONEINFO displayCtrl DRONESPEED) ctrlShow GVAR(showSpeed);
(DRONEINFO displayCtrl DRONEALT) ctrlShow GVAR(showAltitude);
(DRONEINFO displayCtrl DRONEDIR) ctrlShow GVAR(showDirection);
(DRONEINFO displayCtrl DRONEPOS) ctrlShow GVAR(showPosition);
