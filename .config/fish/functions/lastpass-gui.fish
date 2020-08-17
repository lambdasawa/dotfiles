function lastpass-gui
    if [ ! -e /Applications/LastPass.app ]
        brew cask install lastpass
    end

    open /Applications/LastPass.app/
end
