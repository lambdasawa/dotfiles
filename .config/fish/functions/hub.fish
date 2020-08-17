function hub
    command -v hub 2>&1 >/dev/null || brew install hub

    command hub $argv
end
