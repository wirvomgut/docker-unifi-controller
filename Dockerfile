FROM debian:jessie
MAINTAINER Julian Liebl

RUN apt-get update && apt-get install -y \
    wget \
    openjdk-7-jre-headless \
    binutils \
    mongodb-server \
    jsvc \
    unzip \
    && mkdir -p /opt && cd /opt \
    && wget https://www.ubnt.com/downloads/unifi/5.4.16/UniFi.unix.zip \
    && unzip UniFi.unix.zip \
    && apt-get remove -y wget unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/UniFi

EXPOSE 3478 8080 8081 8443 8843 8880

CMD ["java", "-jar", "lib/ace.jar", "start"]
