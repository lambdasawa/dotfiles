function 1password-gui
    if [ ! -e /Applications/1Password\ 7.app ]
        brew install --cask 1password
    end

    open /Applications/1Password\ 7.app/
end
