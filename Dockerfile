# If no build-arg "VERSION" is provided, use the default version "6.5.3"
ARG VERSION=7.1.0
FROM docker.elastic.co/logstash/logstash-oss:$VERSION

LABEL maintainer="Philip Schmid (@PhilipSchmid)"

ENV DEBIAN_FRONTEND noninteractive

# Create required file structure and set the permissions accordingly
USER root
RUN mkdir -p /data
RUN chown -R logstash:logstash /srv
RUN curl -Lo /srv/netflow.yaml https://raw.githubusercontent.com/logstash-plugins/logstash-codec-netflow/master/lib/logstash/codecs/netflow/netflow.yaml
RUN /usr/share/logstash/bin/logstash-plugin install --no-verify logstash-codec-netflow

# Drop permissions
USER logstash

CMD ["logstash", "-f", "/srv/logstash.conf"]
