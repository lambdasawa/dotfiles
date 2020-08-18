function npm
    if [ ! -e ~/.asdf/shims/npm ]
        asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
        asdf install nodejs 14.8.0
    end

    command npm $argv
end
