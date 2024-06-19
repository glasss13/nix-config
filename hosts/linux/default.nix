{ homeDirectory, stateVersion, user, ... }:
{ lib, pkgs, config, ... }:

{
  imports = [
    (import ../../modules/linux/home-manager.nix { inherit homeDirectory stateVersion user config pkgs lib; })
    (import ../../modules/shared { inherit config pkgs; })
    # ../../modules/shared/cachix
  ];

  nix = {
    package = pkgs.nix;
  };
}
