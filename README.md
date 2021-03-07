# MacOS setup script


## homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## terminal stuff

```
chsh -s /bin/zsh

brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```

## homebrew formulae

```
brew cask install google-chrome
brew install python
brew tap mongodb/brew
brew install mongodb-community
brew cask install visual-studio-code
brew cask install intellij-idea-ce

brew services start mongodb-community

brew install mysql
brew services start mysql
brew cask install mysqlworkbench
brew cask install robo-3t

brew cask install java

brew cask install postman

brew install jupyter

brew cask install docker

brew cask install android-platform-tools
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
