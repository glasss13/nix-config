{ pkgs, ... }:

{
  enable = true;
  plugins = with pkgs.tmuxPlugins; [
    onedark-theme
    sensible
    vim-tmux-navigator
  ];
  terminal = "screen-256color";
  prefix = "C-a";
  historyLimit = 50000;
  extraConfig = ''
    # Remove Vim mode delays
    set -g focus-events on

    # Enable full mouse support
    set -g mouse on

    set -ga terminal-overrides ",xterm-256color:Tc"

    set -g base-index 1
    set -g pane-base-index 1
    set-window-option -g pane-base-index 1
    set-option -g renumber-windows on
    set-option -g status-position top

    # tmux-sensible sets this, but we don't need it anymore
    set-option -g default-command "" 

    # -----------------------------------------------------------------------------
    # Key bindings
    # -----------------------------------------------------------------------------

    # Unbind default keys
    unbind C-b
  '';
}
