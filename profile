# Aliases
if [ -f ~/.bash/aliases ]; then
  source ~/.bash/aliases
fi

##########
# SYSTEM #
##########

alias hosts='sudo vi /etc/hosts'
alias ports='lsof -i | grep LISTEN'

###########
# HELPERS #
###########

# Only show directories when [TAB][TAB] on cd 
complete -d cd

###########
# EDITORS #
###########

# Set the default editor to vim (could also be emacs, sublime, etc)
export EDITOR=vim

###########
# HISTORY #
###########

# Avoid successive duplicates in the bash command history
export HISTCONTROL=ignoredups

# Append commands to the history file rather than overwriting
shopt -s histappend

# Append commands to the history file every time a prompty is shown instead of after closing a session
PROMPT_COMMAND='history -a'

#######
# GIT #
#######
alias grr='git push -d origin'
alias gclean="git fetch --prune && git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"
source ~/.bash/git-completion.bash
source ~/.bash/git-aware.sh

# Hub CLI
eval "$(hub alias -s)"

# Show git branch in directory with color
export PS1="\[\033[33m\]\n\W \[$txtcyn\]\$git_branch\[$txtred\] \$git_dirty\[$txtrst\]: "

# Integration for bash and iTerm
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

########
# RUBY #
########

# Init rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#########
# RAILS #
#########
alias hamlize="find . -name \*.erb -print | sed 'p;s/.erb$/.haml/' | xargs -n2 html2haml"
alias spec='rake RAILS_ENV=test spec'
alias rails_refresh='rm -rf db/schema.rb; rake db:drop; rake db:setup; rake db:migrate; rake db:seed;'

#########
# XCODE #
#########

alias flush_derived_data='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
