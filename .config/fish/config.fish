set -gx EDITOR "code --wait"

set -gx PATH $PATH $HOME/bin

starship --version 2>&1 >/dev/null
eval (starship init fish)

direnv --version 2>&1 >/dev/null
eval (direnv hook fish)

zoxide --version 2>&1 >/dev/null
zoxide init fish | source

asdf 2>&1 >/dev/null
. $HOME/.asdf/asdf.fish
. $HOME/.asdf/completions/asdf.fish

source ~/.config/fish/util.fish
