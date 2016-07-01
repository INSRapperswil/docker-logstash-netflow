FROM logstash

MAINTAINER Philip Schmid <philip.schmid@ins.hsr.ch>

ENV DEBIAN_FRONTEND noninteractive

RUN curl -Lo /srv/netflow.yaml https://raw.githubusercontent.com/logstash-plugins/logstash-codec-netflow/master/lib/logstash/codecs/netflow/netflow.yaml
RUN curl -Lo /srv/logstash.conf https://raw.githubusercontent.com/PhilipSchmid/docker-logstash-netflow/master/logstash.conf

EXPOSE 9995/udp

RUN /opt/logstash/bin/plugin install  --no-verify logstash-codec-netflow

CMD ["/opt/logstash/bin/logstash -f /srv/logstash.conf"]
