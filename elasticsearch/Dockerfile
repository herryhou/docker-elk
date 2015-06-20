FROM elasticsearch
MAINTAINER HerryHou <HerryHou at gmail dot com>

RUN /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head && \
    /usr/share/elasticsearch/bin/plugin -install lukas-vlcek/bigdesk/2.5.0 && \
    /usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ && \
    /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/1.5.3 && \
    /usr/share/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic