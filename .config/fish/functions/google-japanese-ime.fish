function google-japanese-ime
    if [ ! -e /Applications/GoogleJapaneseInput.localized/ ]
        brew install --cask google-japanese-ime
    end
end
