function swagger-ui -a api_file_path port
    if [ -z "$api_file_path" ]
        echo "Usage: swagger-ui api.yaml 8080" >&2
        return 1
    end

    if [ -z "$port" ]
        set port 8080
    end

    set api_file_realpath (realpath $api_file_path)
    set api_file_basename (basename $api_file_realpath)

    set container_name (echo "swagger-ui-$api_file_realpath" | sed 's|[./]|_|g')

    docker rm -f $container_name

    echo "http://localhost:$port"
    docker run \
        -itd \
        --rm \
        --name $container_name \
        --publish $port:8080 \
        --volume $api_file_realpath:/app/$api_file_basename \
        --env SWAGGER_JSON=/app/$api_file_basename \
        swaggerapi/swagger-ui

    set url http://localhost:$port
    while ! curl -sSL $url 2>&1 >/dev/null
        echo "Wait server..."
        sleep 1
    end
    echo "Sever listen: $url"
    open $url

    docker logs -f $container_name
end
