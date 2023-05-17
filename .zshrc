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

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions asdf)

source $ZSH/oh-my-zsh.sh
source ~/.nvm/nvm.sh

# User configuration

#Path to luarocks
export PATH="$HOME/.luarocks/bin:$PATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

#Explorer
alias open='explorer.exe'
alias ll='ls -l'
alias zsh="vim ~/.zshrc"
alias zshc="source ~/.zshrc"
alias Age='cd /mnt/c/Users/kmilchev/source/repos/AgePartnership/'

#Directories

alias luaplay="cd /mnt/c/Users/kmilchev/Exercism/lua"

#WSL
alias wsl="wsl.exe"
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
alias python39='C:\\Users\\kmilchev\\AppData\\Local\\Programs\\Python\\Python39\\python.exe'
alias refreshbash='. ~kmilchev/.bashrc'

#Python
alias mssql-cli='python39 -m mssqlcli.main'
alias goog='python39 C:\\ProgramData\\chocolatey\\lib\\googler\\tools\\googler\\googler.py'
alias googler='LC_ALL="en_GB.UTF-8" goog'

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
