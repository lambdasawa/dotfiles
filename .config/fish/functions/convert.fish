function convert
    command -v convert 2>&1 >/dev/null || brew install imagemagick

    command convert $argv
end
