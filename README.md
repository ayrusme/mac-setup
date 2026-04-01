# macOS Setup

Last updated: 2026-04-01

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
ssh-keygen -t ecdsa -b 521
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
killall SystemUIServer
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
```

## 11. Manual installs

- [Clipy](https://github.com/Clipy/Clipy) — clipboard manager
- [Livebook](https://livebook.dev/) — Elixir notebooks
- [CurrentKey Stats](https://apps.apple.com/us/app/currentkey-stats/id1456226992?mt=12) — keyboard stats

## Disable sleep (clamshell mode)

```bash
sudo pmset disablesleep 1
```
