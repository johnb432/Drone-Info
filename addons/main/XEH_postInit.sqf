#include "script_component.hpp"

// Get a rsc layer from the BI system.
GVAR(droneInfoRscLayer) = ["DroneInfoRsc"] call BIS_fnc_rscLayer;

GVAR(isOpen) = false;

// Main GUI positioning data. Get positions from config.
private _posX = DISPLAY_XPOS;
private _posY = DISPLAY_YPOS;

// Make sure it's on the screen.
if (_posX > safeZoneXAbs && {_posY > SAFEZONE_Y && {_posX < safeZoneWAbs && {_posY < SAFEZONE_H}}}) then {
 SETPRVAR(displayPosX, _posX);
 SETPRVAR(displayPosY, _posY);
};
