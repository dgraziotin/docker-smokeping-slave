# README

[dgraziotin/smokeping-slave](https://github.com/dgraziotin/docker-smokeping-slave) is a dockerized [Smokeping](https://oss.oetiker.ch/smokeping/counter.cgi/2.007003), derived from [linuxserver/smokeping](https://github.com/linuxserver/docker-smokeping), 
to run as a slave for another Smokeping instance (which could be the original [linuxserver/smokeping](https://github.com/linuxserver/docker-smokeping)).

Being derived from [linuxserver/smokeping](https://github.com/linuxserver/docker-smokeping), [dgraziotin/smokeping-slave](https://github.com/dgraziotin/docker-smokeping-slave) preserves all of [linuxserver.io] goodies including enviroment variables, filesystem permissions, and software updates.

# Settings

Follow [linuxserver/smokeping](https://github.com/linuxserver/docker-smokeping#usage) instructions to set it up.

In addition, you **must** define the following variables and settings:

- `SHARED_SECRET=12345password`.
- `MASTER_URL=http://your.smokeping.ext/smokeping/smokeping.cgi`.
- Container [hostname](https://docs.docker.com/config/containers/container-networking/#ip-address-and-hostname) to the same name expected by the master.

The easiest way to have a master is to use [linuxserver/smokeping](https://github.com/linuxserver/docker-smokeping) and [change its configuration files](https://manpages.ubuntu.com/manpages/trusty/man7/smokeping_master_slave.7.html) to expect slaves. The expected location for the shared secrets is `/config/smokeping_secrets`.

# How to run

Dockerfile and docker-compose.yml are included for building the image. 

Otherwise, feel free to use mine at [dgraziotin/smokeping-slave](https://hub.docker.com/repository/docker/dgraziotin/smokeping-slave).

Remember to set up the container hostname, either via command line (`--hostname`) or in the docker-compose.yml file.

```
---
version: "2.1"
services:
  smokeping-slave:
    image: dgraziotin/smokeping-slave
    container_name: smokeping-slave
    hostname: smokeping-slave
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Berlin
      - SHARED_SECRET=12345password
      - MASTER_URL=http://your.smokeping.ext/smokeping/smokeping.cgi
    volumes:
      - </path/to/smokeping/config>:/config
      - </path/to/smokeping/data>:/data
    ports:
      - 80:80
    restart: unless-stopped
```