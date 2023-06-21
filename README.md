# MacOS setup script


## homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## terminal stuff

```
chsh -s /bin/zsh

brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >>! ~/.zshrc
```

## homebrew formulae

```
brew install --cask google-chrome
brew install python
brew tap mongodb/brew
brew install mongodb-community
brew install --cask visual-studio-code
brew install --cask intellij-idea-ce

brew services start mongodb-community

brew install mysql
brew services start mysql
brew install --cask mysqlworkbench
brew install --cask mysql-shell
brew install --cask robo-3t

brew install --cask java

brew install --cask postman

brew install jupyter

brew install --cask docker
brew install kubectl
brew install kubectx
brew install fzf
brew install helm
brew install minikube

brew install --cask android-platform-tools
brew install scrcpy
```

## UI Tweaks

### Disable the “Are you sure you want to open this application?” dialog
```
defaults write com.apple.LaunchServices LSQuarantine -bool false
```

### keyboard and menu bar

```
defaults write com.apple.menuextra.battery ShowPercent YES
killall SystemUIServer

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

### Quit finder using cmd-q
```
defaults write com.apple.finder QuitMenuItem -bool true
```

### git config

```
git config user.name “Surya Raman”
git config user.email “ayrusme@gmail.com”
```

### pipenv 
```
pip3 install  pipenv
```

### touch id for sudo
```
https://apple.stackexchange.com/a/306324
```
