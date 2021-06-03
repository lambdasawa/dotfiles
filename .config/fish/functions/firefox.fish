function firefox
    if [ ! -e /Applications/Firefox.app ]
        brew install --cask firefox
    end

    if [ ! -e ~/.local/share/tridactyl ]
        # https://github.com/tridactyl/tridactyl/blob/3d04aed543340da28de957000ec2d1505dbceb44/src/lib/config.ts#L928
        curl -fsSl https://raw.githubusercontent.com/tridactyl/tridactyl/master/native/install.sh -o /tmp/trinativeinstall.sh && bash /tmp/trinativeinstall.sh 1.20.2
    end

    if [ ! -e ~/themes/my.css ]
        # TODO: fix path
        mkdir -p ~/themes/
        ln -sf ~/.dotfiles/.config/tridactyl/themes/my.css ~/themes/my.css
    end

    open /Applications/Firefox.app $argv
end
