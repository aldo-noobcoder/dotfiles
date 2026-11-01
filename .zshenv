setopt no_global_rcs
export LANG=en_US.UTF-8
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/cargo/bin:$PATH
export PATH=$HOME/.local/share/npm/bin:$PATH

export MANPAGER="most"
export MICRO_TRUECOLOR=1
export VISUAL="micro"
export EDITOR="micro"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Android
export ANDROID_USER_HOME=$XDG_DATA_HOME/android
alias adb='HOME="$XDG_DATA_HOME"/android adb'
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_AVD_HOME=$XDG_DATA_HOME/android/avd

export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# CUDA
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# Dotnet
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"
# GnuPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# GTK2
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# Icons
export XCURSOR_PATH="/usr/share/icons:$XDG_DATA_HOME/icons"

# NuGet
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"

# Java
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# w3m
export W3M_DIR="$XDG_DATA_HOME/w3m"

# zsh history
export HISTFILE="$XDG_STATE_HOME/zsh/history"


export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"



# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"

export npm_config_store_dir="$XDG_DATA_HOME/pnpm/store"
export npm_config_cache="$XDG_CACHE_HOME/pnpm"
export npm_config_state_dir="$XDG_STATE_HOME/pnpm"
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
#go

export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$GOPATH/bin"
