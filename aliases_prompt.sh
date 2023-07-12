# Custom alias
alias c='clear && clear'
# Git alias
alias ga='git add'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gcp='f(){ git commit -m "$1"; git push; unset -f f; }; f'
alias delcommit='git reset --hard HEAD~1 && git push origin HEAD --force'
alias gaa='f(){ git add .; git commit -m "$1"; git push; unset -f f; }; f'
alias del_branch='f(){ git branch -d "$1" && git push origin --delete "$1"; unset -f f; }; f'
alias rm_branch="git fetch -p && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch"
alias rename_branch='f(){ git branch -m "$1" "$2" && git push origin --delete "$1"; unset -f f; }; f'
alias rename_branch='f(){ git branch -m "$1" "$2" && git push origin --delete "$1" && git push origin HEAD; unset -f f; }; f'

# Git users
alias show_git_user='git config --get user.email && git config --get user.name'
alias personal_git="git config --global user.name "sergioarg" && git config --global user.email sergio_ramos53@yahoo.com && show_git_user"

# Virtual Env Python3
alias create_venv='python3 -m venv venv'
alias start_venv='source venv/bin/activate'

# Quick modification of bashrc file
alias ebashrc='code ~/.bashrc'
alias ubashrc='source ~/.bashrc'
# Folder aliases
alias fr='export FLASK_APP=app && export FLASK_ENV=development && flask run'

# tmux config
export TERM=xterm-256color
Green="\[\033[01;32m\]"
Blue="\[\033[01;34m\]"
Red="\[\033[01;31m\]"
Reset="\[\033[;00m\]"
Cyan="\[\033[01;36m\]"
Yellow="\e[93m"

# Functions
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/⟶ \1/'
}

ExitStatus()
{
    if [[ $? == 0 ]]; then
        echo "$Cyan"
    else
        echo "$Red"
    fi
}

PS1="${Green}┌(${Blue}Sergio${Green})-[${Green}\W${Green}]${Reset} \$(parse_git_branch)${Green}\n└$(ExitStatus)\$ ${Reset}"

# init virtuel event
function startvenv(){
    source "$(find ${1-.} -path '*/bin/activate')" 2>/dev/null || { echo 'bin/acivate not found in a subdirectory'; return 1; }
}

function copy-wpwd(){
    echo -n "//wsl$/Ubuntu$PWD" | tr '/' \\\\ | clip.exe
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PYTHONBREAKPOINT=ipdb.set_trace
