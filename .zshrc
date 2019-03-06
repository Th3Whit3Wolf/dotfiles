# X relative settings
if [[ -r /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then 
    source /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh 
fi
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh 
export TERM="xterm-256color" 

## Font mode for powerlevel9k
POWERLEVEL9K_MODE="nerdfont-complete" 

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k" 

# Prompt settings
#Icon config
POWERLEVEL9K_SUB_ICON='\UF07C' 
POWERLEVEL9K_FOLDER_ICON='\UF07B' 

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC' 
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'' 

# Context
DEFAULT_USER="doc" 
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true 
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='magenta' 
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{white}%n %F{magenta}\uf300" 
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black' 
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="091" 
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="blue" 

# Dirs
POWERLEVEL9K_DIR_HOME_BACKGROUND='magenta' 
POWERLEVEL9K_DIR_HOME_FOREGROUND='white' 
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='magenta' 
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white' 
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='11' 
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='6' 
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3 
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right" 

# VCS icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d3' 
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113' 
POWERLEVEL9K_VCS_STAGED_ICON="\u00b1" 
POWERLEVEL9K_VCS_UNTRACKED_ICON="\u25CF" 
POWERLEVEL9K_VCS_UNSTAGED_ICON="\u00b1" 
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\u2193" 
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\u2191" 

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='0' 
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='magenta' 
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='0' 
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='magenta' 
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='0' 
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='magenta' 

# VCS CONFIG
POWERLEVEL9K_SHOW_CHANGESET=true 

# Time
POWERLEVEL9K_TIME_FORMAT="%D{%T \uF017}" # 15:29:33 
POWERLEVEL9K_TIME_FOREGROUND="white" 
POWERLEVEL9K_TIME_BACKGROUND="magenta" 

# Command Exec Time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear' 
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='090' 
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD='0'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION='4'

# Load
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="0" 
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="0" 
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="0" 
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="white" 
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="white" 
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="white" 
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="013" 
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="6" 
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="magenta" 

# Ram
POWERLEVEL9K_RAM_BACKGROUND="magenta" 
POWERLEVEL9K_RAM_FOREGROUND="white" 
POWERLEVEL9K_RAM_ELEMENTS=(ram_free) 

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=( 
  git 
  zsh-autosuggestions 
) 

# User configuration
# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ram load dir vcs) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time)
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD="0" 

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
alias crit='systemd-analyze critical-chain'
alias find='fd'
alias extract='~/.quiet/extract.sh'
alias install='yay -S --noconfirm'
alias ls='lsd'
alias mem='free -h --si'
alias np='nano PKGBUILD'
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
alias update='sudo pacman -Syu --noconfirm && rustup update && cargo-update && flutter update'
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
#alias code='code-git' #
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
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then 
   export EDITOR='vim' 
 else 
   export EDITOR='nvim' 
 fi 

export SSH_KEY_PATH="~/.ssh/rsa_id"  # ssh
export LANG=en_US.UTF-8
export GOPATH=$HOME/.go
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

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

################################################
# Use firefox-developer-edition when available #
################################################
if [  -e /bin/firefox-developer-edition ]; then
	alias firefox='firefox-developer-edition' #
fi
###############################################
#                   The END                   #
###############################################
autoload -Uz compinit
compinit

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

# Description: show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  ( git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD ) 2> /dev/null
}

# Description: sShow different symbols as appropriate for various Git repository states
# Compose this value via multiple conditional appends.
parse_git_state() {
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

git_prompt_string() {
  local git_where="$(parse_git_branch)"
  
  # If inside a Git repository, print its branch and state
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
  
  # If not inside the Git repo, print exit codes of last command (only if it failed)
  [ ! -n "$git_where" ] && echo "%{$fg[red]%} %(?..[%?])"
}

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
