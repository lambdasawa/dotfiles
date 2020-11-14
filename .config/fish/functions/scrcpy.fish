function scrcpy
    if ! has adb
        if is-mac
            brew install android-platform-tools
        else
            echo "not implemented"
            exit 1
        end
    end

    if ! has scrcpy
        if is-mac
            brew install scrcpy
        else
            echo "not implemented"
            exit 1
        end
    end

    command scrcpy $argv
end
