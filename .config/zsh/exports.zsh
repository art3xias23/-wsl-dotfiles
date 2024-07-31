#!/bin/sh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.config/.zsh"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/opt/nvim/
export PATH=$PATH:/usr/local/bin/nvim/
export PATH=$PATH:/usr/local/go/bin

#JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

#Path to luarocks
export PATH="$HOME/.luarocks/bin:$PATH"

export LANG=en_US.UTF-8

 
# Below command will help wsl2 use the windows graphics in order to run GUIs
#export DISPLAY="$(ip route list exact default | awk '{print $3}'):0"

export NVM_DIR="$HOME/.nvm"

#export PATH

#Use openai command line tool
export PATH=$PATH:/home/tino/.local/bin
export PATH=$PATH:/home/tino/.local/lib/python3.9/site-packages/openai

#Use sqlcmd
export PATH=$PATH:/opt/mssql-tools/bin

#ch
export MANPATH=$MANPATH:/usr/local/ch8.5/docs/man
