{ config
, lib
, pkgs
, ...
}:
let
  # variables would go here!
in
{
  services.xserver = {

    enable = true;

    # windowManager.herbstluftwm.enable = true;

    /* ---------------------------------- GNOME --------------------------------- */
    displayManager = {
      gdm.enable = true;
    };
    desktopManager = {
      gnome.enable = true;
    };

    /* ---------------------------------- Misc ---------------------------------- */
    xkb = {
      variant = " ";
      options = "grp:win_space_toggle";
      layout = "us";
    };
  };

  services.displayManager = {

    # optional -auto login
    autoLogin.enable = true;
    autoLogin.user = "fs";
    
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
