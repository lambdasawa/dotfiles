function discord
    if [ ! -e /Applications/Discord ]
        brew cask install discord
    end

    open /Applications/Discord.app $argv
end
