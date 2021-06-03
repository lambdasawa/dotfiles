function discord
    if [ ! -e /Applications/Discord ]
        brew install --cask discord
    end

    open /Applications/Discord.app $argv
end
