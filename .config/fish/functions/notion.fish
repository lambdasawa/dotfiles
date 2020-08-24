function notion
    if [ ! -e /Applications/Notion.app ]
        brew cask install notion
    end

    open /Applications/Notion.app $argv
end
