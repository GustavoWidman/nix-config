# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# ZSH_THEME="powerlevel10k/powerlevel10k"
export USER_COLOR="green"
ZSH_THEME="r3dlust"

zstyle ':omz:update' mode auto      # update automatically without asking

# ENABLE_CORRECTION="true"

# Fix for nvm slowing down zsh load by about 200ms
# zstyle ':omz:plugins:nvm' lazy yes

plugins=(git virtualenv themes) # zsh-autosuggestions is added in default.nix

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
# alias code="code-insiders"
# alias grun="go run"
alias cat="bat --style plain,header-filesize,header-filename,grid"

# $HOME that works for root and non-root, referring to the same place (get the $HOME of the first non-root user) uses awk from the "users" command
# TRUE_HOME=$(grep -m1 '/home/' /etc/passwd | cut -d: -f6)

# Bun Completions
# [ -s "$TRUE_HOME/.bun/_bun" ] && source "$TRUE_HOME/.bun/_bun"

# Bun
# export BUN_INSTALL="$TRUE_HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$TRUE_HOME/.local/bin:$PATH"

# Rust
# . "$HOME/.cargo/env"

# FZF
# eval "$(fzf --zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsheval "$($TRUE_HOME/.local/bin/mise activate zsh)"

# eval "$($TRUE_HOME/.local/bin/mise activate zsh)"