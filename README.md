# macOS Setup

Last updated: 2026-06-24

## 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## 2. Install everything from Brewfile

```bash
brew bundle --file=Brewfile
```

## 3. Terminal setup

```bash
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >>! ~/.zshrc
ssh-keygen -t ed25519 -C "ayrusme@gmail.com"
```

[Node Version Manager](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)

## 4. macOS defaults

```bash
# Disable "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable reordering Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Keyboard: fast repeat
defaults write -g InitialKeyRepeat -int 10   # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1            # normal minimum is 2 (30 ms)

# Mouse speed
defaults write -g com.apple.mouse.scaling -float 3.0

# Quit Finder using Cmd-Q
defaults write com.apple.finder QuitMenuItem -bool true

# Battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent YES

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable smart dashes, smart quotes, and auto-period (interferes with code)
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable file extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Keep windows when quitting apps (disables "Close windows when quitting an application")
defaults write -g NSQuitAlwaysKeepsWindows -bool true

# Finder: list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Screenshots: save as PNG to Desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"

# Hide Spotlight menu bar icon
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

killall SystemUIServer Dock Finder 2>/dev/null || true
```

## 5. Amethyst — custom layouts

Amethyst uses four layouts: `tall`, `bsp`, `four-corners`, and `center-focus`.

The last two are custom JS layouts from [bryanculver's gist](https://gist.github.com/bryanculver/4c181881cca81d9963f49a77dd5ac127). Preview: [blog post](https://www.bryanculver.com/2024/11/22/amethyst-layouts.html).

### Install custom layouts

```bash
cp amethyst/four-corners.js ~/Library/Application\ Support/Amethyst/Layouts/
cp amethyst/center-focus.js ~/Library/Application\ Support/Amethyst/Layouts/
```

### Set layout order

```bash
defaults write com.amethyst.Amethyst layouts -array tall bsp four-corners center-focus
```

### Other Amethyst settings

```bash
defaults write com.amethyst.Amethyst float-small-windows -bool true
defaults write com.amethyst.Amethyst floating-is-blacklist -bool true
defaults write com.amethyst.Amethyst follow-space-thrown-windows -bool true
defaults write com.amethyst.Amethyst enables-layout-hud -bool true
defaults write com.amethyst.Amethyst enables-layout-hud-on-space-change -bool true
```

## 6. DNS (Cloudflare)

```bash
networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001
```

## 7. Git config

```bash
git config --global user.name "Surya Raman"
git config --global user.email "ayrusme@gmail.com"

# Quality-of-life
git config --global push.default current
git config --global push.followTags true
git config --global fetch.prune true
git config --global fetch.pruneTags true
git config --global fetch.all true
git config --global rebase.autostash true
git config --global help.autocorrect 1
git config --global branch.autosetupmerge always

# Transparently use SSH for GitHub (no more wrong clone URLs)
git config --global url."git@github.com:".insteadOf "https://github.com/"

# Useful aliases
git config --global alias.st "status -sb"
git config --global alias.lola "log --graph --decorate --oneline --all"
git config --global alias.amend "commit --amend --no-edit"
git config --global alias.po "push origin -u"

# Global gitignore
git config --global core.excludesfile ~/.gitignore_global
```

Create `~/.gitignore_global`:

```bash
cat > ~/.gitignore_global << 'EOF'
.DS_Store
._*
.Spotlight-V100
.Trashes
.env
.env.local
*.swp
*~
EOF
```

## 8. Python

```bash
pip3 install pipenv
```

## 9. Touch ID for sudo

```bash
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
```

## 10. Shell environment (.zshrc additions)

```bash
# Claude Code output token limit
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000

# uv (Python package manager)
. "$HOME/.local/bin/env"

# cdpath — `cd myrepo` works from anywhere
cdpath=(~ ~/Documents/repositories ~/Documents/repositories/notes)

# History prefix search — type partial command, arrow up to find matches
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search   # Up arrow
bindkey "^[[B" down-line-or-beginning-search  # Down arrow

# Auto-ls on directory change
chpwd() { ls -l }

# compinit with 24h cache (faster shell startup)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Source extra config fragments from ~/.zshrc.d/ (for machine-specific overrides)
if [[ -d ~/.zshrc.d ]]; then
  for _rcfile in ~/.zshrc.d/*(N); do source "$_rcfile"; done
  unset _rcfile
fi
```

## 11. Manual installs

- [Clipy](https://github.com/Clipy/Clipy) — clipboard manager
- [Livebook](https://livebook.dev/) — Elixir notebooks
- [CurrentKey Stats](https://apps.apple.com/us/app/currentkey-stats/id1456226992?mt=12) — keyboard stats

## Disable sleep (clamshell mode)

```bash
sudo pmset disablesleep 1
```
