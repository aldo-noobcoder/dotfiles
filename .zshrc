if [[ -z "$RECORDING" ]]; then
    fastfetch
fi
# todo list --sort uid
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -n "$RECORDING" ]]; then
    PROMPT="> "
    RPROMPT=""
else
   if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
   fi
fi


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
ZSHROOT="$HOME/.config/zsh"

# Add in zsh plugins
source "$ZSHROOT/aliases.zsh"
source "$ZSHROOT/binds.zsh"
source "$ZSHROOT/functions.zsh"

if [[ -z "$RECORDING" ]]; then
zinit ice depth=1; zinit light romkatv/powerlevel10k
#  
# zinit ice depth=1
zinit light marlonrichert/zsh-autocomplete

zinit light zsh-users/zsh-completions

zinit light joshskidmore/zsh-fzf-history-search

zinit light jessetipton/ding
zinit light Freed-Wu/zsh-help
zinit light unixorn/prettyping
zinit light diverdale/colored-man-pages-plus
zinit light zpm-zsh/colorize
zinit light toku-sa-n/zsh-dot-up
zinit light zshzoo/magic-enter

zinit light zdharma-continuum/fast-syntax-highlighting  2>/dev/null
fi

zinit light QuarticCat/zsh-smartcache

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::command-not-found

smartcache eval fzf --zsh
smartcache eval zoxide init zsh --cmd cd
# smartcache eval pay-respects zsh


# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
export HISTCONTROL=ignoreboth:erasedups
export HISTORY_IGNORE="(ls|lsd|[bf]g|exit|ll|llt|la|lst|clr|clear|btop|wttr|lsd|topgrade|yay|exec bash|cd *|new|kill|attach|*chattr*|*schedule_blocker*|*schedule-blocker*|*request-disable*)"


setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks   
setopt hist_verify
setopt hist_no_store
setopt INC_APPEND_HISTORY   
# setopt CORRECT
# setopt correctall   
setopt AUTO_MENU          # show completion menu on second Tab
setopt COMPLETE_IN_WORD   # complete from anywhere in a word
setopt ALWAYS_TO_END      # move cursor to end after completion

unsetopt promptcr    
unsetopt shwordsplit

unsetopt nomatch     
setopt prompt_subst        # Enable prompt substition

# setopt glob_subst          # global substitution
setopt auto_pushd          # cd foo == pushd foo
setopt pushd_ignore_dups   # no duplicates in the list
setopt pushdminus
setopt auto_name_dirs      # foo=/path/to/foo is the same as
                           # hash -d foo=/path/to/foo

# Misc
setopt interactivecomments # $ # foo doesn't become an error when hitting
                           # enter

setopt bg_nice	             # nice bg commands
setopt notify              # notify when a command returns exit code

ZSH_AUTOSUGGEST_STRATEGY=(completion history)
# Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' switch-group ',' '.'



# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.

if [[ -z "$RECORDING" ]]; then
     [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

fi


