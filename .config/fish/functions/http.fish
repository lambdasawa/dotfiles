function http
    command -v http 2>&1 >/dev/null || brew install httpie

    command http $argv
end
