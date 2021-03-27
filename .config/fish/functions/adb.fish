function adb
    if ! has adb
        if is-mac
            brew install android-sdk android-platform-tools
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command adb $argv
end
