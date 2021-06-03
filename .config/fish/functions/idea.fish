function idea
    if [ -e /usr/local/bin/idea ]
        # Create Command-Line Launcher ...
        /usr/bin/python /usr/local/bin/idea $argv
        return
    end

    if [ ! -e /Applications/IntelliJ\ IDEA.app ] && uname -a | grep Darwin
        brew install --cask intellij-idea
    end

    if [ -e /Applications/IntelliJ\ IDEA.app ]
        open /Applications/IntelliJ\ IDEA.app/ $argv
        return
    end
end
