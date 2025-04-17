
export PATH="$HOME/rubyonmac:$PATH"

source "$(brew --prefix)/opt/chruby/share/chruby/chruby.sh"

source "$(brew --prefix)/opt/chruby/share/chruby/auto.sh"

chruby ruby-3.3.8

eval "$(nodenv init -)"

nodenv global 22.14.0

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/oh-my-posh.json)"
