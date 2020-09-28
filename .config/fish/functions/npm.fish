function npm
    if [ ! -e ~/.asdf/shims/npm ]
        bash -c '
            export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs"
            mkdir -p "$GNUPGHOME"
            chmod 0700 "$GNUPGHOME"
            bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
        '

        asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
        asdf install nodejs 14.8.0
    end

    command npm $argv
end
