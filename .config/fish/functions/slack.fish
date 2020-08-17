function slack
    if [ ! -e /Applications/Slack ]
        brew cask install slack
    end

    open /Applications/Slack.app $argv
end
