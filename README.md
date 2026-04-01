# macOS Setup Script

Last updated: 2026-04-01

## Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Terminal

```bash
chsh -s /bin/zsh
brew install --cask iterm2
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >>! ~/.zshrc

ssh-keygen -t ecdsa -b 521
```

## Homebrew Casks (GUI Apps)

```bash
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask cursor
brew install --cask obsidian
brew install --cask docker-desktop
brew install --cask amethyst
brew install --cask cloudflare-warp
brew install --cask logi-options+
brew install --cask meetingbar
brew install --cask mysqlworkbench
brew install --cask mysql-shell
brew install --cask postman
brew install --cask robo-3t
brew install --cask java
brew install --cask arc
brew install --cask stats
brew install --cask claude-code
brew install --cask blackhole-2ch
```

[Clipy](https://github.com/Clipy/Clipy) — clipboard manager (download from GitHub releases)

## Homebrew Formulae

### Languages & Runtimes

```bash
brew install python
brew install node
brew install asdf
brew install elixir
```

[Node Version Manager](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)

### CLI Tools

```bash
brew install gh
brew install jq
brew install fzf
brew install shellcheck
brew install defaultbrowser
brew install ical-buddy
brew install pandoc
brew install gnupg
brew install jupyter
brew install --cask android-platform-tools
brew install scrcpy
```

### DevOps & Containers

```bash
brew install kubectl
brew install kubectx
brew install helm
brew install minikube
brew install stern
```

### Databases

```bash
brew tap mongodb/brew
brew install mongodb-community
brew install mysql
brew install postgresql@14
```

### AI & ML

```bash
brew install ollama
brew install whisper-cpp
brew install sox
brew install gemini-cli
```

## UI Tweaks

### Disable "Are you sure you want to open this application?" dialog

```bash
defaults write com.apple.LaunchServices LSQuarantine -bool false
```

### Disable reordering Spaces based on most recent use

```bash
defaults write com.apple.dock mru-spaces -bool false
```

### Keyboard, trackpad, mouse

```bash
defaults write -g InitialKeyRepeat -int 10   # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1            # normal minimum is 2 (30 ms)
defaults write -g com.apple.mouse.scaling -float 3.0
```

### Quit Finder using Cmd-Q

```bash
defaults write com.apple.finder QuitMenuItem -bool true
```

### Battery percentage in menu bar

```bash
defaults write com.apple.menuextra.battery ShowPercent YES
killall SystemUIServer
```

## DNS (Cloudflare)

```bash
networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001
```

## Git Config

```bash
git config --global user.name "Surya Raman"
git config --global user.email "ayrusme@gmail.com"
```

## Python

```bash
pip3 install pipenv
```

## Touch ID for sudo

```bash
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
```

## Shell Environment (.zshrc additions)

```bash
# Claude Code output token limit
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000

# uv (Python package manager)
. "$HOME/.local/bin/env"
```

## Livebook (Elixir notebooks)

Download from [livebook.dev](https://livebook.dev/)
