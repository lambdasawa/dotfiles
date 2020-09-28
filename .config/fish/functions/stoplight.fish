function stoplight
    if [ ! -e /Applications/Stoplight\ Studio.app/ ]
        brew cask install stoplight-studio
    end

    open /Applications/Stoplight\ Studio.app/
end
