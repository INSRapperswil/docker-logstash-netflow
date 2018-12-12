# Dockerized Logstash with installed Netflow Plugin

This Docker image can be used to collect Netflow data using Logstash. In the default configuration of this image, you will be able to store Netflow entries in JSON files. Additionally it prints the received flows to STDOUT (needs to be enabled first). Further Netflow processing logic can be easily configured inside the `logstash.conf` configuration.

Pull the image directly from [pschmid/docker-logstash-netflow](https://hub.docker.com/r/pschmid/docker-logstash-netflow/) using the desired version or simply use the `latest` tag.

## Prerequisites
- Create a data directory which will be mounted to the Docker container and will be used to store the Netflow data dump file. By default this image uses the host directory `/opt/netflow-data` which will be mounted at `/data` inside the container.
- Change the `logstash.conf` configuration file according to your needs.

## Getting Started
To start the conainer use:
```bash
docker run -it \
-e "TZ=Europe/Zurich" \
-p 9995:9995/udp \
-v /opt/netflow-data:/data \
-v `pwd`/logstash.conf:/srv/logstash.conf \
pschmid/docker-logstash-netflow:latest
```

## Customization
You can customize the collection of netflow data by using [Netflow Codec Configuraiton Options](https://www.elastic.co/guide/en/logstash/current/plugins-codecs-netflow.html#plugins-codecs-netflow-options).

### Logstash Start Command
This Docker image runs `logstash -f /srv/logstash.conf` by default. Override this `CMD` if you are using another logstash configuration file/path or would like to add some additional logstash command parameters.

### Netflow Definitions
Since there is no default value for the `netflow_definitions` provided by the [Netflow codec plugin](https://www.elastic.co/guide/en/logstash/current/plugins-codecs-netflow.html), I added a default `netflow_definitions` configuration file inside this Docker image (from [logstash-plugins/logstash-codec-netflow](https://raw.githubusercontent.com/logstash-plugins/logstash-codec-netflow/master/lib/logstash/codecs/netflow/netflow.yaml)). To change this configuration simply "override" the definition by mounting a Docker volume at the same destination path. To achive this, use `-v /your/path/your_netflow.yaml:/srv/netflow.yaml`.

## Docker Hub Build
This Docker Hub build is improved by always using the latest tag from the official [docker.elastic.co](https://www.docker.elastic.co/#) Docker registry. See the following links to get more information:
- https://github.com/docker/hub-feedback/issues/508
- https://docs.docker.com/docker-cloud/builds/advanced/#custom-build-phase-hooks
- https://github.com/andyneff/highland_builder/blob/master/builder.py
