# MacOS setup script


## homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## homebrew formulae

```
brew cask install google-chrome
brew cask install visual-studio-code
brew install python
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb-community

brew install mysql
brew services start mysql
brew cask install mysqlworkbench

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