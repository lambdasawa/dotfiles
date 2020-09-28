function prettier
    command -v prettier 2>&1 >/dev/null || npm i -g prettier

    command prettier $argv
end
