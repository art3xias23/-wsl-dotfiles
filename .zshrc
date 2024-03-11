# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/functions.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export PATH=$PATH:/opt/nvim/
export PATH=$PATH:/usr/local/bin/nvim/
export PATH=$PATH:/usr/local/go/bin

#JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

plugins=(git)
# Load and initialise completion system
autoload -Uz compinit
compinit

source ~/.nvm/nvm.sh
ZSH_THEME="robbyrussell"

#DISABLE_LS_COLORS="true"
# User configuration
#PROMPT='%B{green}➜ %F{cyan}%1/ '
#Path to luarocks
export PATH="$HOME/.luarocks/bin:$PATH"

 export LANG=en_US.UTF-8

 
# Below command will help wsl2 use the windows graphics in order to run GUIs
export DISPLAY="$(ip route list exact default | awk '{print $3}'):0"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 


# Setting PATH for Python 3.10
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

#Use openai command line tool
export PATH=$PATH:/home/tino/.local/bin
export PATH="$PATH:/home/tino/.local/lib/python3.9/site-packages/openai"

#Use sqlcmd
export PATH="$PATH:/opt/mssql-tools/bin"

eval "$(zoxide init zsh)"

