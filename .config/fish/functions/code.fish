function code
    command -v code 2>&1 >/dev/null || brew install --cask visual-studio-code

    command code $argv
end
