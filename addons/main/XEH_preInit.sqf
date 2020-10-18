#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

["Drone Info", "toggle", "Toggle Info Panel", {
    call FUNC(toggleDisplay); true
}, {}, [DIK_U, [false, false, true]]] call cba_fnc_addKeybind;

["Drone Info", "configure", "Configure Info Panel",
    ["player", [], -100, QUOTE(call FUNC(fleximenu))],
[DIK_U, [false, true, true]]] call CBA_fnc_addKeybindToFleximenu;

ADDON = true;
