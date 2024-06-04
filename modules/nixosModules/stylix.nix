{ config, lib, pkgs, inputs, userSettings,  ... }:
let
  # theme = "darkmoss";

  themePath = "../../../themes"+("/"+userSettings.theme+"/"+userSettings.theme)+".yaml";
  backgroundUrl = builtins.readFile (./. + "../../../themes/"+("/"+userSettings.theme)+"/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/"+("/"+userSettings.theme)+"/backgroundsha256.txt");

in {
  stylix.image = pkgs.fetchurl {
    url = backgroundUrl;
    sha256 = backgroundSha256;
  };
  stylix.polarity = "dark";
  stylix.base16Scheme = ./. + themePath;
}