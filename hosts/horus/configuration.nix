# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs
, outputs
, lib
, config
, pkgs
, userSettings
, ...
}: {

  /* -------------------------------------------------------------------------- */
  /*                                   Imports                                  */
  /* -------------------------------------------------------------------------- */
  imports = [

    /* -------------------------------- packages -------------------------------- */
    ../../modules/nixosModules/defaultPackages.nix

    /* -------------------------- Host-specific config -------------------------- */
    ./hardware-configuration.nix
    ./networking.nix
    ./bootloader.nix

    /* ---------------------- Default modules for all hosts --------------------- */
    ../../modules/nixosModules/defaults

    /* -------------- Modules to configure varius system parameters ------------- */
    ../../modules/nixosModules/stylix.nix
    # ../../modules/nixosModules/nixvim/nixvim.nix

    /* ----------------------------- Desktop manager ---------------------------- */
    ../../modules/nixosModules/desktops/gnome/default.nix

  ];

  programs.firefox.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
