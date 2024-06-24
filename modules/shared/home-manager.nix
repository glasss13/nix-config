{ user, config, pkgs, lib, ... }:

let
  name = "Max Glass";
  email = "glassmax13@gmail.com";
in
{

  neovim = {
    enable = true;
    defaultEditor = true;
  };
  home-manager.enable = true;
  starship = import ./starship.nix { inherit lib; };
  alacritty = import ./alacritty.nix { inherit lib; inherit pkgs; };
  git = import ./git.nix { inherit name; inherit email; };
  tmux = import ./tmux.nix { inherit pkgs; };
}
