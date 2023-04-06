#!/bin/sh




docker stack rm ad
docker stack rm pa

docker stack rm ma
docker stack rm n8
docker stack rm wo

docker stack rm tr

docker network rm traefiknet
docker network rm dbsnet

docker network rm mauticnet
docker network rm n8nnet
docker network rm wordpressnet