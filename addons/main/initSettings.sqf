[
    QGVAR(enableDroneInfo),
    "CHECKBOX",
    ["Enable Addon", "Enables the addon. Makes it easy to disable instead of unloading the mod."],
    [COMPONENT_NAME, "Locks"],
    true,
    false,
    {
        if (GVAR(isOpen)) then {
            GVAR(doShow) = false;
        };
    },
    false
] call CBA_fnc_addSetting;

[
    QGVAR(showName),
    "CHECKBOX",
    ["Display Name", "Displays the name of the drone."],
    [COMPONENT_NAME, "Locks"],
    true,
    false,
    {
        if (GVAR(enableDroneInfo) && {GVAR(isOpen)}) then {
            call FUNC(refreshDisplay);
        };
    },
    false
] call CBA_fnc_addSetting;

[
    QGVAR(showFuel),
    "CHECKBOX",
    ["Display Fuel", "Displays the fuel level of the drone in percent."],
    [COMPONENT_NAME, "Locks"],
    true,
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
    "CHECKBOX",
    ["Display Speed", "Displays the speed of the drone in km/h."],
    [COMPONENT_NAME, "Locks"],
    true,
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
    "CHECKBOX",
    ["Display Altitude", "Displays the altitude of the drone in meters."],
    [COMPONENT_NAME, "Locks"],
    true,
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
    "CHECKBOX",
    ["Display Direction", "Displays the direction the drone is facing in degrees."],
    [COMPONENT_NAME, "Locks"],
    true,
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
    "CHECKBOX",
    ["Display Position", "Displays the position of the drone as a grid reference ."],
    [COMPONENT_NAME, "Locks"],
    true,
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
    "CHECKBOX",
    ["Allow display repositioning", "Allows the repositioning of the display on the player's screen."],
    [COMPONENT_NAME, "Locks"],
    true,
    false,
    {},
    false
] call CBA_fnc_addSetting;
