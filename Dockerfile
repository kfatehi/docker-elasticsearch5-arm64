FROM ubuntu:20.04

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -s /usr/bin/bash -d /home/elasticsearch -m elasticsearch

RUN apt-get update && apt-get upgrade -y && apt install curl -y

RUN mkdir /opt/jre


RUN curl -SLO https://keyvan.cloud/files/jre-8u311-linux-x64.tar.gz

# You can switch to JRE9 by using this URL
# https://keyvan.cloud/files/jre-9.0.1_linux-x64_bin.tar.gz

RUN tar -zxf jre-8u311-linux-x64.tar.gz -C /opt/jre
RUN update-alternatives --install /usr/bin/java java /opt/jre/jre1.8.0_311/bin/java 100
RUN update-alternatives --display java

RUN curl -SLO https://keyvan.cloud/files/elasticsearch-5.6.4.deb
RUN dpkg -i elasticsearch-5.6.4.deb

RUN mkdir /usr/share/elasticsearch/logs && chown elasticsearch:elasticsearch /usr/share/elasticsearch/logs
RUN mkdir /usr/share/elasticsearch/data && chown elasticsearch:elasticsearch /usr/share/elasticsearch/data

USER elasticsearch
