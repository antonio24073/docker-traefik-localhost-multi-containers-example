# Traefik multi containers example

### Steps:

- install docker
- install docker compose
- join a docker swarm
- run `sh deploy.sh` in the base folder
- open ports like traefik in you firewall
- point the domains to your ip (get your ip with `ip a` command)

```
192.168.0.1   adminer.local
192.168.0.1   mautic.local
192.168.0.1   n8n.local
192.168.0.1   wordpress.local
192.168.0.1   whoami.local
192.168.0.1   phpmyadmin.local

```

### Stop services and networks:

- to stop run `sh rm.sh`



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