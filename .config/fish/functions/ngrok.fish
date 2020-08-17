function ngrok
    command -v ngrok 2>&1 >/dev/null || brew cask install ngrok

    command ngrok $argv
end
