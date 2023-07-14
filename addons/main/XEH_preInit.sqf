#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// CBA Settings
#include "initSettings.sqf"

[COMPONENT_NAME, GVAR(toggleDisplay), "Toggle Info Panel", {
    call FUNC(toggleDisplay);
    true
}, {}, [DIK_U, [false, false, true]]] call CBA_fnc_addKeybind;

ADDON = true;
