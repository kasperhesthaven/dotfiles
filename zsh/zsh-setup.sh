#!/usr/bin/env bash
# ~/zsh-setup.sh — For a configured Oh My Zsh setup

# =============================================================================
# Installation
# =============================================================================

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# =============================================================================
# Customization
# =============================================================================

# Plugins
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi
cd "$CURRENT_DIR"

ZSH_VSCODE_DIR="$HOME/.oh-my-zsh/custom/plugins/vscode"
mkdir "$ZSH_VSCODE_DIR" && cd "$ZSH_VSCODE_DIR"
if [ -d "$ZSH_VSCODE_DIR" ]; then
	echo "Installing zsh plugin 'vscode'..."
	curl -O https://raw.githubusercontent.com/kasperhesthaven/vscode/master/vscode.plugin.zsh
fi
