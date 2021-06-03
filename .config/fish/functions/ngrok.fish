function ngrok
    command -v ngrok 2>&1 >/dev/null || brew install --cask ngrok

    command ngrok $argv
end
