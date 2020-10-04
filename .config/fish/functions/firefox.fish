function firefox
    if [ ! -e /Applications/Firefox.app ]
        brew cask install firefox
    end

    open /Applications/Firefox.app $argv
end
