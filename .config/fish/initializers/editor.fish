if which code 2>&1 >/dev/null
    set -gx EDITOR "code --wait"
else if which vim 2>&1 >/dev/null
    set -gx EDITOR "vim"
end
