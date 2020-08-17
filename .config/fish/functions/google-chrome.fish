function google-chrome
    if [ ! -e /Applications/Google\ Chrome.app ]
        brew cask install firefox
    end

    open /Applications/Google\ Chrome.app
end
