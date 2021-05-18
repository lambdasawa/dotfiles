function rapidoc -a api_file_path port
    if [ -z "$api_file_path" ]
        echo "Usage: rapidoc api.yaml 8080" >&2
        return 1
    end

    if [ -z "$port" ]
        set port 8080
    end

    set api_file_realpath (realpath $api_file_path)
    set api_file_basename (basename $api_file_realpath)

    set container_name rapidoc

    docker rm -f $container_name

    echo "http://localhost:$port"
    docker run -itd --rm \
        --name $container_name \
        --publish $port:80 \
        --volume $api_file_realpath:/usr/share/nginx/html/$api_file_basename \
        --env SPEC_URL=$api_file_basename \
        --env RAPIDOC_OPTIONS="theme='dark'" \
        mrin9/rapidoc

    set url -sSL http://localhost:$port
    while ! curl $url 2>&1 >/dev/null
        echo "Wait server..."
        sleep 1
    end
    echo "Sever open. $url"
    open $url

    docker logs -f $container_name
end
