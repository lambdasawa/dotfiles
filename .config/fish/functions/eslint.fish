function eslint
    command -v eslint 2>&1 >/dev/null || npm i -g eslint

    command eslint $argv
end
