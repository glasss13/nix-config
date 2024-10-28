{ homeDirectory, config, pkgs, ... }:

let
  xdg_configHome = "${homeDirectory}/.config";
  xdg_dataHome = "${homeDirectory}/.local/share";
  xdg_stateHome = "${homeDirectory}/.local/state";
in
{
  "${xdg_configHome}/sketchybar" = {
    source = ./config/sketchybar;
    recursive = true;
  };
}
