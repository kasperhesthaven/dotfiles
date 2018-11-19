#!/usr/bin/env bash
# ~/brew.sh — Based on mathiasbynens, paulirish & alrra's dotfiles


# =============================================================================
# Initialization
# =============================================================================

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade


# =============================================================================
# Core
# =============================================================================

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Change default shell to zsh.
chsh -s /bin/zsh

# Install `wget` with IRI support.
brew install wget --with-iri

# Install development specific
brew install python3
brew install node
brew install yarn

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra


# =============================================================================
# MacOS tools
# =============================================================================

brew install grep
brew install openssh
brew install vim --override-system-vi


# =============================================================================
# CTF tools
# See https://github.com/ctfs/write-ups
# =============================================================================

brew install binwalk
brew install nmap
brew install tcptrace

# =============================================================================
# Various binaries
# =============================================================================

brew install ack
brew install brotli
brew install git
brew install git-extras
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install openssl
brew install p7zip
brew install pigz
brew install rename
brew install tree
brew install zopfli
brew install zsh-completions


# =============================================================================
# Homebrew cask
# =============================================================================

# Installation & maintenance
brew tap caskroom/cask && brew cleanup && brew cask cleanup

# Core casks
brew cask install --appdir="/Applications" --require-sha alfred
brew cask install --appdir="/Applications" --require-sha iterm2

# Development tool casks
brew cask install --appdir="/Applications" --require-sha sublime-text
brew cask install --appdir="/Applications" --require-sha visual-studio-code
brew cask install --appdir="/Applications" --require-sha github

# Browser casks
brew cask install --appdir="/Applications" --require-sha firefox
brew cask install --appdir="/Applications" --require-sha google-chrome

# Misc casks
brew cask install --appdir="/Applications" --require-sha filezilla
brew cask install --appdir="/Applications" --require-sha sketch
brew cask install --appdir="/Applications" --require-sha vlc
brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" resilio-sync
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" AppCleaner

# Workflow
brew cask install --appdir="/Applications" --require-sha caffeine
brew cask install --appdir="/Applications" --require-sha cold-turkey-blocker
brew cask install --appdir="/Applications" --require-sha timing
brew cask install --appdir="/Applications" --require-sha cheatsheet
brew cask install --appdir="/Applications" --require-sha macpass
brew cask install --appdir="/Applications" vanilla

# Fonts
brew tap caskroom/fonts
brew cask install font-fira-code

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
