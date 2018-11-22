##################################################
# COLOR
##################################################
autoload -Uz add-zsh-hook
autoload -U colors
colors
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)



##################################################
# AUTO_CD
##################################################
setopt auto_cd

##################################################
# AUTOCONP
##################################################
# enable
autoload -Uz compinit
compinit
# complist grouping
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
# Upper letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo autocomp
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
	                   /usr/sbin /usr/bin /sbin /bin
# ps autocomp
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# add color for comp list
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ssh auto
#function _ssh {
#  compadd `fgrep 'Host ' ~/.ssh/config | awk '{print $2}' | sort`;
#}
setopt correct
eval "$(essh --zsh-completion)"
fpath=(/usr/local/share/zsh-completions $fpath)

##################################################
# PROMPT
##################################################
PROMPT='%k%f%{[38;5;010m%}[%D{%H:%M:%S} %h] %n:%F{006}%~%f%# '
#PROMPT='%k%f%{[30;48;5;198m%} Host: %m %{[0m%} %{[30;48;5;109m%} Hist: %h %{[0m%} %{[30;48;5;072m%} PWD: %~ %{[0m%} %{[30;48;5;227m%} Return: %(?.True.False) 
#%{[0m%}%{[38;5;010m%}%n%f%# '
#RPROMPT='%D{%H:%M:%S}'

##################################################
# ALIAS
##################################################
alias ls='ls -G'
alias ll='ls -laG'
alias l='ls -G'

##################################################
# HISTORY
##################################################
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt hist_ignore_space
set-options history-limit $HISTSIZE

##################################################
# DIRECTORY STACK
##################################################
setopt auto_pushd
setopt pushd_ignore_dups


##################################################
# LETTER DELETE
##################################################
WORDCHARS=':?_-.[]~=&;!#$%^(){}<>'


##################################################
# ENV
##################################################
export PATH="/Users/keyakko/platform-tools:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export LANG=en_US.UTF-8
export LC_ALL=$LANG


##################################################
# POWERLINE
##################################################
function powerline_precmd() {
  #PS1="$(powerline-shell --shell zsh $?)"
  PS1="$(powerline-go --shell zsh --error $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
fi


#source <(kubectl completion zsh)

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/apr/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

source "/usr/local/opt/zsh-git-prompt/zshrc.sh"

