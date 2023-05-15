
whoami:
	sudo sed -z -i 's/\n\n#ini docker-traefik-localhost-multi-containers-example//g' /etc/hosts 
	sudo sed -z -i 's/\n\n0.0.0.0 traefik.local//g' /etc/hosts 
	sudo sed -z -i 's/n0.0.0.0 whoami.local//g' /etc/hosts 
	sudo sed -z -i 's/\n#end docker-traefik-localhost-multi-containers-example//g' /etc/hosts 

	docker network create -d overlay traefiknet;

	docker stack deploy -c traefik/docker-compose.yml tr;
	docker stack deploy -c whoami/docker-compose.yml wh;

	sudo bash -c "echo '0.0.0.0  whoami.local' >> /etc/hosts"
	sudo bash -c "echo '0.0.0.0 traefik.local' >> /etc/hosts"
	
rm:
	sudo sed -z -i 's/\n\n#ini docker-traefik-localhost-multi-containers-example//g' /etc/hosts 
	sudo sed -z -i 's/\n\n0.0.0.0 traefik.local//g' /etc/hosts 
	sudo sed -z -i 's/\n0.0.0.0 adminer.local//g' /etc/hosts 
	sudo sed -z -i 's/\n0.0.0.0 mautic.local//g' /etc/hosts 
	sudo sed -z -i 's/\n0.0.0.0 n8n.local//g' /etc/hosts 
	sudo sed -z -i 's/\n0.0.0.0 wordpress.local//g' /etc/hosts 
	sudo sed -z -i 's/\n0.0.0.0 phpmyadmin.local//g' /etc/hosts
	sudo sed -z -i 's/\n#end docker-traefik-localhost-multi-containers-example//g' /etc/hosts 

	docker stack rm ad
	docker stack rm pa

	docker stack rm ma
	docker stack rm n8
	docker stack rm wo

	docker stack rm tr
	docker stack rm wh

	docker network rm traefiknet
	docker network rm dbsnet

	docker network rm mauticnet
	docker network rm n8nnet
	docker network rm wordpressnet

up:
	sudo bash -c "echo -e '\n#ini docker-traefik-localhost-multi-containers-example' >> /etc/hosts"
	sudo bash -c "echo -e '0.0.0.0 traefik.local' >> /etc/hosts"
	sudo bash -c "echo -e '0.0.0.0 adminer.local' >> /etc/hosts"
	sudo bash -c "echo -e '0.0.0.0 mautic.local' >> /etc/hosts"
	sudo bash -c "echo -e '0.0.0.0 n8n.local' >> /etc/hosts"
	sudo bash -c "echo -e '0.0.0.0 wordpress.local' >> /etc/hosts"
	sudo bash -c "echo -e '0.0.0.0 phpmyadmin.local' >> /etc/hosts"
	sudo bash -c "echo -e '#end docker-traefik-localhost-multi-containers-example' >> /etc/hosts"

	docker network create -d overlay traefiknet;
	docker network create -d overlay dbsnet;

	docker network create -d overlay mauticnet;
	docker network create -d overlay n8nnet;
	docker network create -d overlay wordpressnet;

	docker pull traefik;
	docker stack deploy -c traefik/docker-compose.yml tr;

	docker pull adminer;
	docker stack deploy -c adminer/docker-compose.yml ad;

	docker pull phpmyadmin;
	docker stack deploy -c phpmyadmin/docker-compose.yml pa;

	docker pull mautic/mautic:v4;
	docker pull mariadb;
	docker stack deploy -c mautic/docker-compose.yml ma;

	docker pull n8nio/n8n;
	docker pull mariadb;
	docker stack deploy -c n8n/docker-compose.yml n8;

	docker pull wordpress;
	docker pull mariadb;
	docker stack deploy -c wordpress/docker-compose.yml wo;

test:
	curl -m 2 -skI -XGET 'http://adminer.local' | awk 'NR==1' & \
	curl -m 2 -skI -XGET 'http://mautic.local' | awk 'NR==1' & \
	curl -m 2 -skI -XGET 'http://n8n.local' | awk 'NR==1' & \
	curl -m 2 -skI -XGET 'http://phpmyadmin.local' | awk 'NR==1' & \
	curl -m 2 -skI -XGET 'http://wordpress.local' | awk 'NR==1' & \
	wait
