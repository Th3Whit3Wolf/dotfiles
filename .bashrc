# Ultimate Bashrc
# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi
	alias dir='dir --color=auto' #
	alias vdir='vdir --color=auto' #
	alias grep='grep --colour=auto' #
	alias egrep='egrep --colour=auto' #
	alias fgrep='fgrep --colour=auto' #
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

# enable bash completion in interactive shells
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

xhost +local:root > /dev/null 2>&1

# complete command names and file names
complete -cf sudo

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s cdspell                 # Correct cd typos
shopt -s histappend              # Append to the history file, don't overwrite it
shopt -s cmdhist                 # Bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s extglob                 # Extended pattern
shopt -s no_empty_cmd_completion # No empty completion
shopt -s dotglob				 # Bash includes filenames beginning with a ‘.’
shopt -s expand_aliases
shopt -s hostcomplete
shopt -s nocaseglob				# Bash matches filenames in a case-insensitive fashion when performing filename expansion


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTIGNORE="&:ls:[bf]g:exit"

# ex - archive extractor
# description: extract files
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# description: Display the colors your terminals uses
# usage: colors
colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}


# less highlight
# sudo pacman -S source-highlight
# export LESSOPEN="| src-hilite-lesspipe.sh %s"
# export LESS=' -R '
alias les='LESSOPEN="| src-hilite-lesspipe.sh %s" LESS=" -R " less -N'

# source files
if [[ -s $HOME/pv0/bin/activate ]]; then
  . $HOME/pv0/bin/activate
fi

if [[ -s /usr/share/git/completion/git-completion.bash ]]; then
  . /usr/share/git/completion/git-completion.bash
fi

if [[ -s /etc/profile.d/autojump.bash ]]; then
  . /etc/profile.d/autojump.bash
fi

if [[ -s $HOME/perl5/perlbrew/etc/bashrc ]]; then
  . $HOME/perl5/perlbrew/etc/bashrc
fi

################################################
#                    ALIAS                     #
################################################
alias ali="bat --theme DarkNeon  --color always -p ~/.bashrc | rg alias | rg -v '#' | sed 's/'\''/ /g' | sed 's/=/ =/' | cut -d ' ' -f2-15 | tr -d '\"'  "
alias bashrc='nvim ~/.bashrc && source ~/.bashrc'
alias b='cargo build'
alias atomp='atom $PWD'
alias bit='~/.quiet/bit.sh'
alias blame='systemd-analyze blame'
alias boot='systemd-analyze'
alias br='cargo build --release'
alias c='clear'
alias cargopwd='cargo install --force --path $PWD'
alias cargogit='cargo install --force --git'
alias chown='sudo chown -R doc:users'
alias cin='cargo install --force --path $PWD'
alias cig='cargo install --git'
alias clean='sudo pacman -Sc && sudo pacman -Rns $(pacman -Qtdq)'
alias clone='git clone'
alias con='sshpass -p "karrick" ssh -o StrictHostKeyChecking=no david@104.248.30.216'
alias cpu='sudo cpupower frequency-set -u'
alias crit='systemd-analyze critical-chain'
alias find='fd'
alias extract='~/.quiet/extract.sh'
alias install='yay -S --noconfirm'
alias l='lsd'
alias ls='exa'
alias mem='free -h --si'
alias np='nano PKGBUILD'
alias nvtest='nvim -u /home/doc/Code/vim/vim-tester/init.vim'
alias progress='~/.quiet/progress.sh'
alias r='cargo run'
alias rr='cargo run --release'
alias read='$(ls /bin/ | rg ^firefox | head -n1) /home/doc/git/book/2018-edition/book/index.html'
alias rustinux='cargo-pkgbuild && cargo rpm build && cargo deb'
alias sscp='~/.quiet/scp.sh'
alias sign='~/.quiet/sign.sh'
alias sudoenv='sudo env PATH=$PATH'
alias suvim='sudo -E nvim'
alias sys-dis='sudo systemctl disable'
alias sys-en='sudo systemctl enable'
alias sys-ls='sudo systemctl list-unit-files'
alias sys-rm='sudo systemctl mask'
alias sys-start='sudo systemctl start'
alias test='~/.quiet/test.sh'
alias t='cargo test --release -- --nocapture'
alias tmuxkillall="tmux ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}"
alias update='sudo pacman -Syu --noconfirm && rustup update && flutter upgrade'
alias uninstall='sudo pacman -Rcsn'
alias vim-reset='vim -c "call dein#clear_state() | call dein#recache_runtimepath() | q"'
alias wifi='sudo wifi-menu'
alias x='chmod +x'
alias xo='xdg-open &>/dev/null'
alias xsetkeyr='xset r rate 182 42'
alias zshrc='nvim ~/.zshrc && source ~/.zshrc'
################################################
#                    Typos                     #
################################################
alias cta='cat' #
alias sl='ls' #
alias cd..='cd ..' #
alias vim='nvim'
################################################
#        Modified Commands (Niceties)          #
################################################
# alias code='code-git' #
alias grep='grep --color=tty -d skip' #
alias cp="cp -i" #
alias rm='rm -i' #
alias ..='cd ..' # up one
alias df='df -h' #
alias du='~/.quiet/du.sh' #
alias grep='grep --color=auto' #
alias mkdir='mkdir -p -v' #
alias more='less' #
alias ping='ping -c 5' #
################################################
#                 ENVIRONMENT                  #
################################################
export EDITOR=nvim
export GOPATH=$HOME/.go
export ELECTRON_TRASH=kioclient5 code
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/
export JAVA_OPTIONS="$JAVA_OPTIONS -DsocksProxyHost=localhost -DsocksProxyPort=9050"
export CPPFLAGS="-D_FORTIFY_SOURCE=2"
export CFLAGS="-march=native -mtune=skylake -Ofast -pipe -fstack-protector-strong --param=ssp-buffer-size=4 -fno-plt -fopenmp -Wno-error -w" #
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-Wl,-O4,--sort-common,--as-needed,-z,relro,-z,now,-lgomp"
#-- Make Flags: change this for DistCC/SMP systems
#MAKEFLAGS="-j2"
#-- Debugging flags
export DEBUG_CFLAGS="-g -fvar-tracking-assignments"
export DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"
export DEBUG_MAKEFLAGS="-j1 --debug=bvij"
#-- CMAKE flags
export CMAKE_C_COMPILER="command gcc $CFLAGS"
export CMAKE_CXX_COMPILER="command g++ $CXXFLAGS"
export CMAKE_LINKER="command ld $LDFLAGS"
# export SSH_ASKPASS="ksshaskpass"
################################################
# Use firefox-developer-edition when available #
################################################
if [  -e /bin/firefox-developer-edition ]; then
	alias firefox='firefox-developer-edition' #
fi
###############################################
#                   The END                   #
###############################################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
