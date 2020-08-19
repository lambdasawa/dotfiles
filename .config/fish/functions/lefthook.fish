function lefthook
    if ! has lefthook
        if is-mac
            brew install Arkweid/lefthook/lefthook
        else if is-debian
            curl -sSLO https://github.com/Arkweid/lefthook/releases/download/v0.7.2/lefthook_0.7.2_Linux_x86_64.gz
            gunzip lefthook_0.7.2_Linux_x86_64.gz
            mv lefthook_0.7.2_Linux_x86_64 ~/bin/lefthook
            chmod u+x ~/bin/lefthook
        end
    end

    command lefthook $argv
end
