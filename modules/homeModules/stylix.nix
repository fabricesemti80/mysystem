{ config, lib, pkgs, inputs,  ... }:
let
  theme = "bespin";
  backgroundUrl = builtins.readFile (./. + "../../../themes/"+("/"+theme)+"/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/"+("/"+theme)+"/backgroundsha256.txt");

in {
  stylix.image = pkgs.fetchurl {
    url = backgroundUrl;
    sha256 = backgroundSha256;
  };
  stylix.polarity = "dark";
}