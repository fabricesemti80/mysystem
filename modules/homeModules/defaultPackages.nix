{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {

  home.packages = with pkgs; [


    /* -------------------------------- Utilities ------------------------------- */

    bat # ? (A cat(1) clone with syntax highlighting and Git integration)
    btop # Resource monitor
    cava # Console-based audio visualizer for ALSA
    cmatrix # Matrix screensaver
    cowsay # Program that generates ASCII pictures of a cow with a message
    curl # Command-line tool for making HTTP requests
    direnv # ? (Environment switcher for the shell)    
    eza # Command-line utility for task automation    
    dig # DNS lookup utility
    duf # Disk usage/free utility    
    fastfetch # A fast, minimalistic system information utility
    htop # An interactive process viewer for Unix systems
    httpie # ? (Command-line HTTP client)
    jq # ? (Lightweight and flexible command-line JSON processor)
    just # A command runner for managing project-specific tasks  
    lazygit # A simple terminal UI for git commands  
    ripgrep # A line-oriented search tool that recursively searches directories for a regex pattern
    ranger # A terminal-based file manager
    scrot # Command-line screen capture utility
    tree # A recursive directory listing command that produces a depth-indented listing of files
    whois # A utility that retrieves information about domain names
    zsh # A powerful shell designed for interactive use and scripting
    feh # Lightweight image viewer

    gnome.adwaita-icon-theme

  ];

}
