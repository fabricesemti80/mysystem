{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

      # Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    #  Replace with your username
    fs = {
      # You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      # initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      description = "Fabrice Semti";
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        #  thunderbird
        git
        # neovim
        just
        vscode
      ];      
    };
  };
  
}