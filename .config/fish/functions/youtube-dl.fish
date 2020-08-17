function youtube-dl
    command -v youtube-dl 2>&1 >/dev/null || brew install youtube-dl

    command youtube-dl $argv
end
