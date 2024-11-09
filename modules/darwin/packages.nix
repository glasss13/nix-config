{ pkgs }:
with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-packages ++ [
  darwin.trash
  hidden-bar
  rectangle
  stats
  cocoapods
]
