#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "cba_xeh",
            "A3_UI_F"
        };
        author = "johnb43";
        authorUrl = "https://github.com/johnb432/Drone-Info";
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        name = COMPONENT_NAME;
        hideName = "true";
        actionName = "GitHub";
        action = "https://github.com/johnb432/Drone-Info";
        description = "Adds a display panel with information from a drone controlled by the player.";
    };
};

class RscText;
class RscButton;
class RscTitles {
    class GVAR(droneInfo) {
        idd = -1;
        duration = 1000000;
        fadeIn = 0;
        fadeOut = 0;
        onLoad = QUOTE(with uiNameSpace do {GVAR(droneInfo) = _this select 0;}; call FUNC(onLoadDialog););
        onUnload = "";
        controls[] = {
            QGVAR(droneInfoBackground),
            QGVAR(droneInfoStatusName),
            QGVAR(droneInfoStatusFuel),
            QGVAR(droneInfoStatusSpeed),
            QGVAR(droneInfoStatusAlt),
            QGVAR(droneInfoStatusDir),
            QGVAR(droneInfoStatusPos)
        };

        // Background for Panel
        class GVAR(droneInfoBackground): RscText {
            idc = 29;
            style = 0;
            x = QUOTE(DEFAULT_DISPLAY_XPOS);
            y = QUOTE(DEFAULT_DISPLAY_YPOS);
            w = QUOTE(safeZoneW * 0.066);
            h = QUOTE(safeZoneH * 0.096);
            colorBackground[] = {0.09, 0.1, 0.13, 1};
            colorText[] = {1, 1, 1, 1};
            sizeEx = "0.015 / (getResolution select 5)";
            font = "PuristaMedium";
            size = 2.3;
            shadow = 2;
            text = "";
        };

        // Info bars for panels
        class GVAR(droneInfoStatusName): GVAR(droneInfoBackground) {
            idc = 30;
            colorBackground[] = {0, 0, 0, 0};
            y = QUOTE(safeZoneY * -0.65);
            h = QUOTE(safeZoneH * 0.016);
        };

        class GVAR(droneInfoStatusFuel): GVAR(droneInfoBackground) {
            idc = 31;
            colorBackground[] = {0, 0, 0, 0};
            y = QUOTE(safeZoneY * -0.7);
            h = QUOTE(safeZoneH * 0.016);
        };

        class GVAR(droneInfoStatusSpeed): GVAR(droneInfoBackground) {
            idc = 32;
            colorBackground[] = {0, 0, 0, 0};
            y = QUOTE(safeZoneY * -0.761);
            h = QUOTE(safeZoneH * 0.016);
        };

        class GVAR(droneInfoStatusAlt): GVAR(droneInfoBackground) {
            idc = 33;
            colorBackground[] = {0, 0, 0, 0};
            y = QUOTE(safeZoneY * -0.822);
            h = QUOTE(safeZoneH * 0.016);
        };

        class GVAR(droneInfoStatusDir): GVAR(droneInfoBackground) {
            idc = 34;
            colorBackground[] = {0, 0, 0, 0};
            y = QUOTE(safeZoneY * -0.883);
            h = QUOTE(safeZoneH * 0.016);
        };

        class GVAR(droneInfoStatusPos): GVAR(droneInfoBackground) {
            idc = 35;
            colorBackground[] = {0, 0, 0, 0};
            y = QUOTE(safeZoneY * -0.945);
            h = QUOTE(safeZoneH * 0.016);
        };
    };
};

class GVAR(droneInfoMovingDialog) {
    idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(with uiNameSpace do {GVAR(droneInfoMovingDialog) = _this select 0;}; call FUNC(onLoadMovingDialog););
    onUnload = "";
    controlsBackground[] = {"MoveMeBack"};
    controls[] = {
        QGVAR(moveMe),
        QGVAR(confirmButton)
    };

    class MoveMeBack: RscText {
        idc = 10;
        moving = 1;
        colorBackground[] = {0.1, 1, 0.1, 0.6};
        colorText[] = {0, 0, 0, 1};
        x = QUOTE(DEFAULT_DISPLAY_XPOS);
        y = QUOTE(DEFAULT_DISPLAY_YPOS);
        w = QUOTE(safeZoneW * 0.066);
        h = QUOTE(safeZoneH * 0.096);
    };

    class GVAR(moveMe): RscText {
        idc = 11;
        style = 2;
        moving = 0;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {0, 0, 0, 1};
        lineSpacing = 1.1;
        shadow = 0;
        sizeEx = "0.012 / (getResolution select 5)";
        text = "Move me. Press Esc to cancel.";
        x = QUOTE(DEFAULT_DISPLAY_XPOS);
        y = QUOTE(DEFAULT_DISPLAY_YPOS);
        w = QUOTE(safeZoneW * 0.066);
        h = QUOTE(safeZoneH * 0.096);
    };

    class GVAR(confirmButton): RscButton {
        idc = 12;
        moving = 0;
        x = QUOTE(safeZoneX);
        y = QUOTE(safeZoneY * -0.45);
        w = QUOTE(safeZoneW * 0.033);
        h = QUOTE(safeZoneH * 0.03145);
        colorBackground[] = {0, 0, 0, 0.5};
        sizeEx = "0.018 / (getResolution select 5)";
        text = "Confirm";
        onButtonClick = QUOTE(0 = call FUNC(confirmMove));
    };
};

#include "CfgEventHandlers.hpp"
