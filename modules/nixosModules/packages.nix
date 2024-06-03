{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [

    /* ------------------------------ Desktop apps ------------------------------ */
    firefox
    # chromium
    # telegram-desktop
    alacritty
    # obs-studio
    rofi
    wofi
    mpv
    kdenlive
    # discord
    gparted
    # obsidian
    # zoom-us
    pcmanfm-qt    
    _1password
    _1password-gui

    /* --------------------------- Developer Tools: --------------------------- */
    git # ? (Version control system)
    git-crypt # ? (Transparent file encryption in git)
    go-task # ? (Task runner / build tool)
    hugo # ? (Static site generator)
    httpie # ? (Command-line HTTP client)
    jq # ? (Lightweight and flexible command-line JSON processor)
    nix-info # ? (Nix package manager information)
    nixfmt-classic # ? (Formatter for Nix code)
    nixpkgs-fmt # ? (Formatter for Nixpkgs code)
    pinentry-qt # ? (Qt-based PIN or passphrase entry dialog for GnuPG)
    pre-commit # ? Make quality commits
    ripgrep # ? (Fast and efficient text search tool)
    wget # ? (Command-line utility to download files from the web)

    /* -------------------------------- Security -------------------------------- */
    sops # ? (Simple and flexible tool for managing secrets)
    gnupg # ? (GNU Privacy Guard - encryption and signing tool)
    pinentry-qt # ? Qt-based PIN or passphrase entry dialog for GnuPG

    /* -------------------------- Terminal enhancement -------------------------- */
    ranger # ? (Console file manager with VI key bindings)
    neovim # ? (Text editor that seeks to improve upon Vim)
    tree # ? (Recursive directory listing command)
    tmux # ? (Terminal multiplexer)

    /* ------------------------------ Coding stuff ------------------------------ */
    go # ? (Go programming language)
    gnumake
    gcc
    # nodejs
    # python
    # (python3.withPackages (ps: with ps; [ requests ]))    

    /* ------------------------------- Utilities: ------------------------------- */
    age # ? (Simple, modern file encryption tool)
    bat # ? (A cat(1) clone with syntax highlighting and Git integration)
    direnv # ? (Environment switcher for the shell)

    /* ------------------------- Command-line Utilities: ------------------------ */
    btop # ? (Resource monitor)
    cmatrix # ? (Matrix screensaver)
    cowsay # ? (Program that generates ASCII pictures of a cow with a message)
    duf # ? (Disk usage/free utility)
    eza # ? (Command-line utility for task automation)
    fzf # ? (Command-line fuzzy finder)
    lolcat # ? (Colorize text in the terminal)
    man-pages # ? (Linux manual pages)
    nano # ? (Text editor for Unix-like operating systems)
    fastfetch # commandnd-line system information tool)
    tailscale # ? (Mesh VPN service for easy and secure network access)
    dig # ? (DNS lookup utility)
    curl # ? (Command-line tool for making HTTP requests)
    httpie # ? (Command-line HTTP client)
    wget # ? (Command-line utility to download files from the web)
    file
    tree
    wget
    git
    fastfetch
    htop
    nix-index
    unzip
    scrot
    ffmpeg
    light
    lux
    mediainfo
    ranger
    zram-generator
    cava
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    swww
    openssl
    lazygit
    bluez
    bluez-tools

    /* -------------------------------- GUI utils ------------------------------- */
    feh
    imv
    dmenu
    screenkey
    mako
    gromit-mpx

    /* ------------------------------- Xorg stuff ------------------------------- */
    #xterm
    #xclip
    #xorg.xbacklight

    /* ------------------------------ Wayland stuff ----------------------------- */
    xwayland
    wl-clipboard
    cliphist

    /* ------------------------------ WMs and stuff ----------------------------- */
    herbstluftwm
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    polybar
    waybar

    /* ---------------------------------- Sound --------------------------------- */
    pipewire
    pulseaudio
    pamixer

    /* -------------------------------- GPU stuff ------------------------------- */
    # amdvlk
    # rocm-opencl-icd
    # glaxnimate

    /* ----------------------------- Screenshotting ----------------------------- */
    grim
    grimblast
    slurp
    flameshot
    swappy

    /* ---------------------------------- Other --------------------------------- */
    home-manager
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord
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
