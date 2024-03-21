

source ~/.config/zsh/exports.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/nvm/nvm.sh

setopt prompt_subst

#enanle use of control + arrow keys in console
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

PROMPT='%F{green}→%f %F{cyan}%1~ %f '

eval "$(zoxide init zsh)"
