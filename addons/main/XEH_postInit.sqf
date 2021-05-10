#include "script_component.hpp"

// Get a rsc layer from the BI system.
GVAR(droneInfoRscLayer) = [QGVAR(layer)] call BIS_fnc_rscLayer;

GVAR(isOpen) = false;

// Main GUI positioning data. Get positions from config.
private _posX = DISPLAY_XPOS;
private _posY = DISPLAY_YPOS;

// Make sure it's on the screen.
if (_posX > safeZoneXAbs && {_posY > safeZoneY && {_posX < safeZoneWAbs && {_posY < safeZoneH}}}) then {
    DISPLAY_XPOS_SET(_posX);
    DISPLAY_YPOS_SET(_posY);
};
