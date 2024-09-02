# Check if running in zsh, otherwise exit
if [ -n "$ZSH_VERSION" ]; then
    autoload -Uz compinit
    compinit

    setopt HIST_IGNORE_ALL_DUPS

    # Zsh-specific configurations
    # Zsh plugins
    if [ -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]; then
        source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
        autoload -Uz _zinit
        (( ${+_comps} )) && _comps[zinit]=_zinit

        # Load Zinit annexes
        zinit light-mode for \
            zdharma-continuum/zinit-annex-as-monitor \
            zdharma-continuum/zinit-annex-bin-gem-node \
            zdharma-continuum/zinit-annex-patch-dl \
            zdharma-continuum/zinit-annex-rust

        # Zsh plugins
        zinit light zsh-users/zsh-autosuggestions
        zinit light zsh-users/zsh-history-substring-search
        zinit light zsh-users/zsh-syntax-highlighting
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down
        zstyle ':completion:*' menu yes select
    fi
else
    # If not running in zsh, provide a warning
    echo "Warning: This configuration is designed for zsh. Some features may not work in bash."
fi

# Common configurations for both bash and zsh

# Devbox
DEVBOX_NO_PROMPT=true
if command -v devbox &> /dev/null; then
    eval "$(devbox global shellenv --init-hook)"
fi

# Git
LANG=en_US.UTF-8

# Completions
if command -v devbox &> /dev/null; then
    source <(devbox completion zsh)
fi
if command -v docker &> /dev/null; then
    source <(docker completion zsh)
fi
if command -v kubectl &> /dev/null; then
    source <(kubectl completion zsh)
fi

# Starship
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# The Fuck
if command -v thefuck &> /dev/null; then
    eval $(thefuck --alias)
fi

# Zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# Aliases
if command -v eza &> /dev/null; then
    alias ls='eza --long --all --no-permissions --no-filesize --no-user --no-time --git'
    alias lst='eza --long --all --no-permissions --no-filesize --no-user --git --sort modified'
fi
if command -v fzf &> /dev/null && command -v bat &> /dev/null; then
    alias fzfp='fzf --preview "bat --style numbers --color always {}"'
fi
if command -v bat &> /dev/null; then
    alias cat='bat --paging never --theme DarkNeon --style plain'
fi

# Path modifications
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"