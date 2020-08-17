function idea
    if [ ! -e /Applications/IntelliJ\ IDEA.app ]
        brew cask install intellij-idea
    end

    open /Applications/IntelliJ\ IDEA.app/ $argv
end
