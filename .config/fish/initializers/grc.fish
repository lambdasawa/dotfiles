if ! command -v grc 2>&1 >/dev/null
    if is-mac
        brew install grc
    else if is-debian
        sudo apt install -y grc
    end
end

if [ -e /usr/local/etc/grc.fish ]
    source /usr/local/etc/grc.fish
end
