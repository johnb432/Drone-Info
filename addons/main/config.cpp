#include "script_component.hpp"

class CfgPatches {
 class ADDON {
  name = COMPONENT_NAME;
  units[] = {};
  weapons[] = {};
  requiredVersion = REQUIRED_VERSION;
  requiredAddons[] = {"cba_main", "cba_xeh", "A3_UI_F"};
  author = "johnb43";
  VERSION_CONFIG;
 };
};

class CfgMods {
 class PREFIX {
  name = "Drone Info";
  hideName = "true";
  actionName = "GitHub";
  action = "https://github.com/johnb432/Drone-Info";
  description = "Drone Info";
 };
};

class RscText;
class RscButton;
class RscTitles {
 class Drone_Info {
  idd = -1;
  duration = 1000000;
  fadeIn = 0;
  fadeOut = 0;
  onLoad = QUOTE(with uiNameSpace do {Drone_Info = _this select 0;}; call FUNC(onLoadDialog););
  onUnload = "";
  controls[] = {
   "Drone_Info",
   "DroneInfoStatusName",
   "DroneInfoStatusFuel",
   "DroneInfoStatusSpeed",
   "DroneInfoStatusAlt",
   "DroneInfoStatusDir",
   "DroneInfoStatusPos"
  };

  //Background for Panel
  class Drone_Info: RscText {
   idc = 29;
   style = 0;
   x = QUOTE(DEFAULT_DISPLAY_XPOS);
   y = QUOTE(DEFAULT_DISPLAY_YPOS);
   w = QUOTE(SAFEZONE_W * 0.066);
   h = QUOTE(SAFEZONE_H * 0.096);
   colorBackground[] = {0.09, 0.1, 0.13, 1};
   colorText[] = {1, 1, 1, 1};
   sizeEx = "0.015 / (getResolution select 5)";
   font = "PuristaMedium";
   size = 2.3;
   shadow = 2;
   text = "";
  };

  //Info bars for panels
  class DroneInfoStatusName: Drone_Info {
   idc = 30;
   colorBackground[] = {0, 0, 0, 0};
   y = QUOTE(SAFEZONE_Y * -0.65);
   h = QUOTE(SAFEZONE_H * 0.016);
  };

  class DroneInfoStatusFuel: Drone_Info {
   idc = 31;
   colorBackground[] = {0, 0, 0, 0};
   y = QUOTE(SAFEZONE_Y * -0.7);
   h = QUOTE(SAFEZONE_H * 0.016);
  };

  class DroneInfoStatusSpeed: Drone_Info {
   idc = 32;
   colorBackground[] = {0, 0, 0, 0};
   y = QUOTE(SAFEZONE_Y * -0.761);
   h = QUOTE(SAFEZONE_H * 0.016);
  };

  class DroneInfoStatusAlt: Drone_Info {
   idc = 33;
   colorBackground[] = {0, 0, 0, 0};
   y = QUOTE(SAFEZONE_Y * -0.822);
   h = QUOTE(SAFEZONE_H * 0.016);
  };

  class DroneInfoStatusDir: Drone_Info {
   idc = 34;
   colorBackground[] = {0, 0, 0, 0};
   y = QUOTE(SAFEZONE_Y * -0.883);
   h = QUOTE(SAFEZONE_H * 0.016);
  };

  class DroneInfoStatusPos: Drone_Info {
   idc = 35;
   colorBackground[] = {0, 0, 0, 0};
   y = QUOTE(SAFEZONE_Y * -0.945);
   h = QUOTE(SAFEZONE_H * 0.016);
  };
 };
};

class Drone_Info_MovingDialog {
 idd = -1;
 movingEnable = 1;
 enableSimulation = 1;
 onLoad = QUOTE(with uiNameSpace do {Drone_Info_MovingDialog = _this select 0;}; call FUNC(onLoadMovingDialog););
 onUnload = "";
 controlsBackground[] = {"MoveMeBack"};
 controls[] = {
  "MoveMe",
  "ConfirmButton"
 };

 class MoveMeBack: RscText {
  idc = 10;
  moving = 1;
  colorBackground[] = {0.1, 1, 0.1, 0.6};
  colorText[] = {0, 0, 0, 1};
  x = QUOTE(DEFAULT_DISPLAY_XPOS);
  y = QUOTE(DEFAULT_DISPLAY_YPOS);
  w = QUOTE(SAFEZONE_W * 0.066);
  h = QUOTE(SAFEZONE_H * 0.096);
 };

 class MoveMe: RscText {
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
  w = QUOTE(SAFEZONE_W * 0.066);
  h = QUOTE(SAFEZONE_H * 0.096);
 };

 class ConfirmButton: RscButton {
  idc = 12;
  moving = 0;
  x = QUOTE(SAFEZONE_X);
  y = QUOTE(SAFEZONE_Y * -0.45);
  w = QUOTE(SAFEZONE_W * 0.033);
  h = QUOTE(SAFEZONE_H * 0.03145);
  colorBackground[] = {0, 0, 0, 0.5};
  sizeEx = "0.018 / (getResolution select 5)";
  text = "Confirm";
  onButtonClick = QUOTE(0 = call FUNC(confirmMove));
 };
};

#include "CfgEventHandlers.hpp"
