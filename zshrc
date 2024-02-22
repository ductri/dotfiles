# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias sshl="autossh -M 20000 -f -N -L 9999:localhost:9999"
alias gits="git status ."
alias pybasic="source ~/pyvenv/basic/bin/activate"
alias clc="clear"
alias neww="vim /home/tringuyen/research/notes/every-vocab.md"

export GEM_HOME=$HOME/gems

path+=('/home/tringuyen/.local/share/gem/ruby/3.0.0/bin')
path+=('$HOME/gems/bin')
export PATH

unsetopt correct
