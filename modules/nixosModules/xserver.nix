{ config
, lib
, pkgs
, ...
}:
let
  # variables would go here!
in
{

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    windowManager.herbstluftwm.enable = true;
    xkb = {
      variant = " ";
      options = "grp:win_space_toggle";
      layout = "us";
    };
  };

  # libinput = {
  #   enable = true;
  #   mouse.accelProfile = "flat";
  #   touchpad.accelProfile = "flat";
  # };

  # deviceSection = ''Option "TearFree" "True"'';

  # Enable display link
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

}
