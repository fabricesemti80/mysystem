# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {

  /* -------------------------------------------------------------------------- */
  /*                   You can import other NixOS modules here                  */
  /* -------------------------------------------------------------------------- */
  imports = [
    /* -------------------------- Host-specific config -------------------------- */
    ./hardware-configuration.nix
    ./networking.nix
    /* -------------- Modules to configure varius system parameters ------------- */
    ../../modules/nixosModules/locale.nix
    ../../modules/nixosModules/users.nix
    ../../modules/nixosModules/packages.nix
    ../../modules/nixosModules/bootloader.nix
    ../../modules/nixosModules/audio.nix
    ../../modules/nixosModules/xserver.nix
    ../../modules/nixosModules/hyprland.nix
    ../../modules/nixosModules/nixvim/nixvim.nix
    ../../modules/nixosModules/nixConfig.nix
    ../../modules/nixosModules/ssh.nix

  ];


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
