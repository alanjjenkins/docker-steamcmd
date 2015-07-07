FROM monsantoco/min-jessie
MAINTAINER Alan Jenkins <alan.james.jenkins@gmail.com>

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y lib32gcc1 curl && \
    useradd -m steam
USER steam
RUN cd ~steam && curl https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O && tar -xvzf steamcmd_linux.tar.gz && rm steamcmd_linux.tar.gz && \
    cd ~steam && ./steamcmd.sh +quit
USER root
ADD steamcmd /usr/bin/steamcmd
