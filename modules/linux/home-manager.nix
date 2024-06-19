{ homeDirectory, stateVersion, user, config, pkgs, lib, ... }:

let
  shared-programs = import ../shared/home-manager.nix { inherit user config pkgs lib; };
  shared-files = import ../shared/files.nix { inherit homeDirectory config pkgs; };
in
{
  home = {
    enableNixpkgsReleaseCheck = false;
    username = "${user}";
    packages = pkgs.callPackage ./packages.nix { };
    file = shared-files // import ./files.nix { inherit user homeDirectory config pkgs; };
    inherit homeDirectory;
    inherit stateVersion;
  };

  programs = shared-programs // { };

}

