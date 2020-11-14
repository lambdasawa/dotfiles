function authy
    if [ ! -e /Applications/Authy\ Desktop.app ]
        brew cask install authy
    end

    open /Applications/Authy\ Desktop.app/
end
