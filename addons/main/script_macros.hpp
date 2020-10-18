#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

//This part includes parts of the CBA and ACE3 macro libraries
#define GETUVAR(var1,var2) (uiNamespace getVariable [ARR_2(QUOTE(var1),var2)])
#define GETPRVAR(var1,var2) (profileNamespace getVariable [ARR_2(QUOTE(var1),var2)])

#define SETPRVAR(var1,var2) (profileNamespace setVariable [ARR_2(QUOTE(var1),var2)])

#define FUNC_PATHTO_SYS(var1,var2,var3) \MAINPREFIX\var1\SUBPREFIX\var2\functions\var3.sqf

#ifdef DISABLE_COMPILE_CACHE
    #define PREPFNC(var1) TRIPLES(ADDON,fnc,var1) = compile preProcessFileLineNumbers 'FUNC_PATHTO_SYS(PREFIX,COMPONENT,DOUBLES(fnc,var1))'
#else
    #define PREPFNC(var1) ['FUNC_PATHTO_SYS(PREFIX,COMPONENT,DOUBLES(fnc,var1))', 'TRIPLES(ADDON,fnc,var1)'] call SLX_XEH_COMPILE_NEW
#endif

// Hardcoded defaults.
#define SAFEZONE_X safeZoneX
#define SAFEZONE_Y safeZoneY
#define SAFEZONE_H safeZoneH
#define SAFEZONE_W safeZoneW
#define DEFAULT_DISPLAY_XPOS (SAFEZONE_X * -2.17)
#define DEFAULT_DISPLAY_YPOS (SAFEZONE_Y * -0.7)

// Relative positioning defines.
#define DISPLAY_XPOS (GETPRVAR(displayPosX, DEFAULT_DISPLAY_XPOS))
#define DISPLAY_YPOS (GETPRVAR(displayPosY, DEFAULT_DISPLAY_YPOS))
#define BACK_XPOS (DISPLAY_XPOS - (SAFEZONE_H * 0.093))
#define BACK_YPOS (DISPLAY_YPOS - (SAFEZONE_H * 0.046))

// Display control ID defines.
#define DRONEINFO (GETUVAR(Drone_Info, nil))
#define MOVEME (GETUVAR(Drone_Info_MovingDialog, nil))
#define BACKGROUND 30
#define DRONEFUEL 31
#define DRONESPEED 32
#define DRONEALT 33
#define DRONEDIR 34
#define DRONEPOS 35
