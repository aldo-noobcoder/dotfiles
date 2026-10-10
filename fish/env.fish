# fzf
set -Ux FZF_DEFAULT_OPTS "
    --prompt="⌕	"
    --color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# env
set -x VISUAL micro
set -x EDITOR micro

# XDG base dirs
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

set -gx ANDROID_USER_HOME "$XDG_DATA_HOME/android"
set -gx  ANDROID_AVD_HOME "$XDG_DATA_HOME/android/avd"
# cargo
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"

# cuda
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"

# docker
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

# dotnet
set -gx DOTNET_CLI_HOME "$XDG_DATA_HOME/dotnet"

# gnupg
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"

# go
set -gx GOPATH "$XDG_DATA_HOME/go"

# gtk2
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# icons
set -gx XCURSOR_PATH "/usr/share/icons:$XDG_DATA_HOME/icons"

# libice
set -gx ICEAUTHORITY "$XDG_CACHE_HOME/ICEauthority"

# minetest
set -gx MINETEST_USER_PATH "$XDG_DATA_HOME/minetest"

# node repl
set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME/node_repl_history"

# nuget
set -gx NUGET_PACKAGES "$XDG_CACHE_HOME/NuGetPackages"

# java
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# w3m
set -gx W3M_DIR "$XDG_DATA_HOME/w3m"

# wine
set -gx WINEPREFIX "$XDG_DATA_HOME/wine"

set -gx ZDOTDIR "$HOME/.config/zsh"

# wget
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# nvidia settings
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME/nvidia/settings"'

#bash

set -gx  HISTFILE "$XDG_STATE_HOME/bash/history"

set -gx  GOPATH "$XDG_DATA_HOME"/go

set -gx XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"

set -gx XINITR "$XDG_CONFIG_HOME/X11/xinitrc"

set -gx  SSB_HOME "$XDG_DATA_HOME"/zoom

set sponge_allow_previously_successful false
set sponge_successful_exit_codes 0 127


# expo
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx ANDROID_HOME $XDG_DATA_HOME/android/sdk

# pnpm
set -gx PNPM_HOME '/home/jsisthebest/.local/share/pnpm'
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end
