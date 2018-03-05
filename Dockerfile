FROM ubuntu
USER root
ENV ACTIVATOR_VERSION 1.3.12
RUN apt-get update \
&& apt-get install -y scala default-jre default-jdk git wget unzip
RUN groupadd play
RUN useradd play -m -g play -s /bin/bash
RUN passwd -d -u play
RUN wget http://downloads.typesafe.com/typesafe-activator/${ACTIVATOR_VERSION}/typesafe-activator-${ACTIVATOR_VERSION}.zip && \
    unzip typesafe-activator-${ACTIVATOR_VERSION}.zip && \
    mv activator-dist-${ACTIVATOR_VERSION} /opt/activator && \
    chown -R play:play /opt/activator && \
    rm typesafe-activator-${ACTIVATOR_VERSION}.zip
RUN git clone https://github.com/slick/slick.git
WORKDIR /ebusiness
ADD . /ebusiness

