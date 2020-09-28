function curlie
    if ! has curlie
        if is-mac
            brew install rs/tap/curlie
        else if is-debian
            set file curlie_1.5.4_linux_386.deb
            curl -sSLO https://github.com/rs/curlie/releases/download/v1.5.4/$file
            sudo dpkg -i $file
            rm $file
        end
    end

    command curlie $argv
end
