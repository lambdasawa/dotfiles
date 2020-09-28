function watchexec
    if ! has watchexec
        if is-mac
            brew install watchexec
        else if is-debian
            curl -sSLO https://github.com/watchexec/watchexec/releases/download/1.14.0/watchexec-1.14.0-x86_64-unknown-linux-gnu.deb
            sudo dpkg -i watchexec-1.14.0-x86_64-unknown-linux-gnu.deb
            rm watchexec-1.14.0-x86_64-unknown-linux-gnu.deb
        end
    end

    command watchexec $argv
end
