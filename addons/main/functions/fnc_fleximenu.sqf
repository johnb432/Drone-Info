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
 * call tao_rewrite_main_fnc_fleximenu;
 *
 * Public: No
 */

[
    ["main", COMPONENT_NAME, "popup"],
    [
        [
            "Reposition Info Panel", // text on button
            {
                MOVEME closeDisplay 0;
                createDialog QGVAR(droneInfoMovingDialog);
            }, // code to run
            "", // icon
            "", // tooltip
            [], // submenu
            DIK_R, // shortcut key
            GVAR(enableDroneInfo) && GVAR(isOpen) && GVAR(reposPanel), // enabled?
            true // visible if true
        ],

        [
            // Show/Hide info panel
            "Show/Hide",
            {
                call FUNC(toggleDisplay)
            },
            "",
            "",
            [],
            DIK_S,
            GVAR(enableDroneInfo) && {!isNull(getConnectedUAV player)},
            true
        ]
    ]
];
