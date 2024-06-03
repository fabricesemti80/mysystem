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

    /* ---------------------- Applications for the terminal --------------------- */

              # Utilities
              fastfetch
              htop
              jq
              just
              ripgrep
              tree
              tmux
              whois

              # Developer tools
              deadnix
              git
              pre-commit

              # NIX             
              niv
              nixfmt-classic

              # Terminal enhancments
              tmux
              zsh
              

  ];
}
