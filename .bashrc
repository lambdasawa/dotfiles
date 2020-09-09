export EDITOR="code --wait"
export PATH="$PATH:$HOME/bin"

if which starship 2>&1 >/dev/null; then
  eval "$(starship init bash)"
fi

if which direnv 2>&1 >/dev/null; then
  eval "$(direnv hook bash)"
fi

if which asdf 2>&1 >/dev/null; then
  source $HOME/.asdf/asdf.bash
  source $HOME/.asdf/completions/asdf.bash
fi
