function google-japanese-ime
    if [ ! -e /Applications/GoogleJapaneseInput.localized/ ]
        brew cask install google-japanese-ime
    end
end
