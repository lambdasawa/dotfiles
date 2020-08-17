function aria2c
    command -v aria2c 2>&1 >/dev/null || brew install aria2

    command aria2c $argv
end
