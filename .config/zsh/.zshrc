

source ~/.config/zsh/exports.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/nvm/nvm.sh

setopt prompt_subst

PROMPT='%F{green}→%f %F{cyan}%1~ %f '

eval "$(zoxide init zsh)"
