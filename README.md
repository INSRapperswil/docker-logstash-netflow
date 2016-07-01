# docker-logstash-netflow

## Run container
To start the conainer use:
```
docker run -it --rm -e "TZ=Europe/Zurich" pschmid/docker-logstash-netflow logstash -f /srv/logstash.conf
```

For own configuration:
```
docker run -it --rm -e "TZ=Europe/Zurich" -v "$PWD":/config-dir pschmid/docker-logstash-netflow logstash -f /config-dir/logstash.conf
```
Make sure your `netflow_definitions` variable points to `/srv/netflow.yaml`.
