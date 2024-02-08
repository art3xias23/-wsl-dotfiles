
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export PATH=$PATH:/usr/local/go/bin
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


#JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

# Get git branch autocomplete
autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh
source ~/.nvm/nvm.sh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"
# User configuration
PROMPT='%B%{$fg_bold[green]%}➜ %F{cyan}%1/%f%b %{$reset_color%}'
#Path to luarocks
export PATH="$HOME/.luarocks/bin:$PATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

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
alias msbuild='msbuild.exe'

#dotnet
alias dotnet='dotnet.exe'

#Nuget
alias nuget='nuget.exe'

# Setting PATH for Python 3.10
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

#Use openai command line tool
export PATH=$PATH:/home/tino/.local/bin
export PATH="$PATH:/home/tino/.local/lib/python3.9/site-packages/openai"

#Use sqlcmd
export PATH="$PATH:/opt/mssql-tools/bin"

alias pip=pip3
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

set shell=/bin/zsh

#Exercism
alias es='exercism.exe submit'
alias exercism='exercism.exe'

#Functions
function psql
{
 
    # -E                        use integrated authentication
    # -S $1						first arg Server 
	# -d $2 					second args Database
	# --row-limit				
	# -Q "SET NOCOUNT ON; $3"	Query, don't print rows affected, third arg is query
    
    sqlcmd -E -S "$1" -d "$2" -Q "$3";
}

#Set upstream branch
function  gsetu 
{
	echo "Hello\n"
	 local current_branch=$(gcb)
	  echo "Current branch: $current_branch\n"
	 local upstream_branch="origin/$current_branch"
	  echo "upstream branch: $upstream_branch\n"
	 git branch --set-upstream-to="$upstream_branch" "$current_branch"
}

# Below command will help wsl2 use the windows graphics in order to run GUIs
export DISPLAY="$(ip route list exact default | awk '{print $3}'):0"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 




