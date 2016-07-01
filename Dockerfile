FROM logstash

MAINTAINER Philip Schmid <philip.schmid@ins.hsr.ch>

ENV DEBIAN_FRONTEND noninteractive

COPY logstash.conf /srv/
RUN curl -Lo /srv/netflow.yaml https://raw.githubusercontent.com/logstash-plugins/logstash-codec-netflow/master/lib/logstash/codecs/netflow/netflow.yaml

EXPOSE 9995/udp

RUN /opt/logstash/bin/plugin install  --no-verify logstash-codec-netflow

CMD ["logstash -f /srv/logstash.conf"]
