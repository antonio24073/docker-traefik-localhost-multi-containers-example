#!/bin/sh

docker network create -d overlay traefiknet
docker network create -d overlay dbsnet

docker network create -d overlay mauticnet
docker network create -d overlay n8nnet
docker network create -d overlay wordpressnet

docker pull traefik
docker stack deploy -c traefik/docker-compose.yml tr

docker pull adminer
docker stack deploy -c adminer/docker-compose.yml ad

docker pull phpmyadmin
docker stack deploy -c phpmyadmin/docker-compose.yml pa

docker pull mautic/mautic:v4
docker pull mariadb
docker stack deploy -c mautic/docker-compose.yml ma

docker pull n8nio/n8n
docker pull mariadb
docker stack deploy -c n8n/docker-compose.yml n8

docker pull wordpress
docker pull mariadb
docker stack deploy -c wordpress/docker-compose.yml wo