function gomi
    if ! has gomi
        if is-mac
            brew install b4b4r07/tap/gomi
        else if is-debian
            curl -sSLO https://github.com/b4b4r07/gomi/releases/download/v1.1.1/gomi_linux_x86_64.tar.gz
            tar zxf gomi_linux_x86_64.tar.gz
            mv gomi ~/bin/
            rm *.tar.gz
        end
    end

    command gomi $argv
end
