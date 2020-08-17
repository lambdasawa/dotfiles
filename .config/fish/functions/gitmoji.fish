function gitmoji
    command -v gitmoji 2>&1 >/dev/null || brew install gitmoji

    command gitmoji $argv
end
