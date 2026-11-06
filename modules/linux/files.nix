{ user, homeDirectory, config, pkgs, ... }:

let
  xdg_configHome = "${homeDirectory}/.config";
  xdg_dataHome = "${homeDirectory}/.local/share";
  xdg_stateHome = "${homeDirectory}/.local/state";
in
{
  # zsh reads .zshenv on every invocation; .zshrc only on interactive ones.
  # The Nix installer hooks /etc/zshrc, so `ssh host <cmd>` (non-interactive)
  # never gets the nix profile on PATH and falls back to the distro's node 16.
  # nix-darwin generates an equivalent /etc/zshenv on the macOS hosts; we have
  # no root on these boxes, so do the same thing at the user level.
  "${homeDirectory}/.zshenv" = {
    text = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';
  };
}
