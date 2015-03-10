# Aliases
if [ -f ~/.bash/aliases ]; then
  source ~/.bash/aliases
fi

# Set the default editor to vim (could also be emacs, sublime, etc)
export EDITOR=vim

# Avoid successive duplicates in the bash command history
export HISTCONTROL=ignoredups

# Append commands to the history file rather than overwriting
shopt -s histappend

# Append commands to the history file every time a prompty is shown instead of after closing a session
PROMPT_COMMAND='history -a'

export PS1="\[\033[33m\]\n\W $ "
