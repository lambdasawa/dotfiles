function stoplight
    if [ ! -e /Applications/Stoplight\ Studio.app/ ]
        brew install --cask stoplight-studio
    end

    open /Applications/Stoplight\ Studio.app/
end
