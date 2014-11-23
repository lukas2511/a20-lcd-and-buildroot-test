export TERM=xterm-color

# Aliases
alias ll='ls -l'
alias la='ls -la'
alias path="echo $PATH | sed 's/:/\n/g'"
alias v='vim'

autoload -U zutil
autoload -U compinit
autoload -U complist
autoload -U promptinit
promptinit
compinit -i

# Uncomment following line to AUTO_CD if command is a directory
setopt AUTO_CD
setopt NO_BEEP
setopt EXTENDED_GLOB

# Allows commands like 'echo foo > file1 > file2'
setopt MULTIOS
setopt CORRECT

# Set colors
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

# One history for all open shells; store 10 000 entries. Use ^R and Alt-P
HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=10000
setopt incappendhistory
setopt sharehistory
setopt extendedhistory

# Useful to remember command in history without executing them
setopt interactivecomments

# Add tab completion to "cd.."
zstyle ':completion:*' special-dirs true
PROMPT="%(?..[%?] )%{$fg[blue]%}${PROMPT_HOST}%{$fg_bold[green]%}%p %{$fg_bold[yellow]%}%2~ ${dir_status}%{$reset_color%}"

