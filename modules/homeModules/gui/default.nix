{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [

        /* -------------------- Applications with user interface -------------------- */
        _1password-gui
  ];
}
