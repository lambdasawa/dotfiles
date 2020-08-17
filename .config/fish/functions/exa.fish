function exa
    command -v exa 2>&1 >/dev/null || brew install exa

    command exa $argv
end
