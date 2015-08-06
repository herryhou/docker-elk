#!/bin/bash

host_ip=$(/sbin/ip route|awk '/eth0.*link/ { print $9 }')

docker run -d \
 --name elk_elasticsearch1 \
 -p 9200:9200 \
 -p 9300:9300 \
 -e HOST_NAME=$hostname \
 -e HOST_IP=$host_ip \
 elk_elasticsearch:latest \
 elasticsearch \
 -Des.node.name="$HOST_NAME" \
 -Des.network.publish_host=$HOST_IP \
 -Des.network.bind_host=0.0.0.0 \
 -Des.discovery.zen.ping.multicast.enabled=false \
 -Des.discovery.zen.ping.unicast.hosts=192.168.10.171:9300,192.168.10.172:9300,192.168.10.173:9300 \
 -Des.cluster.name="Docker_ES" && \
docker run -d \
 --name elk_kibana1 \
 -p 8080:8080 \
 --link elk_elasticsearch1 \
 elk_kibana:latest \
 ./run.sh