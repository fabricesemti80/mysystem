{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "python-2.7.18.8" "electron-25.9.0" ];
  };

  environment.systemPackages = with pkgs; [

    /* -------------------------------- Utilities ------------------------------- */

    _1password # A CLI for the 1Password password manager
    alacritty # A GPU-accelerated terminal emulator
    # brightnessctl # Utility to control brightness
    fastfetch # Command-line system information tool
    file # Command to determine file types
    # ffmpeg # A complete, cross-platform solution to record, convert and stream audio and video
    fzf # Command-line fuzzy finder
    # light # Control backlights and other lights in GNU/Linux
    lolcat # Colorize text in the terminal
    # lux # A simple brightness control tool
    # mediainfo # Supplies technical and tag information about a video or audio file
    nano # Text editor for Unix-like operating systems    
    ntfs3g # Read/write driver for NTFS file systems
    tmux # A terminal multiplexer that allows multiple terminal sessions to be accessed simultaneously
    unzip # Utility to extract compressed files in a ZIP archive
    wget # Command-line utility to download files from the web
    zip # Utility to compress files into a ZIP archive
    zram-generator # Systemd unit generator for zram swap
    zsh # A powerful shell designed for interactive use and scripting    

    /* ----------------------------- Graphical Tools ---------------------------- */

    _1password-gui # A graphical interface for the 1Password password manager
    gparted # A graphical partition editor for managing disk partitions
    # pcmanfm-qt # A fast and lightweight file manager with a Qt interface
    bluez # Official Linux Bluetooth protocol stack
    bluez-tools # A set of tools to manage Bluetooth devices for Linux
    firefox # A web browser developed by Mozilla
    gparted # A graphical partition editor for managing disk partitions
    pcmanfm-qt # A fast and lightweight file manager with a Qt interface
    tailscale # Mesh VPN service for easy and secure network access
    swww # Wallpaper utility for Sway/Wayland
    httpie # Command-line HTTP client    

    /* --------------------------- Developer Tools: --------------------------- */

    deadnix # A tool to detect dead code in Nix packages
    git # ? (Version control system)
    nix-index # Quickly locate Nix packages
    nix-info # ? (Nix package manager information)
    nixfmt-classic # ? (Formatter for Nix code)
    nixpkgs-fmt # ? (Formatter for Nixpkgs code)
    niv # Easy dependency management for Nix projects
    pinentry-qt # ? (Qt-based PIN or passphrase entry dialog for GnuPG)
    pre-commit # ? Make quality commits
    ripgrep # ? (Fast and efficient text search tool)
    wget # ? (Command-line utility to download files from the web)

    /* -------------------------------- Security -------------------------------- */

    age # ? (Simple, modern file encryption tool)
    sops # ? (Simple and flexible tool for managing secrets)
    gnupg # ? (GNU Privacy Guard - encryption and signing tool)

    /* -------------------------- Terminal enhancement -------------------------- */

    ranger # ? (Console file manager with VI key bindings)
    neovim # ? (Text editor that seeks to improve upon Vim)
    tree # ? (Recursive directory listing command)
    tmux # ? (Terminal multiplexer)

    /* ------------------------------ Coding stuff ------------------------------ */

    # go # ? (Go programming language)
    # gcc # The GNU Compiler Collection, which includes front ends for C, C++, and other languages
    gnumake # A tool that controls the generation of executables and other non-source files from source files
    # nodejs # A JavaScript runtime built on Chrome's V8 JavaScript engine
    # python # An interpreted, high-level programming language known for its readability and broad library support
    # python3.withPackages (ps: with ps; [ requests ]) # A Python 3 environment with the 'requests' package included

    /* -------------------------------- GUI utils ------------------------------- */
    # imv # Image viewer for X11/Wayland
    # dmenu # A dynamic menu for X11
    # screenkey # Screencast your keystrokes
    # mako # Notification daemon for Wayland
    # gromit-mpx # Tool to make annotations on screen

    /* ------------------------------- Xorg stuff ------------------------------- */
    # xterm
    # xclip
    # xorg.xbacklight

    /* ------------------------------ Wayland stuff ----------------------------- */
    # xwayland
    # wl-clipboard
    # cliphist

    /* ------------------------------ WMs and stuff ----------------------------- */
    # herbstluftwm
    # hyprland
    # seatd
    # xdg-desktop-portal-hyprland
    # polybar
    # waybar

    /* ---------------------------------- Sound --------------------------------- */
    pamixer # Command-line mixer for PulseAudio
    pipewire # A server for handling audio and video streams
    pulseaudio # A sound server providing a variety of audio features

    /* -------------------------------- GPU stuff ------------------------------- */
    # amdvlk
    # rocm-opencl-icd
    # glaxnimate

    /* ----------------------------- Screenshotting ----------------------------- */
    flameshot # Powerful yet simple to use screenshot software
    # grim # Screenshot utility for Wayland
    # grimblast # A utility for taking screenshots on Wayland
    # slurp # Utility to select a region in Wayland
    # swappy # A Wayland native snapshot editing tool


    /* ---------------------------------- Other --------------------------------- */
    home-manager # Manage a user environment using Nix
    # spice-vdagent # A SPICE agent for Linux
    # libsForQt5.qtstyleplugin-kvantum # Kvantum Qt5 style plugin
    # libsForQt5.qt5ct # Qt5 configuration tool
    papirus-nord # Papirus icon theme with a Nord color scheme
  ];

  /* ---------------------------------- Fonts --------------------------------- */
  fonts.packages = with pkgs; [
    font-awesome
    fira-code-nerdfont
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
