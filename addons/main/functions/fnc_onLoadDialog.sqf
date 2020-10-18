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

private _posX = DISPLAY_XPOS;
private _posY = DISPLAY_YPOS;

(DRONEINFO displayCtrl BACKGROUND) ctrlSetPosition [_posX, _posY];
(DRONEINFO displayCtrl DRONEFUEL) ctrlSetPosition [_posX, _posY];
(DRONEINFO displayCtrl DRONESPEED) ctrlSetPosition [_posX, _posY + 0.025];
(DRONEINFO displayCtrl DRONEALT) ctrlSetPosition [_posX, _posY + 0.05];
(DRONEINFO displayCtrl DRONEDIR) ctrlSetPosition [_posX, _posY + 0.075];
(DRONEINFO displayCtrl DRONEPOS) ctrlSetPosition [_posX, _posY + 0.1];

(DRONEINFO displayCtrl BACKGROUND) ctrlCommit 0;
(DRONEINFO displayCtrl DRONEFUEL) ctrlCommit 0;
(DRONEINFO displayCtrl DRONESPEED) ctrlCommit 0;
(DRONEINFO displayCtrl DRONEALT) ctrlCommit 0;
(DRONEINFO displayCtrl DRONEDIR) ctrlCommit 0;
(DRONEINFO displayCtrl DRONEPOS) ctrlCommit 0;
