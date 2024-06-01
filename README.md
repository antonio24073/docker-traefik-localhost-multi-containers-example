# Docker Traefik Localhost Multi Containers Example

This is a example project to run multiple containers with auto SSL, auto reverse proxy and Traefik functions in localhost. You can adapt to work in a production server.

## Installation:

- install docker
- install docker compose
- join a docker swarm

## Running

Run in the base folder this command to test:

```
make whoami
```

You can access locally in `whoami.local`.
To remove your service:

```
make rm
``` 

Or to run all apps:

```
make up
``` 

And `make rm` to remove all services.


You can control ports in you firewall if you don't you want publish but it works locally and externally in `0.0.0.0` and in your external IP if you points the domain to it.



### Local links:

[adminer](http://adminer.local)
[mautic](http://mautic.local)
[n8n](http://n8n.local)
[phpmyadmin](http://phpmyadmin.local)
[wordpress](http://wordpress.local)
[whoami](http://whoami.local)

### Repos:

[adminer](https://hub.docker.com/_/adminer/)
[mariadb](https://hub.docker.com/_/mariadb)
[mautic](https://hub.docker.com/r/mautic/mautic)
[n8n](https://hub.docker.com/r/n8nio/n8n)
[phpmyadmin](https://hub.docker.com/_/phpmyadmin)
[traefik](https://hub.docker.com/_/traefik)
[wordpress](https://hub.docker.com/_/wordpress)
[whoami](https://hub.docker.com/r/containous/whoami)


