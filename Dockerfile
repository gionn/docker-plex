FROM ubuntu:trusty
MAINTAINER Giovanni Toraldo <me@gionn.net>

ENV DEBIAN_FRONTEND noninteractive
ENV PLEX_VERSION 0.9.12.1.1079-b655370

RUN sed -i s/archive/it.archive/g /etc/apt/sources.list
RUN apt-get -q update && \
    apt-get -qy dist-upgrade && \
    apt-get install -qy curl avahi-daemon avahi-utils && \
    curl -v -L -O https://downloads.plex.tv/plex-media-server/${PLEX_VERSION}/plexmediaserver_${PLEX_VERSION}_amd64.deb && \
    dpkg -i plexmediaserver_*.deb && \
    rm plexmediaserver_*.deb && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove && \
    apt-get clean

USER plex
ENV HOME /var/lib/plexmediaserver

RUN rm -f $HOME/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid

VOLUME /var/lib/plexmediaserver

EXPOSE 32400

CMD /usr/sbin/start_pms
