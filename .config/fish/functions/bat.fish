function bat
    command -v bat 2>&1 >/dev/null || brew install bat

    command bat $argv
end
