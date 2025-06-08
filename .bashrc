#
# See the bash configuration files for Arch Linux:
#     https://wiki.archlinux.org/title/Bash#Configuration_files
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Aliases
alias ls='ls --color=auto'
alias ll='ls -la'

## Source bash completion
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
source ~/.bash-completion-arduino-cli.bash

## Set Environment Variables
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk/

#-----
# GENERATED CONTENT (START)
#-----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#-----
# GENERATED CONTENT (END)
#-----

# Use Starship Prompt
eval "$(starship init bash)"

# Auto-start tmux for interactive shells
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

. "$HOME/.cargo/env"

export PATH="/home/silas/.local/bin/:$PATH"
export PATH="/home/silas/.local/bin/STM32CubeProgrammer/bin:$PATH"
export PATH="/home/silas/.local/bin/GoDot/:$PATH"
export PATH="/home/silas/.local/nrf-command-line-tools/bin/:$PATH"
export PATH="/home/silas/.local/JLink_Linux_V838_x86_64:$PATH"
