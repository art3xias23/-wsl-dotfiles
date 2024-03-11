#!/bin/sh

 #MongoDb
 alias mngl='mongosh --host 172.28.224.1 --port 27017'

 #Golang
 alias wgo='wgo.exe'
 alias gt='go test'
 alias grun='go run'
 alias tr='templ generate && go run .'

 #Misc
alias open='explorer.exe'
alias templ='templ.exe'
alias ll='ls -l'
alias ll='ls -la'
alias ezsh="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias start='cmd.exe /C start'
alias clip="clip.exe"
alias grep='grep --color=always'
#Directories

alias luadir="cd /mnt/c/Users/kmilchev/Exercism/lua"
alias homedir="cd ~/" 
alias ndir="cd ~/.config/nvim" 
alias workdir="cd /mnt/c/Users/kmilchev/source/repos/AgePartnership"
alias cld="cd /mnt/c/Users/kmilchev/Exercism/common-lisp/"
alias pcld="cd /mnt/c/Users/kmilchev/Desktop/Tino/Code/Lisp/CommonLisp/Practical_Common_Lisp/"
alias codedir="cd /mnt/c/Users/kmilchev/Desktop/Code/"
alias hx="cd /mnt/c/Users/kmilchev/Desktop/Tino/Code/Web/htmx-playground"
alias ggo="cd /mnt/c/Users/kmilchev/Desktop/Tino/Code/go/"

#Nvim
alias env='nvim ~/.config/nvim/init.lua'
alias snv='source ~/.config/nvim/init.lua'
alias e='nvim'
alias vim='nvim'
alias v='nvim'

#SBCL
alias nsb="rlwrap sbcl --load ~/.config/nvim/plugged/vlime/lisp/start-vlime.lisp"

#WSL
alias wsl="wsl.exe"

#Random
alias cl='clear'
#Git

alias git="git.exe"
alias ga='git add'
alias gcp='git cherry-pick'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gpull='git pull'
alias gpush='git push'
alias ipush='git push --set-upstream origin $(../branch.sh "$(git push 2>&1)")'
alias gfo='git fetch origin'
alias gs='git status'
alias gr='git reset'
alias gl='git log'
alias gwl='git worktree list'
alias gap='git add -p'
alias gac='git add . && git commit -m'
alias gcmer='git branch --sort=-committerdate | head -10'
alias gcb='git rev-parse --abbrev-ref HEAD'
alias gmd='git fetch origin development:development && git merge development'
alias gmm='git fetch origin master:master && git merge master'
alias lua='lua54.exe'

#MSBuild
alias msbuildw='msbuild.exe'

#Nuget
alias nugetw="nuget.exe"

#dotnet
alias dotnetw='dotnet.exe'

alias pip=pip3
alias python=python3
#alias mssql-cli='python3 -m /home/tino/.local/lib/python3.9/site-packages/mssqlcli/main'

#NPM
alias nis='npm install --save'
alias ni='npm install'
alias ns='npm start'

#gum
alias gul='gum list'
alias gu='gum use'
alias guw='gum use Work'
alias gup='gum use Play'
alias gdel='gum delete'

#Exercism
alias es='exercism.exe submit'
alias exercism='exercism.exe'
