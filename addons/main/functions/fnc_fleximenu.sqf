#include "script_component.hpp"
/*
 * Author: johnb43
 * Menu definition.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tao_rewrite_main_fnc_fleximenu;
 *
 * Public: No
 */

[
 ["main", "Drone Info", "popup"],
 [
  [
   "Reposition Info Panel", // text on button
   {
    MOVEME closeDisplay 0;
    createDialog "Drone_Info_MovingDialog";
   }, // code to run
   "", // icon
   "", // tooltip
   [], // submenu
   DIK_R, // shortcut key
   GVAR(enableDroneInfo) && GVAR(isOpen) && GVAR(reposPanel), // enabled?
   true // visible if true
  ],

  [
   // Change to tablet/paper
   "Show/Hide", // text on button
   {call FUNC(toggleDisplay)}, // code to run
   "", // icon
   "", // tooltip
   [], // submenu
   DIK_S, // shortcut key
   GVAR(enableDroneInfo), // enabled?
   true // visible if true
  ]
 ]
];
