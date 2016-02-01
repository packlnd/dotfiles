## Set up the promp

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle ':completion:*:vim:*' ignored-patterns '*.(o|a|so|aux|dvi|log|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps|pyc)'

ZSH_THEME="alanpeabody"

export MARKPATH=$HOME/.marks
function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  rm -i "$MARKPATH/$1"
}
function marks {
  ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
export GOPATH="$HOME/labs"
export PATH="$HOME/arm-2011.03/bin:$PATH"
export PATH="/usr/bin/javaws:$PATH"
export PATH="$HOME/chromium/depot_tools:$PATH"
export PATH="$HOME/Downloads/javacc-5.0/bin:$PATH"
alias tmux="TERM=screen-256color-bce tmux"
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox
export SCALA_HOME="/usr/local/scala/scala-2.11.6"
export PATH="$SCALA_HOME/bin:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/Downloads/omnetpp-4.4.1/lib"
export TCL_LIBRARY="/usr/share/tcltk/tcl8.6"
export PATH="$PATH:$HOME/Downloads/omnetpp-4.4.1/bin"
export PATH="$PATH:/usr/local/android-studio/bin"
export JAVA_HOME="/usr/local/java/jdk1.8.0_45"
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$PATH:/usr/local/jre1.8.0_45"
alias -g ...='../..'
alias -g ....='../../..'
alias xclip="xclip -selection c"
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$JMFHOME/lib"
export PATH="/home/packland/javacv-bin:$PATH"
export CLASSPATH="/home/packland/javacv-bin:$CLASSPATH"
export GOPATH="$HOME/uw/452/452-labs"
export PATH="/home/packland/home-automation/lamp/app/swift-2.2-SNAPSHOT-2015-12-18-a-ubuntu14.04/usr/bin/:${PATH}"
