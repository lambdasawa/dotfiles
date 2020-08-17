function starship
    command -v starship 2>&1 >/dev/null || brew install starship

    command starship $argv
end
