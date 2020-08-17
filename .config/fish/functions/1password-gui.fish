function 1password-gui
    if [ ! -e /Applications/1Password\ 7.app ]
        brew cask install 1password
    end

    open /Applications/1Password\ 7.app/
end
