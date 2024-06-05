{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixVim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix colors
    nix-colors.url = "github:misterio77/nix-colors";

    # Stylix
    stylix.url = "github:danth/stylix";

  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , stylix
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        # username = "emmet"; # username
        # name = "Emmet"; # name/identifier
        # email = "emmet@librephoenix.com"; # email (used for certain configurations)
        # dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
        theme = "old-hope"; # selcted theme from my themes directory (./themes/)
        # wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
        # # window manager type (hyprland or x11) translator
        # wmType = if (wm == "hyprland") then "wayland" else "x11";
        # browser = "qutebrowser"; # Default browser; must select one from ./user/app/browser/
        # defaultRoamDir = "Personal.p"; # Default org roam directory relative to ~/Org
        term = "alacritty"; # Default terminal command;
        # font = "Intel One Mono"; # Selected font
        # fontPkg = pkgs.intel-one-mono; # Font package
      #   editor = "emacsclient"; # Default editor;
      #   # editor spawning translator
      #   # generates a command that can be used to spawn editor inside a gui
      #   # EDITOR and TERM session variables must be set in home.nix or other module
      #   # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
      #   spawnEditor = if (editor == "emacsclient") then
      #                   "emacsclient -c -a 'emacs'"
      #                 else
      #                   (if ((editor == "vim") ||
      #                        (editor == "nvim") ||
      #                        (editor == "nano")) then
      #                          "exec " + term + " -e " + editor
      #                    else
      #                      editor);
      };
    in
    {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixosModules;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/homeModules;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {

        # Personal laptop
        horus = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs userSettings; };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/horus/configuration.nix
            inputs.nixvim.nixosModules.nixvim
            stylix.nixosModules.stylix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {

        # Home on my personal device
        "fs@horus" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs userSettings; };
          modules = [
            # > Our main home-manager configuration file <
            ./home/fs/home.nix
            stylix.homeManagerModules.stylix
          ];
        };

        # Home on my work server
        "808fsemti@dc1devjump02p" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs userSettings; };
          modules = [
            # > Our main home-manager configuration file <
            ./home/808fsemti/home.nix
            stylix.homeManagerModules.stylix
          ];
        };

      };
    };
}
