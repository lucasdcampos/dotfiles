export EDITOR=code

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_find_no_dups
setopt hist_ignore_space
setopt auto_cd

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt prompt_subst
PROMPT='%F{green}%*%f %F{yellow}%n%f %F{cyan}%~%f %F{red}${vcs_info_msg_0_}%f$ '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
