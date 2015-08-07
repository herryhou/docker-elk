#!/bin/bash

host_ip=$(/sbin/ip route|awk '/eth0.*link/ { print $9 }')

docker run -d \
 --name elk_elasticsearch1 \
 -p 9200:9200 \
 -p 9300:9300 \
 elk_elasticsearch:latest \
 elasticsearch \
 -Des.node.name=$(hostname) \
 -Des.network.publish_host=$host_ip \
 -Des.network.bind_host=0.0.0.0 \
 -Des.multicast.enabled=false \
 -Des.discovery.zen.ping.multicast.enabled=false \
 -Des.discovery.zen.ping.unicast.hosts=192.168.10.171:9300,192.168.10.172:9300,192.168.10.173:9300 \
 -Des.cluster.name="DockerES" && \
docker run -d \
 --name elk_kibana1 \
 -p 8080:8080 \
 --link elk_elasticsearch1:elasticsearch \
 elk_kibana:latest \
 ./run.sh