function lens
    if [ ! -e /Applications/Lens.app ]
        brew install --cask lens
    end

    open /Applications/Lens.app
end
