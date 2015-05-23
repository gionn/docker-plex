Plex Media Server Docker image
===========

[![Circle CI](https://circleci.com/gh/gionn/docker-plex.svg?style=svg)](https://circleci.com/gh/gionn/docker-plex)

Dockerized Plex Media Server on base ubuntu 14.04 without frills, using the .deb available on [Plex Downloads section](https://plex.tv/downloads).

# Running
```
docker run -d -p 32400:32400 gionn/plex
```

and then browse [http://localhost:32400](http://localhost:32400).

# Volumes

A default volume is defined for holding library metadata at ```/var/lib/plexmediaserver```.

To add your library, use ```-v /path/to/videos:/srv``` and then add /srv as library via Plex web interface.

