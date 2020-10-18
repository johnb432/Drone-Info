[
 QGVAR(enableDroneInfo),
 "LIST",
 ["Enable Addon", "Enables the addon. Makes it easy to disable instead of unloading the mod."],
 ["Drone Info", "Locks"],
 [[false, true], ["Disabled", "Enabled"], 1],
 false,
 {
  if (GVAR(isOpen)) then {
   GVAR(doShow) = false;
  };
 },
 false
] call CBA_fnc_addSetting;

[
 QGVAR(showFuel),
 "LIST",
 ["Display Fuel", "Displays the fuel level of the drone in percent."],
 ["Drone Info", "Locks"],
 [[false, true], ["Disabled", "Enabled"], 1],
 false,
 {
  if (GVAR(enableDroneInfo) && {GVAR(isOpen)}) then {
   call FUNC(refreshDisplay);
  };
 },
 false
] call CBA_fnc_addSetting;

[
 QGVAR(showSpeed),
 "LIST",
 ["Display Speed", "Displays the speed of the drone in km/h."],
 ["Drone Info", "Locks"],
 [[false, true], ["Disabled", "Enabled"], 1],
 false,
 {
  if (GVAR(enableDroneInfo) && {GVAR(isOpen)}) then {
   call FUNC(refreshDisplay);
  };
 },
 false
] call CBA_fnc_addSetting;

[
 QGVAR(showAltitude),
 "LIST",
 ["Display Altitude", "Displays the altitude of the drone in meters."],
 ["Drone Info", "Locks"],
 [[false, true], ["Disabled", "Enabled"], 1],
 false,
 {
  if (GVAR(enableDroneInfo) && {GVAR(isOpen)}) then {
   call FUNC(refreshDisplay);
  };
 },
 false
] call CBA_fnc_addSetting;

[
 QGVAR(showDirection),
 "LIST",
 ["Display Direction", "Displays the direction the drone is facing in degrees."],
 ["Drone Info", "Locks"],
 [[false, true], ["Disabled", "Enabled"], 1],
 false,
 {
  if (GVAR(enableDroneInfo) && {GVAR(isOpen)}) then {
   call FUNC(refreshDisplay);
  };
 },
 false
] call CBA_fnc_addSetting;

[
QGVAR(showPosition),
 "LIST",
 ["Display Position", "Displays the position of the drone as a grid reference ."],
 ["Drone Info", "Locks"],
 [[false, true], ["Disabled", "Enabled"], 1],
 false,
 {
  if (GVAR(enableDroneInfo) && {GVAR(isOpen)}) then {
   call FUNC(refreshDisplay);
  };
 },
 false
] call CBA_fnc_addSetting;

[
 QGVAR(reposPanel),
 "LIST",
 ["Display repositioning", "Allows the repositioning of the display on the player's screen."],
 ["Drone Info", "Locks"],
 [[false, true], ["Locked", "Unlocked"], 1],
 false,
 {},
 false
] call CBA_fnc_addSetting;
