function cloud_sql_proxy
    if ! has cloud_sql_proxy
        if is-mac
            curl -o ~/bin/cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
        else if is-debian
            echo TODO
            exit 1
        end
        chmod u+x ~/bin/cloud_sql_proxy
    end

    command cloud_sql_proxy $argv
end
