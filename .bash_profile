# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/opt/flutter/bin:$PATH
export GOPATH="$HOME/.go/bin:$PATH"
# AutoStartx
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx -- vt1 &> /dev/null
#fi


