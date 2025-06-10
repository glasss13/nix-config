{ homeDirectory, config, pkgs, ... }:

let
  xdg_configHome = "${homeDirectory}/.config";
  xdg_dataHome = "${homeDirectory}/.local/share";
  xdg_stateHome = "${homeDirectory}/.local/state";
in
{
  "${xdg_configHome}/nvim" = {
    source = ./config/nvim;
    recursive = true;
  };
  "${homeDirectory}/.zshrc" = {
    source = ./config/zsh/.zshrc;
  };
  "${xdg_configHome}/sesh" = {
    source = ./config/sesh;
    recursive = true;
  };
  "${xdg_configHome}/ghostty" = {
    source = ./config/ghostty;
    # recursive = true;
  };
}
