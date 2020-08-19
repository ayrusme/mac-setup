source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export GPG_TTY=$(tty)
export PIPENV_SHELL=/bin/zsh

alias batt='adb shell dumpsys battery | grep level'

notify () {
arg=$1
content=${arg:-task was done}
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$content\"}" HOOK_URL_HERE
}

setalarm() {
    sleep $(echo "$1 * 60" | bc)
    say "The clocks run out, times up, over, blaow"
}

mkcd() { mkdir -p "$1" && cd "$1"; }
