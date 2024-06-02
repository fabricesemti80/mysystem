{
  config,
  lib,
  pkgs,
  ...
}:
let
  # variables would go here!
in {

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };
   
}