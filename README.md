# docker-logstash-netflow

## Run container
To start the conainer use:
```
docker run -it --rm -e "TZ=Europe/Zurich" -v /opt/netflow-data:/data -p 9995:9995/udp pschmid/docker-logstash-netflow logstash -f /srv/logstash.conf
```

For own configuration:
```
docker run -it --rm -e "TZ=Europe/Zurich" -v "$PWD":/config-dir -p 9995:9995/udp pschmid/docker-logstash-netflow logstash -f /config-dir/logstash.conf
```
Make sure your `netflow_definitions` variable points to `/srv/netflow.yaml`.
