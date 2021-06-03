function notion
    if [ ! -e /Applications/Notion.app ]
        brew install --cask notion
    end

    open /Applications/Notion.app $argv
end
