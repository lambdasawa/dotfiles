function lens
    if [ ! -e /Applications/Lens.app ]
        brew cask install lens
    end

    open /Applications/Lens.app
end
