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
        _1password-gui 
        git 
        just
        ripgrep
        tree
  ];
}