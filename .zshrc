##################################################
# COLOR
##################################################
autoload -Uz add-zsh-hook
autoload -U colors
colors
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

setopt correct

# essh completion
#eval "$(essh --zsh-completion)"

# kubectl completion
#source <(kubectl completion zsh)

##################################################
# PROMPT
##################################################
PROMPT='%k%f%{[38;5;010m%}[%D{%H:%M:%S} %h] %n:%F{006}%~%f%# '

##################################################
# ALIAS
##################################################
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias l='ls --color=auto'

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
# POWERLINE
##################################################
function powerline_precmd() {
  PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

#if [ "$TERM" != "linux" ]; then
#  install_powerline_precmd
#fi

