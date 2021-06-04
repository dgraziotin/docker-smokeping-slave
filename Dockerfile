FROM ghcr.io/linuxserver/smokeping

LABEL maintainer="Daniel Graziotin <daniel@ineed.coffee>"
ENV SHARED_SECRET= \
    MASTER_URL= 
# add local files
COPY root/etc/services.d/smokeping/run /etc/services.d/smokeping/run