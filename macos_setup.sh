#!/bin/zsh

# macOS Development Environment Setup Script
#
# This script automates the setup of a complete development environment on a
# fresh macOS installation. It is designed to be idempotent, meaning it can
# be run multiple times without causing issues.
#
# Author: Matthew Essenburg (as per user request)

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Helper Functions for User Feedback ---
# Using colors for better readability
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

info() {
  printf "\n${BLUE}%s${NC}\n" "$1"
}

success() {
  printf "${GREEN}%s${NC}\n" "$1"
}

# --- Step 1: Install Xcode Command Line Tools ---
info "Step 1: Checking for Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
  info "Xcode Command Line Tools not found. Prompting for installation..."
  # This will open a GUI installer. The script will pause until it's finished.
  xcode-select --install
  
  # Wait until the Xcode Command Line Tools are installed
  read -p "Press [Enter] key after Xcode Command Line Tools installation is complete..."
  success "Xcode Command Line Tools installed."
else
  success "Xcode Command Line Tools are already installed."
fi

# --- Step 2: Install Homebrew ---
info "Step 2: Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
  info "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to the PATH in .zshrc
  # This is for Apple Silicon, but the 'brew shellenv' command is architecture-aware.
  info "Adding Homebrew to your PATH in ~/.zshrc"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
  success "Homebrew installed and configured."
else
  success "Homebrew is already installed."
fi
# Update Homebrew and recipes
info "Updating Homebrew..."
brew update

# --- Step 3: Install Core CLI Tools & Runtimes ---
info "Step 3: Installing Core CLI tools and runtimes with Homebrew..."
PACKAGES=(
  git
  the_silver_searcher # ag
  node
  nvm
  openjdk             # Java runtime
  gh                  # GitHub CLI
)

for package in "${PACKAGES[@]}"; do
  if ! brew list "$package" &>/dev/null; then
    info "Installing $package..."
    brew install "$package"
    success "$package installed."
  else
    success "$package is already installed."
  fi
done

# --- Step 4: Install GUI Applications with Homebrew Cask ---
info "Step 4: Installing GUI applications with Homebrew Cask..."
CASKS=(
  visual-studio-code
  intellij-idea-ultimate
)

for cask in "${CASKS[@]}"; do
  if ! brew list --cask "$cask" &>/dev/null; then
    info "Installing $cask..."
    brew install --cask "$cask"
    success "$cask installed."
  else
    success "$cask is already installed."
  fi
done

# --- Step 5: Set Up Oh My Zsh ---
info "Step 5: Setting up Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Installing Oh My Zsh..."
  # The installer will back up an existing .zshrc
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  success "Oh My Zsh installed."
else
  success "Oh My Zsh is already installed."
fi

info "Setting Zsh theme to 'agnoster'..."
# Use sed to replace the theme line in .zshrc
# This command is idempotent.
sed -i '' 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/' ~/.zshrc
success "Zsh theme set to 'agnoster'."

# --- Step 6: Configure Git ---
info "Step 6: Configuring Git..."
git config --global user.name "Matthew Essenburg"
git config --global user.email "matthew@essenburg.com"
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.co checkout
git config --global credential.helper cache
success "Git has been configured with your details and aliases."

# --- Step 7: Finalize ---
info "🚀 All done! Your macOS development environment is ready."
success "Summary of actions taken:"
echo "✅ Verified/Installed Xcode Command Line Tools"
echo "✅ Verified/Installed Homebrew"
echo "✅ Installed core tools (git, ag, node, nvm, openjdk, gh)"
echo "✅ Installed GUI apps (VS Code, IntelliJ Ultimate)"
echo "✅ Installed and configured Oh My Zsh with 'agnoster' theme"
echo "✅ Configured global Git settings"
info "👉 Please restart your terminal or run 'source ~/.zshrc' to apply all changes."
