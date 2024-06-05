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

    /* ------------------------------- environment ------------------------------ */
    ../../modules/nixosModules/env.nix

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

  /* --------------------------- hardware sepcifics --------------------------- */
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };  
  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  /* ------------------------------- displaylink ------------------------------ */
  services.xserver.videoDrivers = [ "displaylink" "modesetting" "nvidia" ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
