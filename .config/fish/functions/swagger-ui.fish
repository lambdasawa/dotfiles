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

    echo "http://localhost:$port"
    docker run \
        --rm \
        --publish $port:8080 \
        --volume $api_file_realpath:/app/$api_file_basename \
        --env SWAGGER_JSON=/app/$api_file_basename \
        swaggerapi/swagger-ui
end
