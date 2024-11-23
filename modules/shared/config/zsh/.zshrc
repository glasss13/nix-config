if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"

autoload -U compinit && compinit

zinit light starship/starship
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions


zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
# dont add to history if command has a " " before it
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# ignore case for autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

alias ls="eza -lb --icons --git --git-repos-no-status"
alias la="eza -lab --icons --git --git-repos-no-status"
alias cat="bat"
alias vim="nvim"
# alias s=""

s() {
    if [ $# -eq 0 ]; then
        sesh connect $(sesh list -i | fzf --bind "ctrl-d:reload(tmux kill-session -t{2} && sesh list -i)" --ansi --height 40% --layout reverse --border --preview "bash -c 'if [ {1} = '' ]; then tmux capture-pane -ep -t {2}; else eza -1 --color=always {2}; fi'" | awk '{print substr($0, index($0,$2))}')
    else
        sesh connect $1
    fi
}

# macos only
finder() {
    if [ -z "$1"];then
        open -a finder .
    else
        open -a finder "$1"
    fi
}

# search using the existing prefix
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

