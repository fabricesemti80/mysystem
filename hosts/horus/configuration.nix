# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {

  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example
    ../../modules/nixosModules/locale.nix
    ../../modules/nixosModules/users.nix
    ../../modules/nixosModules/packages.nix
    # Import host's bootloader config
    ../../modules/nixosModules/bootloader.nix
    # Host specific configs
    ../../modules/nixosModules/audio.nix
    ../../modules/nixosModules/xserver.nix
    ../../modules/nixosModules/hyprland.nix
    ../../modules/nixosModules/nixvim/nixvim.nix
    ../../modules/nixosModules/nixConfig.nix
    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    # You can also split up your configuration and import pieces of it here:
    # ./users.nix
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ./networking.nix
  ];

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };
  
  # Install firefox.
  programs.firefox.enable = true;
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
