export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
plugins=(git debian docker docker-compose)

source $ZSH/oh-my-zsh.sh

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i

[ ! "$SSH_AUTH_SOCK" ] && export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"

####
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
