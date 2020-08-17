function arc
    if [ ! -e ~/bin/arc ]
        curl -sSL -o ~/bin/arc https://github.com/mholt/archiver/releases/download/v3.2.0/arc_mac_amd64
        chmod u+x ~/bin/arc
    end

    command arc $argv
end
