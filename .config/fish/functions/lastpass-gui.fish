function lastpass-gui
    if [ ! -e /Applications/LastPass.app ]
        brew install --cask lastpass
    end

    open /Applications/LastPass.app/
end
