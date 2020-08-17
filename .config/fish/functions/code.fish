function code
    command -v code 2>&1 >/dev/null || brew cask install visual-studio-code

    command code $argv
end
