# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tino/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tino/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tino/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tino/.fzf/shell/key-bindings.zsh"
