FROM debian:jessie
MAINTAINER HerryHou <HerryHou at gmail dot com>

# To update, check http://www.elasticsearch.org/overview/kibana/installation/
ENV KIBANA_VERSION 4.0.2

ADD https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz /kibana.tar.gz

RUN tar xzf kibana.tar.gz && \
    mv kibana-${KIBANA_VERSION}-linux-x64 /kibana && \
    rm kibana.tar.gz*

WORKDIR /kibana
EXPOSE 8080
COPY kibana.yml /kibana/config/kibana.yml
COPY run.sh /kibana/run.sh

CMD ["./run.sh"]