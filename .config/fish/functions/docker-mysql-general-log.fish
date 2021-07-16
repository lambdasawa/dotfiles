function docker-mysql-general-log -a container_name
    set container_id (docker ps | grep $container_name | awk '{print $1}')
    set u root
    set p (docker exec -it $container_id bash -c 'echo -n $MYSQL_ROOT_PASSWORD')
    set h 127.0.0.1
    set po 3306
    docker exec -it $container_id mysql -u$u -p$p -h$h -P$po -e "SET GLOBAL general_log = 'ON';"
    docker exec -it $container_id tail -f /var/lib/mysql/$container_id.log
end
