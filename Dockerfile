FROM logstash:5.2

MAINTAINER Philip Schmid <docker@ins.hsr.ch>

ENV DEBIAN_FRONTEND noninteractive

RUN curl -Lo /srv/netflow.yaml https://raw.githubusercontent.com/logstash-plugins/logstash-codec-netflow/master/lib/logstash/codecs/netflow/netflow.yaml
RUN curl -Lo /srv/logstash.conf https://raw.githubusercontent.com/PhilipSchmid/docker-logstash-netflow/master/logstash.conf
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get autoremove \
  && apt-get autoclean

RUN /opt/logstash/bin/plugin install --no-verify logstash-codec-netflow
