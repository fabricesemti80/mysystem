{ config, lib, pkgs, inputs, userSettings, ... }:
{
  environment.sessionVariables = {
    FLAKE = userSettings.dotfilesDir;
  };
}
