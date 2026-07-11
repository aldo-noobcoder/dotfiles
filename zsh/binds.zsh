bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^I^I' autosuggest-accept
bindkey "^H" backward-delete-word
# Bind Ctrl+Left and Ctrl+Right to move by word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
