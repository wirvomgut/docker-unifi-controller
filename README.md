# Dockerized Ubiquiti UniFi Controller

## Run it

```
docker run -d --net=host -v /opt/UniFi/data:/opt/Unifi/data wirvomgut/unifi-controller
```

This runs the container from docker hub and mounts the data directory on the host system for data persitence. 
It also uses `--net=host` which allows the controller to map any port to public.

## Docker Compose

```
version: '2'
services:
  srv:
    image: wirvomgut/docker-unifi-controller:5.4.14
    network_mode: host
    ports: #actually not needed because network mode is set to host
    - 8080:8080/tcp
    - 8081:8081/tcp
    - 8443:8443/tcp
    - 8843:8843/tcp
    - 8880:8880/tcp
    - 3478:3478/udp
    volumes:
    - ./config/data:/opt/UniFi/data
```

