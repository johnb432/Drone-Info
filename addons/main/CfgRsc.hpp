class RscText;
class RscTitles {
    class GVAR(droneInfo) {
        idd = -1;
        duration = 1000000;
        fadeIn = 0;
        fadeOut = 0;
        onLoad = QUOTE((_this select 0) call FUNC(onLoadDialog));
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
            idc = IDC_BACKGROUND;
            style = 0;
            x = POS_X(54.8);
            y = POS_Y(10.2);
            w = POS_W(5.5);
            h = POS_H(0.75) * 6;
            colorBackground[] = {0.09, 0.1, 0.13, 1};
            colorText[] = {1, 1, 1, 1};
            sizeEx = 0.025;
            font = "PuristaMedium";
            size = 2.3;
            shadow = 2;
            text = "";
        };

        // Info bars for panels
        class GVAR(droneInfoStatusName): GVAR(droneInfoBackground) {
            idc = IDC_DRONENAME;
            colorBackground[] = {0, 0, 0, 0};
            h = POS_H(0.75);
        };

        class GVAR(droneInfoStatusFuel): GVAR(droneInfoBackground) {
            idc = IDC_DRONEFUEL;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(droneInfoStatusSpeed): GVAR(droneInfoBackground) {
            idc = IDC_DRONESPEED;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 2 * POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(droneInfoStatusAlt): GVAR(droneInfoBackground) {
            idc = IDC_DRONEALT;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 3 * POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(droneInfoStatusDir): GVAR(droneInfoBackground) {
            idc = IDC_DRONEDIR;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 4 * POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(droneInfoStatusPos): GVAR(droneInfoBackground) {
            idc = IDC_DRONEPOS;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 5 * POS_H(0.75);
            h = POS_H(0.75);
        };
    };
};
