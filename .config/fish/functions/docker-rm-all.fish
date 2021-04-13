function docker-rm-all
    docker rm -f (docker ps -aq)
end
