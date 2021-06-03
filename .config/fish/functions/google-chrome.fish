function google-chrome
    if [ ! -e /Applications/Google\ Chrome.app ]
        brew install --cask firefox
    end

    open /Applications/Google\ Chrome.app
end
