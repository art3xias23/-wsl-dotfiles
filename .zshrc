# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="eastwood"

# Uncomment the following line to disable colors in ls.
 DISABLE_LS_COLORS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

GITSTATUS_LOG_LEVEL=DEBUG

source $ZSH/oh-my-zsh.sh
source ~/.nvm/nvm.sh


# User configuration
# Advanced `vcs` color customization
POWERLEVEL10K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL10K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL10K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL10K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL10K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL10K_VCS_MODIFIED_BACKGROUND='black'
#Path to luarocks
export PATH="$HOME/.luarocks/bin:$PATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

#Explorer
alias open='explorer.exe'
alias ll='ls -l'
alias zsh="nvim ~/.zshrc"
alias zshc="source ~/.zshrc"
alias start='cmd.exe /C start'
alias clip="clip.exe"
alias cml="cd /mnt/c/Users/kmilchev/Exercism/common-lisp/"

#Directories

alias luaplay="cd /mnt/c/Users/kmilchev/Exercism/lua"
alias home="cd ~/" 
alias main="cd /mnt/c/Users/kmilchev/source/repos/AgePartnership"

#Nvim
alias nvi='nvim ~/.config/nvim/init.lua'
alias nv='nvim'

#SBCL
alias nsb="rlwrap sbcl --load ~/.config/nvim/plugged/nvlime/lisp/start-nvlime.lisp"

#WSL
alias wsl="wsl.exe"

#P10K Logs
alias pklog='less $GITSTATUS_DAEMON_LOG_POWERLEVEL9K'
alias pkconf='nvim ~/.p10k.zsh'
alias pkc='source ~/.p10k.zsh'
#Git

alias git="git.exe"
alias ga='git add'
alias gcp='git cherry-pick'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gpull='git pull'
alias gpush='git push'
alias gfo='git fetch origin'
alias gs='git status'
alias gl='git log'
alias gwl='git worktree list'
alias gap='git add -p'
alias gcmer='git branch --sort=-committerdate | head -10'
alias lua='lua54.exe'

#MSBuild
alias msbuild='msbuild.exe'

#Nuget
alias nuget='nuget.exe'

#Random
alias refreshbash='. ~kmilchev/.bashrc'

# Setting PATH for Python 3.10
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

#Use openai command line tool
export PATH=$PATH:/home/tino/.local/bin
export PATH="$PATH:/home/tino/.local/lib/python3.9/site-packages/openai"

alias pip=pip3
alias mssql-cli='python3 -m mssqlcli.main'

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

#Functions
function msql
{
 
    # -E                        use integrated authentication
    # -S $1						first arg Server 
	# -d $2 					second args Database
	# --row-limit				
	# -Q "SET NOCOUNT ON; $3"	Query, don't print rows affected, third arg is query
    
    mssql-cli -E -S "$1" -d "$2" ;
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
