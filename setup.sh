#!/usr/bin/env bash

set -euo pipefail

GITHUB_USER="maualvm"
REPO_NAME="dotfiles"
DOTFILES_DIR="$HOME/$REPO_NAME"
DOTFILES_HTTP_REPO="https://github.com/$GITHUB_USER/$REPO_NAME.git"
DOTFILES_SSH_REPO="git@github.com:$GITHUB_USER/$REPO_NAME.git"

###############################################################################
# Verify Xcode Command Line Tools
###############################################################################

if ! xcode-select -p >/dev/null 2>&1; then
    echo "Xcode Command Line Tools are not installed."
    echo ""
    echo "Please run:"
    echo "  xcode-select --install"
    echo ""
    echo "After the installation completes, run this script again."
    exit 1
fi

echo "Setting up machine..."

###############################################################################
# Install Homebrew
###############################################################################

if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."

    /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add Homebrew to PATH for this shell
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

###############################################################################
# Clone dotfiles
###############################################################################

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning $REPO_NAME..."
    git clone "$DOTFILES_HTTP_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles already cloned at $DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

###############################################################################
# Install Homebrew packages from Brewfile
###############################################################################

echo
echo "Installing Brewfile packages..."
brew bundle

###############################################################################
# Git configuration
###############################################################################

echo "Setting up git..."

if ! git config --global user.name >/dev/null 2>&1; then
  echo
  read -rp "Git name: " GIT_NAME
  git config --global user.name "$GIT_NAME"
fi

if ! git config --global user.email >/dev/null 2>&1; then
  echo
  read -rp "Git email: " GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
fi

git config --global core.editor nvim
git config --global init.defaultBranch main

###############################################################################
# Symlink dotfiles using stow
###############################################################################

echo
echo "Creating symlinks..."
stow .

###############################################################################
# Generate SSH key
###############################################################################

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    echo
    echo "Generating SSH key..."

    mkdir -p "$HOME/.ssh"

    ssh-keygen \
        -t ed25519 \
        -C "$(git config --global user.email)" \
        -f "$HOME/.ssh/id_ed25519" \
        -N ""

    echo
    echo "=========================================="
    echo "Copy the following public key into GitHub:"
    echo
    cat "$HOME/.ssh/id_ed25519.pub"
    echo
    echo "https://github.com/settings/keys"
    echo "=========================================="
    echo

    read -rp "Press Enter after adding the key to GitHub..." REPLY

    git remote set-url origin "$DOTFILES_SSH_REPO"

    echo "Switched repository remote to SSH."
fi

###############################################################################
# Configure Git commit signing
###############################################################################

git config --global gpg.format ssh
git config --global user.signingkey "$HOME/.ssh/id_ed25519.pub"
git config --global commit.gpgsign true

echo
echo "Machine setup complete!"
echo
echo "Please restart your terminal session to apply your new shell configuration"
echo "Alternatively, run:"
echo "source ~/.zshrc"
