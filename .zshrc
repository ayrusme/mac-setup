source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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
gitconfig() { git config user.name "Surya Raman" && git config user.email "ayrusme@gmail.com" }
alias curbn='git branch --show-current | pbcopy'
pstag() {
    local branch_name=$(git branch --show-current)
    command git checkout staging
    command git pull
    command git pull
    command git merge ${branch_name}
}
alias nrl='nginx -s reload'
