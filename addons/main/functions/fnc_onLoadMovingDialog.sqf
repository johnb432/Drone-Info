#include "script_component.hpp"
/*
 * Author: johnb43
 * onLoad function for the MoveMe dialog.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_onLoadMovingDialog;
 *
 * Public: No
 */

// Put the Moving Dialog right on top of the existing Info Panel.
(MOVEME displayCtrl 10) ctrlSetPosition [DISPLAY_XPOS, DISPLAY_YPOS];
(MOVEME displayCtrl 11) ctrlSetPosition [DISPLAY_XPOS, DISPLAY_YPOS];
(MOVEME displayCtrl 12) ctrlSetPosition [DISPLAY_XPOS + (((ctrlPosition (MOVEME displayCtrl 10)) select 2) / 4), DISPLAY_YPOS + (((ctrlPosition (MOVEME displayCtrl 10)) select 3) / 8)];

(MOVEME displayCtrl 10) ctrlCommit 0;
(MOVEME displayCtrl 11) ctrlCommit 0;
(MOVEME displayCtrl 12) ctrlCommit 0;
