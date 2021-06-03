function authy
    if [ ! -e /Applications/Authy\ Desktop.app ]
        brew install --cask authy
    end

    open /Applications/Authy\ Desktop.app/
end
