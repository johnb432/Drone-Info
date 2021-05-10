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
#define DEFAULT_DISPLAY_XPOS (safeZoneX * -2.17)
#define DEFAULT_DISPLAY_YPOS (safeZoneY * -0.7)

// Relative positioning defines. Getters
#define DISPLAY_XPOS (GETPRVAR(GVAR(displayPosX),DEFAULT_DISPLAY_XPOS))
#define DISPLAY_YPOS (GETPRVAR(GVAR(displayPosY),DEFAULT_DISPLAY_YPOS))
#define BACK_XPOS (DISPLAY_XPOS - (safeZoneH * 0.093))
#define BACK_YPOS (DISPLAY_YPOS - (safeZoneH * 0.046))

// Setters
#define DISPLAY_XPOS_SET(var) (SETPRVAR(GVAR(displayPosX),var))
#define DISPLAY_YPOS_SET(var) (SETPRVAR(GVAR(displayPosY),var))

// Display control ID defines.
#define DRONEINFO (GETUVAR(GVAR(droneInfo),nil))
#define MOVEME (GETUVAR(GVAR(droneInfoMovingDialog),nil))
#define BACKGROUND 29
#define DRONENAME 30
#define DRONEFUEL 31
#define DRONESPEED 32
#define DRONEALT 33
#define DRONEDIR 34
#define DRONEPOS 35
