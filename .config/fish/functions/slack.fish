function slack
    if [ ! -e /Applications/Slack ]
        brew install --cask slack
    end

    open /Applications/Slack.app $argv
end
