source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export GPG_TTY=$(tty)
export PIPENV_SHELL=/bin/zsh

# misc 

alias batt='adb shell dumpsys battery | grep level'

notify () {
    arg=$1
    content=${arg:-task was done}
    # curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$content\"}" SLACK_WEBHOOK_URL_HERE
    osascript -e "display notification \"Complete\" with title \"$content\""
}

setalarm() {
    sleep $(echo "$1 * 60" | bc)
    say "The clocks run out, times up, over, blaow"
}
mkcd() { mkdir -p "$1" && cd "$1"; }

# git

gitconfig() {
    git config user.name "Surya Raman" && git config user.email "ayrusme@gmail.com"  && git config user.signingkey 3A650300C9A64663
}
alias curbn='git branch --show-current | pbcopy'
pstag() {
    local branch_name=$(git branch --show-current)
    command git checkout staging
    command git pull
    command git pull
    command git merge ${branch_name}
}

# nginx 

alias nrl='nginx -s reload'

# k8s stuff
alias k=kubectl
kexp() {
    local service_name=$1
    echo "going to exec into $service_name"
    local pod_name=$(kubectl get pods | grep $service_name | awk '{print($1)}' | head -n 1)
    echo "pod name is $pod_name"
    kubectl exec -it $pod_name -- /bin/bash
}
export KUBE_EDITOR='code --wait'
