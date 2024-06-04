{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  
  home.packages = with pkgs; [
    ## Developer Tools
    deadnix # A tool to detect dead code in Nix packages
    git # A version control system for tracking changes in source code
    just # A command runner for managing project-specific tasks
    niv # Easy dependency management for Nix projects
    nixfmt-classic # A Nix code formatter
    pre-commit # A framework for managing and maintaining multi-language pre-commit hooks

    ## Utilities
    fastfetch # A fast, minimalistic system information utility
    htop # An interactive process viewer for Unix systems
    jq # A lightweight and flexible command-line JSON processor
    ripgrep # A line-oriented search tool that recursively searches directories for a regex pattern
    tmux # A terminal multiplexer that allows multiple terminal sessions to be accessed simultaneously
    tree # A recursive directory listing command that produces a depth-indented listing of files
    whois # A utility that retrieves information about domain names
    zsh # A powerful shell designed for interactive use and scripting

    ## Graphical Tools
    
    _1password-gui # A graphical interface for the 1Password password manager
    alacritty # A GPU-accelerated terminal emulator
    firefox # A web browser developed by Mozilla
  ];

}
