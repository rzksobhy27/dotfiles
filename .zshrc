PROMPT="%n@%m:%~$ "

stty intr ^E

# some useful options (man zshoptions)
setopt menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
unsetopt BEEP

# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

# shift+tab
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# vi-mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_CURSOR_STYLE_ENABLED=false
ZVM_VI_INSERT_ESCAPE_BINDKEY=^C

# Alies
alias l="ls -al"
alias ll="ls -l"
alias ls="ls --color=auto"

# env variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
