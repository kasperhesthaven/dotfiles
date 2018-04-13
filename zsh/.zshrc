ZSH=$HOME/.oh-my-zsh


# =============================================================================
# Initialization
# =============================================================================

# Reset to use Pure
ZSH_THEME=""

COMPLETION_WAITING_DOTS="true"

plugins=(
  git yarn npm zsh-syntax-highlighting vscode
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Pure - Pretty, minimal and fast ZSH prompt
autoload -U promptinit; promptinit
prompt pure


# =============================================================================
# Homebrew
# =============================================================================

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1


# =============================================================================
# Aliases
# =============================================================================

# Simpler navigation
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Typos
alias brwe=brew
alias yran=yarn

# Shortcuts
alias g="git"
alias dl="cd ~/Downloads"

# Volume
alias mute="osascript -e 'set volume output muted true'"
