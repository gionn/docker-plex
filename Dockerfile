FROM ubuntu:trusty
MAINTAINER Giovanni Toraldo <me@gionn.net>

ENV PLEX_VERSION 0.9.12.3.1173-937aac3
ENV HOME /var/lib/plexmediaserver
ENV DEBIAN_FRONTEND noninteractive
ENV mirror it

RUN sed -i s/archive/$MIRROR.archive/g /etc/apt/sources.list

RUN apt-get -q update && \
    apt-get -qy dist-upgrade && \
    apt-get install -qy curl avahi-daemon avahi-utils && \
    curl -s -L -O https://downloads.plex.tv/plex-media-server/${PLEX_VERSION}/plexmediaserver_${PLEX_VERSION}_amd64.deb && \
    dpkg -i plexmediaserver_*.deb && \
    rm plexmediaserver_*.deb && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean

USER plex

RUN rm -f $HOME/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid

VOLUME /var/lib/plexmediaserver

EXPOSE 32400

CMD /usr/sbin/start_pms
