
### Added by Zinit's installer
# if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
#     print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
#         print -P "%F{33} %F{34}Installation successful.%f%b" || \
#         print -P "%F{160} The clone has failed.%f%b"
# fi

# source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
# if [ ! -d "$ZINIT_HOME" ]; then
#    mkdir -p "$(dirname $ZINIT_HOME)"
#    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# # Add in Powerlevel10k
# zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^I^I' autosuggest-accept
bindkey "^H" backward-delete-word
# Bind Ctrl+Left and Ctrl+Right to move by word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='lsd -A'
alias vim='nvim'
alias c='clear'
alias clock="tty-clock -S -s  -c"
alias matrix="unimatrix -s 95"
alias cc="yay -Scc"
alias cleanup="yay -Rns $(yay -Qtdg)"
alias syu="yay -Syu"
alias ss="sudo pacman -Ss"
alias r="yay -Rns"
alias s="sudo pacman -S"
alias ys="yay -S"
alias cd="z"
alias cfg="micro ~/.zshrc"
alias nano="micro"
alias empty='rm -rf ~/.local/share/Trash/files'
alias pls="sudo $(history -p !!)"
alias pg="ping -c 3 google.com"
alias iwc="iwctl station wlan0"
alias iwl="iwctl"
alias nt="iwc get-networks"
# i like 480p
alias yd="yt-dlp -f 'bestvideo[height=480]+bestaudio'  -S vcodec:h264,res:480,acodec:m4a"

mkcd(){
    mkdir $1 && cd $1
}

# python aliases
alias venv='python3 -m venv .venv && source .venv/bin/activate'
alias py="python"

pyins() {
    sudo pacman -S python-"$1"
}

alias vite="pnpm create vite@latest"

# Shell integrations
# eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# eval $(oh-my-posh init zsh -c 'catppuccin_frappe')

#  functions

chpwd(){
    ls -a
}

crn(){
    g++ $1 && ./a.out
}

#  ENV
export PATH=$HOME/.local/bin:$PATH
# pnpm
export PNPM_HOME="/home/jsisthebest/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# syntax highlighting

export ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
export ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
export ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan,bold'
export ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow,italic'
export ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,italic'


fastfetch
